Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2870C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 949BA816F1;
	Thu, 17 Jul 2025 20:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpDRquVwg3nM; Thu, 17 Jul 2025 20:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 445E6819B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445E6819B4;
	Thu, 17 Jul 2025 20:13:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4287226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA94E40358
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRnmTOBpnHge for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 657FA400C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 657FA400C0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 657FA400C0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:13:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8859B977A8D; Thu, 17 Jul 2025 22:13:39 +0200 (CEST)
Message-ID: <87458598-93d1-40e4-b7f7-36044adfcf38@rnout.be>
Date: Thu, 17 Jul 2025 22:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tim Soubry <tim.soubry@mind.be>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250711143224.2114003-1-tim.soubry@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250711143224.2114003-1-tim.soubry@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QXSqfXIZHeeYDWhIpxj22F1+HWky4ceFZGfUU1RYQMI=;
 b=nFRSAJ29vJWMqZUrhA0Y1BYeuPM8zxrErUXeKYl12jnLrbPH0B/r8hzZxoVROZMhcrhZ53
 WmENI+TvY0LEnse2x10/Q3w+UpNlYn56MXGUcOIeC8BcjEysgS7lPWAJBAbIQH/yVG3x0A
 3/Ca6jJ3edoX5fkp4MMLQBM4plTgQTV2ca+FhOtGrtBZ/MDJvRJoAy5dvJwIutzDum3Rdx
 Gf+0Y6NaedFnAAeACVRVQVrSHSBY2JbaMx4gCSOTBwr6Ni8fLtlD3Z7ki2JioORx8YzmAW
 HY7lDQmWv/09+awg3o/ZWlp1QuVkVNjBO5Z8elzYPfCxNjxzSpW1CeDOznZC6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nFRSAJ29
Subject: Re: [Buildroot] [PATCH 1/1 v3] package/ncmpc: bump version to 0.52
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2025 16:32, Tim Soubry via buildroot wrote:
> Applying version bump of ncmpc to version 0.52 as proposed in [1].
> As from version 0.50 of ncmpc, fmt got added as a dependency [2]. This was
> also added to package/ncmpc/Config.in and package/ncmpc/ncmpc.mk.
> 
> For release notes, see:
> https://github.com/MusicPlayerDaemon/ncmpc/blob/master/NEWS
> 
> Comparision between version 0.49 and 0.52:
> https://github.com/MusicPlayerDaemon/ncmpc/compare/v0.49..v0.52
> 
> [1] https://lore.kernel.org/buildroot/20250707112536.1644236-1-tim.soubry@mind.be/T/#rb3b968fff23bac0298e33f473d63a1ad470d38e3
> [2] https://github.com/MusicPlayerDaemon/ncmpc/commit/c3b0055d06f8e8efab7f388646beb7645b90d063
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
> v2->v3: Deleted libatomic dependency for Sparc patch, as discussed in https://lore.kernel.org/buildroot/62efa9f78ee42286cfbd1cc75c7faf5b@umbiko.net/T/#u
>   ...cro-my_gettext-do-not-define-gettext.patch | 199 ------------------
>   ...uild-add-atomic-dependency-for-sparc.patch |  45 ----
>   package/ncmpc/Config.in                       |   1 +
>   package/ncmpc/ncmpc.hash                      |   2 +-
>   package/ncmpc/ncmpc.mk                        |   3 +-
>   5 files changed, 4 insertions(+), 246 deletions(-)
>   delete mode 100644 package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
>   delete mode 100644 package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
> 
> diff --git a/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch b/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
> deleted file mode 100644
> index 296d3d17d6..0000000000
> --- a/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
> +++ /dev/null
> @@ -1,199 +0,0 @@
> -From d90e80cf0b3525d780b57d016afaa879e16b0fe4 Mon Sep 17 00:00:00 2001
> -From: Max Kellermann <max@musicpd.org>
> -Date: Tue, 23 Jul 2024 14:15:16 +0200
> -Subject: [PATCH] i18n: add macro my_gettext(), do not define "gettext"
> -
> -Defining the macro "gettext" can cause breakages if the C++ standard
> -library happens to include libintl.h (which GCC 14 does).
> -
> -Signed-off-by: Tim Soubry <tim.soubry@mind.be>
> -Upstream: https://github.com/MusicPlayerDaemon/ncmpc/commit/249b62fc9f5e3a653ebdd22da0d75fbe87069457
> ----
> - src/Command.cxx    | 2 +-
> - src/HelpPage.cxx   | 6 +++---
> - src/KeyDefPage.cxx | 2 +-
> - src/SearchPage.cxx | 6 +++---
> - src/SongPage.cxx   | 8 ++++----
> - src/TabBar.cxx     | 2 +-
> - src/i18n.h         | 8 +++-----
> - 7 files changed, 16 insertions(+), 18 deletions(-)
> -
> -diff --git a/src/Command.cxx b/src/Command.cxx
> -index 1caac250..b12a4a35 100644
> ---- a/src/Command.cxx
> -+++ b/src/Command.cxx
> -@@ -238,7 +238,7 @@ get_cmds_max_name_width()
> - const char *
> - get_key_description(Command command)
> - {
> --	return gettext(cmds[size_t(command)].description);
> -+	return my_gettext(cmds[size_t(command)].description);
> - }
> -
> - const char *
> -diff --git a/src/HelpPage.cxx b/src/HelpPage.cxx
> -index fad0f8c0..c07a20c4 100644
> ---- a/src/HelpPage.cxx
> -+++ b/src/HelpPage.cxx
> -@@ -242,7 +242,7 @@ HelpPage::GetListItemText(char *, size_t, unsigned i) const noexcept
> - 	assert(i < std::size(help_text));
> -
> - 	if (row->text != nullptr)
> --		return gettext(row->text);
> -+		return my_gettext(row->text);
> -
> - 	if (row->command != Command::NONE)
> - 		return get_key_description(row->command);
> -@@ -272,7 +272,7 @@ HelpPage::PaintListItem(WINDOW *w, unsigned i,
> -
> - 	if (row->command == Command::NONE) {
> - 		if (row->text != nullptr)
> --			mvwaddstr(w, y, 6, gettext(row->text));
> -+			mvwaddstr(w, y, 6, my_gettext(row->text));
> - 		else if (row->highlight == 2)
> - 			mvwhline(w, y, 3, ACS_HLINE, width - 6);
> - 	} else {
> -@@ -285,7 +285,7 @@ HelpPage::PaintListItem(WINDOW *w, unsigned i,
> - 		mvwaddch(w, y, 21, ':');
> - 		mvwaddstr(w, y, 23,
> - 			  row->text != nullptr
> --			  ? gettext(row->text)
> -+			  ? my_gettext(row->text)
> - 			  : get_key_description(row->command));
> - 	}
> - }
> -diff --git a/src/KeyDefPage.cxx b/src/KeyDefPage.cxx
> -index be638940..dd301d39 100644
> ---- a/src/KeyDefPage.cxx
> -+++ b/src/KeyDefPage.cxx
> -@@ -434,7 +434,7 @@ CommandListPage::GetListItemText(char *buffer, size_t size,
> -
> - 	snprintf(buffer + get_cmds_max_name_width(),
> - 		 size - get_cmds_max_name_width(),
> --		 " - %s", gettext(get_command_definitions()[idx].description));
> -+		 " - %s", my_gettext(get_command_definitions()[idx].description));
> -
> - 	return buffer;
> - }
> -diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
> -index 4f2e3228..9ae8436b 100644
> ---- a/src/SearchPage.cxx
> -+++ b/src/SearchPage.cxx
> -@@ -142,7 +142,7 @@ public:
> - 				 " %s : %s [%s]",
> - 				 GetGlobalKeyBindings().GetKeyNames(Command::SEARCH_MODE).c_str(),
> - 				 get_key_description(Command::SEARCH_MODE),
> --				 gettext(mode[options.search_mode].label));
> -+				 my_gettext(mode[options.search_mode].label));
> - 			return buffer;
> - 		}
> -
> -@@ -453,7 +453,7 @@ SearchPage::GetTitle(char *str, size_t size) const noexcept
> - 			 "%s '%s' [%s]",
> - 			 _("Search"),
> - 			 pattern.c_str(),
> --			 gettext(mode[options.search_mode].label));
> -+			 my_gettext(mode[options.search_mode].label));
> - 	else
> - 		return _("Search");
> -
> -@@ -478,7 +478,7 @@ SearchPage::OnCommand(struct mpdclient &c, Command cmd)
> - 		if (mode[options.search_mode].label == nullptr)
> - 			options.search_mode = 0;
> - 		screen_status_printf(_("Search mode: %s"),
> --				     gettext(mode[options.search_mode].label));
> -+				     my_gettext(mode[options.search_mode].label));
> -
> - 		if (pattern.empty())
> - 			/* show the new mode in the help text */
> -diff --git a/src/SongPage.cxx b/src/SongPage.cxx
> -index c0830a9e..6d166b13 100644
> ---- a/src/SongPage.cxx
> -+++ b/src/SongPage.cxx
> -@@ -174,14 +174,14 @@ static std::unique_ptr<Page>
> - screen_song_init(ScreenManager &_screen, WINDOW *w, Size size) noexcept
> - {
> - 	for (unsigned i = 0; tag_labels[i].label != nullptr; ++i) {
> --		unsigned width = StringWidthMB(gettext(tag_labels[i].label));
> -+		unsigned width = StringWidthMB(my_gettext(tag_labels[i].label));
> - 		if (width > max_tag_label_width)
> - 			max_tag_label_width = width;
> - 	}
> -
> - 	for (unsigned i = 0; i < std::size(stats_labels); ++i) {
> - 		if (stats_labels[i] != nullptr) {
> --			unsigned width = StringWidthMB(gettext(stats_labels[i]));
> -+			unsigned width = StringWidthMB(my_gettext(stats_labels[i]));
> -
> - 			if (width > max_stats_label_width)
> - 				max_stats_label_width = width;
> -@@ -267,7 +267,7 @@ get_tag_label(unsigned tag) noexcept
> - {
> - 	for (unsigned i = 0; tag_labels[i].label != nullptr; ++i)
> - 		if (tag_labels[i].tag_type == tag)
> --			return gettext(tag_labels[i].label);
> -+			return my_gettext(tag_labels[i].label);
> -
> - 	assert(tag < MPD_TAG_COUNT);
> - 	return mpd_tag_name((enum mpd_tag_type)tag);
> -@@ -351,7 +351,7 @@ SongPage::AddSong(const struct mpd_song *song) noexcept
> - void
> - SongPage::AppendStatsLine(enum stats_label label, const char *value) noexcept
> - {
> --	AppendLine(gettext(stats_labels[label]), value, max_stats_label_width);
> -+	AppendLine(my_gettext(stats_labels[label]), value, max_stats_label_width);
> - }
> -
> - bool
> -diff --git a/src/TabBar.cxx b/src/TabBar.cxx
> -index 426bce12..0518801f 100644
> ---- a/src/TabBar.cxx
> -+++ b/src/TabBar.cxx
> -@@ -48,7 +48,7 @@ PaintTabBar(WINDOW *w, const PageMeta &current_page_meta,
> - 			title = current_page_title;
> -
> - 		if (title == nullptr)
> --			title = gettext(page->title);
> -+			title = my_gettext(page->title);
> -
> - 		PaintPageTab(w, page->command, title,
> - 			     page == &current_page_meta);
> -diff --git a/src/i18n.h b/src/i18n.h
> -index 8bda456e..7e98c1b0 100644
> ---- a/src/i18n.h
> -+++ b/src/i18n.h
> -@@ -1,8 +1,7 @@
> - // SPDX-License-Identifier: GPL-2.0-or-later
> - // Copyright The Music Player Daemon Project
> -
> --#ifndef I18N_H
> --#define I18N_H
> -+#pragma once
> -
> - #include "config.h"
> -
> -@@ -10,6 +9,7 @@
> -
> - #include <libintl.h> // IWYU pragma: export
> -
> -+#define my_gettext(x) gettext(x)
> - #define _(x) gettext(x)
> -
> - #ifdef gettext_noop
> -@@ -19,12 +19,10 @@
> - #endif
> -
> - #else
> --#define gettext(x) (x)
> -+#define my_gettext(x) (x)
> - #define  _(x) x
> - #define N_(x) x
> - #endif
> -
> - #define YES_TRANSLATION _("y")
> - #define NO_TRANSLATION _("n")
> --
> --#endif
> ---
> -2.39.5
> -
> diff --git a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
> deleted file mode 100644
> index 2b726b7437..0000000000
> --- a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 72ef4c1c3c11fc05c057f2b40b87de92a573f2eb Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 11 Feb 2019 21:42:01 +0100
> -Subject: [PATCH] meson.build: add atomic dependency for sparc
> -
> -Linking with libatomic is needed on sparc otherwise build fails on:
> -ncmpc@exe/src_Main.cxx.o: In function `std::__atomic_base<long>::operator++()':
> -/home/buildroot/autobuild/instance-1/output/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/6.4.0/bits/atomic_base.h:296: undefined reference to `__atomic_fetch_add_4'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://github.com/MusicPlayerDaemon/ncmpc/pull/45
> -[Dario: make the patch to be applied with fuzz factor 0]
> -Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ----
> - meson.build | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/meson.build b/meson.build
> -index fa0eff9408b6..819674cbede4 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -232,6 +232,9 @@ else
> -   pcre_dep = declare_dependency()
> - endif
> -
> -+# Needed on sparc
> -+atomic_dep = cc.find_library('atomic', required: false)
> -+
> - inc = include_directories(
> -   'src',
> -
> -@@ -445,6 +448,7 @@ ncmpc = executable('ncmpc',
> -   sources,
> -   include_directories: inc,
> -   dependencies: [
> -+    atomic_dep,
> -     thread_dep,
> -     event_dep,
> -     pcre_dep,
> ---
> -2.43.0
> -
> diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
> index 61c186a4ae..2eb5d23967 100644
> --- a/package/ncmpc/Config.in
> +++ b/package/ncmpc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_NCMPC
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
> +	select BR2_PACKAGE_FMT
>   	select BR2_PACKAGE_LIBMPDCLIENT
>   	select BR2_PACKAGE_NCURSES
>   	help
> diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
> index 1d288294d1..41cfd86584 100644
> --- a/package/ncmpc/ncmpc.hash
> +++ b/package/ncmpc/ncmpc.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  65bbec0ede9e6bcf62ac647b0c706485beb2bdd5db70ca8d60103f32f162cf29  ncmpc-0.49.tar.xz
> +sha256  3af225496fe363a8534a9780fb46ae1bd17baefd80cf4ba7430a19cddd73eb1a  ncmpc-0.52.tar.xz
>   
>   # Hash for license file:
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
> index ee75c2a676..726f524bfa 100644
> --- a/package/ncmpc/ncmpc.mk
> +++ b/package/ncmpc/ncmpc.mk
> @@ -5,13 +5,14 @@
>   ################################################################################
>   
>   NCMPC_VERSION_MAJOR = 0
> -NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).49
> +NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).52
>   NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
>   NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
>   NCMPC_DEPENDENCIES = \
>   	host-pkgconf \
>   	libmpdclient \
>   	ncurses \
> +	fmt \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>   	$(TARGET_NLS_DEPENDENCIES)
>   NCMPC_LICENSE = GPL-2.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
