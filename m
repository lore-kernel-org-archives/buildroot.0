Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEF4CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4F9610E1;
	Fri, 12 Jun 2026 11:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHQV1e0YojsU; Fri, 12 Jun 2026 11:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06487610DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263461;
	bh=j5aPEJSIDutBc6NzRsSIRcYTJYblpKSW8zktbqNQxl4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7DgYSzwveXBNd4To7RqhkndHZZdMzwlqDe0RMgZuNBjZZXnd3DwDMTlSxBsnVLfn
	 3MDoxw6upcW6oMZcCW72A2aH4/NASl/QnE6DmnJTg6PdFDASYhwANvC0sJ7G9X4jGX
	 ognM7i9zhUxbAlLSjNn+Oj/nstPVvE2FEmGHzruWljUwh31UApbgPZq9rzQgRQlSOU
	 9ZtQFKXbQXyzRrowk/dS8Dwa+83sOAe3/Jd3f8T3MxWclLgrH2eX6AuZ3fcefdWH3E
	 mXdNXXvMI97U5rUSlfJNfPDJ7CW6mc+o9wPi3R3gRvfg03cRPz4kJ0Xl+K2+uy6mGJ
	 /l/KWYhXmn1fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06487610DE;
	Fri, 12 Jun 2026 11:24:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA3D321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D39B960F79
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HZq21N3Dy0c for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0426E60F33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0426E60F33
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1CE4880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:40:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bb11e239f060b65b4f3ee0bc35b8515ba9f8061a
X-Git-Newrev: bd37cbe9032c9b92797437901ac435a2e6af5272
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.D1CE4880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/faad2: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd37cbe9032c9b92797437901ac435a2e6af5272
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE audiocoding:freeware_advanced_audio_decoder_2 hasn't received
any new CVEs since 2018 while faad2_project:faad2 received 9 new cves
[1].

See the full history in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-38857
[2] https://security-tracker.debian.org/tracker/source-package/faad2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: set FAAD2_CPE_ID_VALID = YES for check-package]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ab03ba7396017b8911944c3089c06c9b68822fbe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/faad2/faad2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 62c469e3ef..9aa767a5b2 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -8,8 +8,7 @@ FAAD2_VERSION = 2.11.2
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
-FAAD2_CPE_ID_VENDOR = audiocoding
-FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
+FAAD2_CPE_ID_VALID = YES
 FAAD2_INSTALL_STAGING = YES
 
 # faad2 contains assembly routines using ARM instructions not present in thumb1 mode:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
