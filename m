Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD8606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eJj5RuAX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8910660BEC;
	Fri, 30 Oct 2026 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUNAKI18Y2pn; Fri, 30 Oct 2026 14:18:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 98BE760B72
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369903;
	b=FYo5gd38ugO83BUQpjktQbJW06CPWUgjAI62Kz3OfwisP/41KuytOPigKiEUiGgynqtH
	 NGvn4OnZT5n+CUSy13RRwCw7SJE/tmGc0SHbdRbCF/h/XgsSRf2j/BmN3/FK+RgFIreF5
	 DOkg7YgE3sFSoTcErrnUQWdpSQdiPaHYi89nPDvQdXpTzo7iIpYzFR8VE9J3WWugANaVw
	 JbNfdSpzd/wrHA0gevvoM0X2rylJw4wAZIqB5+pWYWvDLRpSoVWYU50uPnFufgSDNtosV
	 Qx8QmKDfa+W1E9hModDE8SF7AeXd4L4Gh/ECxk8cWl+tQynHENs3WrtRqaHi+KNYuXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369903;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tnpB6loUZVSJ9Ky0kbl7+vm9kTK5T7BJBhrvvTqdX/I=;
	b=EfmIbn2WtaMha+JOV1Phfm2UN4G8jRuQRt2fZgs2UdhltivV3/3JOD958Ofhskk3OAii
	 vWGnKC5TU+mn4mvK826v9mQlG/hR4segmsOcsGWl/jwe2pXnbkJgOJ2GMEpRK8DK7qbTk
	 GgH8COakMCCwpizs2S53s3Szk8OwWlikAA4nHW/DTo+PTHJoZ8be7qcAlb8pbp1VzCq8U
	 pnlnQSKSXsS/aAkOM/Y9wXydY/nBTQGSsZCzYgrfmGGgMr9s9SLg6/MG0GLqyA/Tdtbau
	 QE50pJuS7oZb1y7SF1Olv4xzSS+OL2OYpPdR6ylSQLUbzfBla8fP+yOETQgQSASeLwg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369903;
	bh=tnpB6loUZVSJ9Ky0kbl7+vm9kTK5T7BJBhrvvTqdX/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eJj5RuAX/3V+Ti6BQ+DOTMY3V76QHnnbnl5LBJKFcyqZY5OXn2J9Kh7vQhZWSgb/Z
	 r+mCzdcp4t61txWwOUsXJsvAcrCbswDD5cO8IhHi5F2TqQk49ffVmaA7IwZNa1FkfX
	 S/thtRZ2r5AFlgeX6E4LW2fh/4IReEIfpnMbnfej9jZXCulCacMQ1YCC69bH6KKmfA
	 Ueji17R9Pvs4ery+iX028t7xDSrnQCtMBXAmr5/nWqP6fNTk0Iu1fKix12PTw4E/TV
	 OQPcmKl1b2Hz5Zk9PkAwLUh1dRVaGHj6LXngYcbNApQ1GewoRXSc7nWlc897em8Cbk
	 E77sPKWMxch9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BE760B72;
	Fri, 30 Oct 2026 14:18:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DDD5712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123B5812D4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3URu2h3vxaic for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC57B812B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=INGlZrsf/xYwbFG/adml/re76lSzGWo2oXcf9t+0O/6PuflDYdXXZ/7zdwZMGJGy1TPt
 60xg5WV0/3xDxTLSTxUi9c/q3vvdusrAZOMrtffdMdULO4QaQa100ebWcAOPbEUNDxDeb
 qbwDFdeipoWzLdPypX9v51OQ66V1bfWFTTQJ73AVfMHc6LVCPML3mm+jRO/ImERaYGNaP
 XY3WhcbR+rSZbIVP4Nu6c+kPtk5J4UoftON9WVSWWhN717hkAho7H3X6/j7N00Ytv+lif
 y4bcw0geDTgCf1cs2yF9Q0k83rOlhZcoT2mPFcx5aPUbLcSyaZMkZ+gni/6Dk2Jcu/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OQTA9vIAuZ/LJQI9wp8TH2C90hzaQ2Z79jBlsO81pqE=;
 b=UaexRXR5aZyADdClaOPOwgayVg1YsizJXfeSw3zKz1CoaTlrSPpf31o63hpDH8NWbPOx
 KvU1LuhzH75uNpSlgeTJ9RBdR4dirjf5dseOxUqKivolPm/vJVvoBhWqF6s8nbinKH0aC
 9zn3IQ587xk+HEtX6AOya+V9/d9sOaaoH4PUle4hdVFS+PzuT2IQCZM38OA1GzAtUbI8S
 gCAP+LWbHZZuYhLpLbr7AaKNKPBnq7ipjy/Kggi5UachhKom1zaQYOfK1hzU2veQox5QZ
 iPvwsK//07ddqtstJyfMwTdtdz6iwn1i4Y5uia//mNFcJXn81HHUjStkkX/Pn0dszFA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC57B812B4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB3959D389; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 975b3e6420bfa21b2c85c62a83c405ad904f98b5
X-Git-Newrev: b9d3e618ecd239a26fc99624ebdca19eeaa703bd
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.EB3959D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/podman: propagate
 missing dependency inherited from shadow
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6149348731789947764=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6149348731789947764==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9d3e618ecd239a26fc99624ebdca19eeaa703bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_PODMAN selects BR2_PACKAGE_SHADOW, but forgot to propagate
its !BR2_STATIC_LIBS dependency. This commit fixes this inconsistency.

We also propagate it to the only reverse dependency of podman, which
is mender-update-modules.

Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f09b4c5bf7becfc1bf22a1880ec4c029b768647d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mender-update-modules/Config.in | 6 ++++--
 package/podman/Config.in                | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 53ffd13dbf..1fd7384f59 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -136,6 +136,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
 	depends on BR2_USE_WCHAR  # podman
+	depends on !BR2_STATIC_LIBS # podman
 	select BR2_PACKAGE_JQ # runtime
 	select BR2_PACKAGE_PODMAN
 	help
@@ -151,7 +152,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
 
-comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
@@ -160,7 +161,8 @@ comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
 	bool "reboot"
diff --git a/package/podman/Config.in b/package/podman/Config.in
index a8c625c5b1..2f20f77507 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
 	depends on BR2_USE_WCHAR  # conmon
+	depends on !BR2_STATIC_LIBS # shadow
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
@@ -89,7 +90,7 @@ endchoice
 
 endif
 
-comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
@@ -98,4 +99,5 @@ comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS

--===============6149348731789947764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6149348731789947764==--
