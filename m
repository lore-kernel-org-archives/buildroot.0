Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CF5FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19DC841DD5;
	Fri,  6 Mar 2026 19:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qkk9L4ZlPcjC; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8560F41DD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826653;
	bh=TA7CTNyQcY1EnMgiZ6kaLLYKQYtBeVu5hWjbzVButQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FBmHdptz5F85TlS2t0+WduoMqwP4qydMDNMwpXSbnAv1OTpjB8y+u77RxvgfQ+T2o
	 YOecxJ5R8U0ITUw6lSeYKHgyCzHGUfA7r2q1R3DuQWGfqWGplxdnRDnzanv8N7icXp
	 rrQAiYXoqkp+QGNyJ/nDFrvGqV6Y6nTSDfr1sThd3ovaAGYIWjdO9Y58v7Vt3zMiaO
	 92ClAAd28YqSgyWs6E1aIO8HWdFXekDAZD71CziHfGnQ1ATsO7PX/+R9k/axGZ3jrs
	 mJIdayl/0fVJwisWB1gZDEDYvquvO41vs/NPnbrMS4HsCQ78jpJLPfvDdXKRrrIi5s
	 Gqzu0QxRUFjoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8560F41DD2;
	Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 426B739B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3444A613F0
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCU0mnkAVbeX for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FB060DFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14FB060DFE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DB8686823; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:42:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 4bbd6db4ef86efe8b1777c7fb5d8063fee3fa583
X-Git-Newrev: 6a3aaab3bd0813eed963c638eb0b594ea0bcd9f6
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.1DB8686823@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/wireshark:
 security bump to v4.4.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a3aaab3bd0813eed963c638eb0b594ea0bcd9f6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html

Fixes the following vulnerabilities:

- CVE-2025-11626:
    MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
    4.2.13 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-11626

- CVE-2025-13499:
    Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
    denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13499

- CVE-2025-13946:
    MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 4.4.0
    to 4.4.11 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13946

- CVE-2026-0959:
    IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0959

- CVE-2026-0960:
    HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0960

- CVE-2026-0961:
    BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 4.4.12
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0961

- CVE-2026-0962:
    SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0962

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2aaeb10bce055d63ea0855914a8fbac4f6390611)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 88eb7ef494..87d5781eed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
-sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
-sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
+sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
+sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9ccd8f9a9e..196ac63271 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.9
+WIRESHARK_VERSION = 4.4.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
