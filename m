Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7E6C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 16:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7492681ED6;
	Tue, 11 Feb 2025 16:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlYs4RTLkIL2; Tue, 11 Feb 2025 16:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7332081EDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7332081EDF;
	Tue, 11 Feb 2025 16:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9190A194
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 751B64077A
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oX018fYz6ySq for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 16:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4546B40732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4546B40732
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4546B40732
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:48:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A45E943289;
 Tue, 11 Feb 2025 16:48:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1thtQl-008XOJ-0d;
 Tue, 11 Feb 2025 17:48:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Jagan Teki
 <jagan@amarulasolutions.com>,  Javad Rahimi <javad321javad@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,  Sergey Matyukevich
 <geomatsi@gmail.com>,  linux-amarula@amarulasolutions.com,  Julien Olivain
 <ju.o@free.fr>
References: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
Date: Tue, 11 Feb 2025 17:48:15 +0100
In-Reply-To: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 11 Feb 2025 10:33:49 +0100")
Message-ID: <87zfis2zsg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepkedvrddugeefrdelhedrvddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddupdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmrdhnihgvshhtrhhojhesghhrihhnnhdqghhlohgsrghlrdgtohhmpdhrtghpthhtohepjhgrvhgrugefvddujhgrvhgrugesghhmrghilhdrtghomhdprhgtphhtthhopehgvghomhgrt
 hhsihesghhmrghilhdrtghomhdprhgtphhtthhopegurghrihhordgsihhnrggttghhihesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
 > download servers"), among other things, adds the connection timeout
 > parameter to the default scp command:

 > config BR2_SCP
 >        string "Secure copy (scp) command"
 >        default "scp -o ConnectTimeout=10"

 > Since the package/pkg-download.mk file exports this command using the
 > SCP variable:

 > export SCP := $(call qstrip,$(BR2_SCP))

 > and the U-Boot Makefile uses this variable as the path for the system
 > control processor (SCP) firmware blob:

 > cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
 > 		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
 >                 --toolpath $(objtree)/tools \
 > 		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
 > 		build -u -d $(binman_dtb) -O . -m \
 > 		--allow-missing --fake-ext-blobs \
 > 		$(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
 > 		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
 > 		$(foreach f,$(of_list_dirs),-I $(f)) -a of-list=$(of_list) \
 > 		$(foreach f,$(BINMAN_INDIRS),-I $(f)) \
 > 		-a atf-bl31-path=${BL31} \
 > 		-a tee-os-path=${TEE} \
 > 		-a ti-dm-path=${TI_DM} \
 > 		-a opensbi-path=${OPENSBI} \
 > 		-a default-dt=$(default_dt) \
 > 		-a scp-path=$(SCP) \

 > the following error occurs:

 >   BINMAN  .binman_stamp
 > usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR] [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout] [-v VERBOSITY] [-V]
 >               {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool} ...
 > binman: error: unrecognized arguments: -o ConnectTimeout=10
 > make[2]: *** [Makefile:1126: .binman_stamp] Error 2

 > The issue was already present, as the scp command was being passed
 > instead of the path to the SCP firmware, but it is now detected due to
 > the compilation error.

Indeed.

 > Adding the BR2_TARGET_UBOOT_SCP_FIRMWARE option allows passing the
 > correct parameter to U-Boot, even if it is not set. This also requires
 > removing the SCP setting from BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS for
 > configurations that previously set this variable explicitly.

 > Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
 > Suggested-by: Julien Olivain <ju.o@free.fr>
 > Co-Developed-by: Julien Olivain <ju.o@free.fr>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

So the real fix is presumably to stop globally exporting all these
variables in package/pkg-download.mk. I don't right away see why they
couldn't just be passed in $(PKG)_DL_ENV to the dl-wrapper instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
