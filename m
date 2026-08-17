Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36393C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05DFE8116F;
	Fri, 21 Aug 2026 15:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W68oZ2B6Vx4g; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325071;
	bh=+3PKqOotUZdJ8V4uU3lfwYip4peW3lynosFW0baP6qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bx5dyJM6uobj4m6b2g9XUshnC3J2InD2b9nDOLHt+uzRsn4ERNZSmXbxsJlrXhgf4
	 3tl04PxodQmjMCaigmHQ+0gx/JDlMmYpCF+X3yvfKf0qQITur97v/9meh8Q801Yrc0
	 UgZu8+BF+Dua8X32FqzAmU0RT1XEWNchSmYvZBwJdtF/ibCHL3vgLD5qgkyco1tKIW
	 5eVsk8+WxMEfelD/FVCyBDvGV5Io3QovG0nZEL3jvZX4Q0E2yPC/Y8BeRRKe6iUhh/
	 8R894hUAG0m/QKYTJreVSyi0gwTKpSQPftiWcxZ0j+vpZNVzHajxdvRQXLdc9zBp6S
	 I5HemGs6CzmDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13A381138;
	Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 066CCEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC45540B29
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUA5_QVJ6YPn for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FC1940A1E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E1AF8E198; Fri, 21 Aug 2026 15:10:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 16:30:51 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: a96a10636901629307201c0b93f707d839d4bd23
X-Git-Newrev: 1cd4f33690b3b3602d38f4a545dffcab7695b62d
X-Patchwork-Hint: ignore
Message-Id: <20260821151015.9E1AF8E198@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libglib2:
 security bump to version 2.88.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1cd4f33690b3b3602d38f4a545dffcab7695b62d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

There have been a number of security fixes of mixed severity in
libglib2 since 2.86.0, sorted by release:

2.87.1
* CVE-2025-13601: Incorrect calculation of buffer size in
  g_escape_uri_string()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3827
* CVE-2025-14087: Buffer underflow on Glib through glib/gvariant via
  bytestring_parse() or string_parse() leads to OOB Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3834
* CVE-2025-14512: GIO: Integer overflow in file attribute escaping
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3845

2.87.3
* CVE-2026-1484: Integer Overflow -> Buffer Underflow on Glib through
  glib/gbase64.c via g_base64_encode_close() leads to OOB Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3870
* CVE-2026-1485: Buffer underflow on Glib through
  gio/gcontenttype-fdo.c via parse_header() lead to OOB Read/Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3871
* CVE-2026-1489: Integer Overflow on Glib through glib/guniprop.c via
  output_marks() lead to OOB Write in glib/gutf8.c:g_unichar_to_utf8()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3872

2.88.1
* CVE-2026-58010: Buffer Over-read on GLib through
  glib/gvariant-serialiser.c:1253 via gvs_tuple_is_normal()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3915
* CVE-2026-58011: OOB Read on GLib through
  glib/gdatetime.c:g_date_time_get_ymd via invalid `GDateTime`
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3917
* CVE-2026-58012: Buffer Over-read on GLib's g_regex_replace() through
  glib/gregex.c:string_append() via g_utf8_next_char()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3918
* CVE-2026-58013: Buffer Over-read on GLib through glib/giochannel.c
  via "g_io_channel_read_line_backend"
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3925
* CVE-2026-58014: Off-by-one Error on GLib through glib/gkeyfile.c via
  "g_key_file_get_locale_string_list"
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3930
* CVE-2026-58015: Path Traversal on GLib DBus through
  glib/gio/gdbusauthmechanismsha1.c via keyring_lookup_entry,
  mechanism_client_data_receive (COOKIE_SHA1 Client Authentication)
  leads to Arbitrary File Read (sort of)
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3931

2.88.3
* CVE-2026-15588: GDBusServer pre-authentication DoS via unbounded
  SASL line buffering
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3985

Full upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e313a2d2590af689eb1f79e55b5a488154400da1)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 09cd8e9979..8970ef74e3 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.86/glib-2.86.5.sha256sum
-sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
+# https://download.gnome.org/sources/glib/2.88/glib-2.88.3.sha256sum
+sha256  ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b  glib-2.88.3.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ae4b653a15..bfe4920291 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
+LIBGLIB2_VERSION_MAJOR = 2.88
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
