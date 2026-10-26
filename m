Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B468606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U23Lt+w2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1FA60728;
	Mon, 26 Oct 2026 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czrpKAWtJG8D; Mon, 26 Oct 2026 10:35:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C4E560702
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793010914;
	b=Rl3Yzq1zQWi45BzUbicWxwnCmm/ie9dOm7Yp5CSXu+99wLnLroBcgXbiU5wf17ARCZcP
	 RVt6f/qcxY1e62+Yq2sg5qKUg5yTOMF/IfOlg/+XQNFcpG0FcOL+z8OuPuOhc1hpGDEnN
	 Xqg6I6jUqbrT7jsBJVS+Thgrv3PvU6Ip9vq+xBjEZHJ++RTB6fx+gQ7TiE6zZxCZs7qiB
	 LPt3JqQYK6eiHlTDoHtyDbma5OwcSXCOS5I0WAWL1OYN5por/Cvusik+x6hwzSawdve7g
	 nx6G8GkSVc/0mjLSrqsQn6uoYfTcReGmTWl9WroEKBegjLW9mO6rxRJTHL59eVhIlyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793010914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=WfTySlXDa2tmW2WMFnK6NrL2zP6op3NKp6ZYtqezp/o=;
	b=Ad6svgiyyWgh0T76G7bMqOQ2rWfDA39gbo8OIPkxLit95mR+Q6KoktOO4A0dOa6IO3rJ
	 1I1kdHx8AotGMEM9C0829v8tZbe8f8ij+hv+CBgsGuY+qHX1L3oSs5zfdkhcnQkQC/DMY
	 HxA2IsZOTs54LeB3Dc8HtF3pAaZjgSxJTZhjTLp3+v+Vj4ANbWIdzr8eSZUIoW6QBXvvc
	 W6/3W/Bbzw4jSjRpizYa7kVbIBi8kD7eHIv0KabycJwP+q+ge7zBOZ+W3BUn/87sH55Nn
	 1VC/2aTgBl+iwi4dnnQgUsE/kHXkASA6TcmiuxykfwSTZFcVQKuK6gzb1QghSi3uy5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793010914;
	bh=WfTySlXDa2tmW2WMFnK6NrL2zP6op3NKp6ZYtqezp/o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U23Lt+w2a6wB2RVzXIRUksnkL0c/QWwhK0od02HNS9SBDWBBpdUjIzNN0CYCQvNrL
	 oHv9OqGYNoCORigOg299Qpcj4TZAQ3JKf3JCJOOZv9YSs/XQZ3yol6EQFx61ohFIvh
	 qkL8R7s6Q0m+6dVZT4AzkuoNO+n7i5dRnPQAhBAwpWUZmunaXO3PpMfvjn90ODdiFv
	 pFhB0Vj66J/RMWMacEspJdFdmuYECNoUGc152/K1pyoc073O3ZQxU63HOUXjhIwvVs
	 5EKMytNulpCNGklACqUHtjUcZ3kGDyumyArlImDkWUgU6ejtsQxZATsALrH9LhdnYd
	 /2wXUfHBXsGRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C4E560702;
	Mon, 26 Oct 2026 10:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 388F3356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A49B80E26
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvSXfg1Yl2SR for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:35:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80F6B80E11
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793010910;
 b=jAUdATSOLrtcdip5dSbUXkJxGN9pMD7WPb8zrnVL0us1Q/eqx3NFJxYrYmup3RjW7Lb2
 eQPdyyN5B88pSjFa/UP5SLBVCzs6swIOSOfnLWyweDVJWUBSc7vDA0RZlhRuLY4OASkyo
 Il1UqHjVoa8PHxAtINseD8MJz1DYn59bY3F/WhI/xxWXqHkV81ZgnQtNNUJGJxv/aInby
 FLhGWV1YnlnC7tgOzYnq8DpRIKJll3B5izeHrU0kUBOhO00rt2hobrN8dyDzZ0qRk1Smd
 52G+wRrs8sC8fE4rYuZQQj/CjPLA+NYyTD8TrrJmZO1Bw9f0qe4TdEgwW7SdaGO45Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793010910;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eumlK1cbswjNJ4/tPXcM2C8VwPvkOKqLjauHrz6PG1k=;
 b=c3NVLz8y7X5CV+Fg7t+WxIIgA+hRf13DyjmHa0XmgzB7AlLk7jdSsr71HZ5QX/OpXGhi
 SKSuoxQIw0VEZZQ8i76G2Cq9k+dOt0E9OaTbNpn+M0/98bcw3oxiPRiQPIOgakJoZQ49t
 KsXq5vwgeFRs1STwQHeUP3uPWQKnmHSUDuFG9/DSwZsjo+bN1l2Rsx3ZjsbmtslkMmQtF
 cpLrrFg03Sd5PdDlZOI7gd4jEikITnYe0pwJ9PvCsblpBfyzA+vwBNZ2akNvtyYrz+YU/
 l6CPNsOpGgkJ3944+JLgGn2KABSSjbQmZ2rkIpKivAvxjW8gkRye+iXD5A4sTZoepCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80F6B80E11
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E8EC9CF7F; Mon, 26 Oct 2026 10:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 11:33:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e7918d01b022fbe47c369643dedbf703f2f30ee
X-Git-Newrev: 40a0fd471abd134f73db3749a885e4abd84e0308
X-Patchwork-Hint: ignore
Message-Id: <20261026103342.8E8EC9CF7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lyaml: bump to version 6.2.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40a0fd471abd134f73db3749a885e4abd84e0308
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

for changelog, see:
https://github.com/gvvaughan/lyaml/releases

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-lyaml/Config.in      | 2 +-
 package/lua-lyaml/lua-lyaml.hash | 2 +-
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/Config.in b/package/lua-lyaml/Config.in
index ef2d3823d1..c13c0118e3 100644
--- a/package/lua-lyaml/Config.in
+++ b/package/lua-lyaml/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUA_LYAML
 	  converting between `%YAML 1.1` and Lua tables, with a
 	  flexible Lua language API to load and save YAML documents.
 
-	  http://github.com/gvvaughan/lyaml
+	  https://github.com/gvvaughan/lyaml
diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index 49c98d9805..d36191e1e8 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  515e81d21903c1e428b017f2fe9dffa4e29ae9881b0d49ddbe6ba625e3164fe3  lua-lyaml-6.2.9.tar.gz
+sha256  ff2ae6c2c25941e44cd5bfd0fdc837f70c077571539e27fdf61443c5e6654de7  lua-lyaml-6.2.10.tar.gz
 sha256  30847a6989db6d5aeee177099fbaa1aaba793a0e5359ab0dafe1582eefb5a028  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index 965060dd62..e591c1cc98 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.9
+LUA_LYAML_VERSION = 6.2.10
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
