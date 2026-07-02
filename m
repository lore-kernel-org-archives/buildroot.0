Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD819C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6778231F;
	Fri,  3 Jul 2026 14:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYori3h04vDb; Fri,  3 Jul 2026 14:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3EBC8175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088822;
	bh=KNbuhCE70Xsa+qI42rTQWs1EM0Fjd5kxrafhat0oQWE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BCTF9dPJ+ZsjTE1gSr/G5d6fcTJq/JK6fBYTfq5yvfLcrNL+yaIq1wyvCPSgMIk+u
	 84rVtgYtQH+qgXkckDQsPsBDNcpcu0DTXRt241wefQiOB+PmJRWrePMFZSg11wqsY1
	 38fUYqLBdB8chQpFErFyp06jFWvSS9WD/ZDfMn9NZAjqOuMsRX0anm/JWcanwaW1sa
	 anGs1eaTFV5lxzzQZ7ovGfHW8YLnxRnhLIu5LY4I3dkuQXtqu4KME5/434WHJsErLt
	 ykaKdyk0fF8NqnsEjqlbz2ZO+OVDdZqV+N+ASCp/24gx/QZxzLeCVYU5B1WUv/1/L9
	 PUevnR3ckqfJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3EBC8175A;
	Fri,  3 Jul 2026 14:27:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3815A363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A2EC4008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJoG9M9uY_py for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1C44063F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B1C44063F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1DC7883A3; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:53:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 925b1285497da4b66f6d179253afbe67e9e216d9
X-Git-Newrev: b559719207ea94e53b56a537f6a8205a136e942a
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.C1DC7883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/squid: add
 upstream patch for CVE-2026-50012
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b559719207ea94e53b56a537f6a8205a136e942a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-50012
    Due to an Improper Input Validation bug, Squid is vulnerable to a
    Heap-based Buffer Overflow attack against cache digests.

For more information, see:
  - https://github.com/squid-cache/squid/security/advisories/GHSA-5vmx-9x64-9284
  - https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/0006-CVE-2026-50012.patch | 33 +++++++++++++++++++++++++++++++++
 package/squid/squid.mk                  |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/package/squid/0006-CVE-2026-50012.patch b/package/squid/0006-CVE-2026-50012.patch
new file mode 100644
index 0000000000..ac3af8a36d
--- /dev/null
+++ b/package/squid/0006-CVE-2026-50012.patch
@@ -0,0 +1,33 @@
+From 19fcfe922717c8b255270c032dcde4071c003bcd Mon Sep 17 00:00:00 2001
+From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
+Date: Sat, 30 May 2026 10:16:33 +0000
+Subject: [PATCH] Harden peerDigestSwapInMask against invalid cache digest
+ reply (#2423)
+
+A cache_digest on-the-wire size may be bigger than the
+mask_size declared in the digest itself.
+
+Ignore the digest in case this happens.
+Upstream: https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd
+CVE: CVE-2026-50012
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/peer_digest.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/peer_digest.cc b/src/peer_digest.cc
+index 741090574d6..53dac203eab 100644
+--- a/src/peer_digest.cc
++++ b/src/peer_digest.cc
+@@ -622,6 +622,11 @@ peerDigestSwapInMask(void *data, char *buf, ssize_t size)
+      * NOTENOTENOTENOTENOTE: buf doesn't point to pd->cd->mask anymore!
+      * we need to do the copy ourselves!
+      */
++    Assure(size >= 0);
++    if (fetch->mask_offset + size > static_cast<ssize_t>(pd->cd->mask_size)) {
++        finishAndDeleteFetch(fetch, "peer digest mask data too large", true);
++        return -1;
++    }
+     memcpy(pd->cd->mask + fetch->mask_offset, buf, size);
+ 
+     /* NOTE! buf points to the middle of pd->cd->mask! */
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 439d65e479..21aca9fe8b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -27,6 +27,9 @@ SQUID_IGNORE_CVES += CVE-2026-33526
 # 0005-CVE-2026-47729.patch
 SQUID_IGNORE_CVES += CVE-2026-47729
 
+# 0006-CVE-2026-50012.patch
+SQUID_IGNORE_CVES += CVE-2026-50012
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
