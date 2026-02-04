Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB9BE83F05
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C09960F4D;
	Wed,  4 Feb 2026 17:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UloHFNV4KNEa; Wed,  4 Feb 2026 17:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1405610B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770227099;
	bh=xMNykwjsnPCkhhD08DgszdQr4fjDN+YW4sSfNkNzibo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YaMQ/yBx1aCKy5jxysyXg8vTFdaU2r45OeQG42Oe6POjzDTYqf+czurmnxH83mYrB
	 3WYl2NQRqKNPkfdk0gvoDCwMQT2xA2H1biskRKuTemtUUUMGoXLdiGuXT7XwOVfLL7
	 U7J+ijfXtB6e10bWxgV755TvEcEIF4z2DqFUn6kMhiKu1KEUVOzYatt0asGu+yVJx6
	 kg9iUK+LxWQZqL0NH8jLlirFWtjh0IZvBa9JKgAGDnzVrW6zE/AQZc5uabukvYMzQ7
	 ls0g2OPopKX3FvlEcbBpWd1vT2IoVlEAWpQwTr4RCWzs6MtFBgPfUfLJyJ8sWlQU3s
	 RXE3sLp1+A9bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1405610B2;
	Wed,  4 Feb 2026 17:44:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A65E173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 039C66079A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZTUujY5HD9u for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223A960D62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 223A960D62
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F02386993; Wed,  4 Feb 2026 17:42:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 18:40:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70043d9e9a0ecb97d46be9527f73b3157da799f7
X-Git-Newrev: 96e6d7092c25506e40061b5bc3a2cc2731953b99
X-Patchwork-Hint: ignore
Message-Id: <20260204174209.4F02386993@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: enable clang python
 bindings
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1635687018728694332=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1635687018728694332==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96e6d7092c25506e40061b5bc3a2cc2731953b99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

It should be noted that because the python bindings have wrong default
include dirs, they are useless if the includes are not provided
externally.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/clang/clang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 2f17a04efc..3e41cb3b13 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -109,6 +109,10 @@ CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 HOST_CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 
+# host-python3 is a permanent dependency of clang, so we can build the
+# python bindings unconditionally:
+HOST_CLANG_CONF_OPTS += -DCLANG_PYTHON_BINDINGS_VERSIONS=$(PYTHON3_VERSION_MAJOR)
+
 # Help host-clang to find our external toolchain, use a relative path from the clang
 # installation directory to the external toolchain installation directory in order to
 # not hardcode the toolchain absolute path.

--===============1635687018728694332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1635687018728694332==--
