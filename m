Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CBFFD45EC
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B1E80F4B;
	Wed, 25 Feb 2026 20:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLdohbCBou3t; Wed, 25 Feb 2026 20:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A1980FA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772052247;
	bh=Np32w73sYvSAtTLr5as0xjli1/O/6m9/bCEAsFwAZGI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fmc86tkFwyNnJwkviXTCBD7jsf9i5OjpayOQGCrd7GaNBVLwX9sMq71AeCHjJfESx
	 daTmDJUHn39pNhWUtvfT506H+5SNYmpaVN2FZ8nuSBZpUBmnfWIpgkA5jzVyaSmRcx
	 blF2IzlAmETWXAkrzebE2rHJmq6kNWZ1HwPq76XtNWXtyWyupO1TrueBY07MGBUGDR
	 Zkv9OMSqyL1/iPVzqc7gjhPdue7HQAD4+XeDgmBPBrjwPmeoKs7ifu00G40uBUtIYN
	 PVTg4UswY7NxW3L60yeb6p67XZMNVlozRYTYnYCN9QXogm5jjRvNUiTohqHlSWSg6A
	 8MxeCwgcyEQwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8A1980FA1;
	Wed, 25 Feb 2026 20:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 195D8204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC7E741906
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYBkQfJtCSyP for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5403416C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5403416C9
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:44:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC062873ED; Wed, 25 Feb 2026 20:44:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 21:36:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b45b3b412c306af9eab09d44bdc7eef7b79bd128
X-Git-Newrev: 2aaeb10bce055d63ea0855914a8fbac4f6390611
X-Patchwork-Hint: ignore
Message-Id: <20260225204404.CC062873ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to v4.4.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2aaeb10bce055d63ea0855914a8fbac4f6390611
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
