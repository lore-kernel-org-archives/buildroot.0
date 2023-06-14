Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB3EB64DC
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5537C8372B;
	Wed, 14 Jun 2023 13:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5537C8372B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_6iWp3m9SQJ; Wed, 14 Jun 2023 13:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFBC8176A;
	Wed, 14 Jun 2023 13:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BFBC8176A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2BCC1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88239402BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88239402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLJx5Sg-RZD3 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E3D3402B7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E3D3402B7
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:17 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C47520011;
 Wed, 14 Jun 2023 13:52:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Qv1-0088CL-Am; Wed, 14 Jun 2023 15:52:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20230606175459.21887-1-neal.frager@amd.com>
 <87legw4bxe.fsf@48ers.dk>
Date: Wed, 14 Jun 2023 15:52:15 +0200
In-Reply-To: <87legw4bxe.fsf@48ers.dk> (Peter Korsgaard's message of "Tue, 06
 Jun 2023 21:40:13 +0200")
Message-ID: <878rcmnoc0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix shellcheck issues
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:
 >> This patch cleans up board/zynqmp shellcheck issues.
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 >> .checkpackageignore              | 3 ---
 >> board/zynqmp/kria/kv260/kv260.sh | 6 +++---
 >> board/zynqmp/post-build.sh       | 9 ++++-----
 >> board/zynqmp/post-image.sh       | 8 ++++----
 >> 4 files changed, 11 insertions(+), 15 deletions(-)

 >> diff --git a/.checkpackageignore b/.checkpackageignore
 >> index 10e70f0787..8d41aa2d37 100644
 >> --- a/.checkpackageignore
 >> +++ b/.checkpackageignore
 >> @@ -103,10 +103,7 @@ board/versal/post-build.sh Shellcheck
 >> board/versal/post-image.sh Shellcheck TrailingSpace
 >> board/zynq/post-build.sh Shellcheck
 >> board/zynq/post-image.sh Shellcheck
 >> -board/zynqmp/kria/kv260/kv260.sh Shellcheck
 >> board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 >> -board/zynqmp/post-build.sh Shellcheck
 >> -board/zynqmp/post-image.sh Shellcheck
 >> boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 >> boot/at91bootstrap/0001-eabi-fix.patch Upstream
 >> boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
 >> diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
 >> index e03d67d8b0..089c1ea58f 100755
 >> --- a/board/zynqmp/kria/kv260/kv260.sh
 >> +++ b/board/zynqmp/kria/kv260/kv260.sh
 >> @@ -6,7 +6,7 @@
 >> # drivers are missing.
 >> # This will be removed when u-boot can build the kv260 u-boot.itb natively.
 
 >> -UBOOT_DIR=$4
 >> +UBOOT_DIR="$4"
 
 >> -fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 >> -${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
 >> +fdtoverlay -o "${UBOOT_DIR}"/fit-dtb.blob -i "${UBOOT_DIR}"/arch/arm/dts/zynqmp-smk-k26-revA.dtb "${UBOOT_DIR}"/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 >> +"${UBOOT_DIR}"/tools/mkimage -E -f "${UBOOT_DIR}"/u-boot.its -B 0x8 "${BINARIES_DIR}"/u-boot.itb

 > I took the liberty to wrap some of these very long lines.


 >> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
 >> index 0713bd1b05..d373ff4d4c 100755
 >> --- a/board/zynqmp/post-build.sh
 >> +++ b/board/zynqmp/post-build.sh
 >> @@ -3,14 +3,13 @@
 >> # genimage will need to find the extlinux.conf
 >> # in the binaries directory
 
 >> -BOARD_DIR="$(dirname $0)"
 >> -CONSOLE=$2
 >> -ROOT=$3
 >> +CONSOLE="$2"
 >> +ROOT="$3"
 
 >> mkdir -p "${BINARIES_DIR}"
 >> -cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 >> +cat <<-__HEADER_EOF > "${BINARIES_DIR}"/extlinux.conf

 > The previous format was better (and my shellcheck doesn't complain about
 > it), so I've dropped this.

 > Committed with that fixed, thanks.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
