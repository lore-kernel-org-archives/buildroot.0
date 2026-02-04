Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47567E9D403
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB871605A3;
	Wed,  4 Feb 2026 15:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-brYfbRH2gg; Wed,  4 Feb 2026 15:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06352605BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219284;
	bh=HoFHmPUWEu7xGhlxG0SmfNRRUBzvSOuZqI3Xh6ffhpQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xw5zHW+VIoAwilXk85AsqgL51ToUZWFU171omTYC7chzPDNdHLqV3pSciwGLkMnWy
	 fLY9qHn8lKC6IizMMVV1NWPDuA1yPgE1eYG6OQhK0ZrLZSG/rOZa4vtAagbfSukWoG
	 I0DcXYF1M7CotGJ1ETVeWonMva5rW87UHbSilV64uk6b7d9Ui6JqKrwU/7G3elXpMe
	 0lPg0HQL5ro57HeV6Ipekovdkl5HorwHMnnG8Ww4BlrqOddCubSMQE5BvpcUkZ8mer
	 /Qc4cwt2RphM7FVr9humcApqdcWiPk42ACuywLklIAvIL8bmahqh2flQPkSyqD6wOJ
	 TJA8goFEfqcvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06352605BD;
	Wed,  4 Feb 2026 15:34:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AB27F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B5C760093
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7G8-w_W3RKV for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73B7A605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B7A605A3
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73B7A605A3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:34:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1B8A231E0BBD; Wed, 04 Feb 2026 16:34:37 +0100 (CET)
Date: Wed, 4 Feb 2026 16:34:37 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYNnDVerq-_9JZDn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770219277; bh=SQ0b9HYAulEWsIzK026dLMnE2ua+PFT8Q3hj3vJXkMQ=;
 h=Date:From:To:Subject:From;
 b=KURL1Pt3HD3AWvCxzEgo8K63ohnNL/xeUD/B3a8izfseS/lXDwHgaeQbqu1r0qr+W
 igQ1k24jXcumTgaA3Z5kzjbgkjLtXG8Jwa45+DwVhZ3fKpYRdzYBxoe3Is6E/FKpJY
 WwBJNiQT0ehBOMR5K/JzqwE8iTQEl6Pq/r7p0yJWQkZAeYPIt54m47K21h7tUrntDX
 jVyDkzDeR34tsu8cX2y7yeKPqYL2fCxniREiR8c5J/XdKLQ1pXTTsoXG/7o+QNZ22p
 8CyYym/dI9FTovhmJ3CQFP7jRE67XcG9TrtmJhW7DWj+UL+kUz2OPFp5ipu5ZUrW/D
 atjemeEmHeD0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 1/2] package/strongswan: update to 6.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for Changes:
https://github.com/strongswan/strongswan/releases/tag/6.0.4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - remove patch 0001 and CVE ignore
v2->v3:
 - another split of patches requested by Markus H.
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index f6b16fc8a2..7a6939b979 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.14.tar.bz2.md5
-md5  21ca3fc7c18456405d03b77266ba630a  strongswan-5.9.14.tar.bz2
+# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
+md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
 # Calculated based on the hash above
-sha256  728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678  strongswan-5.9.14.tar.bz2
+sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index caf214cefa..63ebd275e3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.14
+STRONGSWAN_VERSION = 6.0.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
