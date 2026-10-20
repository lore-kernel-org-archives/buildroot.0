Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE20606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bMW659iJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EBB6076C;
	Tue, 20 Oct 2026 07:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pzF1o11KWfq; Tue, 20 Oct 2026 07:50:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 09F79607CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792482655;
	b=EKu4tRcbND9KGAkdH9Q5Cvl5brPJvaIwT2y19OGHfPoLYkR+HXGMEzTRVzpFrC9xRyy0
	 uJhI8gzTiz2ZYkCpoyay/LRx7RhT0yLe0GHBOJ3Rab64Ka4S091QnaAAbzUvTGqeskXBt
	 dc2zFi9ruy2QdESY7pNJGSbJ0DlJ9YITaHktKVDRnSPyvnvZdH5mkcim/0s2b/PLsdpVY
	 /PkKguEKs4/MlsRosZ3ft5oqTngCoqMHACMFRf88CkHHtZpPCCvValL2iw5MnYidYyNkE
	 awUtOfxrcRIcBccBKqnUXcWRm5T4Aic+mYJIxaAdU3fmQGaOJQVcW0ZCAZO91hUhJWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482655;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5ftorApRb4YMaVyHZgZ3D9P3PkGk0esXQju0nFLRuYY=;
	b=EMII2rYQAKlE2RbXa4FQchc452Ph8LJ9h9X4h0pNCTxCiXBLnlW8y9igESd01HbU0XqO
	 ak9OLMltJlywCsaiTUcoFDlr8kSmfsA1RP/LeNeWpdZ/L+31zZOckW8aINdY2o14DIcBB
	 UcengBfvC1pFt7+nBl6vnnesQ4WE4K6QPEF43sLIFtorHTyxkIUxShg28WyMfOsp/kgoI
	 yienw6PzB5hu894SuxqmRkCPWHTioNLPoZEe/dC80+c1jXN9/siIP+ZG08ZN5/6XJW5LO
	 u4pgB6A2qmyC6Naeb6vwySMW6eAP0v9bDs5rHjpEFgQLKfZlRp+37nDab1U8tnLbRiQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792482655;
	bh=5ftorApRb4YMaVyHZgZ3D9P3PkGk0esXQju0nFLRuYY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMW659iJDbN8TLVxa6WydW4t6J60+3C+qZr+dlf/SqR2OrbpF1Pu36YUE3bLcuiqq
	 igzdcS0NZWKFFGBvSvzjfV7ndNjKd/MIgqMHdnzNSRmmYlFeLk7DcNUbsFO5usgHTD
	 z3VfE9JRElC7yC5Eu2NPBO0XGPyJbRb9BjZnG2qvwXeNqiPCFPziH5qeG9r+vHB0T2
	 7iCvT77prgec+yByDTIF4SgZSU0gbxeD3htDMA1aZmrnSZ3O3B73kdAE/NSz7SIZwU
	 y3sA9tl8Ecx94inB/9ZBAZH7QE/hoy3uMhN3LveytFpcOVAu0T/dk1QmhKIKx5BM8r
	 piHqey4OTSznA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F79607CB;
	Tue, 20 Oct 2026 07:50:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B797223A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A619280FE8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uSA-0vOvAGg for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:50:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED0B480F92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792482653;
 b=MVhCgKCnI8TjoRSVVIiBpdRwGXBxLLmKkT1BC4IRKCFo9AaiBWOWoIUjIA2qmismc1m4
 B5qj/YMyTluz8s2fte3UXjoDcLtsNAzI+PdgOoygJikvG11XelHLY5OJW5pSVzryYn++5
 JDzLuz7eAni0SMtBkmClEJBGKKXLlxEyAQ5ecunNTcesJAxz58BHtziBvE68CfhcJxK0S
 8mxLdnN7qjKiQ93+xJbJLgt32VvZw1z6cIRb6y2vbOL8iQ7uyoA4tj7nzdQDPUFILh6eu
 w5oXqeENy6/S/VnJ+XuBlt5VvT7wfsxoQ3hVEM8Vj3tOxAYbFY7JNzWk5A4YztCu5jA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792482653;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eLLlJu0roXZ2vFMYHtL6nao9AnTPGGykAA0z2xeinnI=;
 b=ILVIT3vsDJWnJNQ3nLdmZhd6GQAy5YiUey8eJOkjL09fD7f5BBIhX9OCLKWrYHluqjaO
 gRtf7UA/bBjuJP2Uuv0b6pNzqGszOrp3KwcF3Y+e8qPBcTJUW0EEZ+ifj2OdQm4itl8NY
 7tDEOpltNr+Kia4bnqIM2AuCz6A2IXwKaOzNDSYwCHVQt2y8CSTPMC5nu53JKFT+przwt
 1J8WGD3z7+sDMty05kehqH9qD53qTQvbEuEwsHOErMN4W1S+GXghI38WaD2Ubb1rE7/zE
 kILS5r8alUOes03OCPRx4oGymbpwsmQoXQyqzZe/nLySAi4ZQ4fM0hlwv3u0xGd5l0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0B480F92
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:50:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CA5D996B7; Tue, 20 Oct 2026 07:49:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 09:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32a2510317091c91e265650864d368b72507d29a
X-Git-Newrev: 97179e17d4e777720bbcabdc6aa0f355ed9443ae
X-Patchwork-Hint: ignore
Message-Id: <20261020074930.0CA5D996B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: fix build with Lua 5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97179e17d4e777720bbcabdc6aa0f355ed9443ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 2.4, dovecot's configure defaults to --with-lua=auto and
picks up any Lua found through pkg-config, as long as it is >= 5.1 and
not 5.2. However, src/lib-lua/dlua-iostream.c, also new in 2.4, uses
luaL_Stream, luaL_tolstring() and luaL_fileresult(), which only exist
since Lua 5.2 and are not covered by dovecot's compat layer, so the
build fails when Lua 5.1 happens to be built before dovecot:

  dlua-iostream.c:16:28: error: field 'stream' has incomplete type
  dlua-iostream.c:68:24: error: implicit declaration of function 'luaL_tolstring'; did you mean 'lua_tolstring'? [-Wimplicit-function-declaration]

Handle Lua explicitly: enable it, and add the missing dependency, only
with Lua 5.3/5.4, and pass --without-lua otherwise, which also covers
LuaJIT as it only provides the Lua 5.1 API. This also makes the build
reproducible, as Lua is no longer picked up depending on build order.

This issue has been present since commit 894cbeddaf
("package/dovecot{-pigeonhole}: security bump version to 2.4.5"), as
dovecot 2.3 only enabled Lua when explicitly requested. That commit is
not part of any release yet.

Fixes:
https://autobuild.buildroot.org/results/e4cf30f6ca8b18ac010755bf13fc1d5e92eda575

Fixes: 894cbeddafddf9322411fcb5257861c1d0df3ea7 ("package/dovecot{-pigeonhole}: security bump version to 2.4.5")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot/dovecot.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 74cacc3200..876cff2523 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -89,6 +89,14 @@ else
 DOVECOT_CONF_OPTS += --without-pam
 endif
 
+# Lua support needs the Lua >= 5.2 API (luaL_Stream, luaL_tolstring...)
+ifeq ($(BR2_PACKAGE_LUA)$(BR2_PACKAGE_LUA_5_1),y)
+DOVECOT_CONF_OPTS += --with-lua=yes
+DOVECOT_DEPENDENCIES += lua
+else
+DOVECOT_CONF_OPTS += --without-lua
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 DOVECOT_CONF_OPTS += --with-ldap=yes
 DOVECOT_DEPENDENCIES += openldap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
