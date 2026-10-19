Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8553606A320
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CTIJechQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CA660777;
	Mon, 19 Oct 2026 17:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkaWcnXzqZiC; Mon, 19 Oct 2026 17:32:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9444A6077C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431165;
	b=F33uQyhhr99j12AyjKIyLDJGwi+iw24WMrbs4v4hbJ10FBpGtTlJiE3Z4yK8K/loCnYu
	 LCZVZLhW04aNQUn/FZUVbGvxH5jckgVikcc9Nt7GLNsDwP1OI3M7paEzx8iTLvIrt/Jhw
	 5rZ11m1NsahYFoYRjw3gBHYnN7MuZa4gIXKzfyxpgjIW+T/woSpIgn2X6ocItQvYn9zzE
	 iD0W2CnphgaYd6dI1ktNDt1GA1S+nIM4QmmQp/rMjEoZdnLOvQy7TFO3eu5M+lhT8JNHy
	 aZFNdfiEk6suAaQ9d76A8K4Vz3XwaleteT2CjQovjWtehUKulcK9Y85XFOmTXdkJVBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hFkyR/V43Jww9wGmegx/XFf2IVoSwXKS71UteaF6Y5s=;
	b=FXxydorUKsVuKfcxkq51L6Cq/lxq3fqPVr4+TCuAFEXM1uvbzWxdlIycOfDmgMqrbFbt
	 2vR6kfZ8OXA66P1XUxEM/D4vsh8EisoiuDMbNFAuMHCV40kjDnYhY20WtD3JCJMpF0HwB
	 X2xDmDon/tkoxwsHu/Tu4szPHuMr5PC6JIVZUi5f6hWh5AsbTCGQgVpQfkc6ndad9z0Mf
	 azV0GC+GjLAPRuW57+HabifZ5Yc6C0HGEHNy49hT/Q1+cPMtK+mMuppbW64v12IZg97cd
	 WJDMGyVT0OBEYnqLSMxUXCMsPZi51Vm7A590oBQ/tlVgtLiP34qeuwT70KuqN7e829A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431165;
	bh=hFkyR/V43Jww9wGmegx/XFf2IVoSwXKS71UteaF6Y5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CTIJechQhGej+3lUleFXwDcP7v1xk2Etk9b/LRtU6iAgCcfpVKvhLJMZwz2qUyAHf
	 lnelFOBCdHT/sRqolaSNxtQgpGnz2X/AUVGIzuAnPkx3krbbt8WvQAaPWSbT7q4Wzx
	 MY6SWlBVpPgtMotFSrbZa6n+rJO9W8w0lAECNYbqjN2rMaTfM8q/lGw0/8tURexvSo
	 mLZcws6DfyrEge0jnntYWk3xw95gXmcz8zkjDhAsJ8K3IM2GE8Lb4dZ988wPGV8915
	 Pd/r+UOZZM/6dzenyx1u3mVIBmNMQz3DnapKLIdZ4R15UpNtAmxMaucX/ia7aYSGmN
	 WR89l38N9O49A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9444A6077C;
	Mon, 19 Oct 2026 17:32:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ADB411CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83992605D9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gicltXABpd5a for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDC5660693
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=ajs8ShSwjx3IHZYW+qDz0gvp5uT1hBO9TLzjuY8lS+He8fDrjb27ARzcRrteHPGmF/hB
 /GfXPTSFfJHXByc9f6+aeXGZJkEpsnxGY348WoTTWXKB0nLqlwGEgEowl54LAni5C8b2L
 43Tduk9u+0+xtPmJ+cxkY28tXJ/Jmnsl8GTYqOlIcNXbYTPA/a6FlMRoq3yUxxgfMSg2g
 wBJzxcuT4Efom8TO7WxCc8AZQ+QNE7Cqp/3O2NNC7XrxPQFgdAbUxrukWURllir09UrCy
 +XLJvoMab/XI9Em1b455SIacxL2lWe1CpqZ4PARl4MAz9zxQYd1JlIp0HcUH3t0a2cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fMtxQFEjcTZ+byCIhOy/Bx3UhwEgq4r23aPtf1pmCFQ=;
 b=ET0Wx6IlxIm/3/HZcoAUs/XoNQk8MgPomR65SBWnCWg9Th1Le2qDqVv8gaW7GIUomcZN
 J8eYe4rxhgQt/mJCoPpVcR6Atsla7qGb2iED8GjP1WI3u1A6mbMht3kwz0+fJvd4njTay
 V20vTNTn/KeyBOXk1qoOr719xpnbBMmSIFaba2Ui2SxbgMfdMoJ3jxtaYUF8UIYWHkdQO
 OpbAIlUjlYjFIxADcV1ae+eS02L81Micq5ZpBIipMVaJ1DigjiDSni3k1WQQsUoHiJnK9
 l+biH5X3ccJFbgn1N22HkLwjZ1iq38xjLCMm7TdGNVDJPi12S6zU7ELuYQQTeKCZNzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC5660693
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 122F69879C; Mon, 19 Oct 2026 17:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e259a1b8117e01fce23b271a98210a5048a81dc
X-Git-Newrev: b368f0d979ca288ab88c70de36fa73cb7da60bd8
X-Patchwork-Hint: ignore
Message-Id: <20261019173113.122F69879C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jc: bump to version 1.26.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b368f0d979ca288ab88c70de36fa73cb7da60bd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 9d317ae5f2..d27a6e99e3 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  7d418aa0fce75da0e5623acd5833165c  jc-1.26.0.tar.gz
-sha256  576b5615b5677c7bf4aacf97dcc6c6b4bf437bbc420c7db77b43ae1785372c9e  jc-1.26.0.tar.gz
+md5  dfa209538fe6eeaf2f6462847dedd131  jc-1.26.1.tar.gz
+sha256  fdf1a58d05db351bd597438cf3b67ff7a9653cc0da4c63234ce77fe26051a4dc  jc-1.26.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 2e82109fdc..b5eb2c08ae 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.26.0
+PYTHON_JC_VERSION = 1.26.1
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/95/5f/9e6e8dc65cb15662fcfc090a52ed4fc4334ab7703b42107bc992777d19a1
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/e8/e0/ac16e68e8e56d0c63eb97d6d9a0f1d0320dcd16763ab288de4ea950eb7ca
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
