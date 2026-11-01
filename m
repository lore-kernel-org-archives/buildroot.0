Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C97606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kf2ojWo2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA51F405FB;
	Sun,  1 Nov 2026 14:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onbwyenTIMHh; Sun,  1 Nov 2026 14:50:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A7D704062E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544656;
	b=X3S0V6f58ZPO4IiY24MsWpUw5CQ+4tU0I5vQSHDDDQvMdW7MEf2a6zRKIr0CZ4uZb5Ll
	 cxWK4How83aim5nOWA1qcOPe5HNbASlRVEQNbmHdmw6OmxoVC7wKEP4yiplhPAWCxxGMj
	 R6Pbnl4XKl59dy9H9LUqhwiNlo7047CkMArcws3b7B77qRPPTKmNtxmNWkALl9KDEheAq
	 trLRDBsZAmn+nqUH65vfPDphCR661594a/LwQ6NPf+E7oyx9ihMgycfqhp8TmRI+oWT2N
	 eCKK/Elmm7kP86YCrIMa97K/ZfascJDWqbNrbWTytDHIvDJ/h9NZXnk5AoQAslbVlbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+MylTl7pSUKP5HMMCK6f6ZZYF3rRCAY3dwTtddE9kYQ=;
	b=Rlu5ZLUW8J70JebfZsetXNt6aFp+QFpqBzfLVlzulRxHiiwuO53vI2k5NIS1XF/HiDdz
	 k83OUtJ3+dlXdzivIhKWo/8Lgeha6pgZVeMfplVRBiii5/gfqOPhZ/dOeSmFfhgal49b5
	 KyhZCmbS66iJaV5+OlkoiY/kgKGu9fWNRkqkNXineDO9uKPu0Wri3WKvU+Tuzgkfl1ch4
	 9uWtsHTFfmuK5bYtY64BrJz+Yrr4OTE1jyhmxxGME5dzRiSUoed7/ehJfijB6qMHdZxYr
	 /pOfosL8PBj595Y2CS/vs4agQkOQMcdOkxgwFO9uhki4xL68cGsPLhv5dzjry6CNxCw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544656;
	bh=+MylTl7pSUKP5HMMCK6f6ZZYF3rRCAY3dwTtddE9kYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kf2ojWo2jbaCTQyGsSJt+xLRkNgsxqEKtPvQW3Ybprqo2AfULk3USLBJ3NRRrAEv/
	 Umn8Yi6bAW4kbwqo7W+X3CRkPJNFi2wRJ+s+XD5FbL22yDEi4nTpQmfhC7XZJsqp1q
	 WQqW4N33huCRs9d6DaF0K0sNa9Kkeqr9zG5W8j//Hn7PsrnbmZE7xVWS6AmePjA4C4
	 ftdE48Psb/kvdteQ1CGf/SI8zcPANRmmmVFPlp05tUJZvzT/VX/kSDjKWs140Afd/W
	 SvAuWyNhbbqqPVACj/ZReoPKxdRr6fqw+owNsj8cDVBSSWKVOJPb8gEi3TpfCPIvO5
	 rV5m/82Pulpcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D704062E;
	Sun,  1 Nov 2026 14:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A644B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62666405E5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlYRF1oLH0Cw for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9FE2C405E2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544646;
 b=LrPDtk6ZaYYe5qqCdr9JgQy2p2gkStlvXxFVCyuwDaS7+dwy9QYYrt/vUkPbw4IcRG2/
 XALaCfkUkBRN6+kJeh6DPh+P3eEeEyF/IsUexVGcWK1/mNIJiKmEU3yUPmbt/JVJ4ieUG
 o6opArX6tQxpxWfxLENnStQQAvr0Wyl5fmoxMf1G6YA1xueCaeOcng46pPPM5LIJ1thDY
 eGllvCOGXKUPwAq2mALg/xDX7n+OHTkpIc6tM5wVKNlmUwMBtzUQLPKOneObw9ozGC3qA
 NBmvYotrFLguOyE6Unzws5RSr/3VTYjZPs3Efhgl7rRZrFMJjKhfVk4j/d9cNLgnPag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ilhvQQhYMPpNFa7mb7L6zmwvOVMpnXmfV2xIK3kNySo=;
 b=Rk23U71wvgOsBuFpRcG5db+El71oeG0UEciMqOhbEDi025bxUlfhvdjXp13yKLcRp1HR
 Lcu2HeBoKjvXPERAidKdTdE0uYYHTtILTIILUj4nZ2hWWB7v7eNyD5t+PGKf8DlI65+Ba
 rzLbzf+XrOTDOWTkEgcNO17p1MM99AkRtHSvNmAU83EDfBHzeiwYQoyoKz9MDYJdA4Yzc
 frnhU9ZP/qae1aX/zVYSK2p8slxIX7iXheL3ewRMWQvua9qDYKM2C0Tdy9iADlS+QAMPf
 00yDurRNdYZ9+q3/MKNWumqXVI58ORIkdQTc6/Z9MGEgvcr5Y4wPOO9aMBAvolNPr5A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FE2C405E2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C7AD9D45F; Sun,  1 Nov 2026 14:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8850254c60c8d3c9c696beb8fda8d599b8543c8
X-Git-Newrev: 1bc28b9dcad33c23407a0eb5b5783e0c5aee6d4b
X-Patchwork-Hint: ignore
Message-Id: <20261101144917.6C7AD9D45F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dnspython: security bump to
 version 2.9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1bc28b9dcad33c23407a0eb5b5783e0c5aee6d4b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix CVE-2026-114605: a crafted DNS message can cause excessive CPU use
while decompressing DNS names.

https://github.com/rthalley/dnspython/security/advisories/GHSA-45c3-73f7-pv4m

Switch to the uv_build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 01ef94b889..b5ed1a16a6 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  5f2ceb19b1c269f9e1ccef8bf2a1e8c5  dnspython-2.8.0.tar.gz
-sha256  181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f  dnspython-2.8.0.tar.gz
+md5  264d7e3c65df17a3a23c52b64fae6c76  dnspython-2.9.1.tar.gz
+sha256  9a6d30e55f8dc63e6052597666112bff0586b95a2474a9deda03afbbf820d37a  dnspython-2.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index da3cf223fd..404676275a 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.8.0
+PYTHON_DNSPYTHON_VERSION = 2.9.1
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/91/21/7fcd6780f61e9756aafaea760560509bb4111375daa2e23c1be7a89f33f1
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
-PYTHON_DNSPYTHON_SETUP_TYPE = hatch
+PYTHON_DNSPYTHON_SETUP_TYPE = pep517
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-uv-build
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-uv-build
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
