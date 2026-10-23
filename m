Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211E606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SIcwGkeM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D512C40964;
	Fri, 23 Oct 2026 23:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX4YVWgHoMZ4; Fri, 23 Oct 2026 23:54:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D679B40A92
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792799657;
	b=UD+r7CfGxeNvYQBIISSBQ5yJnI0Aljij13y4iVwIaBLcj21qwhoVBLl+/0n8uzHY+kZM
	 4gtGC8Qmaz7NVeYAVXEEvQloQLuvPTyB2rqA5K0kXyLNRgjeXaPCIiybaUjK+K1g0opql
	 XGU0v6ajAEhRmjaY/6s/MleHp1VWkIMuzxRDuuOP2+atozk+X5Zc2fXkf7ID+GTyN1Wa2
	 r/8KgQ/PEyZhpPfKSaSP/3X3z8zEMAZnuIQLFGc9pC4XqLJdGMnSwoDloLWk3Gu0NzHjj
	 CFck7MDIXfzSn933+fIKxSxEloVYB+a0sdW/vf9VY1J386ySQUSwfwYh/k+s552nNog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792799657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pEts2BN5oGw7ESJhxcPxeuGeCZkk7kF07A5g6Dv/vvA=;
	b=nO4lpbx278jgTLElGgKJR5IgS+fwi1nCwVOsC+nwk8y416sP4PPLlH2yEAKgCx6wQ9+M
	 LWvuhSIMLIL50jeziyTvEcLNy+4mXPi7+Xl06WVezryC07FTjtapzO++CJsfKyBEslyF9
	 bQw9KB9keUIPAWZPIpWHrS1184Ku4favDn6gj0/L00BYzhvXuQmUALjbaoqCy93gXEzNj
	 itnf1wVMylSF+bmC7rWUMevtHjCwraf5SQnEDKbsvIClUaxgmK3yVjGMZ3FL/1ttmawxW
	 g5w+G6QWbtdsYxJ/1T26KzmxVNQPWCGBzGBRNK7g3Chu0daP1mRDGnmYBUpBpH5qcLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792799656;
	bh=pEts2BN5oGw7ESJhxcPxeuGeCZkk7kF07A5g6Dv/vvA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SIcwGkeM3+Wo3Aj7OxCxPZEGtIGR/gRhPFpsIeyOY4Uxpzxwg2cYuUt4SF9kSA3KD
	 icvVpQlVe1RnY+YRv390MLjWMLwIdsxPK8sO2rX4mvZz3sQnWyypzdyvLpMQuXAB5S
	 MqxMWgd7Ky9riqim1u99S+7w8v9whH4g0s3plGzKdnafh0jivd2XEkI+Uw6EPdOFn1
	 asHgchcpUhBDp+axNkxOebkwynPmv0YbeRbXk578m9MFrQbDYmfHCPzCf2okWLe7XB
	 8pG9eJsTn+ZwRClodEEOCofrZvulru6jYVLejBglXy4WJ9g4JeFANrv/8fke2v9vA1
	 o3DvnVkS0D+mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D679B40A92;
	Fri, 23 Oct 2026 23:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE345235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9484740ABB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KK_y9_ZkTQMU for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 23:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B063240964
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792799654;
 b=pqJB2qBzvxIsPQeHIw0I22rKxBJlxNmmPyFNCP6LFTGDUjGW6B6PbRao137dQId15p6P
 OdrdtJdkqTy/0m+2EFLRrGDIEqTiE9LZajTgx6QFOsEEUAJaQgL8yc5u1486q55HgcNPv
 T+r3Ue0htFbhJpw/VNiSWpN3HvenEBboj807OoCaVlFw2HuY2o+U4kJGsSnoRXz1b6KDV
 f7ddXmeveYmAArZiWMHX9R5milw9+hyT/gnWQPkO2x6rmjvXlrpmXWT46RNpPeowcs9za
 6T7pz+To+IoBtK57H4SV2gRkKjncGcZRCyAal3YAK/lNRT8OTNhB7dEubyRWf0mwTHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792799654;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wZSBHkE+6P3g/UeE4Ap7Zl+DcdPnOESytkpTWOL8NqE=;
 b=rQMg5Po6uMxTAJYTgqOt7EIjvSc1lCiY6yXO7mqh50jyKs6zPJlcIGM+owODD6uo8m5E
 x3E+VZooUI9PhwIl+lQPOMH/TbIZJQwJhik7lQbW+BzuI5HjnYPhWAu5R/zsBNQqDenyN
 xFEhlXkvqvUqL7LDEodzPF4aYGHI1LMsoSf4XnUu8hsZhlAWLhgwbhkx3VbubP2MqlKNb
 R9WZ6zZFKyk35MZxtJZ8vu0jXZYzkhs9FAtZDpFwzAaJImWZfGQkjmz58efj8QG5spKUg
 89yHFWIrWWZ9RV7qrsaTj3UIEDK9EszQpTKKIlH+9bWgolxp828No9OOXlkvbRL2ijQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B063240964
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:54:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0E0E9C6BC; Fri, 23 Oct 2026 23:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 01:34:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d69b7f3aba9e386f67a0a403075570ffd1211c2
X-Git-Newrev: cb7884163e44a33a049acf2129f9b0b34aa04e81
X-Patchwork-Hint: ignore
Message-Id: <20261023235249.F0E0E9C6BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-certifi: security bump to
 version 2026.10.23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb7884163e44a33a049acf2129f9b0b34aa04e81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version removes two more eMudhra CAs relative to version
2026.10.19, "emSign Root CA - C1" and "emSign ECC Root CA - C3". Both
had been removed before in 2026.10.18 [1], and then restored in
2026.10.19 as "unaffected" [2]. Version 2026.10.23 is in line with NSS
1.131.1 [3] in this regard.

[1] https://github.com/certifi/python-certifi/commit/5cb238caeeb6c30ec1a7309ad3e16a5aa7b10ce8
[2] https://github.com/certifi/python-certifi/commit/662df63d7906df66f1f07c0751a3dfe9da14d914
[3] https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_131_1.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Fiona: rewrite commit message to describe security context & release history]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a583c17bae..96b977a4e4 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
-sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
+md5  9380cf82be7f2a74885ca68665b4b12b  certifi-2026.10.23.tar.gz
+sha256  a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd  certifi-2026.10.23.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index bdfb8ed12a..38fa5c8f22 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.19
+PYTHON_CERTIFI_VERSION = 2026.10.23
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
