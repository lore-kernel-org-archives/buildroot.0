Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BAB606A32E
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=maOMVaQ4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB32405EF;
	Sun,  1 Nov 2026 17:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4IxAKKFTetQ; Sun,  1 Nov 2026 17:07:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DDF2B405D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552862;
	b=iOnLUWfqozsb9ZYPIEmvRZvo/1G6T69G/c9bW8a6gN53Ej1VwwVzV6IrH10zvSquGsTt
	 BRy7ObgeffLE9IQzb803XRtx9xvz06joepEFMe3QCqrEiN0+GY+66w85QBa9w7xXKb8Zf
	 /VYr2TcDTSpndvOZBaYYkdecL5HJYxW0t2nXO7T4IVuAY9TN0bMzCJPf/771Y15lkyFgI
	 kjrVNb6OovArieqFeAFwsSqKatbT0Co2OlLwj07SSpHg0Fje1ir+rAAH88YDRLdg6teTg
	 cOFzTZ2dfPwEMH11CVlUgwOWbPVsqOOmZDsbCNMEskZpEDYFrSHQxlUQ7MriQeXEYhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vfwtx25phgnpllLcxRI5VQMTgghqL+PH4Cn/dT+UJZM=;
	b=Jnui61vrhfsared2Jr4gVll+pj87JNrEEu+X3ZZAdKzxi4FSn8X5R3EB8epAVOKVwIxt
	 J698qp+taypVx7M3Cy+pqTdkbh3bQ/+LvQs2BJZF1Js/Ekz+opJzM500MgWdxF3ckvGmr
	 OsCEBJviNv7dA2tsc0I37MEUWLC3ZX1Zt334CEv8wZxFe2sk3ZC09aMwTCphC9JMh6k0U
	 9XdrvZdfh3DR6qz6XaRl+EBxZar1gEfZFHg/qL40pDnu+S6kQ5zJF5zulEeb8g9ZO2usk
	 u3XLNG6pM2pZ/UQ5BtMqe20XiXmZ2jcOY01mrBgKwCIEs3jfmOEoUrD0v4QXGX8SYGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552862;
	bh=Vfwtx25phgnpllLcxRI5VQMTgghqL+PH4Cn/dT+UJZM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=maOMVaQ4h3jhjcN3Utub0YVnb/oypD6gzX2iuQYlhqYAAr+sWj/3FLMKbrvMxogYf
	 Jlfgsa1EIQZleo4GwxYT11/ZoXgKX5ecbsrsN2jX/T8Nk4eG5+Du2wg4pwt9RDJOCr
	 1olO7ZFxSlQ9zH7/GO4ibzvdjzAQxDC2oewBLEiM/Epi7Do65qYsA7nMOosv7xQq1s
	 0iApVQeW1uZVjxJTk0BxJNEwLOzo2DkSb4XOluQ9vwe9frq5T55rQVGvVdXy6A37Ca
	 7A4bTIlQn8lvTr4sUbCTCZ/44lUHakizyAWoB/3BVQp0d9gq3hIL+rdbeQtBPUABOP
	 s8sAR1gC1O0sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDF2B405D2;
	Sun,  1 Nov 2026 17:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4111D380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3118A80D5E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlbsnphshMLr for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0126E80D58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552838;
 b=GvvHw3dXt0NOYKjhiQ0MKjE3wpqd1Ipp164yQyNf3VtbGOCYEE0rjf7enbKvZ64kohKp
 FDeSTxB6cxPbaPPoqH7usthfdIWumBGlhLbT5hjvOpqIckCCQIxWScgLV8/B0ggOemq3I
 I23BH1mN2NwyVGzYutwzxPSjpvEuv8xSXGIFFxHZmmICylszSeJCLUtV+/MDLnISOZkVN
 MeGEBDhPItDOEFwT/tWswAUzGrNNwI02CxwEAyR52bPQlMEZZxf2TRG136svpk0h97LEa
 f4ajSBieoM+00q1MHkpYxBTD8lKYNPNXWTzA7I5s94wdsRgy7avB8F4+5+44pxDD0Lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fdh9l5RbAW5M9SJ8QoGIJC1Jpv0JZpLyBQQMOMExjac=;
 b=qqGxy8CNwoQi60pdI+TGaGMR3BjMhYJDUY/zsxd+Lsjr4wRZIzYdTcEUvuEigZI/6ekU
 s2xjcwK8zdGLCD1qboAPU5J/mmbG9fRgk5bSqQ9l3NhEwOc43cgeKPrlD3mD2oYur4rDO
 OL5G2/nVJRj6kklUYSI9r4yGLEPI+4Vof4dc2ZmAPv4PDStC3DhJldpIoFdWEuE7Nufeo
 +JuBqo/QBJLA6FCO1U5HVnAq9Sux8/DC+n9NnYDSOIJanwBrt8a45lVrJIQ+5jDsOWO/l
 qlfsfKUrjik0kouyOQSbDtQoLJ8iGJyBzuT6vZBY3gSJQla3wtsYOCqv5XpByRDz2Dg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0126E80D58
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C288F9D4FC; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b2ac3a37d8be7d18b1272d31e3023fa7b233f35
X-Git-Newrev: 6680751acecb8ec8e3826f525f425c823e757a7e
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.C288F9D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasn1: bump to version
 0.6.5
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6680751acecb8ec8e3826f525f425c823e757a7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 1611a42549..ea3c3507c9 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  8389c385b422c57820eca5f21bad64b1  pyasn1-0.6.4.tar.gz
-sha256  9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81  pyasn1-0.6.4.tar.gz
+md5  149c7bfcd5cbe4c10261ed6724cee161  pyasn1-0.6.5.tar.gz
+sha256  6b11616a6bcf3a40e635f082bb232fa57b5e0dd7f517bd7ddd69ec3794508a47  pyasn1-0.6.5.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index b8b9062985..390ebb76bc 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.6.4
+PYTHON_PYASN1_VERSION = 0.6.5
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/9a/23310166d960def5897e91fe20e5b724601b02a22e84ba1f94232c0b7f67
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/88/7e/3c0da41061a2021cac7cd524fd57092adbe5b515e8bf9005702e366802e2
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
