Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E2AEEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACE660B4B;
	Thu, 12 Feb 2026 19:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aH4dS3l83u0W; Thu, 12 Feb 2026 19:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00E42608DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770926072;
	bh=yBtEv6THDO6+tZpZQ21vIjN5denrXSBlaZZ+WMmRspk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dmz/rK0zbTZHL7UQLAMWC2W2UXL8PKwmqNNotBlaA1KW0+m3s2+eoIzaXeVCAvMh8
	 1uYTKQ8QDpOMQ7AjrTdtYnF2PUVJe2raaHaNh3In9zai2IutLWzUumZhlv87KV/OWu
	 vhKnvmVVNBX6hOKksd8Gdz2p2VLWjMxKgX9XepVvR8X/MfNXMEpDIkDRMht8RV9HV8
	 an/raEHiASYxKUmblYvB0pDh2SqLWNjnQU0SEcBfBRexfA5PGkgceozQlKqOzT4Unq
	 WTD/FhHB1v+cofAZCzhG1JzS2TYQ3fpJ9H7jPoACN92yNi6b34NACQf+MTcHT4rl/v
	 HMwzdO8UUFhIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E42608DF;
	Thu, 12 Feb 2026 19:54:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C2A1CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6860B402E6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Cq_OhUf_8LP for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A614E4009D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A614E4009D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 716D386C6F; Thu, 12 Feb 2026 19:54:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 20:44:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eee0df35a6f32c2f7d90e2a27a71bfe5396b332
X-Git-Newrev: 0981dc05d6dc300966ce1aa7483ad7b763878756
X-Patchwork-Hint: ignore
Message-Id: <20260212195430.716D386C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump to 1.21.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0981dc05d6dc300966ce1aa7483ad7b763878756
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/containers/skopeo/releases/tag/v1.21.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 02cb76d6f1..4a1bcfa0f1 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0c19fe51b2cd8d1bd5e38c03b97421e318fc08153bdf5ef2f816a29889eacdef  skopeo-1.20.0-go2.tar.gz
+sha256  f76eeddf697a3cc7a872e3077ab4d0fdbebe9f3c6171462e3e9feb84368b3fac  skopeo-1.21.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index a8587f06b8..d534a04813 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.20.0
+SKOPEO_VERSION = 1.21.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
