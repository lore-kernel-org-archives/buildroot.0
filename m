Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3F2C19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8291E8126C;
	Thu, 11 Aug 2022 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8291E8126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIj24T_UN93N; Thu, 11 Aug 2022 20:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9485B80E3F;
	Thu, 11 Aug 2022 20:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9485B80E3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3381BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4863D401C9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4863D401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a524866lxbVA for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:58:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2D7400E2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F2D7400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:58:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3447B240003;
 Thu, 11 Aug 2022 20:58:32 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:58:31 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220811225831.0e3d5fbc@windsurf>
In-Reply-To: <ca7d879728d7de4dc9636c3facd570c83860b9f6.1660131874.git.stefan@agner.ch>
References: <ca7d879728d7de4dc9636c3facd570c83860b9f6.1660131874.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4HXq5S8AGWQWxiZCSggahb3tMechg6UeiJpsoo6fjc=;
 b=Vr7+TmLPxS+5kbpuRr+pPd5L7NSCM5sg02B0iov0078F+3cRQV0YZcRueknxngH1FcROMC
 P75dM+OMSH2veAgqjQ/WSNUqpfjTG0TNf5m83yDZOdFISwL4PnJHzM4GL6ZtkC5bcDecNb
 VtakLVaI9WHjjDWhILhb/0lsrIGhHxq8WVnXVetl5tBsaRraINOLjxCDkOJRKlWlDqpOFD
 8njpIqLDGvLu9yuJF0lzA32yHVYCfer7rfuLBnrAfqtiBZgvG6/Pk51sGHs4hDfG1qDF9O
 9qiDEgv5f0a9Kr+1iXfX5QpSJIVhGE/WcSwydAaQXoN7kxaD7i6p3fTlP/SWYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vr7+TmLP
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to release 32
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
Cc: nolange79@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Aug 2022 13:45:38 +0200
Stefan Agner <stefan@agner.ch> wrote:

> The new releases mostly contain bug fixes. The build system has been
> prepared to use AppArmor library, but since actual support is still
> missing it is not worth yet to enable build infrastructure in
> Buildroot.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

In fact, no, I didn't apply: this patch break "make legal-info":

>>> dbus-broker 32 Collecting legal info
LICENSE: OK (sha256: 3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4)
ERROR: No hash found for subprojects/c-dvar/AUTHORS
cp: cannot stat '/home/thomas/projets/buildroot/output/build/dbus-broker-32/subprojects/c-dvar/AUTHORS': No such file or directory
make: *** [package/dbus-broker/dbus-broker.mk:69: dbus-broker-legal-info] Error 1

Seems like the folders in subprojects/ have changed quite a bit, this
needs to be compared with version 29 to see how license information
needs to be updated.

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
