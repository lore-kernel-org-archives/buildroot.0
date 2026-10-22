Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3FC606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d0+L8cNk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6998560887;
	Thu, 22 Oct 2026 21:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XBydzbEaZYZ; Thu, 22 Oct 2026 21:27:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8415A6088D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704424;
	b=EDtB3iCeeJvDL1CgGMei2EBPMaRZyjhdZR7CyvaPyIwnD6tbV06/JHmD08wfUSPN+uAO
	 0iRpCebH0+ne0RGFYTcFwCFC7oFzRrAT2JrzNb5GsTe0V6nlDd/PhdL3MZYBELjbcFb+W
	 86xkyzxvbiFB3552hnJgJxyOb0/o4jXtLmKgqc19mqdobBElboF0paJyqXbKrx+cCiw3W
	 63xiYSuVQLzu8EOFY9fAtcl2aDuYLRCtL9c9+HC9XvgddOGWZnfOMTGGGb736jIDhDeDW
	 20tGteVXUhYdnqIHEfpI3IPwar7YSYmA8PrWlMfm55seLOUVY9LR71pXcu9YYzJ0dBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704424;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ROyHEgdkASwZBKdXTeQz7YD7T+fihxJ846fIFMtQcVE=;
	b=O2Pb28t+FP4W/PVksI2iikBvhgu9VwvGMWjHXoJked8tf9dhZEYAEup3uo+wZyVq1I1P
	 wkybVws6GWFk2GqwGJV+4RdyQ5Y0gl/vaDGIRu0GwEKbvDHJb6+kN7/bPUEz4h5+oCbaO
	 57zoJ1I5HmwRfeJpXR7NBDtfaeODiyqtoNVDowth5Y0F3uWBJGRwedISMbtUrdMzvScK4
	 uaKRitHCwHRI4SmLe5D1A2pyT2K7q6FeDHKd06YQBV6W1FimbzsQlb8RDe6NRfkHaCdD1
	 +ZPjk2Kc7BoDdUOjvsRN8a3jwtyk1GivcHaaPC1iMtJFHyhIMgADq1wqUiIxqtrJpWA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704424;
	bh=ROyHEgdkASwZBKdXTeQz7YD7T+fihxJ846fIFMtQcVE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d0+L8cNkxjYmk7QixYlMeQ5Vpm8K/pm3jsHJvnRHdO2N4LaUVI+FN+b0YiTtlZvK3
	 cucYcpu52js5knkA/ufc32bWd5S6YGzWWD8SChVHEyQeOD3MFsWq6jztQp3gf9sLyz
	 /9zf+8JE8qwejkYn6yGnmEEvIeAEYeuZMF83wPhxgUXcmKLY+jdjLBXuuK1FUgE7S6
	 2DGw+4h4OsXBSgguoZ+tmtalYCsUxNed9y14IAfYEpN6yplgbnM/uLfhYKqn3k97F3
	 7eKNOl/iJGXirI2FY4hlwe/8Ny9VoZXusyhHDBfMo+fhamW4/WORKqecFeXrWSQYMJ
	 P4NB07/6Lgz5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8415A6088D;
	Thu, 22 Oct 2026 21:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40970356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25AA46088D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28WGAa-xO6Gm for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8434C60887
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704422;
 b=VRMJqBWS/x1Swa3AFeZ34GfT2EQtdQqJdv2tUs66dPEP5pIbDOu7GSw9O1wWFP20Cggn
 63arZvyK5ohrssfpQiwLYEP9/m5TH9WyEfrQ7/fnitpDspWKvCmEJww5aHE9wvisXsVHL
 8twvc0U4AHY5ZrljAZOpLx0RUzVIcz88rgazRhbK/W1piYByOzecFaDorVxQLiqe9kXea
 cOuBgZD12TNzV0KffUHLUfeb5BwoVruuR6UNeeEEmnKA40SlTfD1Ke3PsT3+gkoQAHgMh
 PVJ3VEjyyvYCvVdtAb8eyxkzOXUKjM1c+1EBRGPDnAAzFXDeKlaekier+YB9ZM4g5Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704422;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a1quAvw7PIdf3y/Wv1TfoyiZ3SpHBGGsInEBY7hUSG8=;
 b=H1gjqFHEb6WVjTrr4/2362K1wp7imGKolNkLaNvCLJa/raCbOLfYluOrxynLtMsedWKz
 4SA8K16GcwGRE0Z7zujKoBSckrBUxNCFI5imuk5mVg6pnkf/UR+oc90YXeBr557UNmNeO
 JPzNHveuuMlEYEOxMsJtZic0va32tosH1Bg6p92TTitRh3KaschoTIA9NgENUZUpmu7FM
 sWv2eML52GiPM9JT7OeCoWAHsI5j7YGAU1D8cg93wWkca8DOgpLXvGHppQfCytd24LGQ0
 Fsda0Vx7fjplIGDOLoy78AvMievGnFZI492Cg5hjwHUQtdbAx4K4KXcshXhvkK2kHxg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8434C60887
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EEB59B63D; Thu, 22 Oct 2026 21:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:26:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0ec4fc8d88c15c45905511ae916b0a680f1beaa
X-Git-Newrev: 0c41f4f1221f1812b4110dbaed0cbf7bf7b0622b
X-Patchwork-Hint: ignore
Message-Id: <20261022212538.5EEB59B63D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-ddr-phy-binary: bump version
 to lf-6.18.37-2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c41f4f1221f1812b4110dbaed0cbf7bf7b0622b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No change: the firmware files are identical to lf-6.18.20-2.0.0, only
the release tag moved.

Changelog:
https://github.com/nxp-qoriq/ddr-phy-binary/compare/lf-6.18.20-2.0.0...lf-6.18.37-2.1.0

Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
https://gitlab.com/vjardin/buildroot/-/pipelines/2909708419

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 94f9c999c5..45055eabc1 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4faeb92a1c63d99cdc18994beddc5916f2ac5cd853466fbc2557693bc371bf2d  qoriq-ddr-phy-binary-lf-6.18.20-2.0.0.tar.gz
+sha256  cb3e18b85237c6beec7a3da6b09255edd57b182086649017b310d82075976aab  qoriq-ddr-phy-binary-lf-6.18.37-2.1.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 3c39b36362..46784e5175 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.18.20-2.0.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.18.37-2.1.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
