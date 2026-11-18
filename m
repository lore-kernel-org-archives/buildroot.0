Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D70606A325
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nNFwunlE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 308146064A;
	Wed, 18 Nov 2026 20:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwo8Fj2a_1wW; Wed, 18 Nov 2026 20:44:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B9ABA606F6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795034666;
	b=d1hkl0dFZLnhUOAtuy2LBqvM84vpanEUWT+XUh9qPtAW3rvBe0FbpqqtEP8ueZeiU2hY
	 7tiBAemGM2megN4XibEEL9PN7tLtXC3YVKg5l0SzL8srQyf5s8Rt/2YTh54ZlqH7ZDjRW
	 KIUbc1H0szuO9vxsyDMh2inCUu3YxYBw+lhtitNh0aUXLm1hrq23ZbumWS48B9e4AfZKw
	 4yvihEecNvLHZNMLCPD5jJsuzlnjynaPyIWdrhSHAlbDlzm33ox6XEa/Sp2tztsOMvO+U
	 po+6WIPTFOPM2rdCu5Ut7roHC0RfsNIyZ8dRFV+IGJsKB5ozD3IvcVyok0FdFFfmkZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795034666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cjecVc0qCVJ8SkcEgmjA9CernvZ3be5PLwpZHGctzwY=;
	b=tObsMpU5YMu4Z4z4xut10b2RnTghvYw28PT7uE47WZi2MRjgv1YYClT8nvSeUdVM+vXu
	 9c3stEfqcU/rVKb7Mb1lisnF6V49o8ybAqS0yBabWPq7NJYw2gjcfbmvkVbEG+cfxEefk
	 vdvFgjAx88GneS96HoDDR7yEE43BFe3SOegx+5bZJvHHIlAgVFvMOWvM2ysxSB3VNFh7c
	 5yIIekELHHqkzEo89xFSM64M5lEE4hmz/3+OhQEw6bCe+82/EF5I/G5EJthf7TaGoWwql
	 16mGlD27La1ulBGlzvevuNEn8Kx2rKt0pZfRL5iyTNjfGXV2nm5OHZoOgWz8LhP+z7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795034666;
	bh=cjecVc0qCVJ8SkcEgmjA9CernvZ3be5PLwpZHGctzwY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nNFwunlEBz0mBmx5DjkJ+DixYYWPd+LuBFx7AwDTgIFmgUT4UWdjPhhD6KyfXFqxJ
	 vQ5qZNTDiwKphSQJx4QSXwQ+zd5JQsQb8R6XDLAOSkemMg8zWiLEYu+PNNVrnosFOI
	 KoOqzkrn0sWDF9E/hzmpKhmpF1OKoMrzNfOTAgJsBYg9ngwxczjZKneo7myMHBbSxP
	 eNlwBhT+AB3+LQmA1lZebkjkt3yRtuw8t0jfk9gJSqmO+CgeEQ5jy4nBYIZpeE6+di
	 heOdkg7ChWgPlzR33OhnxzpudAaB81ojq+wE5eQNN85ZaoyP3rxZ1rHDbwyY7aYS42
	 h6k0K5jXOODiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9ABA606F6;
	Wed, 18 Nov 2026 20:44:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A68661
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C1044050D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21hBJ-6wmelX for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 20:44:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AB34240505
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB34240505
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:44:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso11785995e9.0
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 12:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795034661; x=1795639461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=/CsnlOYbazb1fO/jb8aj016jiVtB5uAXmueV2z9XiU0=;
 b=QX8i0Z8gHah5zVXCUS9JtCCK/cQImdBnS2lsWviOBpSxRQqhVaMviNuYtn7RYQqb+k
 lDgPdyc3uv/tW78/lEm4pbeIyHHfh612SWUnLNP868w7iKbPEedXJ+XKGHRyGqZ5wfep
 jyr9rlF38T9hJY1QqKfUKnR7zp5H6axnHkMwadts7gfSWu/dQwvFdhADjreWa7QHqz7n
 JbgHgn8X2tka4rT1rxv3Ww38qJBoiLPbUPTrswaB/QmxxjeUgANhX7bxTgA39xuE5I2T
 uUvIOHgNhTy9Kku6PnFJmo7KYsAIzHZW3bLXNLCjJteCOMJURWKotN/mxgGqfqUyJIqt
 gVXw==
X-Gm-Message-State: APuU4Z884DZV58TktidQ/0+6WvtzDSAwNNWERfmPUpZHmTW+1o8pRyS/
 eJ5mo8UtCDZBlUC2j1x4D7UF3Tbp7YPSJqZzfZd/TZYvH3iD+wRDNAZCl4DCa0nkq/R+SYj0oBX
 dqWIb
X-Gm-Gg: AYBFou2JCNGYc2kGBmnPvP/p4jmFG1MiPEQf/iVaAYa4V60rHiJlNPjahWTNYLMZNQH
 4IucuoONm0MAve4PrzVY5KHcsCcqr1H8RJzsDY1z44utYZULr42nUeHoV9IsBUkxI4zc0IDmAgH
 DS6Ilwi6DzB7+pihQUfJDV1Qhqill4USS0yPJXmQNaAcFq6BT3FG0i2Fzv9G+ggHJme7zQqCgn+
 V7cZfud1DzavNT6NpFARm9WcNIp7Fip5nM6DaHzqN7Sd+gbpU6FQgcy1jyU4SwIjliVpjhtRniV
 fOoQfstla1AYyCZu2a77TE0bsQPvHO1KnevGFCwLYJ95ovaVnPvTwfO0HiVe0+/iFq+ZoJH5qyW
 qQVJ0DIKXv3agCKlIQydkkU2Is+fcUGV+zyh1R/HjDm3vMZ0OsJjGPZmkHL6QVFyVfZlrL/C3li
 6JDrz16VMtm4r+jhn9LsygBdytNBb1NyWpURMOYVQi+Cujcy64x5H7Y/bhBgOHSAGHxyeA5hoFp
 rZ09bhZtOKjAfikH4Ql1RC5pgzn4+j4rZ0Bdtz/IT2EXb+3aMOSn1g/9FEmsRya6ePFpwqlvLLc
 XU8gJvMNsxAIZme5yteH4A==
X-Received: by 2002:a05:600c:a41:b0:4a1:fbd2:f689 with SMTP id
 5b1f17b1804b1-4bb7da13ad8mr76799835e9.7.1795034660849; 
 Wed, 18 Nov 2026 12:44:20 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7df07ff6sm56847135e9.4.2026.11.18.12.44.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 12:44:20 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 21:44:20 +0100
Message-ID: <20261118204420.332438-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nginx: security bump to v1.30.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For more information about the release, see:
 - https://nginx.org/en/CHANGES-1.30
 - https://lwn.net/Articles/1108362/

This fixes the following vulnerabilities:

- CVE-2026-125283: a buffer overflow might occur in a worker process
  when using the "try_files" and "alias" directives in certain
  configurations.
  https://www.cve.org/CVERecord?id=CVE-2026-125283

- CVE-2026-123007: a flow control window overflow in HTTP/2 might allow
  an attacker to cause a segmentation fault in a worker process, or
  might have potential other impact.
  https://www.cve.org/CVERecord?id=CVE-2026-123007

- CVE-2026-123633: use-after-free might occur in a worker process when
  using HTTP/2 if worker_connections were not enough.
  https://www.cve.org/CVERecord?id=CVE-2026-123633

- CVE-2026-121810: use-after-free might occur in a worker process when
  using HTTP/3 if worker_connections were not enough.
  https://www.cve.org/CVERecord?id=CVE-2026-121810

- CVE-2026-123634: use-after-free condition might occur if the
  "resolver" directive was used and the same name was simultaneously
  resolved in subrequests, allowing an attacker who is able to trigger
  name resolution to cause segmentation fault in a worker process, or
  might have potential other impact.
  https://www.cve.org/CVERecord?id=CVE-2026-123634

- CVE-2026-113425: use-after-free might occur in a worker process in the
  mail proxy server.
  https://www.cve.org/CVERecord?id=CVE-2026-113425

- CVE-2026-120967: in the stream module, an attacker who is able to
  complete the SSL handshake synchronously might cause client SSL
  certificates to be verified using the configuration of the default
  server rather than the virtual server selected by SNI.
  https://www.cve.org/CVERecord?id=CVE-2026-120967

- CVE-2026-123640: the ngx_stream_ssl_preread_module might interpret
  malformed ClientHello messages differently than other TLS
  implementations, which might result in bypassing security restrictions
  https://www.cve.org/CVERecord?id=CVE-2026-123640

- CVE-2026-118899: worker processes might get caught in an endless loop
  while reading the request body over SSL.
  https://www.cve.org/CVERecord?id=CVE-2026-118899

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 646b51997e..63aeb66766 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8  nginx-1.30.6.tar.gz
+sha256  2565b5c837050e958f70fb0f73c48e2bca4542ad349fd356f46fb0c72610bc6e  nginx-1.30.7.tar.gz
 # License files, locally calculated
 sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index c330e81ebf..187fb17eb5 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.30.6
+NGINX_VERSION = 1.30.7
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
