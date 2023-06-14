Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9192BEB64DC
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39BCD838D3;
	Wed, 14 Jun 2023 13:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39BCD838D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJ28ma_MQ-0T; Wed, 14 Jun 2023 13:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677768382F;
	Wed, 14 Jun 2023 13:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677768382F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD7BF1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 952B66120F
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 952B66120F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkyMnZuSgfzW for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B23C560A67
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B23C560A67
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:07 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 869B1E000C;
 Wed, 14 Jun 2023 13:52:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Quq-0088Bw-S4; Wed, 14 Jun 2023 15:52:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20230606144237.2802780-1-neal.frager@amd.com>
 <87pm684ckh.fsf@48ers.dk>
Date: Wed, 14 Jun 2023 15:52:04 +0200
In-Reply-To: <87pm684ckh.fsf@48ers.dk> (Peter Korsgaard's message of "Tue, 06
 Jun 2023 21:26:22 +0200")
Message-ID: <87cz1ynocb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynq: fix shellcheck issues
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
 >> This patch cleans up board/zynq shellcheck issues.
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 >> .checkpackageignore      | 2 --
 >> board/zynq/post-build.sh | 4 ++--
 >> board/zynq/post-image.sh | 8 ++++----
 >> 3 files changed, 6 insertions(+), 8 deletions(-)

 >> diff --git a/.checkpackageignore b/.checkpackageignore
 >> index 10e70f0787..90a1481e54 100644
 >> --- a/.checkpackageignore
 >> +++ b/.checkpackageignore
 >> @@ -101,8 +101,6 @@ board/udoo/common/post-build.sh Shellcheck
 >> board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 >> board/versal/post-build.sh Shellcheck
 >> board/versal/post-image.sh Shellcheck TrailingSpace
 >> -board/zynq/post-build.sh Shellcheck
 >> -board/zynq/post-image.sh Shellcheck
 >> board/zynqmp/kria/kv260/kv260.sh Shellcheck
 >> board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 >> board/zynqmp/post-build.sh Shellcheck
 >> diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
 >> index 9fd8bbf2c8..7cec673e4b 100755
 >> --- a/board/zynq/post-build.sh
 >> +++ b/board/zynq/post-build.sh
 >> @@ -3,6 +3,6 @@
 >> # genimage will need to find the extlinux.conf
 >> # in the binaries directory
 
 >> -BOARD_DIR="$(dirname $0)"
 >> +BOARD_DIR="$(dirname "$0")"
 
 >> -install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
 >> +install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux.conf

 > This is IMHO not how we should be writing these lines, but instead use
 > quotes around the entire word and use ${} around the variables, E.G.

 > install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"

 > Committed with that fixed, thanks.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
