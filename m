Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65D606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L3stJ3ag;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=t6WA5KPh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB7D60645;
	Sun, 25 Oct 2026 22:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYWY1vlLwe7B; Sun, 25 Oct 2026 22:12:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B936460680
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966350;
	b=N6SeTXWNbblI+8HJmS6p0WCdIQ0N7+wYoSyRQ7D9l/8oUfGlHXx8653sgAOjvlxTDJBx
	 QfOuP+JHduwV2MRtNIK0jYMlAL7q4EuHnP1svtbcPjwby4zH3BuloTxtQtQmJlI8g6kF4
	 lzkFHohHd+KPiqJjy5yRbAsaRGUwaV1Ok2TTB3YClLcoZ6kc1leRYj+63VJkP/Nbffr3Z
	 79j80l7+u4bIcvQ8mr7Ravu23Hw+cPZQCzyQm8hYXB7T0OfwwSDjF744Qzg8fYhqlIM12
	 3hyKyKBHz/P9bddmF9QgDU+n1lgbx1Zntpcfus+oh/MnKmZTO2iagV5Wakn+gyf6hAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jlF/1KAGf6nPUrEZ6LbkS2gL2LPtOtztWrpCh8i5ZA8=;
	b=PFSfjGt91Js6Cy62bVFZkUzKEel2i0TWiTM++gnQTcMBIBO7O4uTmloji9k6ddME2+2F
	 w/BMqpcO7vZTstjGGDzQtDvEQK+TBxjuuq07DoUPrRccoQw4BaZ5ONCwzrYlgNPNW6S/7
	 4YEiMDHFjU48xgZAX84u/8zdg9gx5KOsneDSbZiJUvn/UgI/duRqnPIykvOci1If3bhbv
	 M48J060dHH25l8CKqvOXcxy1WSTFS9bmsxtmNdiMpsBC6biLlxzFBf5j6dQJDM2548SgM
	 dXrv91vfliBJts0qJd4Ls6Zc9Myyckh0zAI1WI/fH8Zz6X6uZ31cQ7lgCpkyJoPIvnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966350;
	bh=jlF/1KAGf6nPUrEZ6LbkS2gL2LPtOtztWrpCh8i5ZA8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3stJ3agZ7sB4/ovvwmwE075YxH97CixGOBnzkcjGDSxuuKs8LpYyWLc8OYuboqNi
	 9GRJq7ee5xkzTNj/m8X9nc3yxKAUOTP0Jn2LkCchSGMZfLCHWoccaK+Kgtt5mNXS9Q
	 s6DJGaf3GzH2GPbKIj+UJMbGEleUscj/Aa7lZd9pcY2HyQGFY0ROt6obiDipMxtAlZ
	 UzZ/D6TJslt899Ey9EiMMaZIN4CSmG8C9RbuOpJkcPekcRbEwuvAD32g7CnsXc6AlP
	 Y13gUeNwOy5fVNEM6Oa/Aq7fvf9AsRx97SQL2N69Rp7f0FfAgOsfSlIYK2f24KPCEh
	 bTaegZO9VhXUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B936460680;
	Sun, 25 Oct 2026 22:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4778B334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3923440497
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTc5EU7skfK1 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:12:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 49A2140450
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966348;
 b=FnMqC1/UpOC4jwat3i/uTqJfCHkRxNw5LT/MLL/KwGGYzBgg/xgM6Ay+oKxTm8aY6VhV
 mIOFm0ZqpwuNSZNogH488IUlLWCBxlFz5Ew7zNp27WcJ+fISw5aectE4pCpjrLB0Itf55
 2Do15hiDE+IwrM4SXiOTg3VPf1RW0vhl5qobDGQ0P/xRjQ8lZJNl+McoQi+86bx+fCJce
 wwuZWIuq6367yqkqWlWh2uK2AeaYBfYz3hM26k+cMQAq+jeIkKhVzPzUMYNdwc1HhI7+5
 ZleEsjzfrxmuErmo1n6u3Jd1jzMfGaNnVISgLAmE/e13XbTAHuflbVxSdk2qDqPGOvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966348;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=MhjGuXZPXSmz6nc++SPkEqYBiGe/hjuKnQgKDl9apcs=;
 b=YQZdR9T3J8IjrxOpT57fzq2M6pf8Iic51dPvhmJMBHe1qO7G8eXpmSiV2j1IqKEFv7AX
 qpbcUk4cVXk9Gt3funhJAVyJ6Zm+JUNixvslUvz0ehEM0+ZMZO4iSoCDd21U7oZZdGPKF
 TclnRyYTJH/62sV0MiJ7LRB37ykSlGZnFhgk0kXDMVyAieDdYZcKUW9H0U32HYk/6Ze9e
 Mu3uzijUbj4ghyfOVcUO4HCGWVkbbw1ueIQSgokd3Woom5XH5EL9IvPpWgVrQ0IRp3TQY
 86c70xUq1pCkj5zer1tNzM9V5OTzHCpjxMlg0AGIWLJ5AwNgzP++ZbxzE2d+qYydqNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t6WA5KPh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=t6WA5KPh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49A2140450
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966086;
 bh=MhjGuXZPXSmz6nc++SPkEqYBiGe/hjuKnQgKDl9apcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=t6WA5KPhfu+r2WQe25XHR7yWa/Hey2FxW72PhMtjs2H9eSJPVcV43mgR/7R11STLB
 N/moP0884WBmZ36RuoqJe9rnbUgyEPmnzYmd5xYcutHbVhtoo8E1myJ9C/xG1RWCQk
 ipYKu7/09fmCTV1EsO9yWOOft9c4xau1sGDHfew3bD8rvDMwlYhDP2mjCqmkMU/Pfi
 slE8gRTrhWabBpm+CRkWOa3yBlR14ZC01Kk0ffEJ8+OpelzGjP5cXLW/g5PHfGVSdH
 HriLzK/cEolD8e0TNvyYxn03YxdTEaq/chEcRh8TDxCoqeESWPzwxUxvb665pUusLH
 +PQSN1VBv4fcA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 bl3NYpwWq7ZshMCIJ/1+Td2u0ssxO8ANJ/Veioig0nFQSxSsBE656no+UYwIT2nJwcv8fCJQexy
 6uWiV/2PBdlaHU+L7EG3X90fqn3bSymgprkP0hiT4dR8ARA0qNnmjHR4uUHK4bF+KYSgtvjEWzR
 ThsNsw6mXNF/Zr7PjRJH1gKlJu+2Q2kF3BZkPgtI2KvQVMH1T24APr24ZLbNZoKs2cZR6g2FcW0
 KJRVDhcXtaxE2Q7QpmRAdX3zYoD/KqMbPGmLjXLyEb5K7S7FOyvyh0+WwnO2k4UPB6O35/DeBAE
 KWLsjSX1wuaqzIC1MUiMus7fpD3MFtB+GCBwg4t7jny/7kH84cY9pu8TSK8QIZ2H/VEUdUw+VB1
 LYrb5AhwwRrsmMjK6Nb4nKSfS+DQGh9Y9DQM9d+xcjBSIdk2TV6iweqG5JbSywDfgXsFVixNgE4
 1cbyLM3bcUJQSunj8AUEknw5V1rgMXTbQOZ2O2p3jDlJgQ8Za5igO5Wepcda4M+vb1DJ0C29/Rv
 xagxvxzPZSKunpefg7j/9IeWOfCes7sJB8h3tQdkNy1xcZ7QIFwNbWdAZZHp8j4VEjeAQtii2z5
 XDEsEeqQq++Dei5dDb4KllDknn0vsw==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03020A4C6AA4;
 Sun, 25 Oct 2026 23:08:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-2E1g;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>,
 Stefan Agner <stefan.agner@openhomefoundation.org>
Date: Sun, 25 Oct 2026 23:07:13 +0100
Message-ID: <20261025220723.1332924-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 24/34] package/docker-engine: bump version to
 v29.6.2
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Agner <stefan@agner.ch>

Release notes:
* https://docs.docker.com/engine/release-notes/29/#2962

Signed-off-by: Stefan Agner <stefan.agner@openhomefoundation.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 34ad9755c5..b1ac5cd5de 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  460e3c95fbf86414e88e7cb58551df061c206592bc66680fec75c5cdd551e3bd  docker-engine-29.5.3-go2.tar.gz
+sha256  8b64afb7562347d2ce9f1027e326ce9a45c8f41a486106ce2034f7eb1abe0e0f  docker-engine-29.6.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 50210fa99c..fa78a96abc 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 29.5.3
+DOCKER_ENGINE_VERSION = 29.6.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,docker-v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
