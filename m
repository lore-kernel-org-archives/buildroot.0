Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B875C88E65
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8FBF4052B;
	Sun, 13 Sep 2026 16:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0QlL5OdRq0L; Sun, 13 Sep 2026 16:35:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D6A2C40563
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789317316;
	b=bUDm2J3MSKWmtWq8GbV+oXM5s+TAlExYjpHmlSeJKF4Ro9iHFtouAclJsqjzS8sC5OCe
	 UKFh/h+jpGU3P9+2j7FpMZ3ec7vJNI+Le+5+hl68vKrc5ZBQpAno4l95r3JOA8Fna15ZH
	 WrKEA5CiMjPDPC4lnkWt634w82NP0Ehg4rQmOy1/fEsqnE48d87NyLGMjCOd6WWmF//d9
	 Lo0SeKrQRoys2zZby4lbVcuZ9BBhsfX92cdskAn1m78/fCEFeaDnNo3adcWRzTioV/yZ7
	 Nu0t94FfIUEltawffgps6PSQIIZqeIeUbGkN2vj6qkhYYVYn2txGk8kF3FXjpvNTn5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789317316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/MNWeLXtyYC3Bo/fazAig+C/jpqlEgh4EumVRDzot3g=;
	b=juY1Z2GMYCYk1q6dcdTBjwsmyXmWiPMVcQQEJNtFB7tbpb7bpY/W+5jx6Nw3ugD3Vsgy
	 Ufo2YjCI/SMEHjOvQIMh9SvafAA0yZVBn6qtv/dZXL/vpJoOG5jx+6Oi0nvmBHLPQL9vA
	 l2hsiqNhIxfSj546yOlTgf5q+XKDHOLs0gAwN14EGzUEukf5/Ex2lvWU8US7zIEqdfvaz
	 WFC8HEzz4DF7dSe0dzsngj7Z0eFb6Afit6WiyWFqYq2jHvV6tBHZg/LbkG8xz6xVzf5kc
	 HOO3fkK3XVkG+oVUpx3i0BKN7VPWxPBG4hZ1wqcQRJhIdLQY+NStl4bGAs+8gXc6jYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789317315;
	bh=/MNWeLXtyYC3Bo/fazAig+C/jpqlEgh4EumVRDzot3g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gtdp6qf0K4Dx7QmjLAXRLZ9oQ3oCNtccJDC8osqQCixXSuOtmr1GR+ulBqXE84YGM
	 8OTN1nTuVeNy2SbbKMo4jGnDv0BEfvRDwWhXEJshf18Lv77Aimg2ZZ0h7crlsMgOar
	 B3H8CIR/crqzmar1Tozfcb3W7qBMJRMWPxbRFSDHr0KHdZCkPF6d/ZKWT5Blv0GKIC
	 SsDp/qNg0kmp37WlMkUDtUXWSgbi1IiGERoeEDSaoO1T6dcTAbcpvyfaWjxpRNPgP8
	 /ozQI5F77wvE/B6zorSNwQCG/YM8HSXwjjQ6CDARQSt8Xgv1NwNP1juCpiee7sZJD2
	 LbGBnzGdNu87w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A2C40563;
	Sun, 13 Sep 2026 16:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB1F2465
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D4D860600
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e75plw5rk5IJ for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:35:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A9CB1605F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789317312;
 b=K8k68hL/U5KH2SzefbffzsP4acCDqYXd9y5l7IFvgJZvUsYlrmAziGHnXBcDeGI+4EsE
 PYDs7yjlE7FUJ/A45hB/yayjQTJ3bDiV+JEGa8gR0xkXN2NfpP+hwctoe3eqqgHbGY1QS
 1CN+xUDV4WwU+FFpQrHnxwIFDgNuMKEiaaae2KldchRY90bk3t/k/gR2rCyzRN+M4bZtk
 rPJYFNuUjFTSg96lsu16XGB5GXRfOkNMd+nKzOMUSI+jckx+WQwIqN9PC/4UaIkvQ4bbE
 3fEKKZtHqbncjfcm+r803PYpv32Qlgtzttceor1iDBrM+ZYAnk7hhOwJnetlQvWVbFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789317312;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=40z2aQYQOaTmr8Lds4TZuf45L6NHujrlL8LeXLcd3VI=;
 b=Nsp63+VCRj5dibyZMkbw+wBJrgigXyr7Mk8pfsIecoR3TnHYZiI8JnhV0GJYcjIqdOJU
 ygUtnrHi1Hv7Khiq2332H491tkGxKAfLGuyj75hhFvpzpP+yjarBYSB7dq1niAVCrbrnS
 grckVeJhzeLDkNvnDtJKSWbCN4Mdp9xMlNdUfMT/c6HSdshiGW9ocCQUU14UPU9gi02KM
 DAyzYycAjZbvyalpPWmROlAu7QCr8+NR27UXWRlsZUrwIjdHfEkGjOuPFeYJIoCEzXAKx
 /T37bbBa6xO0Oi7qRvDoh10tES7tqWs4R87WIbv/S1mVH75ksHQdS4cxhq0sP51vP1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9CB1605F5
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:35:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3EAF95C3A; Sun, 13 Sep 2026 16:34:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 18:30:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 376daf3dd0ac4dda52ede3284dec59a92bb24130
X-Git-Newrev: e8ee9feba137fba7cabfbac56e4f8bab89762c99
X-Patchwork-Hint: ignore
Message-Id: <20260913163407.A3EAF95C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: bump to version 2.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8ee9feba137fba7cabfbac56e4f8bab89762c99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index d6ba6e5da2..0c36fc7700 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2b840e0c87c36ae00100fe892301565d7d905e07e1ce1f69cb4b9fcd65bc82ef  pocketpy-2.1.8.tar.gz
+sha256  c67cb6a1422abe26114219d2e58441cbb3625bae6b25901d5b7f6f46b23ae8b3  pocketpy-2.2.0.tar.gz
 sha256  5ad14c41f26ed1b8c9a0039ae566bc7ce00277aec1634220eae5db2bb8fc54ef  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index c1ae075d38..1150a47fc5 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.8
+POCKETPY_VERSION = 2.2.0
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
