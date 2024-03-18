Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C090C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 076A540608;
	Mon, 18 Mar 2024 13:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgrp-mFsQWw3; Mon, 18 Mar 2024 13:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A62408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3A62408A5;
	Mon, 18 Mar 2024 13:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF9261BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC14740608
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0OFXX9gmXnD for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C2FA408A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2FA408A5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C2FA408A5
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:53:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B8C72000C;
 Mon, 18 Mar 2024 13:53:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmDQE-002fMt-2Z;
 Mon, 18 Mar 2024 14:53:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
References: <20240318133338.1811892-1-javad.rahimipetroudi@mind.be>
 <20240318133338.1811892-2-javad.rahimipetroudi@mind.be>
Date: Mon, 18 Mar 2024 14:53:02 +0100
In-Reply-To: <20240318133338.1811892-2-javad.rahimipetroudi@mind.be> (Javad
 Rahimipetroudi's message of "Mon, 18 Mar 2024 14:33:38 +0100")
Message-ID: <874jd3fxz5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/avenger96: bump Linux
 version to 6.6.21LTS
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Javad" == Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com> writes:

 > This patch upgrades Kernel version to 6.6.21 LTS on avenger96 board.
 > Beside that, the device tree path also modified to point the device
 > tree in proper location.

Please document when this move was done as I requested - E.G. this
commit from 6.5-rc1:

commit 724ba6751532055db75992fc6ae21c3e322e94a7
Author: Rob Herring <robh@kernel.org>
Date:   Thu May 4 18:38:52 2023 -0500

    ARM: dts: Move .dts files to vendor sub-directories

    The arm dts directory has grown to 1559 boards which makes it a bit
    unwieldy to maintain and use. Past attempts stalled out due to plans to
    move .dts files out of the kernel tree. Doing that is no longer planned
    (any time soon at least), so let's go ahead and group .dts files by
    vendors. This move aligns arm with arm64 .dts file structure.

    There's no change to dtbs_install as the flat structure is maintained on
    install.

    The naming of vendor directories is roughly in this order of preference:
    - Matching original and current SoC vendor prefix/name (e.g. ti, qcom)
    - Current vendor prefix/name if still actively sold (SoCs which have
      been aquired) (e.g. nxp/imx)
    - Existing platform name for older platforms not sold/maintained by any
      company (e.g. gemini, nspire)

    The whole move was scripted with the exception of MAINTAINERS and a few
    makefile fixups.


 > As another change, with the default root append (mmcblk1p4) in
 > 'extlinux.conf' file in the overlay directory of the board,
 > the rootfs was not possible to be detected. This file also
 > modified to point to the proper mmc block.

Also document where this comes from. I would guess it is from this
change in 5.10-rc1:

commit 21b2cec61c04bd175f0860d9411a472d5a0e7ba1
Author: Douglas Anderson <dianders@chromium.org>
Date:   Thu Sep 3 16:24:36 2020 -0700

    mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4

    This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
    probe") but applied to a whole pile of drivers.  This batch converts
    the drivers that appeared to be around in the v4.4 timeframe.

    Signed-off-by: Douglas Anderson <dianders@chromium.org>
    Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
    Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # SH_MMCIF
    Tested-by: Thierry Reding <treding@nvidia.com>
    Link: https://lore.kernel.org/r/20200903162412.1.Id501e96fa63224f77bb86b2135a5e8324ffb9c43@changeid
    Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Or the followup one from 6.5-rc1:

commit 3108eb2e8aa7e955a9dd3a4c1bf19a7898961822
Author: Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon Jun 12 16:37:30 2023 +0200

   mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS

   All mmc host drivers should have the asynchronous probe option enabled, but
   it seems like we failed to set it for mmci, so let's do that now.

   Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
   Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
   Tested-by: Linus Walleij <linus.walleij@linaro.org>
   Tested-by: Yann Gautier <yann.gautier@foss.st.com>
   Cc: stable@vger.kernel.org
   Link: https://lore.kernel.org/r/20230612143730.210390-1-ulf.hansson@linaro.org

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
