Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F359606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d9I/NtmX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C5B6069A;
	Fri, 23 Oct 2026 15:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCmGzVR3WBsm; Fri, 23 Oct 2026 15:28:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F119606AE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792769301;
	b=imFziRRB9yTW++OHiWAwwS+YfvK/sIi6OQ95QEg0JILr3NBcDitegGD3Jv/LvtQJRraT
	 9oWHDJ5AxzUP/dwKRg3J5AbMYSnrAGshr2rX7ihOHjxtxpontH8IpMBUdILItLoTFdFuh
	 bKezDJ1eEex/UHXgGR8TZYYDfWd8EIR4aUsrs7BEC02ad5Z7VUuKA+o7MfTWy8yINcHE/
	 dKi8+W/g+dHFTrxTDJ51lhohfGSI8w073P7STfrw6Xgtokk0i0xsWnbB0nzTnwN1Tf5KE
	 4XQrRlrlocImLnfgBPD67zGdiAEhVVlEDHdCsmvXQK1ShUPhcKKWRvfPylHHlO3ovaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792769301;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Ng4LqFFuCKy9NVIPBxD7hhP9boFL8/O46TL9umJghLs=;
	b=RoTQPCcb7d4yDXSSZLzkNIyf9eDb0wr/bQSm94T2qKFKLFj/g9uyy2gqP4yO8j0/eBXi
	 PZyo5WGCeALUplSNgDEfmji6YCj5+0sbys8IMP8yiQPgPsGdxehvBs9mwF7/Uco0/at+4
	 U9/Ogw+u/FsLlUxFnHOM6k/D0H+qPxMDoEGn23JTaYNIoGHqwm1LJbmdHzFl3fkNqh7FE
	 e1VaNhc8An2KlSJ1MzGuyUmDUenlZ3l2BI/mx6ws51AdCbfcwrhrS4qCDhdXZLXWUtFNH
	 q+W++Q5nIE7ikupAkYdVA4wzDykFmjYfEh9PpKwdtpVvqOnegR4oKdEVyKpfrCuwpew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792769301;
	bh=Ng4LqFFuCKy9NVIPBxD7hhP9boFL8/O46TL9umJghLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d9I/NtmXlpdU+sBGuc/1bU1FeS41SKNVXpxpVjgCrPc75JfvE3EwTObdsOmaL7gdd
	 0wmwmQe7wdunZsnlAOLDXLC5+nURn3nErF1bZn923Fhn2/IX6PmIYdTqhJ3TNjyPVH
	 WNi3FByVFZC4XdekrjZD6UvnJT+EkiF+HSOghIvtxZYriW39OIzZ1ASTfPH7ACrSsg
	 XsTncG+TBkPR56DK8Ey5I5Bz6KOHgwD7s/8UgKWNZskW4pLnYFE8JRafPXhhkrjFAP
	 FcxBHQOiHiEelrjWuWkF6fH9/PmHhcsM4eBKRf4FMij7H416lhv5w/QNtvbUx7lQjs
	 0euZHzBoTQzhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F119606AE;
	Fri, 23 Oct 2026 15:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F15D3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54EF3606AE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWBsZzF0qwek for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:28:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8F65460697
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792769298;
 b=JosYe+DS5QlgPgpja/A8kjpE+vr54KioLXZC1UU/kF2vIvMztURGMrsuZkPqZotnCicX
 NfGY9zY1Tn17YAv+BxAGlwI0dUbM2LkwWRoXkEnWQazt3mINN17wsSJ9+iPLNaemynprp
 Qem2q194Sxj5XVoz13dopktzcXlZMILYbdCnA226WnZHH1EgNk/MND0W2AOOoUOicVuCH
 pKOlekfG1ci2334JppmwycLsjscrjBdZx6fBI7GsHEe2levBGcpNlD4NMve+o73d6jF+6
 cFxAsdywCyxJr0hjpLE4JVCbT1nUXENOgjDrvjeXsp1tUMbBS0JgNY+dZd1K4yRiDAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792769298;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nKf+aiAAPBMSCrOFpPZoBChqktN3j0j8SzKgLboWy9E=;
 b=X06VGAdZncahe2KVixYF/xNLTGPN6IoxlBOLBhNhRo9n+cN2jBCLVbHyF3B4HgaBJW5s
 dXA1oZw6SrjN7DE7X6oRwGWl/Ivu9HV6lnqvRGaBzhKzCwr3aUVoPBjqhFn5cux7J4/Bd
 gN5MTXoy2MokmsQZbzg0r5sZ1yUU3rXuw7OGKtz7yz4ORn4A0XQ1OkeXkdS/3Bqyn/tea
 MURw6k9kWGFsn4H/hqr3V32JOgyBf4j4Pl7jChOdo9NuirhvCZjr2/h4UlM3FauZS7GOu
 WvODf1I8ftg146EtzhyBd7YdlTKuwedW2jh+RzY3ao9gK4Wd2/gHED/Vdk27RrIAzYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F65460697
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:28:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01E7A9C67B; Fri, 23 Oct 2026 15:26:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 17:14:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eba141c962c8688464b03fee3c991fd8adeb4bf
X-Git-Newrev: fd9c348c227e9560a45caaeaa2cb026a8cf8043d
X-Patchwork-Hint: ignore
Message-Id: <20261023152654.01E7A9C67B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: security bump to
 version 1.43.118
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6312540167327463182=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6312540167327463182==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd9c348c227e9560a45caaeaa2cb026a8cf8043d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 0a6c7b6b3e794e865193dee23c68adfadb6b9c04, available from
version 1.43.117 onward (see [1]), blacklists the roots that signed
the compromised eMudhra intermediate CAs ([2]).

[1]: https://github.com/boto/botocore/commit/0a6c7b6b3e794e865193dee23c68adfadb6b9c04
[2]: https://emudhra.we-have-a-problem.com/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 2f298bcd54..4165d4cfde 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  2e223cba9b8627048a80de7eae77d5aa  botocore-1.43.114.tar.gz
-sha256  f366fa4db518775632ad1eb128cd8203ca46396cecf37209d904f0bbc049ce90  botocore-1.43.114.tar.gz
+md5  3d48f43d16ae64ec8af669c35f938b20  botocore-1.43.118.tar.gz
+sha256  7f3f9d88cc9e847587690f82a42e3c3c292c3026c92c1e60d68a9310018e003f  botocore-1.43.118.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index e029532f9c..3aee2d8f30 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.114
+PYTHON_BOTOCORE_VERSION = 1.43.118
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/ce/c8/b508359d1f3846a918c06807a9ae27eee063f904559269e42ccde9de09ea
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/d4/b8/3e55154ddaf1a6d1d4ddda85c0e5983205a3b7657edacd8ebba8c6fd774c
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE

--===============6312540167327463182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6312540167327463182==--
