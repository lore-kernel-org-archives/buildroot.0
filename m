Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3962CA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 13:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206DB41BA5;
	Tue, 12 Sep 2023 13:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 206DB41BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qyt2vxeNi_Qm; Tue, 12 Sep 2023 13:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 370FD41BB0;
	Tue, 12 Sep 2023 13:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 370FD41BB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDC161BF5B3
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 13:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2D5861163
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 13:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2D5861163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAeAbFFakZs4 for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 13:17:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12BC960BD9
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 13:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12BC960BD9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D71760015;
 Tue, 12 Sep 2023 13:17:04 +0000 (UTC)
Date: Tue, 12 Sep 2023 15:17:03 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230912151659.599672dc@windsurf>
In-Reply-To: <ZQBfUcvieaqDg7sv@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
 <35d775ed8e08f7082c025d0c32f53bb4@free.fr>
 <ZP4cBkx2VFsfsN7M@gmail.com>
 <6316e92cc730f0e9fdd11379a95dd10b@free.fr>
 <ZQBfUcvieaqDg7sv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694524625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKPCxYPDzTLgP20ubMZ83L6++Yofc2lfgGwGtcsHSFY=;
 b=PHTeY5H/1FFE4f5bpKicQd3arOSLXFZCiQeSolYzzceqFvNr9cXBN8ganiZXIWBXOhwByl
 kdmyStJEqms/qnvPjehoHHTW0NSSOsPaW8X+Uj0J+o4eFqSTfeiJaqw/YqR59qItS3AflH
 4+6+WBtHD708+Vmw750IHbqT2IfptX0N+Y+McnFkEkc/BxSfSjyrNCdtaKdJPGB0GgyHRy
 F+b+WIpOhwDMildOB0dB7Rnea1Ek7Lp8cBiJlzT7otShjbTBI6Vq2xdbgDR6YoQ1tqcz9b
 gSbHGQYx+ntAC16UMi6vusVDkkh3A7/u8A9i6NQRSSo7vJxtrS1QiSBH+viOpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PHTeY5H/
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Sep 2023 14:53:37 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> make[1]: Leaving directory '/home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/build/host-libzlib-1.3'
> ***
> *** ERROR: package host-libzlib installs executables without proper RPATH:
> ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bin/xmlwf
> ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bin/pkgconf
> ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bin/protoc
> ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bin/protoc-gen-c
> ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bin/python3.11
> ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bin/openssl

This seems pretty broken as none of these files are installed by
host-libzlib...

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
