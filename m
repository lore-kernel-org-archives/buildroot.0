Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEED606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H8L1r60a
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BAD4061B;
	Sun,  1 Nov 2026 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRwcZ7SnT-Ef; Sun,  1 Nov 2026 17:07:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6D68F405CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552857;
	b=BR2/Xp1odwRnufCJK3yKUCI1L2tLdr7qvXIJQ0VeNS9edsVKbTJ812VZtUZUltPIUoYX
	 ljpNRGNe8RbmaR9D2XM/bqgK0X9UFvUjOUU3FmBqGzscgbd8kya1weIt6Zo27AK0EUrbS
	 H9XzulA2qbU+py6sk5fNE/Mlfm5248odgv4MSKivTnkhAeqWoxy5yJMLlqpSnrgoGWZLh
	 rABM/uIe9XGE4G/D85lSLN+3zzV8dYOM8FKyKz+dCWQ1LTYVdwG/DUhAegokJe43vrDqu
	 tDx34L5adhsngHx2RYXW1vRCZdNrxpcKLHbcuNTx0RGqvi/flv+LquFZtu7GW6J4Rug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sLIXYsdmcFxFrSrMRc2tVPorJAIcQIDeNczUlKnOkEM=;
	b=mh7LKw2KaIL/TOvn+Us5mPMB0bUBMy7Gwf8xjN+nKEwWsrL1+g0HFPDij/tiXY4fG1oW
	 RsJAbM3TG+uIM8yY17uMKwVOuWazxtb32M1+xpPAKr5Af401iMiP3lCy5adDUD7XDd61G
	 ryK0KjsFK2huGk3ChSbF0h6L2zNm+qjKm7FMszZDr/AKDOpGfGjx3ARomwOJCuvsLpLBe
	 yXcQ7EOnZWeO4IQDJ9nfuDp6w7qgk2BPIUGFvBeG3ygfsM1W63yvXTiY3CFcGskQ+0nrD
	 w3tBaeucSZ338mGZcvu3+wN9KZVhy8MLno7t1T9HHOh64wzIqJ1Q2ZeVUONpGm0ItAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552857;
	bh=sLIXYsdmcFxFrSrMRc2tVPorJAIcQIDeNczUlKnOkEM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H8L1r60aEKsvg4iCLnJfrVdXhcRkX5SXZ4Btp7GP/qxXPxCrm1vind0SOfaCcvQCg
	 jm8Rkep4FDhTg1DxhoDZ5yBZYzEyzHzB1D34MhGTSeCv/9q3o0kUjGkdmtW5Jd7Kls
	 KILCqZyQBiK9th4ERnCk5CWkx79o9O9w5KFoK/NIEYMVSg4YWbpTxGD0qT2LXXKIR/
	 xSgphnurivFDxSNlIHCp8QVz+MHd1nbbXvZ4inmVP+KyvBbaCVEbutNNfnMc/7YvK+
	 vQpLqlUWA4pUKmX6+2jSMvGdw9KRBkUFyWJBsejbL8l0s5N1IxxfNTFUrm1ol1MAe1
	 CftbDUoXM+jZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D68F405CF;
	Sun,  1 Nov 2026 17:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C04AA2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5A4E605F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mduIMr3GxtrN for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E8C596065A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=qfo1PC2dK9O1IIV2dGKrCHOkd+MIEKZQBDNhdw5zaY5xRA0zKD4J9Q87XWXWhaxA2Keu
 DLb4o4g/60dAjRq3Av8fvpg7VkZ1LbUBrju0GMQ2YNxka8ibWoCMPgj8bqjRmFjg8X66z
 qFd83WBU9iN2O9R205JXd2E0ah3tF4AcPFVCfSe/5oICf9D3tzvx6myzwcjs9IQSYijk8
 IWzV8KJ+b6R91U0EUVmOGkP8pfVrp57ygS9Eqzn0fq5u8WfwjRVaGGl4DnQuur6s6+V/3
 5QAc9Jr+mZgpWS024CM5lOmQL/PZwBdnQNKdmm6kqMIRIFCwpN5QpqQaudpcarMTtPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ILkaM4CFZmpyheU2MjDUvyVg3JYh8F9MGEvcrC8xuTk=;
 b=D1Vrjs6C9YhmRUBP1u2S4f9FwTKUfN1fp+GTesTi4/YE/Pn7wlngq7J6t65iPS9r1zBW
 y+DEBbL2ek8OPbIAnVbx8dN++yQBQHEQ8EtNlvxIYzo4BHf5XiGrG5ngWE8kPXSkMy9oT
 FqN/SkljexxXZCMB84j1s5h1841DYc0uisx7ATeoXpL9M2d3BFCoaj19Vm2CAxg/6S1Hw
 nTnAJIXwltn54Oyso3HwusIduzZrMkCLlUVKZdGxWuIIxIHeMKkZofO9eYKPxzaL8YLZX
 HTI5fRbc48djf+7/eIehr32IHmrsorNMstNrapKM2iYLK27ZzxGVh7BmvNdLjSm0eSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C596065A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6E749D4FD; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e28e07a7bcfc3adb2b67c78d3936b01757c1ebe2
X-Git-Newrev: 1b2ac3a37d8be7d18b1272d31e3023fa7b233f35
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.B6E749D4FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opentelemetry-api: bump to
 version 1.45.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b2ac3a37d8be7d18b1272d31e3023fa7b233f35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-opentelemetry-api/python-opentelemetry-api.hash | 4 ++--
 package/python-opentelemetry-api/python-opentelemetry-api.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.hash b/package/python-opentelemetry-api/python-opentelemetry-api.hash
index 934c47ffe0..3db5a9fb79 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.hash
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/opentelemetry-api/json
-md5  54bb20b0cb8b4d0ef8a3389cebc4a81b  opentelemetry_api-1.45.1.tar.gz
-sha256  aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75  opentelemetry_api-1.45.1.tar.gz
+md5  ce7e35c4c1a5dd174e2f9efe0af1bae5  opentelemetry_api-1.45.2.tar.gz
+sha256  d7b0008e21e5fd61cbe7a7f34ca3b6905a78ab677d9bc395e299359c75cda6b4  opentelemetry_api-1.45.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.mk b/package/python-opentelemetry-api/python-opentelemetry-api.mk
index 46029d9f62..89a5c38554 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.mk
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPENTELEMETRY_API_VERSION = 1.45.1
+PYTHON_OPENTELEMETRY_API_VERSION = 1.45.2
 PYTHON_OPENTELEMETRY_API_SOURCE = opentelemetry_api-$(PYTHON_OPENTELEMETRY_API_VERSION).tar.gz
-PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/2e/02/6e0ae9cc61bd3169d401077b507b3ebc344745171e1051ab430be012dcd9
+PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/19/14/cf3a6b6448849656e1e5f4e2101f3988dc6789724050096aba1bc5ccf592
 PYTHON_OPENTELEMETRY_API_SETUP_TYPE = hatch
 PYTHON_OPENTELEMETRY_API_LICENSE = Apache-2.0
 PYTHON_OPENTELEMETRY_API_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
