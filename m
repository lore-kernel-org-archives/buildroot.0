Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B47EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B5760669;
	Fri, 13 Feb 2026 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYI030DOe2ej; Fri, 13 Feb 2026 19:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5168B613E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011356;
	bh=AGCwUNiW+i2RqEfRkuZlpaTgrley2cYemGuJblR0WF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ANQ10ToApU/ca5UZaxJVqQ1y2pmzjqBPij6OjB+NzjVgsCfw9OAnE+rZNSBXkGHxP
	 KKay0m54TRc+tU3mQL6nZp69hVHiezJSfmN0/zFeWO1HaAqD98pXmH/sZbFTavesxx
	 bY3lDoXR8CUDYHh5QuKsxbWiQ3E06bE2pG6FB7rWmnIHD4M7NhWR47KWWVz5F+Pw3g
	 UmLUALZugSUqgYl8MlD1WZHQTb5Fw5AEvgmNtPotzm6YoWlfXRj1HJbmzMchY82Xd8
	 Ip+n5qpkkrhBHL9BXQu+iOe1DxaeB6LMi9E4xGeSRJBC2Y64/iPGW+0B+8+x1ee3KN
	 1PXFiIeoRmR7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5168B613E3;
	Fri, 13 Feb 2026 19:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8119F69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A2B94026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h34K3vEoD0UR for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B26740407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B26740407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 602C483A88; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:44 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f35b44d29bb327582821728d12eae4ef7e6d3f94
X-Git-Newrev: 417c6b2a11f1a137d0407ba37e49d4ecff91373e
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.602C483A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/easy-rsa: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/417c6b2a11f1a137d0407ba37e49d4ecff91373e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE `openvpn:easy-rsa` is valid for the EasyRsa package. The last
CVE is CVE-2024-13454 [1] that is reference in the upstream bug tracker
[2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-13454
[2] https://github.com/OpenVPN/easy-rsa/issues/1122

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7bcad09c029bd66cf7ae819e7a2a332025cb7837)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/easy-rsa/easy-rsa.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 7266943f5b..2d70dfd05f 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -10,6 +10,8 @@ EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RS
 EASY_RSA_LICENSE = GPL-2.0
 EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
 
+EASY_RSA_CPE_ID_VENDOR = openvpn
+
 # shell script, so no build step
 
 define EASY_RSA_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
