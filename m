Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E3C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 14:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF9981C21;
	Tue, 18 Mar 2025 14:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBdYJHMCFda6; Tue, 18 Mar 2025 14:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C77E81F5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C77E81F5C;
	Tue, 18 Mar 2025 14:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBB51D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C289640744
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMl7G_vYNULL for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 14:34:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCAC7406EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCAC7406EC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCAC7406EC
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:34:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D54843C67
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:34:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tuY1X-0018NZ-2k
 for buildroot@buildroot.org; Tue, 18 Mar 2025 15:34:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 15:34:31 +0100
Message-ID: <87cyee9zm0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptedujeegteffjefhfefgfeefgefhueekuefhgefhtdfgkefgleeufeeifedtveeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpkhgvrhhnvghlrdhorhhgpdhmihhnugdrsggvnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2025.02 released
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

Hi,

Buildroot 2025.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2025.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2025.02.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2025.02 tag)

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a fairly active development cycle with more than 1200 changes and
contributions from 110 unique contributors!

Of noteworthy new features/changes we have:

 - utils/generate-cyclonedx script added to generate SBOMs in
   CycloneDX format. To use it, run

       make show-info | utils/generate-cyclonedx > sbom.json

- Nios2 architecture support removed.

- Toolchain:

  - binutils 2.44 added, binutils 2.43.1 becomes the default.

  - gdb 16.1 added, gdb 15.1 becomes the default.

  - glibc 2.41, uclibc-ng 1.0.51

  - Synopsys external ARC toolchains marked as broken as they
    are not "bare" toolchains, causing various build issues

  - ARM external toolchains bumped to 12.4.rel1 and are now also

- Linux: Support device tree overlays and support custom device tree
  files with Linux >= 6.12, which changed the build logic. For this a
  new BR2_LINUX_KERNEL_CUSTOM_DTS_DIR option has been introduced and the
  existing _CUSTOM_DTS_PATH option deprecated.

- New defconfigs: FriendlyARM NanoPi R3S, NXP imx8mm-evk / imx8mm-ddr4 /
  imx8mp-evk / imx93-evk / ls1043a-rdb / ls1046a-rdb, Orangepi 5 plus,
  Polyhex Debix model A, Raspberrypi zero 2w 64bit, Raxda rock 4SE, STM
  STM32MP135F-DK

- New packages: bmap-writer, cpuinfo, cross-ldd, farmhash, fft2d, fp16,
  gemmlowp, libecoli, libglib2-bootstrap, lynis, nxp-bt-wifi-firmware,
  nxp-mwifiex, panel-mipi-dbi-firmware, parsec, psimd, pthreadpool,
  python-aiohttp-sse-client, python-asyncclick, python-changelog-chug,
  python-telnetlib3, python-waitress, qt6graphs, qt6multimedia,
  qt6quick3d, rnnoise, ruy, snooze, tensorflow-lite, usbip, utfcpp,
  wlr-randr, xilinx-embeddedsw, xnnpack

And the usual package version updates and bug fixes. See the CHANGES
file for details:

https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02/CHANGES

Upgrading from 2024.02.x:

In addition to these changes, for people upgrading from 2024.02.x the
most noteworthy changes since that release can be seen in the
announcements for 2024.05, 2024.08 and 2024.11:

2024.05: https://lore.kernel.org/buildroot/87bk46tjk2.fsf@dell.be.48ers.dk/T/#u
2024.08: https://lore.kernel.org/buildroot/87frqcj3nw.fsf@dell.be.48ers.dk/T/#u
2024.11: https://lore.kernel.org/buildroot/87y0zkhumg.fsf@dell.be.48ers.dk/T/#u

Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes until
at least 2026.02 is out. We are working on extending this support period
to 3 years, which requires funding from companies through the LTS
initiative:

        https://mind.be/buildroot-lts/

The previous 2024.02.x LTS release will see at least one more update
before it becomes EOL in April, so start migration to 2025.02 soon.

The next release will be 2025.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
