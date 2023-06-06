Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A806C7EE43
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 19:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B54E64173D;
	Tue,  6 Jun 2023 19:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B54E64173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0HVYGrBHI9j; Tue,  6 Jun 2023 19:26:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBAA941734;
	Tue,  6 Jun 2023 19:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBAA941734
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C31781BF339
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 978A541C2D
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 978A541C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUvuNSiqnXsJ for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 19:26:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356504194B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 356504194B
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 19:26:26 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E86520002;
 Tue,  6 Jun 2023 19:26:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q6cJy-00EeGD-Df; Tue, 06 Jun 2023 21:26:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20230606144237.2802780-1-neal.frager@amd.com>
Date: Tue, 06 Jun 2023 21:26:22 +0200
In-Reply-To: <20230606144237.2802780-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 6 Jun 2023 15:42:37 +0100")
Message-ID: <87pm684ckh.fsf@48ers.dk>
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch cleans up board/zynq shellcheck issues.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  .checkpackageignore      | 2 --
 >  board/zynq/post-build.sh | 4 ++--
 >  board/zynq/post-image.sh | 8 ++++----
 >  3 files changed, 6 insertions(+), 8 deletions(-)

 > diff --git a/.checkpackageignore b/.checkpackageignore
 > index 10e70f0787..90a1481e54 100644
 > --- a/.checkpackageignore
 > +++ b/.checkpackageignore
 > @@ -101,8 +101,6 @@ board/udoo/common/post-build.sh Shellcheck
 >  board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 >  board/versal/post-build.sh Shellcheck
 >  board/versal/post-image.sh Shellcheck TrailingSpace
 > -board/zynq/post-build.sh Shellcheck
 > -board/zynq/post-image.sh Shellcheck
 >  board/zynqmp/kria/kv260/kv260.sh Shellcheck
 >  board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 >  board/zynqmp/post-build.sh Shellcheck
 > diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
 > index 9fd8bbf2c8..7cec673e4b 100755
 > --- a/board/zynq/post-build.sh
 > +++ b/board/zynq/post-build.sh
 > @@ -3,6 +3,6 @@
 >  # genimage will need to find the extlinux.conf
 >  # in the binaries directory
 
 > -BOARD_DIR="$(dirname $0)"
 > +BOARD_DIR="$(dirname "$0")"
 
 > -install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
 > +install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux.conf

This is IMHO not how we should be writing these lines, but instead use
quotes around the entire word and use ${} around the variables, E.G.

install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
