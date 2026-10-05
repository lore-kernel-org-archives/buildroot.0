Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA7CA5FF5
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5196075A;
	Mon,  5 Oct 2026 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYxrCNYaaFUS; Mon,  5 Oct 2026 20:41:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B0BBE60685
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791232900;
	b=CHyeOlDa67SnN8T+HelrKLx4H/7cFmwbI+aykAP18Y2Zxo0nny9Tbwnns7w5NyIKUSi3
	 3yGp9yJTCToK1olAXxABzNQqGpj6KgX1bMQFgbEiNyvPazFCtYY57ySLPyTOsBFXru1oU
	 C0FfbEDrCMHP9KgF6/iQ5a/EZgATSyxKOw/CvY4eJyRkrtvw6TkGBr8zNKWDYqzGOJOzc
	 rnamfa4b5Mq6/sq4u7QfRyuLOIlUNgl/DTlzqWq7PtzkwkMTk/8sFRkof/SWuhpt2DcZW
	 LV1mkVXoAA6D21JnUJWBHL80E8Nf77r4/EZRAMhID3pM7C6w0MKRzjPtcsYEdn80FuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791232900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aUnCZ5YivfJKcLjnwvzU+q6G6aWZfsrPOUKqbW5/2I8=;
	b=cTEIAIc+dF3oY84j+BAhGglUt44Rjp0gz+jPYDaqeoIuQybJpYKDxWw//EOV0cWbQJRp
	 YdpqXydMc7hh88PRorAQYLpFS6hG4N2fdGnkQsFT9qPJEjByHfU2Cs9OZEUER88grnXZi
	 v1VrRn2v4zgHNze5iyw4g3KVSNmKbLmswUpgYIfoEI0sogpfRw0nlz4AHZMVrWg6GMlD9
	 HherS1p92sPOi5R7pcbMY2OVw7dDuGh53KJotm0f0bIiVMF5mAX000XPyKuCoK7p79ek8
	 J9l902TiENVAxyWkR60euH2cCAFdMJBuO/f7SjILOL2FjWSOcEw3U0+rBkspgttn2ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791232900;
	bh=aUnCZ5YivfJKcLjnwvzU+q6G6aWZfsrPOUKqbW5/2I8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MTDlxfzkORLdASogqz4B1DQpb+zeJJoi0ZrjBLCARBqP++30rRy0x3RTM6c4WwOpQ
	 LfbAX+xvoWdZl9Sds3QuGNaSalXT+kd3VNMq3j9JcCMKBBS2eRzHVy3L40dSlxCfrt
	 zaO8nG3AQ5rmtuJGoU1yl1pGVQdaICNssdK5CM9ybdZQmhCEq32tMaLwb+UQewM0B7
	 jCYXMA8Wh8E6yjTnEdk/ScVJ9akkjywFdgphfdRYfcUmOfNiaa2ypKA/o8coD9MnU5
	 cjk9MwombS7U7C3pC14M7Np7uhEOai22zZJ/8NcNEwrgDhm14JU9eoFsPaYn+USNd8
	 YHQp+NZPBqssQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0BBE60685;
	Mon,  5 Oct 2026 20:41:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FEDD22B
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D9680965
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvjjG7z1yGAd for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 20:20:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 04530808C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791231603;
 b=RR9C+tL4k0g1GJEowi4duE5OyKu8NhvLWgpyJRH7AcGmiDtPXDbvRPj4QdbihLvz9ySG
 c6IWFsiXLXxctFG5VCfqJgIn2tqo/uOePDMHvFYKPuzh2WWtHSCFC3kDFxttttBn7zC0B
 259pdfWtX+WuzMqEk57sPUF3iF2/BCdkk3hBoknhWnq5IczLYHhW11bun4lxtVXXjduiI
 b+JIaw52BI+7VQc6KV6M76ns496D8kzRYW1zw9amCbrqQVTjk0G64XD+9Ad38KbyOM1DZ
 yAbdQnZQ6hzv6xfL4tevYOA75hJFrlTQNd/qTVslnTKKk22gnSA58vBvVnSG0khdtcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791231603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JDDtYzDsdKkXNXn1A0yPVfapakeECHPSF/qmeINBAqs=;
 b=Sf0E7G4JmSjegntqod+DWyxlnz78sn1o5Mxdaip2ydyWwlbFuD6c+Yukrmjr2yeWCTVQ
 afnAdcYslDMDNgiqNpMJMpOZBMHE8pcUQFuJ7jz3KtE+xJ+SEY0EGADbPg4kPV0Ds90ve
 57+tjiw/3F1/6ufd5uFckNn8qKMfOtbaPaWKVkB9qUataB5GHGMTnPG3VblfwYiRgyvwf
 412OE40BwOscEZuCftwQvqIjVgcAcydXIMufvHgit5U3w8fFMViIsDymu4tZq0aSf/JDt
 r4v5BqFnq+IxxL1UF9n+au4S19uBdvA4mZBINtNlY1ZODKjEIHHgq90qSbQlp3nc1Ew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04530808C8
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F3BD8D6FE; Mon,  5 Oct 2026 20:18:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 21:56:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 261aaa6d63c5bc717631ea0ce2917fac321ac84b
X-Git-Newrev: 96bac75585733129044f7d9153d205f5eef93a3c
X-Patchwork-Hint: ignore
Message-Id: <20261005201847.1F3BD8D6FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: remove 2to3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96bac75585733129044f7d9153d205f5eef93a3c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream release 3.13.0 first included commit
https://github.com/python/cpython/commit/ae00b810d1d3ad7f1f7e226b02ece37c986330e7
which removed the 2to3 program and the lib2to3 module.

Buildroot commit d63e207eb869063f82c867658676c2903beb08cb bumped the
package from 3.12.9 to 3.13.2 but forgot to remove its handling.

Current versions of Kodi do not need lib2to3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix typo in commit log version "3.13.9" -> "3.12.9"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy           | 6 ++++++
 package/kodi/Config.in     | 1 -
 package/python3/Config.in  | 5 -----
 package/python3/python3.mk | 6 ------
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb6257f532..9ba6ab243e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PYTHON3_2TO3
+	bool "python module 2to3 has been removed"
+	select BR2_LEGACY
+	help
+	  The python module 2to3 has been removed upstream
+
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk has been removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d64a6fee7e..16b86f3fe5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -95,7 +95,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE2
-	select BR2_PACKAGE_PYTHON3_2TO3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON3_SQLITE
 	select BR2_PACKAGE_PYTHON3_SSL
diff --git a/package/python3/Config.in b/package/python3/Config.in
index f9d3d3aaa2..c362c52ab3 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,11 +41,6 @@ menu "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
-config BR2_PACKAGE_PYTHON3_2TO3
-	bool "2to3 module"
-	help
-	  code translation from python 2 to 3
-
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 67fee2d6c2..b86453f145 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -75,12 +75,6 @@ endif
 
 PYTHON3_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
-PYTHON3_CONF_OPTS += --enable-lib2to3
-else
-PYTHON3_CONF_OPTS += --disable-lib2to3
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
