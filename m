Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE0CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F063784246;
	Fri, 29 May 2026 16:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pue9s-FI6ccu; Fri, 29 May 2026 16:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ABEE8422D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071516;
	bh=TEUzwBwbck7jZF0ENjaLLHkAYgQc++yiRmW3vk4+UbE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=icw2FaRtXStr4oRPC6f70nvC2wSX3LGWBrH6GbTUqmRnTJ7iOjBle6gEF876Iw68W
	 kXMQmIOVXvEoq28gjn+DuJ9fKL/D7wLtH4qqStDsPWVAxCZxxkSCT69LlNMSk6X2Cz
	 2IeTDY9Vo85WNfSOmt7fE/VK6cN9tQadXzbmUtHuCEygV1crSmQuElfp+RBwHbgsYh
	 f2/GGgh73ngyieax8Ex0qmkiV/CQ10KWsm4m8MoVZxPSanWOIq/rhWuaY0DlCPOCn4
	 HBUsFUANrSxOcS2WMog/OMJF4vwHjwFyhv1zLf9c8C+A3wl1OPyXa1p+UMEKdNazNm
	 ZltvOQlIFmgSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABEE8422D;
	Fri, 29 May 2026 16:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55009F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 436CD421FD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpsQiSauGQWS for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D151D421D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D151D421D2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D151D421D2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso122412855e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071509; x=1780676309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JH55apUPDRYDTH4guwl7FKbjXSXiDdBXFZ2FKDW2pKA=;
 b=BHtU+Q9Asvk3kYQdX3A5gZCPWqfXjiIS6GhemnDe7cDyxffNhmnzAISgWU6XsGJcC1
 ALMWLbNY2N0ZqF6ljUKErHHVq3iA+sN/QCP8fyfhonBAMMHezWtLY3mAf1jfrI16xGf1
 h5jaZXhl+m0f6oTDpFO01WsQL+Auvv9ufz4FZTYbwlPQ5HadTxMagMECe/hXfgvzP2yb
 EDJZbfcVJKQUro3kZD5gUmeaZUO/A9U/lpuyAfpACQtmfEMugeUhIMLeiB/Cr8Ackb42
 3xoPGsUgobULNFjA/PgmoJcD162X5KStSI75Fo/XFfZwE3dp+rseWXfofneTMnvb4+1T
 Kkrw==
X-Gm-Message-State: AOJu0Yz3UFbTQnqCL6qeUssqzuEMFWLrXX1w33WkgFQlmwqTkTNRRUDF
 SrajP7nRD5aMWqum8kSGBp4HHo3riNqePIuh4Fzy34tGTk6/hj4I3AYKm1IZ5KSNXOYbW8g1l6Q
 lA6g5
X-Gm-Gg: Acq92OFINTOww4G1yUp25CCv/OpRq0S4QTlCiNd+OVSB5JWriGavesCIecP3aT0xEW+
 hyPx1hW09RRd6FLIWK4XX54mEx+2OqCw9fQfGQRbh6fcfG6+jK8P3+y4kB5HyKsly7CMwWkmg/f
 YV5y+2tyUXHPvvHVBTT5grPvoSNChgpk0nKDL+IoFQpJZI0w2leUJLP1nngVwYku1SDKkTwhVVK
 cuTXr/PeRuCw769CetYj4ovUaEXkTACK56d1COqsw7L1ifvrgfn0zuVC9FAmZ6h8Tt6RJyDBmc3
 pfdPpqlwagQpqkk6HW3VTjffhuBLl+HlKkCdu/RhBLlOTS1tSvhbYv9A3JsCU1tHbZbq+PijPfm
 NBMLE+wFSJjU+Lq0RdG7XRfSGPOADwtlyLYHt2ZDr8cK4mIJwQnr4NxiXWT88eOLtpxb0sYDrtc
 VSNYA9VOYzwqdR/7rz67pKRabIZv1DoWc5thmlZsGNknRsmP5/TyxIa2Ppbw==
X-Received: by 2002:a05:600c:c3cb:20b0:490:3d62:eb0 with SMTP id
 5b1f17b1804b1-490a293b7d7mr4255095e9.24.1780071509306; 
 Fri, 29 May 2026 09:18:29 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm4810103f8f.0.2026.05.29.09.18.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:18:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:18:25 +0200
Message-ID: <20260529161826.517403-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529161826.517403-1-thomas.perale@mind.be>
References: <20260529161826.517403-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780071509; x=1780676309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JH55apUPDRYDTH4guwl7FKbjXSXiDdBXFZ2FKDW2pKA=;
 b=bc6HFfKde+oEMP7XiBfwfQNAkTe55FinHPDhKXAaBzAwQpCwrRFS3/KkiGIHUcoQPn
 vfkluciFd/Mk8sii5jKyJnUFN7pKGFy2V+0mpvkBaU2qjG21C1Nr/lLP4E+xG0Wpspra
 FQbfUbBw0m9PUu5Ugz7XunAbYs5f2NoOQDVxB6B6QGqLPGYEA3bNthkB82DQ9PFB/3Uu
 O2vpM6wf18RrUll85Xr2WRdYXZV/KSaQGQypexsqbEmgKU4uriJA2zHOcXI1jP7f6x7s
 +gWES9/0TyD5emsbh+amX/VTlwMBoisnwLOIPxiUIN802soK5XLAMEdJmOAUga9xWuEp
 V45w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bc6HFfKd
Subject: [Buildroot] [PATCH 4/5] package/busybox: patch CVE-2026-2615{7,8}
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Based on the work of the OpenEmbedded community. This commit patches the
following vulnerabilities:

- CVE-2026-26157:
    A flaw was found in BusyBox. Incomplete path sanitization in its
    archive extraction utilities allows an attacker to craft malicious
    archives that when extracted, and under specific conditions, may write
    to files outside the intended directory. This can lead to arbitrary
    file overwrite, potentially enabling code execution through the
    modification of sensitive system files.

    https://www.cve.org/CVERecord?id=CVE-2026-26157

- CVE-2026-26158:
    A flaw was found in BusyBox. This vulnerability allows an attacker to
    modify files outside of the intended extraction directory by crafting
    a malicious tar archive containing unvalidated hardlink or symlink
    entries. If the tar archive is extracted with elevated privileges,
    this flaw can lead to privilege escalation, enabling an attacker to
    gain unauthorized access to critical system files.

    https://www.cve.org/CVERecord?id=CVE-2026-26158

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...tar-strip-unsafe-hardlink-components.patch | 198 ++++++++++++++++++
 ...rip-unsafe-components-from-hardlinks.patch |  38 ++++
 package/busybox/busybox.mk                    |   4 +
 3 files changed, 240 insertions(+)
 create mode 100644 package/busybox/0017-tar-strip-unsafe-hardlink-components.patch
 create mode 100644 package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch

diff --git a/package/busybox/0017-tar-strip-unsafe-hardlink-components.patch b/package/busybox/0017-tar-strip-unsafe-hardlink-components.patch
new file mode 100644
index 0000000000..604f1a4f9b
--- /dev/null
+++ b/package/busybox/0017-tar-strip-unsafe-hardlink-components.patch
@@ -0,0 +1,198 @@
+From 3fb6b31c716669e12f75a2accd31bb7685b1a1cb Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does the same
+
+Defends against files like these (python reproducer):
+
+import tarfile
+ti = tarfile.TarInfo("leak_hosts")
+ti.type = tarfile.LNKTYPE
+ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
+ti.size = 0
+with tarfile.open("/tmp/hardlink.tar", "w") as t:
+	t.addfile(ti)
+
+function                                             old     new   delta
+skip_unsafe_prefix                                     -     127    +127
+get_header_tar                                      1752    1754      +2
+.rodata                                           106861  106856      -5
+unzip_main                                          2715    2706      -9
+strip_unsafe_prefix                                  102      18     -84
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157
+CVE: CVE-2026-26158
+Upstream: https://git.busybox.net/busybox/commit/?id=3fb6b31c716669e12f75a2accd31bb7685b1a1cb
+Upstream: https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/libarchive/data_extract_all.c      |  7 +++--
+ archival/libarchive/get_header_tar.c        | 11 ++++++--
+ archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
+ archival/libarchive/unsafe_symlink_target.c |  1 +
+ archival/tar.c                              |  2 +-
+ archival/unzip.c                            |  2 +-
+ include/bb_archive.h                        |  3 ++-
+ 7 files changed, 42 insertions(+), 14 deletions(-)
+ 
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 8a69711..b84b960 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	}
+ #endif
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
+-	/* Strip leading "/" and up to last "/../" path component */
+-	dst_name = (char *)strip_unsafe_prefix(dst_name);
++	/* Skip leading "/" and past last ".." path component */
++	dst_name = (char *)skip_unsafe_prefix(dst_name);
+ #endif
+ // ^^^ This may be a problem if some applets do need to extract absolute names.
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 
+ 		/* To avoid a directory traversal attack via symlinks,
+ 		 * do not restore symlinks with ".." components
+-		 * or symlinks starting with "/", unless a magic
+-		 * envvar is set.
++		 * or symlinks starting with "/"
+ 		 *
+ 		 * For example, consider a .tar created via:
+ 		 *  $ tar cvf bug.tar anything.txt
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index cc6f3f0..1c40ece 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ #endif
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->name));
+-//TODO: do the same for file_header->link_target?
++	strip_unsafe_prefix(file_header->name);
++	if (file_header->link_target) {
++		/* GNU tar 1.34 examples:
++		 * tar: Removing leading '/' from hard link targets
++		 * tar: Removing leading '../' from hard link targets
++		 * tar: Removing leading 'etc/../' from hard link targets
++		 */
++		strip_unsafe_prefix(file_header->link_target);
++	}
+ 
+ 	/* Strip trailing '/' in directories */
+ 	/* Must be done after mode is set as '/' is used to check if it's a directory */
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 6670811..89a371a 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -5,11 +5,11 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
+ {
+ 	const char *cp = str;
+ 	while (1) {
+-		char *cp2;
++		const char *cp2;
+ 		if (*cp == '/') {
+ 			cp++;
+ 			continue;
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp += 3;
+ 			continue;
+ 		}
+-		cp2 = strstr(cp, "/../");
++		cp2 = cp;
++ find_dotdot:
++		cp2 = strstr(cp2, "/..");
+ 		if (!cp2)
+-			break;
+-		cp = cp2 + 4;
++			break; /* No (more) malicious components */
++
++		/* We found "/..something" */
++		cp2 += 3;
++		if (*cp2 != '/') {
++			if (*cp2 == '\0') {
++				/* Trailing "/..": malicious, return "" */
++				/* (causes harmless errors trying to create or hardlink a file named "") */
++				return cp2;
++			}
++			/* "/..name" is not malicious, look for next "/.." */
++			goto find_dotdot;
++		}
++		/* Found "/../": malicious, advance past it */
++		cp = cp2 + 1;
+ 	}
+ 	if (cp != str) {
+ 		static smallint warned = 0;
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 	}
+ 	return cp;
+ }
++
++void FAST_FUNC strip_unsafe_prefix(char *str)
++{
++	overlapping_strcpy(str, skip_unsafe_prefix(str));
++}
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
+index f8dc803..d764c89 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
+ 				*list->data ? "hard" : "sym",
+ 				list->data + 1, target
+ 			);
++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
+ 		}
+ 		list = list->link;
+ 	}
+diff --git a/archival/tar.c b/archival/tar.c
+index 9de3759..cf8c2d1 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
+ 	DBG("writeFileToTarball('%s')", fileName);
+ 
+ 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
+-	header_name = strip_unsafe_prefix(fileName);
++	header_name = skip_unsafe_prefix(fileName);
+ 
+ 	if (header_name[0] == '\0')
+ 		return TRUE;
+diff --git a/archival/unzip.c b/archival/unzip.c
+index 691a2d8..5844215 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -860,7 +860,7 @@ int unzip_main(int argc, char **argv)
+ 
+ 		/* Guard against "/abspath", "/../" and similar attacks */
+ // NB: UnZip 6.00 has option -: to disable this
+-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
++		strip_unsafe_prefix(dst_fn);
+ 
+ 		/* Filter zip entries */
+ 		if (find_list_entry(zreject, dst_fn)
+diff --git a/include/bb_archive.h b/include/bb_archive.h
+index e0ef8fc..1dc77f3 100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
+ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;
+ 
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
++void strip_unsafe_prefix(char *str) FAST_FUNC;
+ void create_or_remember_link(llist_t **link_placeholders,
+ 		const char *target,
+ 		const char *linkname,
+-- 
+2.50.1
diff --git a/package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch b/package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch
new file mode 100644
index 0000000000..bcfbf5d4d2
--- /dev/null
+++ b/package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch
@@ -0,0 +1,38 @@
+From 599f5dd8fac390c18b79cba4c14c334957605dae Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: [PATCH] tar: only strip unsafe components from hardlinks, not
+ symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in
+tar archive hardlinks, but it was being applied to symlinks too
+which broke "Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157
+CVE: CVE-2026-26158
+Upstream: https://git.busybox.net/busybox/commit/?id=599f5dd8fac390c18b79cba4c14c334957605dae
+Upstream: https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/libarchive/get_header_tar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+ 
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index 1c40ece..606d806 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+ 	strip_unsafe_prefix(file_header->name);
+-	if (file_header->link_target) {
++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
+ 		/* GNU tar 1.34 examples:
+ 		 * tar: Removing leading '/' from hard link targets
+ 		 * tar: Removing leading '../' from hard link targets
+-- 
+2.50.1
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ff868bd719..b88d526cd2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -32,6 +32,10 @@ BUSYBOX_IGNORE_CVES += CVE-2025-46394
 # 0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-60876
 
+# 0017-tar-strip-unsafe-hardlink-components.patch
+# 0018-only-strip-unsafe-components-from-hardlinks.patch
+BUSYBOX_IGNORE_CVES += CVE-2026-26157 CVE-2026-26158
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
