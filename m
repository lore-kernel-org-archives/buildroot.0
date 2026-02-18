Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00843E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD05E60F3D;
	Thu, 19 Feb 2026 17:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDOG8yF0LmjA; Thu, 19 Feb 2026 17:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D861561047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521867;
	bh=LpbULKhHaF83+V5PLqZkbTzefC+fzomb3o4X0WJsBpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c8Pa80rzldDX8nSHqpeV6SlBmQv8lYOKd/JnXAI06iaElrLvfES5DUMrLfgsWqAKg
	 /KglTueS7g1zsr554jBI2GtlSbt5RYAuupHsk9MBUe7b9NW1oAIpPupIoLA+v+NdYo
	 Tki5xTLkTFSVYCqusJqqq+KEcPe14bjDdj38Rmd7Aykw8RxDneiwDxv0GucC/JtKkj
	 jCW8tH5k7+ZGdu73pR6fc2iJMu7jYI8uGOqexHoQfiLOcpA5RivK6Kp9av1w/PUjOx
	 rbnEC88VKWq+gZiS6MwZRXSpNeyzHlHYsK76npEDg50p/oBmejLXmoK3dZ4T4+rr7z
	 MYXo0pHRFW+eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D861561047;
	Thu, 19 Feb 2026 17:24:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 388F21CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2682940827
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eyd72mbuAOsH for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4382540848
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4382540848
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 413D786FA5; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:28:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d6a0bfca7ee6b30b71a67e3e40809967cfbf3215
X-Git-Newrev: d21f8a7c73d6b2c27a6a9b96a304a58760844ec3
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.413D786FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/busybox: patch
 CVE-2025-60876
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d21f8a7c73d6b2c27a6a9b96a304a58760844ec3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

This commit fixes the following vulenerability:

- CVE-2025-60876:
    BusyBox wget thru 1.3.7 accepted raw CR (0x0D)/LF (0x0A) and other C0
    control bytes in the HTTP request-target (path/query), allowing the
    request line to be split and attacker-controlled headers to be
    injected. To preserve the HTTP/1.1 request-line shape METHOD SP
    request-target SP HTTP/1.1, a raw space (0x20) in the request-target
    must also be rejected (clients should use %20).

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2025-60876
    - https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
    - https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 073c6af03e765c930e01da56c78f2770bdfb52a6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...w-control-characters-or-spaces-in-the-URL.patch | 42 ++++++++++++++++++++++
 package/busybox/busybox.mk                         |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch b/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
new file mode 100644
index 0000000000..d0a31ed821
--- /dev/null
+++ b/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
@@ -0,0 +1,42 @@
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: wget: don't allow control characters or spaces in the URL
+Forwarded: yes, https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
+Bug-Debian: https://bugs.debian.org/1120795
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+Upstream: https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
+Upstream: https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
+CVE: CVE-2025-60876
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index ec3767793..fa555427b 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+ 	char *url, *p, *sp;
+ 
++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
++	const unsigned char *u = (void *) src_url;
++	while (*u) {
++		if (*u <= ' ')
++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
++		u++;
++	}
++
+ 	free(h->allocated);
+ 	h->allocated = url = xstrdup(src_url);
+ 
+-- 
+2.47.3
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7ae9c1d41e..a33548c355 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
+# 0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
+BUSYBOX_IGNORE_CVES += CVE-2025-60876
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
