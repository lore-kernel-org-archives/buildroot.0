Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AC6C369DC
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 13:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD0760FC0;
	Wed, 30 Apr 2025 13:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEgV8o1MwS-j; Wed, 30 Apr 2025 13:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938D560FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938D560FAE;
	Wed, 30 Apr 2025 13:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9BE01C4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0C58400D1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pciio_H8poC for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 13:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FA13401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FA13401F1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FA13401F1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:06:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9B3243B46;
 Wed, 30 Apr 2025 13:06:00 +0000 (UTC)
Date: Wed, 30 Apr 2025 15:05:57 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250430150557.4f8e7efe@booty>
In-Reply-To: <20250424063619.789456-1-neal.frager@amd.com>
References: <20250424063619.789456-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetgfetfedvjeejgedvjeeggfefueduueejfffgtdehveduveelkeettdelieffnecuffhomhgrihhnpegrthhlrghsshhirghnrdhnvghtpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746018361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xQKiOBFVdLlBHDG5FbpGUyYkDKXxjozFtcbLclhSAg=;
 b=Xyjezt6kzFCIjyNoZytaFVcHXhiPbH/BNJF6KP3e4btD9cy923F5VLp+mn+61QOjM9WYvN
 sBrABdq/F3sNAP431DPAcwf/7c4Vi7LEuDHcK5HY1ah0DNVVkL2OqscqqzhQ6UmCleBpxP
 ZFdWl+ivlJHXDCU/ieDrn9xRyhMRkCs8r3R8OFsb5gh5OfeuJ6H5Ym41SOJEff/YUWWFIq
 /N81F+ISf/65KICbr+PQx4Owc0a24A7ViKoUAGct0YDriNCnOFmgzdW4uYedjR/DGkHRRc
 zRfcO8L6jmUGTRXN5i3iJlM01X1OifSKtrCV2cnfuWpquTdfCk1I0tz/7mtgiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xyjezt6k
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xilinx-fpgautil: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, arnout@mind.be, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fabio.caccamo@amd.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Thu, 24 Apr 2025 07:36:18 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Add a new package to Buildroot called xilinx-fpgautil which builds the Xilinx
> fpgautil script which can be used for loading FPGA bitstreams on zynq, zynqmp
> and versal products at run-time.  This is a handy application for loading
> FPGA bitstreams and their corresponding device tree overlays.
> 
> An explanation of how this script can be used for each type of product can be
> found on the wiki pages below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
> 
> In addition, the source code for xilinx-fpgautil can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
> 
> The Xilinx fpgautil script can be used hand in hand with the Versal Segmented
> Configuration with the following example command for programming the pld.pdi
> file to the Versal FPGA:
> 
> fpgautil -b /lib/firmware/xilinx/<design-name>_pld.pdi -o /lib/firmware/xilinx/<dtbo-name>.dtbo
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[...]

> --- /dev/null
> +++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# xilinx-fpgautil
> +#
> +################################################################################
> +
> +XILINX_FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
> +XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
> +XILINX_FPGAUTIL_LICENSE = MIT
> +XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
> +
> +define XILINX_FPGAUTIL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_LDFLAGS) \
> +		$(@D)/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c \
> +		-o $(@D)/fpgautil
> +endef
> +
> +define XILINX_FPGAUTIL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/fpgautil $(TARGET_DIR)/bin/fpgautil
                                                          ^^^^

Are you installing in /bin for some reason? /usr/bin seems the right
place.

Otherwise looks good, so in case you send v3 with only the /usr/bin
change, you can add:

 [build-tested only]
 Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
