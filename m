Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC67CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4328A406EA;
	Sun, 11 Oct 2026 13:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svYFuoTeGb0p; Sun, 11 Oct 2026 13:09:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 64DF2406CD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724155;
	b=De2KI+ngxZlkuE6I1OQqYnYmdHtVp0y2zOSgmkMBsi3Mnk8hzBTyD5wtqByJKst1b5yx
	 kXaxUOMYTt7hZ3i4XhcuF7VOot3dDYAmfNBkmlVegRxx+5BftjURXKmh8Mov/Decwi3Dk
	 69gh3yNucjLfwclJHidU50I3qxENGWwBGIrBKj5gl0felLlYnlvBu4idLsRp7XsiF1NMH
	 +Tcnm1EFJf3tzwn62MQlBtvm1ix930S0RbBBGkuxqW5gcERoZYYLgVUizodQcNTGnfIa1
	 xVKZJrM6XIxSfe6LD2kXR7t4ya9X1p0gnCuddpZLBZu98qQzpNE6UoCpTMXMIW4L50w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YM9ph6jPO1va4bIZKlOjpEVM9FPcGtuu0uxwFFwS55M=;
	b=nkuEjlXN0vQEJ3n16JkNS6n4NZlXZ1mmiZmtk/GNOjMEWIp2vL/BPPDtAPcbF8DP803f
	 F63GOy24ZyVAPPx28ashf3d4BLb+LDZlAOdvmJM4tTohqPVw1gwKL1n0/zSvBkYVGUs7h
	 HVFQFQSQjmKtCQRN9KCHk6Xw7SZbq5mCR0dyhHVjo8pbvQ5cqHtqIwHlXcvh9aLluNSbR
	 Z9YfRDMYIVYsRU0UYYv8JfVZvI+RGcAPNb36IhsZ4y5cciXHcvb0lk0AT5iygYVRvIoWK
	 hnLLI7pnRORXKxz2yOqecE7Xq/Ygu5Pq6lOAaDC2uUTyr83KmjTvMim2LOAR4V2j9ig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724155;
	bh=YM9ph6jPO1va4bIZKlOjpEVM9FPcGtuu0uxwFFwS55M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzTmQd50J3fmKOFbx2iqIVFafO1GA9pL79uLegGXvvu61m5sUshyxecA5pfp8BXxM
	 AomRvVUU/z1KpG50gaeSpoGvybcakZy3csX89eQxPyansdvmDGAkxJZ4sKU4eeC6UT
	 y4WaLDak3OJEgSdbQxs1nBPQBYO/zxjYRinh0usVJzXMVa1YZY02qxY//0nqnbccLw
	 1hxqHpD/2LKXOph2V2s3vVXPyaDRJXDFhrl8s6I9FtCFeYl7rbHxF+bRZlcT3eb5Ss
	 Pg1I45b6ydBmilydFhjeKFvnic/MI6G5wa66x4uXJb/JHVtVkpV+TAvCj0/FXhnXTL
	 ddCxNSKk3F6hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DF2406CD;
	Sun, 11 Oct 2026 13:09:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CCC62E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E19C60622
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ncyt3_Ydic8h for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD814605F1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724153;
 b=faLNqSDDBp3tArjqShLx+qLobd5D4xzOypCVS7LIx6jKDFbAk71hcelxdJBu2vqtGOB/
 C4YDQ/CIpmOboQlL+oYS/TgxJ9zoG1FHENNkuyb6f4yW300D9rA8WX14NyxNX4kNEwvPu
 W7kxi7T+4W2MnAFEKU+MBnvn4zEMvrdffUhDL/CEkX/5PQKrdUzjTRdV/motO/vPmOAys
 N/Pm/cJpqwAkPM9PEDrPBknAf6foWowQ6RSJg/VfdF963wquAi6PzNWbcKydrFO2JwCiM
 sTxP2SczvdsBMwV1ubaxUC6KVzQYhCsRFYziQqcqOQXyWzkjaRtZ0rzno0LVj7VUaDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724153;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UXrOvtSgBrpTtgpED7/7DJpgwVG5punLuF8xfZxyedw=;
 b=EjLGql3hSOU0RqeNcIpW6wD0vC7GWm/Iz4AFLqNE+ejxP1upgz4NwSQRzkej87VyKFjX
 0ER8EU9Papfan9JpmPMOInudHpETs0QyLGQ/f2KbK1wfBRuvG+mQH2vs3zZKb3OIaAuEH
 uIfzCz2nzYCm/v2v2VKX/0i6CWnDjVN3/ovu4DDf+ISEMPCFRQHXTH+uI+Tx0NtXTuc0q
 HGlhTUao6KhtJn0EDQD9+ASiurIJlshiWMu8/DBuRuJdY9qh5Pi3OLPrNJgiFFw56tMTr
 DQKp6ys+d9qRr6JjZH2Wkm5Cz8FDMjxObaD/P7N06hfIv7Y7qJVNFERComrmF+LE8yQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ytcr810t; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ytcr810t
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD814605F1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=UXrOvtSgBrpTtgpED7/7DJpgwVG5punLuF8xfZxyedw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Ytcr810tmP7tXHo97qvN3QjY6t/LpBFglwzVyucZoDoqBIFJMAoSCUrkroqqRY0M8
 fNuFuBomjURDtkSoXznaCWGKwa9hPcnrkNEr/X2g8TK+K14w+GO8mISOx7FAZoKhwl
 xNuRkDhtUfRaHWqLT/Oh3AQNsUBVHhvYuPYiXt9AtClFMtDM12TlSFPcF/mDnYPtjH
 XsGJfPeDKwVmRRSrGvjuy5yxs1+1GzaiL9V0qp01Psu2CPsDphYTX6Cdzq9/zCrOXZ
 2+FzbF5+QJfvGxiGLw87NlgonwBS+EgYgZD2jvO2YBlQKvV+64z74/DmZORneHPV3Z
 +TId11WDRBl8g==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 z00admZBxIjlfWw0leWtV/9mwrXdNWaGlk1bicq/mLg/p/0wJ4CWS334o9ywwHL4o+/yr0Q0RIe
 pGqyBRVu9roblpmQbcC2lH2JjK0+8OP1bhl8mS2t56cWSYbt9oADM7QlnvdBXvWcf2dEusrB4Cd
 EaS7xIClwFkcbXbhrGQDS1Z8Ek2hX1ePzkR2lJGTNfLtf4yvwep8BgfjdtODRz4P32pYKpZ4hE/
 fyAlYQC6Gbc9fwVJHfCmUN+2HPGgs6Bsp+t4aarnVr1iPFPT+UwUzfs1NOl9bqDg+eL25butYD7
 OPmL0NC/yD4DA15nWTZWA5G0WJI4e2+swNYZ7iNw8RdLCLXQC9TxaJ9HjnLgq3hZKhlhTRyl/gv
 1PREu1Lw/d+riY3kyDRgKTs0LMO2R3+fmxExywQAh6phqRxm4n1B5gShRIlyVXtSXJ0O0J7wbv/
 qo6rUTuFD6dZB4ejneJsMnXPF7h21o9DRiVmHF+GMWk6at5HMY2la9k+en9VZre++x7Qpeleibq
 nGLWtohr5VvY4M82Ff31DZIQA9ZFYIZO9cQvEJ9jvOWhOyRljQk5+y/cwGAWjX6ZReWz5PHYstr
 3V3EXRA=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7743FA4C5846
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-1pLs
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:43 +0200
Message-ID: <20261011130058.3443432-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 38/52] package/kodi-inputstream-*: mass
 version bump to Piers
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash        | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index cfd0b62fe6..8844714a85 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c4a458045bf4edfe51a1f9f03ac777c7101c9b00e0e72c76ac51a2b3f530779a  kodi-inputstream-adaptive-21.5.25-Omega.tar.gz
+sha256  efc7841f949ae0c3f5eaba3f8066f7edfc162619dc0b56e53a18911011263d75  kodi-inputstream-adaptive-22.3.22-Piers.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 8aab0c88e8..eea32fd154 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.25-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.22-Piers
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 497efef7cf..c19949135f 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7223a30d2774e4c7cbd6c4f8a266bf4d186d160590077be627bd0490d80645c  kodi-inputstream-rtmp-21.1.2-Omega.tar.gz
+sha256  4980297ade011d9c9f34c668702d5ae9528650bb4dbeff34cfa640d3a86f57ec  kodi-inputstream-rtmp-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 7aef9c815d..7b487564b8 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 21.1.2-Omega
+KODI_INPUTSTREAM_RTMP_VERSION = 22.1.3-Piers
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
