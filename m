Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B3E92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C714403B9;
	Mon, 29 Dec 2025 14:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmRVEUGRQRGX; Mon, 29 Dec 2025 14:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CCF5407F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017277;
	bh=1PLjbp65hE2eiUvfCvnNa35Km2XMmRuWmUcWF0HrJIU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iW7YgKWub6KB1jak96BqJrXKLmVuFhDmwE6OfVKhAe6Y34qPH6AR0FMI51Eav7Zrh
	 hN/0jHR4egj6D8AAvGs7x3EA0Y19A/OuVXsKMTDoqAxUrl8j3LlLhjnNx6mDjGzljU
	 QYY/fsOLTI7Mg4yUSllrrkCd28D4VH+zvmBurOmvdqJ7o2foh1TdFpQUbgxkJHkE/x
	 hpwHfkTGLDfTMACKiV9kDSN0vPnnyw2TG3B4o6Zg0AJxKcWbpfArhyySspl2KNudsP
	 0dPd9Odh0bHoFomFyYL698miNT+hQ0yT1r0OPgJsiU022KS5+VBPv3MrdxzOrSiq4N
	 M37zGgtSOOI0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CCF5407F6;
	Mon, 29 Dec 2025 14:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 919BBB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7C2D403FE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNh-n4pb24t3 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8F7403B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C8F7403B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8874887B4A; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6244163284a05ae38a819abcb7b65e03b04102dd
X-Git-Newrev: 7b8c58ae03f87e047c14585b16de19c66b8344c8
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.8874887B4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyxml: add CVE trailer in patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b8c58ae03f87e047c14585b16de19c66b8344c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                   | 1 -
 .../tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch  | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index cae06b629c..b0ebd9c49e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1018,7 +1018,6 @@ package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
-package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/trousers/0001-Check-if-the-compiler-understands-pie-and-relro-options.patch lib_patch.Upstream
diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
index ea0f6476c8..1da613c205 100644
--- a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
+++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
@@ -8,8 +8,8 @@ by two non-zero bytes. In case of malformed input (0xef should be
 the start byte of a three byte character) this leads to an infinite
 loop. (CVE-2021-42260)
 
-[Retrieved (and backported) from:
-https://sourceforge.net/p/tinyxml/git/merge-requests/1]
+CVE: CVE-2021-42260
+Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  tinyxmlparser.cpp | 6 ++++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
