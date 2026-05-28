Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13668CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD59283ADB;
	Fri, 29 May 2026 08:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIL5ReNdWZMw; Fri, 29 May 2026 08:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D54283B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043137;
	bh=2w8CuK9YYtTHM2i3UOz3h1efNDGc/bTImXoE5qzKDsY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dewl8ffWQXv2nsdviL4MORBCGvDjRvTxahES1UOvKXc4fTjt/M22cqsdt8j5H9OV8
	 HjwFbnv5MSTXGSW0KMZZyiFNBtNOSgg7SPdsfHtWmJ86CS1IogMV0iW1xDnk8eeNxl
	 Ju2rmIDm2MUAHcKeRpHjzB6qoW4b8HNraU5+gjLqU/FzCtwJ4G8flwTrI69/lEiQ5t
	 y+HMuEiUjs7N4iWiW65S25Ve2CZqO3MsA+yPyFDn+zOZg459TV4D0FRZoNxBCWYBCf
	 FO5TSiE4mTitJuxWzzTRUmv2+Kkh065k/G884WofMKQ0M6p2jeh6f8JQ9HqFpDGdpk
	 EvxwGO8IfY8xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D54283B1B;
	Fri, 29 May 2026 08:25:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06CDC28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A68DB41F9C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iejNrKoL0R_P for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32D041F64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C32D041F64
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62F4587171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:02:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c43c33f6ea6a74c728aa9e1e06437999ad12524e
X-Git-Newrev: 0699a48794f4dbcee549e553094edc89c2d8562a
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.62F4587171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-cbor2: add
 CPE ID
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0699a48794f4dbcee549e553094edc89c2d8562a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The "cpe:2.3:a:agronholm:cbor2:*:*:*:*:*:python:*:*" is a valid CPE
[1][2] for this package.

[1] https://nvd.nist.gov/products/cpe/detail/C9CB66BA-6D92-430D-B3A8-D20C43E0655C
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26209

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 140d618567404950951afd0d26d4321c2247ed74)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-cbor2/python-cbor2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index bbeffaae32..41808780b1 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -10,6 +10,8 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/e4/aa/ba55b47d51d279
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
+PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
