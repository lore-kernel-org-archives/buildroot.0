Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C71606A8A2
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kpWh9aKL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IGXML4Pq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D9B40D3A;
	Thu, 12 Nov 2026 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jypmrT3MROM; Thu, 12 Nov 2026 19:16:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F8C940AB1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794511002;
	b=i4XGjVaejco8RKydZd2HTeVXcMFoQ9JENCmcS8JUKcZuq2MuEKAlRDHOLgjUGphT9bE1
	 0hhLfixkElcSEKpsxwzCSBJsYAB8Z0ohUaPB2nGWAWKnEPsL1a+XHCPiIxSyTzL29Fk/O
	 n7R0JS1FZUy6PvYUJ1TX24TdI+vaKyeCu1PcPev95wmXwQot8eVqrzXmS2xz3mLpVPk+D
	 nuMqas3meYCVaLLrzYxvRW01ai080/4An5kyl4GVExVUoyluYeprO6ST2sG7avPiWrvD/
	 O+P3Ukc1oSPF/dhC18Gc30dZ2oyX9d6GYx5dCtF3ITnUVYEMWCHwpP07qVa6DkXT55g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794511002;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TK16mDtM0/Tyz/1HJEg+u4lPx8r/LzJdFrZiRaXBsT4=;
	b=ZaCmNSkuV89ikEcuYuHSPARER71cvUmGWtUt0+ZcucG/8fi5sJ6Gm04W1gAaw5YFdIfC
	 rO7anRDcc2mbzsdMlfFCSTuAHenW+9Z4YyLzIycqIZyBFr6JTzoNzpnn3+Qgr7I0m9pDr
	 rE4kkQ51rwtpfIXoUEuSysHcYq83z+amqHe4mRjSNydmvKmWxnMjmY+2m2rUdEZOnJJwA
	 R+5V1BZ7xKeQIXe3aVp2VycrDRFR7lxi8LIEfDC2le+v95M9Nh7E2WDN5JmvP98aGhARx
	 Rb4QVkgNPreUSjTpw5vQNyVaWclL2DUXKAO+qo43s9DtQsFlbJAQ+emXIf9qvQ/VIEg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794511002;
	bh=TK16mDtM0/Tyz/1HJEg+u4lPx8r/LzJdFrZiRaXBsT4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kpWh9aKLzz/q9SXj7IrBRAummW90UlaOu//7n9HGf140CA9WfOfaoxq3HH1H3VT5i
	 VlLAoK4rRNhcp3k5EE8dMwnU3zkDINd/9X3LQe6u9QXA4cQxi0fe7JELRDeTxBm3pG
	 sVRanS4ti7XYHkNmsGzyRB4liNREgQicN5Ip23O/hjBYoyaRtZ3wCzutfUGXHqgs0K
	 oqnQwIF/f5JrAjnkjlxY1UbilorDIpnHfK2lPSV/AEfBMHpY3PhRF6ANVuZ72kscqU
	 Rt63VnHo1LmLlWRaWB9GmDc0VrjtuR0f226alZKpb0r/8m4QqWgMZVv+aD6cQ0UMk2
	 wiDIcczKfGC8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8C940AB1;
	Thu, 12 Nov 2026 19:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96598AF8
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B84815D6
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3UczjnyA_s6 for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:16:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CAE981346
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IGXML4Pq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CAE981346
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794510986;
 bh=ZsEw028Dagt4pOpYT3Ypln2uyh/awHKVjFe1IES5Vw0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=IGXML4PqZVH2C49E5fyiG83a+m8iQWYihmb8RObeIXVhUeL828IbX8X6ZUw8xm9LZ
 6wDxFtse7K+nXrHKzd0i04p6qPaDWBobEEJPpr6ukP9g0o2wi3jmTIDiQpOe4EQ2cd
 +7AP9NYWndjzZTeFN1m+JKXks5ij7SEDJ1iMoYHK/6401erFGfz/nfgL4+BgQNShqz
 55ob3X1gDSY79IuR8nwOV/1KjDDskUsGHoaX1TN0+p+H8fSh6hQpUkVF/hgo3v5kNA
 IFp8ZGLCgoS5oh/P3JE/ZimnjPjp0mZXwYVkErPJ+xKZbE2EG7gMONYkh3ZMmtoBTX
 +TQ7dLxqvLG0g==
X-KAS-Sym: v3:f51bdf72230551df:Clbr0x+vcQ+nh8vBqvFoeZstHusRJYrRDDnZznkXjRYlN
 ebf6e7/iHV/u9RUYEfS4E0HJ6KsO48+V/xEOn5+Cg7YfAAMuZXQQYhoLw9y4MTpkcyz2l8s900H
 teTo6LqQtb59w/+q6FSzp4L2qxSCANHJvRVokv3rVcpk1QnraAosmkIulJqTmlcrxPkrG+iaHfW
 TMy2RGQXSDOsYZZske4MwoIehla6vD2WGp+Ss+N70BpW/K5niNVj6AY8sac7aEyGuBTbAOp1L99
 rAeX55JwxJy1koM809WZ+qR2MB9hNg3x4WkKIZc+h9dFkHqDHChn0WJFJ9irW0BvXmZ2fX9g==:
 3s/LUyFX3Wa6BAH+s581oMiEIiHaK6at9AYs4zBZaj4iQk9ynqT5RU79+p3FydqTD9PkE3ftGdn
 UEaIP8A00oU9M3Lk7AgU8AHdEVLFERMxnFOKbxF+sziIXvj7X0pVWNBNrCQl+CvN24lQcyiz0Pr
 J6J1dO5VQ30f7c9Dpe17a5n2S+y81drR9C2X1iqfbwN/I9v5WUwvzy6gXYyQtGFs+IQa2+z6SoE
 kKvaR7Wyb/FzbWmfZ3CkDN8FoRD/vlO2VAH+qnXX43nLGOMzgwl4xVkmokPSRvkYnLxGBAs18c3
 zULB37gBuWpJj5Yy85IXoQemJh7wbC+aavyAvtGtFIwtDw+oFIgT1c7sk00REsmSW7Jm+e8qjTp
 HgS+kL8w0Z7LeXjxMlk39WwyW11+QXjiNRqH5tjAJGmMAUm1YQO+lGMFJWrY6LwAWotQB6IBBk1
 FaxMwVzbLKON3oROrtSTMOJcqjDE05tyr9+1JrySAqiOJjdFXdjTUXAiO9LPNNhIDWMcr8cBCBS
 qh/oxT4C/5UDXiutaACEUBxUzWw+Zmyet5ljf29Ki87IpOLul5YB4DRXQ==
Received: from fli4l.lan.fli4l (p54a1b984.dip0.t-ipconnect.de [84.161.185.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 53FD5A4C4052
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:16:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36772)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRaHZ-000000000wR-327M
 for buildroot@buildroot.org; Thu, 12 Nov 2026 19:16:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 20:16:25 +0100
Message-ID: <20261112191625.102355-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112191625.102355-1-bernd@kuhls.net>
References: <20261112191625.102355-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.4.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/f4235e3211f5498bea6abf05b2cc6304b04a9908

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 0d8b0760fd..8b7f49a611 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7550feb11581709c884cfe8e8b0968b8b387ece23388189108005aeefde09ecd  intel-vpl-gpu-rt-26.4.1.tar.gz
+sha256  4d114920b71592bd1978d8af32e7acb97f756b93f7466cfae7bb96ceb627ee2b  intel-vpl-gpu-rt-26.4.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 0bd9fffb66..aaed8a2b47 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.4.1
+INTEL_VPL_GPU_RT_VERSION = 26.4.2
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
