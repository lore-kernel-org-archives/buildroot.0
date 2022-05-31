Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F547C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0803384044;
	Tue, 31 May 2022 08:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kxrCnvMFtzdw; Tue, 31 May 2022 08:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C7AF8403F;
	Tue, 31 May 2022 08:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFA2E1BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D75941A04
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYTFN5TwSt5C for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DD6E41A00
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:51:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 764361C000D;
 Tue, 31 May 2022 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653987077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tT4WPHihcGhxlJ++7dH0aLP2MNFksmYMWksw2eWNJFU=;
 b=fz4wlJYK+VMShqAW18ppXre5WbN/Asiwlt6lwszgxg7yts28+eCS1wqhBVaQ999+mjqseI
 hzG99y2b1EWzdHESHFgSN9st5NDL5Th/WoqhFsn2hnoV33JVf66+LIe7hmCdWgfm5i6AAz
 9Xmab2k6Gj+lkn695bpof/7Z5Cn5GX1iyvjFjYeZMZA6vhDyunjG8US96PtiDXzXOOEdGz
 8sW88N1z7S/iV8r7ta5v/nORl3qOqLXNxTOGYfzL3PRW743US2IBauXjBo6SbahuN6vUCC
 Izfnik2xfcGXkKiZjAcEG4JltyyBeXAKNUpXNt6sj++XIxEpd80+VG9vvzlsug==
Date: Tue, 31 May 2022 10:51:16 +0200
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220531105116.0efa8a41@windsurf>
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 00/20] Update Ejabberd and its
 dependencies
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 19 May 2022 16:07:50 +0200
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> Johan Oudinet (20):
>   package/erlang-idna: bump version to 230a917
>   package/erlang-lager: bump version to 3.9.1
>   package/erlang-p1-utils: bump version to 1.0.23
>   package/erlang-p1-cache-tab: bump version to 1.0.29
>   package/erlang-p1-tls: bump version to 1.1.13
>   package/erlang-p1-stringprep: bump version to 1.0.27
>   package/erlang-p1-xml: bump version to 1.1.49
>   package/erlang-p1-xmpp: bump version to 1.5.6
>   package/erlang-p1-yaml: bump version to 1.0.32
>   package/erlang-p1-yconf: bump version to 1.0.12
>   package/erlang-p1-oauth2: bump version to 0.6.10
>   package/erlang-p1-pkix: bump version to 1.0.8
>   package/erlang-eimp: bump version to 1.0.21
>   package/erlang-p1-mqtree: bump version to 1.0.14
>   package/erlang-jose: bump version to 1.11.1
>   package/erlang-p1-acme: bump version to 1.0.16
>   package/erlang-p1-stun: bump version to 1.0.47
>   package/erlang-p1-sip: bump version to 1.0.47
>   package/erlang-p1-zlib: bump version to 1.0.10
>   package/ejabberd: bump version to 21.12

I have applied the entire series to next, there were just a few issues in
the last patch: the new 0003-fix-includes.patch did not have your
Signed-off-by line, was not git formatted, and its original source was
not indicated. I fixed up those small issues when applying.

Thanks a lot for your work on keeping ejabberd and its dependencies
up-to-date!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
