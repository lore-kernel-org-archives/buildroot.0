Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D44C55174
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34B824034A;
	Wed,  5 Aug 2026 19:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQAkOcAh0ozo; Wed,  5 Aug 2026 19:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524DB40801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785959108;
	bh=9wU8LmxTvAwK6RpUsQnlakceCNudXOdN4fTZCi4+svo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rf+GY15MYVnIn8TYWHtkm0jrugWRYTeHJsrBVeo7QNoOJHQZXv/t5Y/ffPweMYXzM
	 BED7yUVNCb1fWZdmDIrtfmO+eNJWqDpsK6XuaeHxv1uhN9CFCeP4Ln4OeBy68L0Ij1
	 DmI8jhQLmk7GH4cCA9Ar7zw/5C0YR+Xg0pqv+4f0X4QIfi3XVIGSJsB+JugE8C7Xm9
	 zaQcwi4q6HxfMXnTkJmTGyZU5wCvPYFkNyQqLQQz8Pvq2eOlyykb2UU5vhrSf8TDDK
	 8p4jginUKdjzVWfxJHssSOgesWrZ9/s5zTRpx2MvOtb0kATdTnn1XZcRRUX4NYNT3L
	 8MiFLtbAvaRtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524DB40801;
	Wed,  5 Aug 2026 19:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97CE5144
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 19:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A52E607D8
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 19:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1S8nTwU7wpgd for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 19:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79035605CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79035605CA
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 19:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB78D8C9A3; Wed,  5 Aug 2026 19:44:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Aug 2026 21:35:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c323d714afbc772050fbf665d67700f9a869d79
X-Git-Newrev: e313a2d2590af689eb1f79e55b5a488154400da1
X-Patchwork-Hint: ignore
Message-Id: <20260805194419.BB78D8C9A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: security bump to version
 2.88.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e313a2d2590af689eb1f79e55b5a488154400da1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
