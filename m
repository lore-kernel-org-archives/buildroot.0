Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B86606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X2fLUmkX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC1A6073F;
	Tue, 20 Oct 2026 21:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JJ4e5nYOjaB; Tue, 20 Oct 2026 21:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B4BD606DB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531695;
	b=lcFNnqcMlhDdX5imrnOR9kubPCmr6/mUlNJpIrFaiI0yxEKAJ4YSJbRWMg9r9iFjRXVG
	 qbhfksC0hvKpoXEp+EWp1zwv9wmGhnHHGVmtcwJHz5l1ICEy8uj6BzAt+jeL81tXnSSmX
	 m7GQGwprPQiARg1UQ5cWf3enNHnOjINPtxnAyUzr64N0hJTygshdHb3aG9JiRkTuvM4uB
	 GC6gImxGNC7BkV/5f+wXy+YFNpbq9uckpN8ezKUSUmWCsymuAHSLooOSmuF7ApE4+wmBH
	 nc+/85+Ct0c1OY+qmhf+JycBSR4jR+hgn25APVb76J+TCeyqGndw0OPGjFwMh3SEyoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bSLmtXCGZPVO+YYcGfN07XvSEyd8d7Iq+aXITU/A9rQ=;
	b=HqWAw3jnGbylimPZDr6HUuS7DIZZh4ZiKrnVfZT8RdMC3tibWhY7SlzpQj97BNeTkUtZ
	 li6Z299hE1kL9RTvYKmWNdYgev8uyRWyTntWakmcmR/ikZNTks44JHendTB3/s7aNzh3q
	 oUEQjIJ8AKiStIqt5RvjlWsvTcnlugrCcmB0U4Wqr80K4oCNzKBOt3p6gf3TGEj3QQUbC
	 mQCgY6LKPCJkqxRl0RmDPKZQHM2wW0Iz3Ei085CGbX+UsAdZDN7zPWX3p4//QBRkVGOVN
	 wSSrdJl6WJ2qElQR/2yCM2Sezh3u0FxLslB+cFDEXt0MsuQXdbtiV8ZgjgIsp9mrILA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531695;
	bh=bSLmtXCGZPVO+YYcGfN07XvSEyd8d7Iq+aXITU/A9rQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X2fLUmkXh4ysFghByhkIZZffZx9BXoZvW17X5BoulrqwM2pGjoADRjWvecIctWWro
	 AX0g+McMEjvTGki9IgGd0QlQr9BT4hbrkRy2I1aPiV7E9gswRrr5zRziAeOhEUXCW7
	 zp2KrBWf26Ub5rwmMoZL99WBOl+qSDvgywIq3s8qtYB04IOxyMU+4V+h5RWlb3EHif
	 HwAnuwPLtxbSvFBEf3D41VujWLq1ytwPY7zbXtOenhaaoQsjZm/cOnqs+OaymfunkY
	 hrEV8NTL+oWdhqlyn4nqADW7sjk7f87bumUKte/SdL3ayxnYXDb3FBVI9nUg1aY319
	 ycBWSctr57ajg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4BD606DB;
	Tue, 20 Oct 2026 21:28:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FD43A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB30C606DB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1DZsxYqxD5t for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:28:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25993606C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531693;
 b=FmaisWW12vc184M+acujWXBD6aibD8xDaY+ACw8br24Dt8nsZTwjC9UgeaxdW2IwrF39
 V/jcGawijhguuXwI2aH4aT9L8SrFYdLta5YQSo6wyrYmUz72KZlurnHah2Km7e323oLPM
 Hj7fcggUUvBZrZIppOk7hkepAhAFaPb46ToLUVKUW/pP2xzjFXx8sT4dQ9fA5mMz3G0Co
 PGKUzqRlfmNxTg18vgSRxcpeTUfdPARmKWuitwhtDGmhaxYZ3+s72vR4G4Fs1ERul/z4M
 Zo49B/Kk/Yo0miu0Pi+r1AqpnGcnijz1kyJxw6ylBHcGyMJ/r8H2FTUghR2G1eLTEyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531693;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dJl4Tf4vwRkk30SxB95XpZNoOV3Gv4ODHv6oWtAW/rU=;
 b=p5yEb7ugay8D8b+nX/aLR3OPSAKMWNTWSmAxkaURbTfITLpKEAz1bRCLPZ2uQ9FksGN0
 BA9oKTOZWX1K01/F8d0LtR3ItHo/M9YTAYTaW22tS5NLI5aVvC363+6FgZxZ+jMuc1zOW
 palDI7WXKL+V0xSe0srpdcMuT/cfsGIG38PVYiDJVoX60L3tvtheskk/ly9Hg6Z/tX3Bf
 I9FFqYbPkReNr3RP7F2iBK0RlWfJWW39StRqqzadSA1f9SRPaHA1m/9AQA6Z4Vkz59J5g
 UDq7iD/a2C3i/db9HhXFhZP2VZV5AHw6X2adDE25or8nu6tma5b43ENBUwq9+HOmj0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25993606C2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:28:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6786999B5; Tue, 20 Oct 2026 21:26:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 854abad276a73134867fe2fac98333a120b8f197
X-Git-Newrev: bc03d108fbf17c3db07e459864f1110a463490f4
X-Patchwork-Hint: ignore
Message-Id: <20261020212649.D6786999B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: bump to version
 5.2.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc03d108fbf17c3db07e459864f1110a463490f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 8341aab93d..d63030eb62 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  e7c3a629f252de1aeca447c79ba40399  dbus_fast-5.0.14.tar.gz
-sha256  9c30a134be1a1e4021630e551de040ec38705213c0889ecfdb0218f83beaffa3  dbus_fast-5.0.14.tar.gz
+md5  d02dece424c7cc96a200868d30e6df62  dbus_fast-5.2.0.tar.gz
+sha256  a4a5dddc04b1ade5eb7650d791e2f6fb7c1334595593473914e78a2526ecddda  dbus_fast-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 91c6679e1d..5153e4083b 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 5.0.14
+PYTHON_DBUS_FAST_VERSION = 5.2.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7f/6b/d4c8871e772ddf73e76bfd725dbb6fa82eb11492b370b423892016f0e579
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/4c/5b/ce64b8788c10a8bd313c8638b28be5dccdd5c2daf14839f23aff37e0b39d
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
