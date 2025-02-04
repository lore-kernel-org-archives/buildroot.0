Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5959C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8732E60FBB;
	Tue,  4 Feb 2025 13:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYlpxvh81qzP; Tue,  4 Feb 2025 13:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB3060FB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB3060FB1;
	Tue,  4 Feb 2025 13:30:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFAE8185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF9760FB1
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFHb6jjaO-dc for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B114B60FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B114B60FA2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B114B60FA2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:30:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CDFA1F764;
 Tue,  4 Feb 2025 13:30:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfJ0E-00Fq9j-2r;
 Tue, 04 Feb 2025 14:30:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>,  <luca.ceresoli@bootlin.com>,
 <thomas.petazzoni@bootlin.com>,  <michal.simek@amd.com>,  <ju.o@free.fr>,
 <brandon.maier@collins.com>,  <romain.naour@smile.fr>,
 <ibai.erkiaga-elorza@amd.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
 <20250125224930.3639111-5-neal.frager@amd.com>
Date: Tue, 04 Feb 2025 14:30:10 +0100
In-Reply-To: <20250125224930.3639111-5-neal.frager@amd.com> (Neal Frager's
 message of "Sat, 25 Jan 2025 22:49:29 +0000")
Message-ID: <87o6zhn8gt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefgudfgtdekfedtiedtveejieeffeejjedvtdevffffffffueetgfefudfhlefhueenucffohhmrghinheprghtlhgrshhsihgrnhdrnhgvthenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesf
 hhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v6 5/6] board/zynqmp: add new qspi.bin
 binary to images
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch adds the new qspi.bin file to the zynqmp sdcard.img.
 > For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
 > For QSPI booting, only the qspi.bin file needs to be written to the flash.

 > This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
 > as either "ImageA" or "ImageB".

 > Kria BIRT (Boot Image Recovery Tool):
 > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 V1-> V2:
 >  - new to patch series
 V2-> V3:
 >  - corrected commit message to use BIRT instead of SBIRT
 V3-> V4:
 >  - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
 V4-> V6:
 >  - no changes
 > ---
 >  board/zynqmp/genimage.cfg           | 1 +
 >  configs/zynqmp_kria_kd240_defconfig | 1 +
 >  configs/zynqmp_kria_kr260_defconfig | 1 +
 >  configs/zynqmp_kria_kv260_defconfig | 1 +
 >  configs/zynqmp_zcu102_defconfig     | 1 +
 >  configs/zynqmp_zcu104_defconfig     | 1 +
 >  configs/zynqmp_zcu106_defconfig     | 1 +
 >  7 files changed, 7 insertions(+)

 > diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
 > index 20d8352c08..0a6aea7a29 100644
 > --- a/board/zynqmp/genimage.cfg
 > +++ b/board/zynqmp/genimage.cfg
 > @@ -3,6 +3,7 @@ image boot.vfat {
 >  		files = {
 >  			"boot.bin",
 >  			"u-boot.itb",
 > +			"qspi.bin",

I guess you are adding it to the vfat to be able to easily write it from
the SD card to QSPI from U-Boot / Linux?

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
