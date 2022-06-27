Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FD5C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D81B481466;
	Mon, 27 Jun 2022 22:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81B481466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tL_zsDrlnb5; Mon, 27 Jun 2022 22:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B285981461;
	Mon, 27 Jun 2022 22:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B285981461
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F11031BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC128415A8
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC128415A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-xGtDW7Ns1N for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:41:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C967E4155F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C967E4155F
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:41:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89B11240002;
 Mon, 27 Jun 2022 22:41:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5xQZ-00D6Zf-OC; Tue, 28 Jun 2022 00:41:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists--- via buildroot <buildroot@buildroot.org>
References: <20220620125636.29944-1-yegorslists@googlemail.com>
Date: Tue, 28 Jun 2022 00:41:55 +0200
In-Reply-To: <20220620125636.29944-1-yegorslists@googlemail.com>
 (yegorslists's message of "Mon, 20 Jun 2022 14:56:36 +0200")
Message-ID: <871qv9sp8s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libusb: bump to version 1.0.26
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "yegorslists---" == yegorslists--- via buildroot <buildroot@buildroot.org> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Remove upstreamed patches.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  ...igure.ac-link-with-latomic-if-needed.patch | 39 -------------------
 >  ..._usbfs-fix-maybe-uninitialized-error.patch | 37 ------------------
 >  package/libusb/libusb.hash                    |  2 +-
 >  package/libusb/libusb.mk                      |  2 +-
 >  4 files changed, 2 insertions(+), 78 deletions(-)
 >  delete mode 100644 package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
 >  delete mode 100644 package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch

 > diff --git a/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
 > deleted file mode 100644

This presumably also means that we can drop _AUTORECONF. Committed with
that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
