Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A784C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D947E60BDA;
	Sun, 16 Jan 2022 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xs0GzwvhVLws; Sun, 16 Jan 2022 10:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C1A60BA4;
	Sun, 16 Jan 2022 10:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E99FD1BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D823F60BA4
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJp6aKIAZX7B for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:55:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA0C660AE4
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 10:55:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp4-g21.free.fr (Postfix) with ESMTP id B81B419F5A6;
 Sun, 16 Jan 2022 11:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642330541;
 bh=po80WxaiU+ZQydndgnhLe4v2vlN4gMh9Ek1WQxm6dqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KJadOmMP+x9M+ln9WeM7Urg4of5hDDsPijCn2WrGjnr9avbzNaquaz75DUD5AQPOz
 mjrNnTZjTGmIb0mje+fWjLfrLnPVuy8ZHmG6J8DbQBAMu/SZaZQwSjSKRVjFUSFKHZ
 tqfhSXKmJVIc190ZI13fE6K77kl3DP+Gra2H5Wvhphg3MPF7zbJcyHbg3okHE5S/rT
 +Wh0Mwm74LPESPa5rQTAtQXc3o3sQj5nPywQuCEKrseFRon1qdR+LA+Af6N64khzLo
 mDXcqlM8uLhgz4uBW+Xp+XTFOj1GS5oF/LuebExFzwbKhAalGqG/lKgESfdx8UYhqu
 jBM2WW0HVsG/g==
Received: from 37-173-27-224.coucou-networks.fr ([37.173.27.224])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 16 Jan 2022 11:55:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220113215104.02a734a1@windsurf>
References: <20220110200151.830192-1-ju.o@free.fr>
 <20220113215104.02a734a1@windsurf>
Message-ID: <77b72a63fdde563f496649641a0efab1@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 13/01/2022 21:51, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Mon, 10 Jan 2022 21:01:51 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>>  [...]
>> +config BR2_PACKAGE_PYTHON_GNUPG
>> +	bool "python-gnupg"
>> +	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG # runtime
> 
> This generates a circular dependency reported by kconfig, because
> another package does exactly the opposite. So I have inverted the logic
> here:
> 
> select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime

What do you think about reversing the logic of all Buildroot packages
selecting gnupg so they default to gnupg2?

Quoting: https://gnupg.org/download/index.html
"""
GnuPG 1.4 is the old, single binary version which still support the
unsafe PGP-2 keys. This branch has no dependencies on the above listed
libraries or the Pinentry. However, it lacks many modern features and
will receive only important updates.
"""

There is currently only two packages selecting gnupg:
gpgme and python-gnupg

Most Linux distributions are now shipping gnupg2 by default.  gnupg v1
is now more for legacy/compatibility cases.

If you agree, I can send a patch for this.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
