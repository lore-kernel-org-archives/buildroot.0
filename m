Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119CFCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A8940D93;
	Thu,  1 Oct 2026 14:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZePuiE_fRMq; Thu,  1 Oct 2026 14:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E420E40D83
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864595;
	b=HsmHNrTws+R/imwF6QVIuGj4NNZtNE/zt08lPzyCjKZ1E9WcJX01bYqprJIBgOlCbAoI
	 iaHH6aE7rhyRMXv5p2uNTW0HrAOQjpuG54onevuuq8bupyCnxXJdJzAzEgAZTtSDXHexn
	 ZavyIRyDBW42zS9aPAvmLPjZNGYvqALm1AfYpBc3IuHe942rO9ZPsZcaSIHfOYSr1pj9r
	 7TGmPi0yGP6uQX4mjYIxALQpe0KZ9ZlRlmjmPlANdXqT4lFMCiL2xuf0wQs4Scwgb0plr
	 FzfGl6jhOr1eOakegSDdJxc8Nn3kiDRuKC00sqUIW9HdeHv5hVcTVoXNkDMXlM+N45A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=86RARaIgOgPF83JT2GbapbofsTCBYfpAVJdcDdAjn9k=;
	b=Y7Q0VfbYKPVCY8AjWFmIE1I6pkFsJre1Mw6RP2zSGL9BxolIfdrcKj6bkSXxPhVFLSjT
	 VAf5CadZGIAbCUTHeseVg+fZ6YKnzgRNZ658aeVZQyKjgp+aO6X8SEjZia4rID1WuSI7a
	 Pd0nKvjNnVy2UwvMJDkujp23mYA8XisyUYmhQKyxvcFC6jBbzHKuxVTedU6mBWo3TpImw
	 VGSL6TCZwJshtAvkrwMVcKc/414Le6XD6Pbdisu5rsfB9Zqve2O6ikewZzHi/D5UXyDJ3
	 Jsqzy9EIzruOQlz8+c8RbEpmmjt8y9QDg1drJRQ9NrLDS0V9SMtj+o4AR5DYCWbHtLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864595;
	bh=86RARaIgOgPF83JT2GbapbofsTCBYfpAVJdcDdAjn9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dOlKz2ip8xtzqzqG5jbPBuK8SC4Gvlc6+7Wjhfb17+dw+1T6UbpOSqmcbj9pbBTqA
	 5Nks6wCojnOxiXDq1Ez0XV8t3GDzQEcQeLXlqCgFDbACGQyvPfxshqFg0BORTZWVdf
	 WmECQin2wEpVm/KGxmQb3OW4tdP3aQiFx2gcBEvSC/IdoEySVo8U71U+lUr2asDwcj
	 crkag6EpYM7aNYu3We2Npe/6Ly1Zrb1EXn9e3IzFCO/p21H1dg3pm2sXBzV/+F/j8d
	 mpvViajjmK35Wf0YVxEX6DQSsYsP/DKF3l1GnfSfJ+x17Op2k+VKGpufygBveiG2xF
	 eALPDGf60g+BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E420E40D83;
	Thu,  1 Oct 2026 14:23:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 883A8263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EBEE80DD8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPG8I83orES8 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E211580ECF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=Zlye2jlcyAGNoOg2I++Z3SghYNjXiwHDByoB7qP3+mwekIYy98R7p4YzAsab30ljuFbV
 di0SiqQP2uaZveXIrLcynRQjQSxHeRzgRk0XcqN+eq4QIVd5EOX4g7ADTnb+e/HcnE95W
 zIUAUwNrz3lgUiy8B/Ba5nJFhu7kdApQ3V420GZlsATmKt7vq7ddqYuMn84LW0+D8eMx+
 W4H3iRah9Jr7i4CxDc66pf2NZcNgufm8oLDkg+UzHvrX71OEwm9BdiHBMjvDJHti7XAB7
 TpkBvSsBeOuQGqp6BF96AmtwhQuLgAi5IAA0W+81W5I1pgDRn8qJiNKqg+SKxrwftLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/9wPvZZW8ae/s3DrGFf4wD1L1qoGEpB4cmqfP373i/4=;
 b=ps4V/xSy6SjtYZkvlP9c70+y2rtp0oM1UxDGHO+Py9ksmDq18jnnMlJHN8FXVJCa2MHM
 WacqobARQ3Go1GteLCdDtiw25BSrSH2aROkf1ujPBwYwmX4Rztu8ZU4rwBsOo5Ddhb723
 cFnfUN0BuIsVJZ3FHbo3TOqtJUWvaTX7uRl5h0SzxMtQ0bm7lmWfz09FpIA5jzp7YEl8o
 ldxpnS9FNEMQmVWPPehcEJszO5OaKQq1GxcpY7UZJPNZEBcMci/C+wBj0oThSObgWmpWo
 bIjSzSITtrEOYT2eUPOjLsiz6n2AG2ul3nhUxOun6W+2lPEhEfWFsUUVQ3ag2fsM/hQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E211580ECF
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 365B99843D; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d91709f4d3a242d58a4df73cda9a9503e0ec4257
X-Git-Newrev: 70870db0f0b8eda2358faba7771895c540eb523c
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.365B99843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark:
 security bump to v4.4.15
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5085221767300304278=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5085221767300304278==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70870db0f0b8eda2358faba7771895c540eb523c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.15.html

Fixes the following vulnerabilities:
CVE-2026-5409, CVE-2026-5408, CVE-2026-5406, CVE-2026-5407, CVE-2026-5299,
CVE-2026-5401, CVE-2026-5404, CVE-2026-5403, CVE-2026-5405, CVE-2026-5654,
CVE-2026-5657, CVE-2026-5656, CVE-2026-5653, CVE-2026-6538, CVE-2026-6537,
CVE-2026-6535, CVE-2026-6534, CVE-2026-6533, CVE-2026-6532, CVE-2026-6531,
CVE-2026-6530, CVE-2026-6529, CVE-2026-6527, CVE-2026-6524, CVE-2026-6523,
CVE-2026-6521, CVE-2026-6520, CVE-2026-6519, CVE-2026-6522, CVE-2026-6870,
CVE-2026-6869, CVE-2026-6868.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1880965a3b8dccaaa93dbdc36806c06b90d77eb9)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7572ea8b52..037f2f509a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
-sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
-sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.15.txt
+sha1  dd591df261c7866e7eaac3f015c904ab21d9d51d  wireshark-4.4.15.tar.xz
+sha256  05e884da8d91929bd1fb6a91c26836d69145ecd439b97c2d82698388de221570  wireshark-4.4.15.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d58fa7a6c5..1ded080906 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.14
+WIRESHARK_VERSION = 4.4.15
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============5085221767300304278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5085221767300304278==--
