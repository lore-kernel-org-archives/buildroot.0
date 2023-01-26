Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D923C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2506E612A3;
	Tue, 21 Feb 2023 01:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2506E612A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50wJ8zL44SZb; Tue, 21 Feb 2023 01:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89BB617B4;
	Tue, 21 Feb 2023 01:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89BB617B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97061BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F9376FBCA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F9376FBCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98EtHcYUvVSJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1679A6FBBA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1679A6FBBA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FC468648F; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Jan 2023 17:07:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ec326fb97e51baa9f874d309a8fb2c69d6c8c18
X-Git-Newrev: 722b84eafa5e3d9540e0a80bae0c971a3a778358
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.0FC468648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nginx: bump to version
 1.22.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=722b84eafa5e3d9540e0a80bae0c971a3a778358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop eleventh patch (already in version)
- Update hash of LICENSE file (update in year)
- pcre2 is supported (and enabled by default) since
  https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0f2e4d6052b

http://nginx.org/en/CHANGES-1.22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nginx/0011-Mp4-disabled-duplicate-atoms.patch  | 315 ---------------------
 package/nginx/Config.in                            |   2 +-
 package/nginx/nginx.hash                           |   4 +-
 package/nginx/nginx.mk                             |  11 +-
 4 files changed, 7 insertions(+), 325 deletions(-)

diff --git a/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch b/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch
deleted file mode 100644
index 7baa810b56..0000000000
--- a/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch
+++ /dev/null
@@ -1,315 +0,0 @@
-From 6b022a5556af22b6e18532e547a6ae46b0d8c6ea Mon Sep 17 00:00:00 2001
-From: Roman Arutyunyan <arut@nginx.com>
-Date: Wed, 19 Oct 2022 10:53:17 +0300
-Subject: [PATCH] Mp4: disabled duplicate atoms.
-
-Most atoms should not appear more than once in a container.  Previously,
-this was not enforced by the module, which could result in worker process
-crash, memory corruption and disclosure.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
- 1 file changed, 147 insertions(+)
-
-diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
-index 9c3f627f..4eff01e9 100644
---- a/src/http/modules/ngx_http_mp4_module.c
-+++ b/src/http/modules/ngx_http_mp4_module.c
-@@ -1121,6 +1121,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-         return NGX_ERROR;
-     }
- 
-+    if (mp4->ftyp_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
- 
-     ftyp_atom = ngx_palloc(mp4->request->pool, atom_size);
-@@ -1179,6 +1185,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-         return NGX_DECLINED;
-     }
- 
-+    if (mp4->moov_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     conf = ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_module);
- 
-     if (atom_data_size > mp4->buffer_size) {
-@@ -1246,6 +1258,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom");
- 
-+    if (mp4->mdat_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     data = &mp4->mdat_data_buf;
-     data->file = &mp4->file;
-     data->in_file = 1;
-@@ -1372,6 +1390,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom");
- 
-+    if (mp4->mvhd_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom_header = ngx_mp4_atom_header(mp4);
-     mvhd_atom = (ngx_mp4_mvhd_atom_t *) atom_header;
-     mvhd64_atom = (ngx_mp4_mvhd64_atom_t *) atom_header;
-@@ -1637,6 +1661,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->tkhd_size = atom_size;
-     trak->movie_duration = duration;
- 
-@@ -1676,6 +1707,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->mdia_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1799,6 +1836,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->mdhd_size = atom_size;
-     trak->timescale = timescale;
-     trak->duration = duration;
-@@ -1862,6 +1906,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->hdlr_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1890,6 +1940,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->minf_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1933,6 +1989,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->vmhd_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1964,6 +2029,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->smhd_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1995,6 +2069,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->dinf_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -2023,6 +2103,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->stbl_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -2144,6 +2230,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->stsd_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -2212,6 +2304,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->time_to_sample_entries = entries;
- 
-     atom = &trak->stts_atom_buf;
-@@ -2480,6 +2579,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-                    "sync sample entries:%uD", entries);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->sync_samples_entries = entries;
- 
-     atom_table = atom_header + sizeof(ngx_http_mp4_stss_atom_t);
-@@ -2678,6 +2784,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-                    "composition offset entries:%uD", entries);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->composition_offset_entries = entries;
- 
-     atom_table = atom_header + sizeof(ngx_mp4_ctts_atom_t);
-@@ -2881,6 +2994,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->sample_to_chunk_entries = entries;
- 
-     atom = &trak->stsc_atom_buf;
-@@ -3213,6 +3333,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-                    "sample uniform size:%uD, entries:%uD", size, entries);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->sample_sizes_entries = entries;
- 
-     atom_table = atom_header + sizeof(ngx_mp4_stsz_atom_t);
-@@ -3396,6 +3523,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(uint32_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stco/co64 atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->chunks = entries;
- 
-     atom = &trak->stco_atom_buf;
-@@ -3602,6 +3739,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(uint64_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stco/co64 atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->chunks = entries;
- 
-     atom = &trak->co64_atom_buf;
--- 
-2.30.2
-
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 90a0822298..406a1c861a 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -214,7 +214,7 @@ config BR2_PACKAGE_NGINX_HTTP_REFERER_MODULE
 config BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE
 	bool "ngx_http_rewrite_module"
 	default y
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Enable ngx_http_rewrite_module
 
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 06d3392a2e..06454c5e32 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49  nginx-1.20.1.tar.gz
+sha256  9ebb333a9e82b952acd3e2b4aeb1d4ff6406f72491bab6cd9fe69f0dea737f31  nginx-1.22.1.tar.gz
 # License files, locally calculated
-sha256  b57270c1f73eb6624b38b2d0a1affcec56b21fab39efbf8c837428f05cef1d73  LICENSE
+sha256  ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 62ea379ffc..10cc95d90e 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.20.1
+NGINX_VERSION = 1.22.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
@@ -19,9 +19,6 @@ NGINX_CONF_OPTS = \
 	--with-cpp="$(TARGET_CC)" \
 	--with-ld-opt="$(TARGET_LDFLAGS)"
 
-# 0011-Mp4-disabled-duplicate-atoms.patch
-NGINX_IGNORE_CVES += CVE-2022-41741 CVE-2022-41742
-
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
 # See system/skeleton/etc/passwd
@@ -83,8 +80,8 @@ else
 NGINX_CONF_ENV += ngx_force_have_libatomic=no
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-NGINX_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+NGINX_DEPENDENCIES += pcre2
 NGINX_CONF_OPTS += --with-pcre
 else
 NGINX_CONF_OPTS += --without-pcre
@@ -167,7 +164,7 @@ NGINX_CONF_OPTS += --without-http_gzip_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE),y)
-NGINX_DEPENDENCIES += pcre
+NGINX_DEPENDENCIES += pcre2
 else
 NGINX_CONF_OPTS += --without-http_rewrite_module
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
