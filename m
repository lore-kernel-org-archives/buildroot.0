Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A61CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 20:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D1A8141F;
	Sat,  3 Oct 2026 20:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e50DGH66LFTD; Sat,  3 Oct 2026 20:54:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D24E981421
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791060865;
	b=RR+YOnZim9tboRDaMBOBgE32Pc9bM1JVlw14EPLytNI2Nb0zeQuYYtuh+N2bpafouF+a
	 D52FW0nGodu2heu/GLTpDvrXqY/MpzavCPERmAAZCUPH39JZUD3+5XDLYf1NL0tMgf07m
	 jjdM/RUZoqUbVNzQkbmVjWN/95CMD2VuYe0AG+B7VyHvtC+aNjAqt9LIhFagIDL5AMSwv
	 VUhP4iCjKQO4wd4qt+SmqU4xmJVH1sGkjWaXnt9k5fNT6U5p3kUv0qIYvyWsNZMoWPLiU
	 CaKebw//0MQ7wZTGKPEDGUoovjnbp2DUTRQudK7hWEuMkGO3WWZMvzJZQeb9j9O7ojw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791060865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gRbN94CAMdzi4aFytCk40D2VdbCl4ReDMPNX62RVIfc=;
	b=Gk/2Maf4yRv0CA8TyOPbI6cBm9FS9LbjiXsl7McGyO6bIhqPZGuLVFwA2OUxZjRYpFVT
	 iknlQay4+tjse7LBcLiltsxc0/61FyprDp5L5zMFbijtwY/GQXX9v0Cw2YpiL/QaQU4DI
	 2pHVddclgoWDiu9JEfG7sJ5C7WFvcizIzUVkNoAyGqLq0nS0uHvGiyI6rFS2rwytnL/Z3
	 +Z7Lyuni1YTM4MhMu22Tu7mdWb2DkBXeiW7tyFEfQak9DDX2YWztH/bdR1dWTnZda9XUK
	 QtTYixsrhHfB/jlvUUtU3rmJKATkAvfz8qAlZC4scuZdueT1zVxFFHIoFRP14wcfnUA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791060864;
	bh=gRbN94CAMdzi4aFytCk40D2VdbCl4ReDMPNX62RVIfc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pTP/DDb4eo2i4a1xOGiyoEoPgn2XgMxIA6wiMEv39n6lHCWkF5iRQVkL2hX8ajKUe
	 jV4OpRlQuTHEExkPGgi3yCkk6QHl9svc5lJFt2f0XJ78BwwkL7x0H5gSOIyFnGBmiz
	 uV1sAqKV3S8zVNdR7b6pX8zbwjyJwGQH18kvh1hzk8RrF7XapP6E/QCLikoCiNB8sO
	 Hql40SmbqJnOWWZV9JR+dj8pqNmrgIDK9BPuHzlNfBpRHJJTlq8sQPM1if+7zM7ad6
	 zCdCffBuACgKGgggfyIpEnHDxWxZhUhEUnxUAaPzPZyVV3gORicyE7JoHgls5j58zj
	 6ithAF6xYEqNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D24E981421;
	Sat,  3 Oct 2026 20:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 074FD2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED4F5406F5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxFbHoTSQPwN for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 20:54:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7AE9340EAD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791060861;
 b=fXn/pp2OmPwGrD2RhzorCvIq9EhApqfZGNn51ETVwkCXgigeRrv/OXRmgooY2cL0j2eC
 jNUnyavrL44hQaRV539QLRZkFIlR1AZaE6d249fS5yEQQdsuaqK3X7izEJdsAS19wAZBs
 xLoBAxFdtD+fQUNEqU79QdDtoB6CqbQzs70n5OrLt9fb1VTtTJlvkUU8MhntOOFuF5gXC
 CF/OBkmafvcpSbF7V+DCJ8iEjYlL9f7q9L2d6FqRANhoobOAQlH3FTRJ87WYachKRn5wa
 zhqihZeYAyKULAFRfjaywrkx+pt0yumajJ21Xiw4IQXNInC5NpqUhqkQVzglYhpXUqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791060861;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=j1USIGU0ye3dnP8lTSKQMyyyQCj7EPgp0iI0POPyTG8=;
 b=K9uwtyBtkoNYGqWhz8K/50T8+1iDHhTaoxGIfwPYzs8ilstnON8z5SZOT9tGdQGTwymH
 /Q0+puVaZ5ynj8SIFcZO/Q/bx9NWhZnNh96lu024iEMnptRgtstvMBlR9VltE+47frX8L
 vj4mPdYq29oKFO+huY3vWrc7D/1seuoh54WijuIrQ1Hm1ga7UxgkwuPK8TV4iUmnrvCF4
 7hR1bXT76h/AuPmtxu/mNW1KjdzOMyKC/PU7AVVwsqXJh3HMuTx7Co864j9bMJYqhJwME
 4tv5bk8HFMXBvJbBrUNjoL8OM99hSdGCjd33V4rW6QG+8Ay8hN0N7bDUw7AHnGZmTvQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AZU3Vrvd; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE9340EAD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.160.0.144])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E3FC7B0053D;
 Sat,  3 Oct 2026 22:54:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Sat,  3 Oct 2026 22:54:12 +0200
Message-ID: <20261003205412.2056188-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qoriq-mc-binary: bump version to
 10.40.100 for lx2160a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NXP tagged 10.40.100 as an engineering release on top of 10.40.0. It
sits one commit past upstream master and only ships the lx2160a
firmware, with DPNI shaping and DPSW fixes over 10.40.0.

Use it for the lx2160a target, and keep 10.39.0, the last release that
still ships them, for the ls1088a, ls2080a and ls2088a targets.

qoriq-mc-utils stays at 10.39.0: upstream has a 10.40.0 release of it
but no 10.40.100.

Changelog:
https://github.com/nxp-qoriq/qoriq-mc-binary/blob/mc_release_10.40.100/CHANGELOG.md

Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
https://gitlab.com/vjardin/buildroot/-/pipelines/2909708426

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/qoriq-mc-binary/{ => 10.39.0}/qoriq-mc-binary.hash | 0
 package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash     | 3 +++
 package/qoriq-mc-binary/qoriq-mc-binary.mk                 | 4 ++++
 3 files changed, 7 insertions(+)
 rename package/qoriq-mc-binary/{ => 10.39.0}/qoriq-mc-binary.hash (100%)
 create mode 100644 package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash

diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.hash b/package/qoriq-mc-binary/10.39.0/qoriq-mc-binary.hash
similarity index 100%
rename from package/qoriq-mc-binary/qoriq-mc-binary.hash
rename to package/qoriq-mc-binary/10.39.0/qoriq-mc-binary.hash
diff --git a/package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash b/package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash
new file mode 100644
index 0000000000..006422ba88
--- /dev/null
+++ b/package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1b647fe30203e229124d76ec05684674c4b00e3dbdd73d3353065197f1e30f3b  qoriq-mc-binary-10.40.100.tar.gz
+sha256  d69738ee3595df930dafa5194de2455216bd613cac1130904bce4af11dcc46e6  LICENSE
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
index 5ae2e48c65..1823853f9c 100644
--- a/package/qoriq-mc-binary/qoriq-mc-binary.mk
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A),y)
+QORIQ_MC_BINARY_VERSION = 10.40.100
+else
 QORIQ_MC_BINARY_VERSION = 10.39.0
+endif
 QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
 QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
 QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
