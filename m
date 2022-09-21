Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB6ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 17:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3F41409EA;
	Wed, 21 Sep 2022 17:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3F41409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQwKegApH1iM; Wed, 21 Sep 2022 17:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E520409F1;
	Wed, 21 Sep 2022 17:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E520409F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3940F1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 17:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1323E409F1
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 17:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1323E409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ha-HeL9HeKxp for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 17:44:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1AB409EA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B1AB409EA
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 17:44:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C44ACFF803;
 Wed, 21 Sep 2022 17:44:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ob3m3-002I8K-J9; Wed, 21 Sep 2022 19:44:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220919142007.1967434-1-aperez@igalia.com>
Date: Wed, 21 Sep 2022 19:44:39 +0200
In-Reply-To: <20220919142007.1967434-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 19 Sep 2022 17:20:07 +0300")
Message-ID: <878rmcei60.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.38.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Update to a new major release which brings in improvements and a few
 > new features. Release notes:

 >   https://webkitgtk.org/2022/09/16/webkitgtk2.38.0-released.html

 > This release also includes security fixes for CVE-2022-32886,
 > CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:

 >   https://webkitgtk.org/security/WSA-2022-0009.html

 > The CMake option to build the documentation has been renamed from
 > ENABLE_GTK_DOC to ENABLE_DOCUMENTATION, therefore update the build
 > recipe accordingly. Option USE_LIBNOTIFY is no longer available, as
 > WebKit now uses the notification portal D-Bus API directly without
 > relying on libnotify. Lastly, version 2.38.0 introduces a new WebRTC
 > implementation based on GstWebRTC which is left disabled for now to
 > keep the existing status quo (WebRTC not available), and adding an
 > option to enable it can be done in a follow-up patch.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

As mentioned elsewhere, this breaks on systems with cmake 3.18.x /
3.19.x (E.G. Debian stable, ..) as this version requires cmake 3.20:

CMake Error at Source/cmake/OptionsGTK.cmake:11 (message):
  Building with Makefiles requires CMake 3.20 or newer.  Either enable Ninja
  by passing -GNinja, or upgrade CMake.

Given how long it takes to build webkit, perhaps building it with ninja
makes more sense? Ideally we would extend pkg-cmake.mk so that you can
define per-package if it should build with ninja or make rather than
having custom logic in webkitgtk.mk.

Alternatively we will need to bump the minimal cmake version to 3.20,
but given that E.G. what is is Debian is older than that, this isn't
really a great option.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
