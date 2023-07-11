Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B34EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 08:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1FC340482;
	Tue, 11 Jul 2023 08:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1FC340482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqBoBsvlpGjK; Tue, 11 Jul 2023 08:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A904013C;
	Tue, 11 Jul 2023 08:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A904013C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35FD21BF2C4
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 08:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E49D3401DB
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 08:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49D3401DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dua0-C_ByiTt for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 08:00:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8286C40118
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8286C40118
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 08:00:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DE8DE0019;
 Tue, 11 Jul 2023 08:00:55 +0000 (UTC)
Date: Tue, 11 Jul 2023 10:00:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230711100053.1d9d3671@windsurf>
In-Reply-To: <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
 <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689062455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lAKDDOqCEPsYiqS1Zr5zLqJbHXf7GMytV1w9gtPqIU=;
 b=P+Vjl1nXGJFWlHrY4M1qh6nOXLGFqVd6Je8f4WtDeF+o1m6HwZk8NXi8LgxsnezYTlZE9D
 IqKZNWDlhHfoYIldq7W2HYIz/Sv1yLevMuTIAaNY1BJsBkCqCvfAdn8XMOzJBRXCHD9Nc0
 jTDjjo1b4RxtMO0pwatFd7jzM/D7YnhjD81NNZBE1xKNSFQR6feb2miQtN26htg4lbHVA3
 R/spXKzedU2JE/oGMomY716VUP+D3lydUKTek0Meq9RRKRP31RZsuhKtlhvdXE3uOBNGWE
 58zez6uiblqHyex1TSUmcPThVd/+HD45j+mL7VJRk5EEk9D/J5MeJStz1QIrWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+Vjl1nX
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 01:35:54 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > So is this patch series modifying python-terminaltables a prerequisite
> > to applying the patch at
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230626181531.2312002-5-james.hilliard1@gmail.com/ ?  
> 
> Yes, it should be applied before that one.

Then, as explained in another e-mail, it should be part of the same
series. Yes, I understand that you sent the series before noticing that
python-terminaltables needed to be changed, and that's fine: send a new
complete iteration of the series with the extra patches.

And for such complicated series, please *always* add a cover letter
that gives some background: what you're trying to do, and what is the
path taken to achieve this.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
