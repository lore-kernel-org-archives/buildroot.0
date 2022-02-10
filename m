Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C87C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5BDC4032E;
	Thu, 10 Feb 2022 21:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfMtYZIdXMn4; Thu, 10 Feb 2022 21:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD29402CA;
	Thu, 10 Feb 2022 21:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2D2D1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90EC340354
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjHqTsDFkbgy for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:49:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68DE240122
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:49:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5968F100004;
 Thu, 10 Feb 2022 21:49:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIHJO-00013x-NH; Thu, 10 Feb 2022 22:49:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
 <20220210192905.4500-5-ps.report@gmx.net>
Date: Thu, 10 Feb 2022 22:49:10 +0100
In-Reply-To: <20220210192905.4500-5-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 10 Feb 2022 20:28:56 +0100")
Message-ID: <87leyitmsp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 04/13] package/gst1-plugins-bad: bump
 version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - removed 0001-neon-Allow-building-against-neon-0-32-x.patch
 >   (from upstream [1])

 > - add codecalpha option (VP8/VP9 alpha support)

 > - add qroverlay option (overlay data on top of video in the form of a QR code)
 >   with json-glib and libqrencode dependencies (omit json-glib explicit
 >   dependencies as they are the same as for gstreamer1, glib2 BR2_USE_WCHAR,
 >   BR2_TOOLCHAIN_HAS_THREADS and BR2_USE_MMU), place instead to 'plugins without
 >   external deps' section into 'plugins that need external deps' section as it
 >   clearly has dependencies (prelimary to upstream commit [2])

 > - add aes option (AES encryption/decryption plugin)

 > - disable new option asio (Steinberg Audio Streaming, windows only)

 > - disable new option gs (Google Cloud Storage, needs storage_client library)

 > - disable new option ldac (LDAC bluetooth audio codec, needs ldacBT-enc library)

 > - remove legacy option ofa (disabled)

 > - disable new option onnx (ONNX neural network, needs libonnxruntime library)

 > - disable new option isac (iSAC plugin, needs webrtc-audio-coding-1 library)

 > - removed libmms ('Microsoft Multi Media Server streaming protocol' option,
 >   add Config.in.legacy entry

 > - enable new gpl option ('Allow build plugins that have (A)GPL-licensed
 >   dependencies') in case gpl plugin enabled

 > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0.patch
 > [2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5d70c168b356691073a0d22f7ce3ea7efb20641c.patch

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - fix rebase/merge artefact in Config.in.legacy (Baruch Siach)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
