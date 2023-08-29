Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A28C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306EB60760;
	Tue, 29 Aug 2023 20:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 306EB60760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HTrqrtwaq-3; Tue, 29 Aug 2023 20:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F1060E55;
	Tue, 29 Aug 2023 20:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76F1060E55
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9421B1BF59B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DD36813A7
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD36813A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Zll4NHEYYBA for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:18:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F1068132D
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1068132D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8347320003;
 Tue, 29 Aug 2023 20:18:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb5As-008PN1-K4; Tue, 29 Aug 2023 22:18:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230723083152.3147145-1-bernd@kuhls.net>
 <20230723083152.3147145-2-bernd@kuhls.net>
 <20230723141918.GE2503916@scaer>
Date: Tue, 29 Aug 2023 22:18:54 +0200
In-Reply-To: <20230723141918.GE2503916@scaer> (Yann E. MORIN's message of
 "Sun, 23 Jul 2023 16:19:18 +0200")
Message-ID: <87pm3538lt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/transmission: fix gtk
 dependencies
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > On 2023-07-23 10:31 +0200, Bernd Kuhls spake thusly:
 >> Buildroot commit 80793107a65d95f8dfd0317a726d3a737c78ef67 forgot to add
 >> packages needed for gtk support:
 >> https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L40
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> ---
 >> v2: removed unneeded glibmm, added gtkmm3 dependencies (Thomas)
 >> 
 >> package/transmission/Config.in       | 8 +++++++-
 >> package/transmission/transmission.mk | 2 +-
 >> 2 files changed, 8 insertions(+), 2 deletions(-)
 >> 
 >> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
 >> index fd4c897497..7ac18ae6d9 100644
 >> --- a/package/transmission/Config.in
 >> +++ b/package/transmission/Config.in
 >> @@ -37,11 +37,17 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 >> 
 >> config BR2_PACKAGE_TRANSMISSION_GTK
 >> bool "transmission-gtk"
 >> +	depends on !BR2_nios2 # gtkmm3
 >> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz -> gtkmm3
 >> +	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango -> gtkmm3
 >> +	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2 -> gtkmm3

 > C++ and xide-char are alrady dependencies of transmission, so no need to
 > replicate them here (yeah, the rule is fuzzy and unwritten, and there is
 > historical baggage where they are replicated).

 >> depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
 >> +	select BR2_PACKAGE_GTKMM3
 >> help
 >> Install transmission GTK-based GUI interface.
 >> 
 >> -comment "transmission-gtk needs NLS enabled"
 >> +comment "transmission-gtk needs libgtk3 and a toolchain with NLS enabled"
 >> +	depends on !BR2_nios2
 >> depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS

 > Still, the sync-4 dependency is missing here, no?

 > Applied to master with the above changes, thanks.

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
