Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D3606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=of4Nsz0+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5710681777;
	Fri, 30 Oct 2026 14:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iFOFWQhfUdv; Fri, 30 Oct 2026 14:20:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 70D1A81774
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370013;
	b=MVTWUW2QfGQMYXPeBXH08BuYprTNfWpVR7Qw2HVmGuFjjiqsW/k7LP88RYZaZuKoAuZ2
	 hbLBftpNLm9tDeLDyvbmmjPOV2EowpVpVqs3zQdV1KalI5cLEm00qtFR3TkciJHMv3otU
	 WF6n/OyRvYzRm7S/Y4RE9DD+ntayt0vBjRNrSwEZHBIc9vdvekiPkIsPvmOc9aSRs1OQu
	 Wyz0UjinqxLHPd4xTOuv63a6VdHVGcdWdFAQgltJFlgwM2t8JvfROZzxGZgL6v2MlWyzm
	 NP2cup3sdLGf0H8KtvCO2lTEY5lwXvmDrS6vM5vIXJ+9Fj1tiqOoZ9Giw2PgitdCfpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370013;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=O+I5dm52LdxpD9lRKi9/d39BBHTXFVmV0ITMDAoVNZ4=;
	b=DB/ZvBpeUbcmcIXMWkPsyJtlSKfS8mcrOEUnUEEQ3QkQf7aIJr8goLQQTaGhNeEzm34o
	 uaissFodeSKQPNifhdyS/YbMz39ipoq8dqhlaLDd+CR48fTuJplW6F+qLAsOQuzx2schr
	 2E1MTzNXQc8Qfe4j4RjtacpMCqxSr0b2DwoDdszW8bf+jPeTln16o0/w/hx40kQ8AaTJ/
	 D1jFaHTD0OILcNq8yTarXblmgQlre0sm1LmWEDWnmgZ1Q8uzWdDzLw0ZQM2YRUTvbz4p5
	 EoLhbShYaxBtaBCQXUvDqOz3e7LJAFYeRlo6wF/juxoDjt7MLlsjmmNjsi5yV7Y/9qA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370013;
	bh=O+I5dm52LdxpD9lRKi9/d39BBHTXFVmV0ITMDAoVNZ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=of4Nsz0+XaikbydntyExFCKQG658vW2jUWYt+KJqJK6a4p1sraCUF8qQsf/xKkcO3
	 APEIT8R/fTs4B/IwLPwro7UIDhi7JRTlaHJYwyq9mGVFpTV/sKBtnB0rX5ElDN6IfR
	 3OywFfjFAIpjdr854utwuLqmqZVUufdMSlE7jWMh8z6t370dLSXUTYULUxmL+oZMjP
	 /AUhnPyD2oorU3paLIDhThIORvWASABKuI7TFvY48YhW1+uMHRE9U6EX8Crxoh9NKC
	 xd8rsObwK2LEaGAJWtMcWFDPV8Q5l7p0W28iRMHiKbNoMmNzTg3KbVMdMKf4HiQXFf
	 xnVLgp+DmIiAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D1A81774;
	Fri, 30 Oct 2026 14:20:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24DB7D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 054B181332
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qlmyCtl788M for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5C5D812BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=K8NxEsUSIM/TU3dVu8jLKz4U3g93P9lb3x0hXk0fc5BIWz9gdmaMPBysGfv1OoDMUumJ
 i13UKpRX6G1zaUeaA1AtqkPMjNr3EJyUSW8p5j69tTgXcx1WjLA45CaIFC7Rxe+BSiByi
 Ei/SLr5h0nEXenz3RHI34W48z2LP0OpULMOArP7anBBY+IFowdJJMH1IW1TKKDc6iaVWI
 yYB7ZRrUXfqc05i87prR0SX2U03VSB+9MVO7svritWbFMDJqXXiEtFtzVSSzE0TosuBsM
 TTOR/Bu9KXEBwaZSGDfoW4wtZdFfHUZyj597dUQVUChJU983QZnCtbMfPODicmDxkEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wNDqZrA8Lf86iW+69EAWvahSDneu9hFLxxBDyaKP/NA=;
 b=QvwkYcX2PGCqFigCvZFGPS9bO3e1yB8eHYGVWH1aLm8s8elXBEZ/mzXzSkcROie2T9pF
 I1Q5rf7C4qKIsREdm349qKJ4lT7wUl5lvvDKFVDkGJkAfV+OID6Ov+ssyDgFWZF8JycQW
 Wb4ec7U+88BOs5ghusNGWV0/D2dRDnoifaLykaLro2mnbQH82ZbkFvLGzKCJgeshPLdq8
 uPO92e9eotmFV9JMaq/mdMpLIsTVHNVtPy1JbqKU6kl/ngcBHGmfCToWOp2ge/jCKcV0M
 RhSm7yFXkBSF01G/HXS419jS87Ap2kJnbZ9ASyBHNLN9A3VVNdcGkdRJEPd9mPjosEw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5C5D812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D484A9D388; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 88ecd46083048dc0473238371044f7cf073bc202
X-Git-Newrev: 38f10e4b9e7b85b429199d9a49bf8f12c71c4be4
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.D484A9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-brotli:
 security bump to version 1.2.1
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
Content-Type: multipart/mixed; boundary="===============6910017554654977808=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6910017554654977808==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38f10e4b9e7b85b429199d9a49bf8f12c71c4be4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For change log, see:
https://github.com/google/brotli/releases/tag/v1.2.1

This release includes the upstream commit:
https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62c30aa78b6
which fixes CVE-2026-111497.

Fixes:
https://nvd.nist.gov/vuln/detail/cve-2026-111497

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: mark commit as "security" and add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f904d35dce2f40226a115cb0e440bc486a7ae48f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-brotli/python-brotli.hash | 4 ++--
 package/python-brotli/python-brotli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index ed8eea72eb..da2d58aa44 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
-sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
+md5  ac1e85a7466ee46d0ca594e041d7ca78  brotli-1.2.1.tar.gz
+sha256  02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de  brotli-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index e2343a24b2..6f5e966a05 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.2.0
+PYTHON_BROTLI_VERSION = 1.2.1
 PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cf/81/1546c983678a9b4e77cb4718eaedd1b2caf24a6cdbf1eb8775938d22aff7
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE

--===============6910017554654977808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6910017554654977808==--
