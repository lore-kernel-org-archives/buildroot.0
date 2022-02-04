Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD034C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F2B401A1;
	Fri,  4 Feb 2022 18:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqYRuHquQTGs; Fri,  4 Feb 2022 18:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 675784013A;
	Fri,  4 Feb 2022 18:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 973441BF297
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93A1B6002E
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 18:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utu2eiV9CQ-9 for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 18:55:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CF90600B5
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 18:55:10 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G3jgn3bpJroAhG3jhn89BB; Fri, 04 Feb 2022 19:55:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644000909; bh=eNgUQhOWCHgI4+7mNedJEjWLsrgt/TDZSD5PJrPubIc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=E8SiV8MSn/mM8+rwsjVuvEABm93OTjhXbcNrQqn0mCjFIWfc2gf4zeWCyFyg0iCkb
 zROoFxyRr04aRhc5hGLFmWXDbEOGRMZHlTqfzRm7J78RdCmNNBSKprBsodhj03iYk4
 6sdUYYz3klVI7AKu1sxFFTDx9ZrNGA52AZZnA6gzYb7FFSsMHrr8DoHCLncT4V4Etr
 ZPCjCLHTdxPfow84gU1e/EtKb5oPdk+vQ8ACj+yyoLdsWygUym0gvPM0GN/hjECwK9
 nhHiQ5ko0frR4+V8+7dUGBX2oYe92UL2ozNKGvLePjHeOMUH/6TF9/0jCP5XrV5yj2
 XkzPnZGySCA/A==
Message-ID: <f45fcc8b-a77f-d65f-10b6-9069b18c3e5d@benettiengineering.com>
Date: Fri, 4 Feb 2022 19:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
 <CADvTj4qg822gvS8ufFWFB8w5Uv+EQ7L4ULJRueQ+rp+MY_ugeA@mail.gmail.com>
 <a07ea4e2-d37b-8596-8cfd-5c5dd29bc279@benettiengineering.com>
 <67349e3c-373f-905a-840a-55c4b8143906@benettiengineering.com>
 <CADvTj4rhqY6SC00CnTMavUnFZED6z4C9jejzuonFr1i7xYuGiw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4rhqY6SC00CnTMavUnFZED6z4C9jejzuonFr1i7xYuGiw@mail.gmail.com>
X-CMAE-Envelope: MS4wfJGPPWO0N+awkJfUM0h7wMRoCTL9nrAmvw+FZUiEWxShaw2Zm61/3G/1Tv4Z6aeaKXdHhR/H4toxmhoM4SdoFSCBNEYXjAJQNAR2Ve0ikHfVL6WM9UsG
 /8EIuLQF2XbijkwidXNYdspwTfp177OOElO6uct9qUYntPm1kqA1LCsJeYinBKYnSAxc9D60UDHuHpUKySmBEb0z4TS9gtNYORjAHUQtQn5LBLZ4SrNJxmd3
 8v4rquo7TayHGlppOCehI+jJ4Y5qT4cqKw+9QyrQ/LE=
Subject: Re: [Buildroot] qt5webengine build failure on gitlab-CI
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/02/22 18:12, James Hilliard wrote:
[SNIP]

>> I was wrong, I haven't pulled the master branch so I was still building
>> 5.15.2 and no 5.15.8
> 
> The master branch still uses 5.15.2.
Yes, I've mixed things up. qt5 uses 5.15.8 but qt5webengine still uses 
5.15.2

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
