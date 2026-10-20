Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0F606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fid7Zpj0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F702605E7;
	Tue, 20 Oct 2026 21:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1l5m58fCAV0; Tue, 20 Oct 2026 21:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 33A4B6070D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792533515;
	b=reqN5kJCet/AiLWFF4qbRP5ZfEcCkqvGQXr9gBbIj0wYSynUtbPGMSrGrxiLudOI06FF
	 kAjbTDXMNk7Xof+YpscQPsP+E0PV0/V24U30MgI5+6bnhzmLHLn9hxhdg6o+kPOAVzsMJ
	 j5JgQO5QGuLrSTucRO7PyOIgoh7n0hnlvvyaWb3DksZ5dHdCg+07vzNh+8TZFtKVjNKL7
	 7kbB54ffWyZ/JkczLwdTFU4EhOzGuc8KQdmm9hFIJFtdIol83aScCbPMB91AFNldYMhc0
	 pq8cI8MaEeZ0Iv2lxieSG+OKP/KsOHwGAAKHCR4lVkzLgFRv5YT/1g2XMkTw7IKz22Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792533515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vPTgL+IEAYYJ0Ga1KQqGdHLX5QQRoK9ZrhmhdBDDaJ4=;
	b=Lb4cy437rw5y4CQHOmBYS4D7h2VHiRvnsUF7FTyAUHnLWikTATpPUDIK8JXCjhgmtRDo
	 ttvEVfCLlwp63wYUvL6+ymk+oCP5Z3UzlT95DV8Z6fK9Rvp651JlosP6cPDgTBMSuOysC
	 YbyDDPvW0d3eECY7PdX4x6bRbQWHrTE2iVTLFR32hgetM50rTtyqbSrvhq+PbLkiG3H3d
	 Lk7t23dpC8Tn5XywhXSNWVrJgblLEPoo/fhFkeE+WjwLm7q+fBOmwRp2H+K99Bt3BMQSU
	 3kpl4thcKgnRgyFd9c9jIjjnweCappJNXzzSWG1Cn/7QPBvpSsxeyzSDi26BTNQfN+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792533515;
	bh=vPTgL+IEAYYJ0Ga1KQqGdHLX5QQRoK9ZrhmhdBDDaJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fid7Zpj0zu2psyX9bOef1OlV/IQ8DjB6XY1GIoiogqQwsTR0MC/P7twYX6OY2QUJ9
	 3NOFZLe+0yyUTVXe1cLLnaD2FXDPEt+94GwOluDatX++YvgaPZEuQy1k7yNaXRrENb
	 HBBlAFioshIfSiOYDnloUAkIeZqh3880/DDox0yMYQwQflF3g/wqaJTaW56dZxUaub
	 mpmf69MaBJdqqehRBrXs80MGEktIYe7F6txTBaXjRVlYTBFxghSmCfBXbVyUlpvVi3
	 fXiDPwK+IqkOTo7DTv7ZRviy45GAReKKVG9nFy3PwJKMy6VVx5xY20tD0gDWnlghF0
	 A0tOKCBJ1PU/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A4B6070D;
	Tue, 20 Oct 2026 21:58:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C173A4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C5CD80F61
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9kEy_mfEP6n for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:58:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 945DC80DFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792533511;
 b=OPnlRH4Cccb3y86j80/UJpyUrH16tPb0Vaf3OtyK6VgcOKnEpjLMGA+GlJ3kHDxMrPf7
 pxLO5e/SDjg7ZB0HZU18VCwWBvDPjOYDn+2DFDW5k3GQYCounf/I23NYBvFwqJ0ppug44
 lU0o4cg2/2jKYzQEvUpIivPxbrtac6nXKdzl7hf1T0q2HOEklI33ZERtNemwB+NTjSqg/
 wf71A2nm13G2Zo1yqQBpFNLRS8tK9a5yVVCk4mLfzALpOY/E3wF8CCV/YPyaTwnPCPkCJ
 zK2oMG4lTz9Adra8jHtPSKSkGHgdeCeMUBnYyKxtGkMf7XODaTq3irL52Vo+1KOUnKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792533511;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z4BVv62xlbZ6UIOuOnyGnOtdN9+nfRifKvb3CtQxnfA=;
 b=XcM19zZDhqcZVkDMyydNJX8jtfTWfZ/t3n3VsFaynFkzWpG7IVrHgoitsEtIAH94u3H6
 AsgNXjf8ABH8XxPMgbLZdQymk1PBkTSDidCv1H7j9I6yGrkdkElfG+tNbk6f1LU9fz1m0
 stehxLljtmTrFuKeuARb7Vr31cJvtQIcUdKpjGSTrH3AH2FE5LwvjOhXlzf03C5SJwV4J
 wbF/3xS81cK8mrkJDM+ziXvT9x6f6L8YHzDPZkwrTeEnw+rmYuqUyUgWtGKD+hzNW5WOL
 u34F3jCFEABP64r5enUVbm1zxVvWAMXwQzMQWw1VdTBb7rQphyMZE9xt/OXWhXZkPyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 945DC80DFF
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:58:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F6FE999CC; Tue, 20 Oct 2026 21:57:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:28:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc03d108fbf17c3db07e459864f1110a463490f4
X-Git-Newrev: 87a1518a25d131ba75b89311df8977d738dbf79a
X-Patchwork-Hint: ignore
Message-Id: <20261020215708.3F6FE999CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-vcs-versioning: new host
 package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87a1518a25d131ba75b89311df8977d738dbf79a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-vcs-versioning/python-vcs-versioning.hash |  5 +++++
 package/python-vcs-versioning/python-vcs-versioning.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/python-vcs-versioning/python-vcs-versioning.hash b/package/python-vcs-versioning/python-vcs-versioning.hash
new file mode 100644
index 0000000000..964a21fb70
--- /dev/null
+++ b/package/python-vcs-versioning/python-vcs-versioning.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/vcs-versioning/json
+md5  bfb201115bc6c78668ed643c9b06503f  vcs_versioning-2.5.0.tar.gz
+sha256  956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55  vcs_versioning-2.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f52f6085a2f4acdb7f425fac78d4bb013b2d723616792fb173a9f8aea191d8f0  LICENSE.txt
diff --git a/package/python-vcs-versioning/python-vcs-versioning.mk b/package/python-vcs-versioning/python-vcs-versioning.mk
new file mode 100644
index 0000000000..78d04b8457
--- /dev/null
+++ b/package/python-vcs-versioning/python-vcs-versioning.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-vcs-versioning
+#
+################################################################################
+
+PYTHON_VCS_VERSIONING_VERSION = 2.5.0
+PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
+PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/6f/a0/6977bb418312ad30f27e522c5040604d4bbf7e40ccd5a11d333afe549354
+PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
+PYTHON_VCS_VERSIONING_LICENSE = MIT
+PYTHON_VCS_VERSIONING_LICENSE_FILES = LICENSE.txt
+HOST_PYTHON_VCS_VERSIONING_DEPENDENCIES = host-python-packaging
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
