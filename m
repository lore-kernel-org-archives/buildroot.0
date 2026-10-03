Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFACCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0720860E1F;
	Sat,  3 Oct 2026 08:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xS9ey4bzF4el; Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2172960E32
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017149;
	b=reKuK5NsudpGN7Ldkib3qYjw2EsY3SPRa32QsAFG9Myp16UZo++hiNyuVMGShwEoB6C9
	 t4RUskNve+zKYkz+D6xFzZFoMsqYFfYeZNuUwAvtVbzL00odynls1KyKE5YjiipMEy933
	 a9rcCjSGiqLreFcD20MUMiwSDzGq4D7sQQvRcug8++GkdC4ATZ4upmoi4ViftXKgAiV34
	 qTO15sNgNQ3v3tecYYVGQAFuBqrtJngYVr4HHzDZgh4fdqJTP+PcnDCuR1qB+GuuaYOR9
	 jbVcrvIcXpJZT4Ha8+mj4Fqf7GK8SE9fDBFhqqGIpgO86EB+eKXsFkEoSyzwSC4dTfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UFYzHlKhrXR+OomivloBhHA+Q/KYVfQ7xRyhHTYylQk=;
	b=nLVxC+ALXKe2yE+ZL1/jjJBz29tEKLuuS5OaiyT1U7FcUzl/4q0G7nCutfzZEYgYqg6P
	 4L1Nf4COtXuXH3EnV0flHT4LVJQUiGnkB+Wdk5cbzikdeGHu+4eRgrqpSm5JacM80V9Au
	 cA7YFEYudjOpTy9iZCwe/nuqGJOWMTEoZp72vTiQDoOT55TZ6trFSwO5D9rAVk6VveXE0
	 yABvZv38ZRkX7CaIQEeXXcevWS5W6yMH452OBBDE3W4TWpmQoWsMHThiyvJGFJeL3Z6UD
	 YV6YkSIoqRbDvtqanVoiChMGh//dMW5VPldzQzOGljvpxrQe/o7CqaK82fRaZyybD5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017149;
	bh=UFYzHlKhrXR+OomivloBhHA+Q/KYVfQ7xRyhHTYylQk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZfFQlPPiTSvYhhhyZz6usBd2k3VsLVNdoH91D4Cs0wcASr+5UtTkQRoYTnSMBalZ1
	 7bw0SO2+ih27U8KLnG4nGZ5YWUpqvSpag3zrpleMQ7Gh1Mu4ZJNrP0kAt6kc4CNffe
	 m7rjSQ+v4kf2905nioMhBonm202oAnkjmjmx138UTdzfyvGfuvbccP3w+ACTjOZmh/
	 07LDtez2R5/8B3+mjqLtydhpng/v7DH6bSBoZ8dSZAI54nyM3ZmvnwbJZ/bG6og9Fs
	 dclaW/Qj/eYK6lDlgWEEiiFy7/ptKxjTPLYn3v+mG5eGBntejquCrQ65p47s9E8TjC
	 LnrQZr8oUKuOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2172960E32;
	Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9F1E2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6C3840FF5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvcYyXIZ7iSL for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CCBFC4104F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017147;
 b=fgpyxPW1l603XBhrxBzHGKRmHs3QzRbyunWvtKGOhbvODq2Y37d9eBLKkP5DP+hsvGIH
 r6Y/h7UsSb2er4xmiFlySMvlIZgP97BpBObBwRe2d3y3OsGVim/AstijL3pIDS6aQQU3T
 yZEbiBj7KAQsCK3pP7uA1XtPgRAnJOOJTaWwJoZl63KV+qyAiTD9B0PVvZaH3FkJvAP9c
 IKehPbEb05+UeclRcKXVi6ClvzzKvFd2712nw5mVw/t7VYxf0qPYHcUZpvtzh/O0MIDiW
 9hPnKmdzHBILE3IsYVYGPrq38RO2kXhkhJKUCLFedeBwtCFemkoFTng4qJMbh858+kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017147;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=1eA2EFI/8o9IgJuwLgNTumw0gnOpORr4MDsk2nQ6S/k=;
 b=RBads8cjAVlOZ+91YMinU200yM/tM0GhkRQm4C3oqNed7gHH3S+tFW+AfVrCiAiRTNu5
 +r8e5g7V77kGkwhyi/jZvXUFSi9IJlQkIino5SO18Jgpjw/EwLzGY1I+m38JfoWQuzTGU
 NFfJ8hwGsycJHcFKdMD+eTNKU7+tH+4fEvImOFeZbvXd2gf+YWaN3qNAFtxTRfE8xLERp
 kV5HNgxm3j/QH94Wcr8bab6hkAHBB+iAqM7FuC6S4Q4Sw7iuVp7xRWt1WvkkfjP9zEFZT
 yLbimvjPSjXjjrCS77IfaNA7AA1E86lWNWKLKHT1Rya6YK+Z4kJ9u2wO+eIKGuVxQKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MffJ2jQV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MffJ2jQV
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCBFC4104F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:46 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8238df7d78dso356453a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017146; x=1791621946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1eA2EFI/8o9IgJuwLgNTumw0gnOpORr4MDsk2nQ6S/k=;
 b=MffJ2jQV3p+zJ47+BhcMeh75Jy/d8BVux5gnOflaotMqbiJt1oDd994GW2QWgCLWtG
 N6POrsw5Qqv20a7ST6s7nvpb03K3XRojqYr0sAT71E+DfDttTBjc0pXqm4cyhXGi7fcZ
 AKZaHvE4BqrMfuIIYK3GoAGHp+cAhQ7dCKJSsndz50wVdvQd+aznERtb2a+EgK+f5ZN7
 jEvUGe4VClzOz6gdNFx6qzHTMZAAOZfsflsoW36exQzXoSDHCYHYiyuiUTgqDeSXvyCr
 kB+pYewusHkQ2fZwCA9pkz6Ty+2aGfsA44gZFKDGhPtKkxnjMifLGDVkCmHmHECSJe6T
 HVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017146; x=1791621946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1eA2EFI/8o9IgJuwLgNTumw0gnOpORr4MDsk2nQ6S/k=;
 b=l2bqjjov1Yl/GS21qHzigq46/z0zI/cgWe9awozjhcTiN4HdPhUuDcs9a1QE4xykl0
 AEP3y0B2lwvGk6sPNJBtFcb4+IrmHDI00G8TIdX/it01wWKD4IKhl3qiKZdEonYKQhom
 eKv/FX9xT+479zOihmPZVO1LF8nBURWLDdq65zuu/JREzyLus6+VaAjf2EYE4Gd8mj+F
 bYKyLQgKgh/kNipEpktnCxx8tLYAgEJPJULCMJHWkBCX8nEfGS1JuoYTjiYfImhiVGuH
 z4okIHleD1FFVR3Kdsl+kYop6kTF0S9FMibEcUt6eN6uYGnVpB1/e3M+fm/1hrXbReZT
 zSdA==
X-Gm-Message-State: AFuF++mOLjJgYg3SNWu54ziSB1lSJzpZp1rdDWNegIJXqDdUHa9HsU6I
 LqNvX/8PqzI4BrU69MmhF3RHCoPz1atDITmANRR42M0Mn2g1t4pJOHM3a+xcZg==
X-Gm-Gg: AYBFou2Y8pkk+KZdsaGQyM1NmgYzhKn6Jal/gNTxWZ9+qjPUSSpDAwX5v975dQ+X8eq
 nHT5B9tfZiVzrRIBTI/nKGmpzDO6WxiXqL32A/6dw9KouEapnlf45pu0N0BtZWgfODPFj6EelxH
 F6aojCVlMICyqluWhsMREVad9Qg2BS9b9wtqjWNTlphSD/l3Tjea9QIBgygzKhzQKiFeiwh86s5
 1wbOI/1eLXGS5bhnbYNQ6MkXuS0/pLgbIj0nmfHP3Pu/dfSTWj1dF72zQhZ5rhYCaEDbju5/8ca
 VQLpAJJ3D2AYLAcxSWBlDneEwRYLNBVe5XK14z5JHjOWiICYOtJ+RzhnSXNw624wM4afcwcCdS7
 ANZP4a26DL6pgteFVDI5lvlxcOjhl225vctepdMgaZ6ie/knZRjoE7hrN3AB77+izU9tF6IESGC
 IG2tf9ALLNtEKYkBwrjDfQgInIHNCWum68TmMdqRLRbJ1SbnlxN1a9oNtsownBMdLWXAojqe9vw
 3iS88gJpnzWr0FCmvwNJRNAzsZYNuMbhpWBSC003arxxFRExDnq/FbjV6yoF871CtF0Z3lvxcl/
 awhcBfn9uoEEzVuNzpanm/xtY/F3PRBkd7sBCHbEuZi1qwaTlE2a/dZtu8zccQ7vzl/TeOsZKcA
 xUvgZpoD/EwcR4wtYhhORyNI9O/S1e0q99qbcgwUI/e9pqTHkKKUW
X-Received: by 2002:a05:6820:7097:10b0:6dd:e380:ef6e with SMTP id
 006d021491bc7-6df35752117mr3001609eaf.76.1791017145792; 
 Sat, 03 Oct 2026 01:45:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:11 -0600
Message-ID: <20261003084453.545653-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setproctitle/python-setproctitle.hash | 4 ++--
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 3520520df8..86278f6527 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  422cd04321b1aa0f4b56d51d10ae5bb8  setproctitle-1.3.7.tar.gz
-sha256  bc2bc917691c1537d5b9bca1468437176809c7e11e5694ca79a9ca12345dcb9e  setproctitle-1.3.7.tar.gz
+md5  a8f283c8da30571cc58d235dd4474ef2  setproctitle-1.3.8.tar.gz
+sha256  cafe209d064a6efb88cb45a03e97981ff8832802b2b5d009dde0197a3b7b41c8  setproctitle-1.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  4bb8a954b08857aaecf1da3ecd722ab810d3899f2ab386052bbe27f5ff24a02a  LICENSE
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 7821eb5225..b33a76c464 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.7
+PYTHON_SETPROCTITLE_VERSION = 1.3.8
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/8d/48/49393a96a2eef1ab418b17475fb92b8fcfad83d099e678751b05472e69de
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/49/b0/6b8a516c5a9e9630bd5293db78314ac012f690305fe93beadea388626efb
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = LICENSE
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
