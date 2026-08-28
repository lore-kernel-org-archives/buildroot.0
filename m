Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42685C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C498110F;
	Fri, 28 Aug 2026 14:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvIFAxZodY0j; Fri, 28 Aug 2026 14:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927153;
	bh=AEhdJ2FnWbMfu2Cy0TGtcgGQ30Pwxy7jzCQNfd+QaGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WBJ6S39lENtBQaFIa76molCsspCAKEK5ZMh63P5/CkUyTWrfBuHBMBooZineLCfNC
	 AvT4alOd6bh4Y3XdcGsIEZb9fy/l7qpXjMa2/u4s9BZSfFS64XNO9R6bbQxW62Q04f
	 cG0cFJ85WQKRtGiuWCTP2hgQMzjFty9UVp03Y2bbDAAv+Me8evRezkKY9REUaZfGk7
	 9vJB+1cCvOlvnUmZjtlt0U5erUtIrRH7jYT4xVRJYx1tKkqI5cBf2nLwkWP4OxaZMi
	 zK/0Q0q47dnv8Y5dTgvBU3uVBeS0jmgSeO/Jju7OkkNruGCn1lyxL0kYFv/vG4SfG6
	 WasZVJmhL7kGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAAAF81112;
	Fri, 28 Aug 2026 14:25:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C75D6D2C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B80B180F61
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iALt1yvshrQv for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04F4E80F36
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0334F921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 98816aaa9e05701708efdaa933644c4a847179b8
X-Git-Newrev: 13baef4c7734f797e61913450e19787f51ae2c33
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.0334F921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/wireshark:
 security bump to v4.4.18
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
Content-Type: multipart/mixed; boundary="===============5464031944956197486=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5464031944956197486==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13baef4c7734f797e61913450e19787f51ae2c33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes the following vulnerabilities:

- wnpa-sec-2026-64 · Sharkd utility crash
  https://www.wireshark.org/security/wnpa-sec-2026-64

- wnpa-sec-2026-65 · Sharkd utility crash
  https://www.wireshark.org/security/wnpa-sec-2026-65

- wnpa-sec-2026-66 · UMTS FP protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-66

- wnpa-sec-2026-67 · RDP protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-67

- wnpa-sec-2026-69 · Dissection engine reassembly crash
  https://www.wireshark.org/security/wnpa-sec-2026-69

- wnpa-sec-2026-70 · BUSMASTER file parser abnormal exit
  https://www.wireshark.org/security/wnpa-sec-2026-70

- wnpa-sec-2026-71 · Tektronix K12xx file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-71

- wnpa-sec-2026-72 · ERF file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-72

- wnpa-sec-2026-73 · Bluetooth Attribute Protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-73

- wnpa-sec-2026-74 · Catapult DCT2000 file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-74

- wnpa-sec-2026-75 · C12.22 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-75

- wnpa-sec-2026-76 · CMS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-76

- wnpa-sec-2026-77 · H.245 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-77

- wnpa-sec-2026-78 · Kerberos protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-78

- wnpa-sec-2026-79 · Bluetooth HFP Profile protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-79

- wnpa-sec-2026-80 · Bluetooth BR/EDR FHS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-80

- wnpa-sec-2026-81 · 3gpp phone log file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-81

- wnpa-sec-2026-83 · CMS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-83

- wnpa-sec-2026-84 · Pcapng file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-84

- wnpa-sec-2026-85 · SSH protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-85

- wnpa-sec-2026-86 · ESS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-86

- wnpa-sec-2026-87 · X.509IF protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-87

- wnpa-sec-2026-88 · RRC protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-88

- wnpa-sec-2026-89 · C12.22 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-89

- wnpa-sec-2026-91 · Bluetooth AVRCP Profile
  https://www.wireshark.org/security/wnpa-sec-2026-91

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.18.html

[Peter: add list of vulnerabilities]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5245c41441bacca292d129d4339e79e5179af79c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 917ac47471..3d8fdb6131 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
-sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
-sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
+sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
+sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1fd81515c1..c500a49336 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.17
+WIRESHARK_VERSION = 4.4.18
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============5464031944956197486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5464031944956197486==--
