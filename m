Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEC606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BMM5otXF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939C74073C;
	Tue, 20 Oct 2026 14:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMTs-XCxbbx9; Tue, 20 Oct 2026 14:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C8F74073F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792505381;
	b=JMjgHPekoYtRizI1aFwZjv1pM4bfjguSIDBtXXmo+k7sJOi7D/A2k94NNdMVh9XB5mCY
	 1ozWaN4cNbNO629nW1HLJCyUA8Ua8O1I0TW/2kd76qABMB7S73eFhJgBMpmdxU1jBj7X4
	 DsuuT4r56E3PP5RmDZ4FswqckCgbgC3salPI3SIz89a8Hvldv3fJfMUvzmhDpUUEpgN1a
	 U5wrJpMWLLfGqU8XCHOUcgYTlXRITac24cuEPaqes1xqIUHDEAY2kMeJejGqW2Dzya5Cq
	 2mc5Prh9Z76MxFOliX5THekQMqPke4b6WAcfZRM6sm5YVcUpW8HZRfV8KlgrCgQRcIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792505381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=O5NtzITyCdWC+VwEUYvPbzG9wsrtkH/TrLEjtLKtpsU=;
	b=PK7IsyYIHUgShGAHC0cDnzx3ixFb2zma22TKxKjJ/iTnAg5r/VhEg5wAt64gSR9FcFIh
	 ail5obbFnxJilIdJN6CovxrVBdHf54986oiOJS9uA3A4oWkGmL94QH3i7mM9zKy/m4FCU
	 SbkwtXKCpUyG6K49rh5j1FHqu9J19A8bUhCBaUT4QBt3aG1sHqqV/oCCRAqiihyL59g8n
	 Pc+D5ASIFLdNmwJfAtsAYYC0zRAm6WUauA7Ons0V8zC37mmn1rOUMIxkkFI68SFyt6rfK
	 Yq4q3Nv/4bYEyfVPwluXnj+hvrGMjZIALPsPahOLHP7vsjotflHwZvdObu/rL6DF5WA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792505381;
	bh=O5NtzITyCdWC+VwEUYvPbzG9wsrtkH/TrLEjtLKtpsU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BMM5otXFDjkf1Ozo0apAiQvihuZZgfY+0JeEC2kiJKMi/wvgL5rnMRSCbUOTDqnGR
	 WHK/5TvLjmTPylo18/R5+1MxRk258NVNtDcZ74McK/T8Z5wu3LITwc3F7fAwnq+OOS
	 Ku0bXS4xBcxGD4jxEbdDzd2LGIedKLMiHXSjnG3fIjZrCdWR4AbmOOcEVvBO2Q+XVz
	 gm7CE30IDfGw86Se5wexyHfJ+aWk8EQUeVLdcwKJLR8K0G08S3qrg4mj+Q2kh4Lw0i
	 seG2Fifud9fttlG+W76los4Zk+fsOfsGGiMfxLUkrobIZPIATllvy3x+UrrCdXRP/r
	 8MquATkJdYwGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8F74073F;
	Tue, 20 Oct 2026 14:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D84751E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAA044073F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmmcDAJSZFtU for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:09:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3FDB4073C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792505375;
 b=DtbiHrVBr5XBQt11Ol47mZTEr1YEHUGkBOB7zS9KxKK5e9z1ja51upAhBYkNZq821PNF
 J7n7BUs7wuodJWVQaBqVIinpq8tUmjWXgSQ/c72eIWxHB4dDFEtG1SPxXfa3VCVnI/Fno
 SJ0CbyQ2Hhg1x3FTcirYCnh7CAIUAAewv67Vm8CAWN4HrEuDNrGUoS0xHxw0IyIx4XUpY
 fEc5UToUHuc+NAgiTNIv7KSDuF1i/MGcOgSX6aSO8612wwtFs6tS7jEyBo1xSoPihyOol
 U4zsYo1lhtgCbS0+iTnurC3CmE0VU8gQh/U3elUPis3MBDTdRgzUlIr17Oz/hqTAFTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792505375;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=KGE30yGlYiJ6jjXEZ/oUBjnRlmIIa6qfACfE8jznNn0=;
 b=KRdTOcOQnCncCUvtgJOqrDZaxkH0cl99rBVyiycBwKFVhh8dIiGV2aPV+b/1JeKi+++R
 TUcl+81ypsekjjWL8P3mLL3kM1+PLG7ZkB/SqSX6qD7hzM9KMWYmNwK71lhnnlFacuZ58
 k1zWtgOvEGjONvBEJOeSQ7q6CzYbbGTQNruPqYAsp8wwkUEO/uX3b641MjRBq7E9uxOwC
 QPomTRi+jrfl3HaNcTs95Kwu0C2rtMjJz71GkqlZVkHjT4Pku0c16J41Gc6eIN5FeLMkG
 /7r8VfTbRHtQ3WQcVM3+H8ErYSCZotpBtlHmYPnGf0UWMYz/gsotHe8qLjkVN4k1zww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nkwYnWch; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3FDB4073C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 74448C63455
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3DAF60393
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:09:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31C93103289A8; 
 Tue, 20 Oct 2026 16:09:30 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 16:09:27 +0200
Message-ID: <20261020140929.1632016-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 1/2] package/network-manager: fix build when
 jansson is enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since upstream commit
e5d2c7cc6dd5f8146954d52855fff36febd03d5b ("meson: fix
cross-compilation issues"), which first came in release 1.58.0, the
jansson detection logic is broken causing the sysroot path to be
prepended twice, causing build failures:

../output-1/build/network-manager-1.58.1/meson.build:307:2: ERROR: Assert failed: Unable to determine Jansson SONAME

We fix this by doing a partial revert of the upstream commit. We have
submitted this partial revert upstream.

Fixes: https://autobuild.buildroot.net/results/104c0e15617d52ae73930fa1c439b7f426837e8d/
Fixes: 67cb61bea5876227226603e58d3f74e5032b734d ("package/network-manager: bump version to 1.58.1")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v1->v2: None
---
 ...ial-revert-of-e5d2c7cc6dd5f8146954d5.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch

diff --git a/package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch b/package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch
new file mode 100644
index 0000000000..93810765fc
--- /dev/null
+++ b/package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch
@@ -0,0 +1,50 @@
+From 57c96b61de76ab6fca79e075076c5d2e35fc1229 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 20 Oct 2026 15:27:21 +0200
+Subject: [PATCH] meson.build: partial revert of
+ e5d2c7cc6dd5f8146954d52855fff36febd03d5b
+
+Commit e5d2c7cc6dd5f8146954d52855fff36febd03d5b ("meson: fix
+cross-compilation issues") fixed some cross-compilation issues, but
+one of the change is incorrect:
+
+   jansson_libdir = jansson_dep.get_variable(pkgconfig: 'libdir')
+-  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'), check: false)
++  jansson_sysroot = meson.is_cross_build() ? meson.get_external_property('sys_root', '') : ''
++  res = run_command(find_program('eu-readelf', 'readelf'), '-d', jansson_sysroot + join_paths(jansson_libdir, 'libjansson.so'), check: false)
+
+This change is not correct as jansson_dep.get_variable(pkgconfig:
+'libdir') will already return a properly sysroot prepended path,
+assumming the pkg-config used is properly configured for
+cross-compilation (i.e the PKG_CONFIG_SYSROOT_DIR environment variable
+is set and points to the sysroot):
+
+The above change breaks the cross-compilation in Buildroot, which
+properly uses pkg-config with PKG_CONFIG_SYSROOT_DIR as we now have a
+path to jansson.so that has the sysroot path twice:
+
+  /home/thomas/buildroot/all/output-all/host/aarch64-buildroot-linux-gnu/sysroot/home/thomas/buildroot/all/output-all/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libjansson.so
+
+Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2575
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 5345a650a0..cc1460460c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -296,8 +296,7 @@ config_h.set10('WITH_JANSSON', jansson_dep.found())
+ jansson_msg = 'no'
+ if jansson_dep.found()
+   jansson_libdir = jansson_dep.get_variable(pkgconfig: 'libdir')
+-  jansson_sysroot = meson.is_cross_build() ? meson.get_external_property('sys_root', '') : ''
+-  res = run_command(find_program('eu-readelf', 'readelf'), '-d', jansson_sysroot + join_paths(jansson_libdir, 'libjansson.so'), check: false)
++  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'), check: false)
+   jansson_soname = ''
+   foreach line: res.stdout().split('\n')
+     if line.strip().contains('SONAME')
+-- 
+2.56.0
+
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
