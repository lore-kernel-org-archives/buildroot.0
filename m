Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01379C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 05:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E8B440242;
	Sat,  1 Jan 2022 05:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_HZyW-YExJS; Sat,  1 Jan 2022 05:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B816401A2;
	Sat,  1 Jan 2022 05:32:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39E4C1BF5D7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EC7E401A2
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onQWpUBm9_1j for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 05:32:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC5F400C7
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 05:32:27 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id x15so22253070ilc.5
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 21:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sp8/6j4fwL8K50VA7NxvLC5vS5bCcvj4czhqb6nCd3M=;
 b=hEHqD3Wc27M95hxXk7pUBvzH/9qDhsp2d50DBVT8aRwruOZ9CaypsKw2TJKxW0MXNA
 PRl0DlHby4YOR1IdqiVzY1j2Wpp23mchxXrjNoffltROYP8I+j5KO/Czi12v3GWd0DYC
 eUNOixwNYkKXjutL52rd+i9tsoepPHkHhRI+hvjLXN0TYM7n5H4jf/hDjPdN8dCQEmlk
 EYS/hV7E8rIp1q0vX4cuCAq0gRvVETBk88X9L7O1pydodrPreZ4DZdRUm8nq/tfh1Mi8
 TnjkNu307S5dxBQiSBN2Fc08CZXPsq5U/de7r/SxDbE/ls/xVzyGfB+95BE9NOD7lnLR
 J5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sp8/6j4fwL8K50VA7NxvLC5vS5bCcvj4czhqb6nCd3M=;
 b=l2A18GmOaScLhznA9DyyvtUSd7Hgfzgd8r1zk+SyOernnT3bzursNuJ/NRHO5e+DDE
 vK5wilqCmQ5jB322A75yVtXr1JDaEJrfhxVPisPLgiVo+2SYCB8ZkXneX+cajKDe64St
 rF1NnBuHnnSbSSM4fklgD7rwyl9w1sB6zVcdY++Jzbtcki4As7NTbZHjmKl6thYaWahN
 H1SNSlW5iSws10CPvbrb/nkWaSdjpI8Xny5kdtPPqXdkKBNBNCrQMCR23rQy23tuf69T
 tyhrm9f4xbslvLsjgDYqrydkOEcR5YrEiqj33RWcrdz/CQbv3jj+yz7mxjmIAF4hqzHQ
 t9Eg==
X-Gm-Message-State: AOAM530deRM/tNR05h90pUCJSl8FYC/5Z7DNlQIBmJYAe5RK8m8vfCzE
 4SViIeepRyLQv5Eo0/0Q0MDjt7ULCxo=
X-Google-Smtp-Source: ABdhPJzMmpWRPNxZ0366VRMotMTHn4PZxyZ1hbf3tLbtPTAcupXogh4FhCHb3DjiME567cNQL6pg4g==
X-Received: by 2002:a05:6e02:1541:: with SMTP id
 j1mr18172575ilu.7.1641015146883; 
 Fri, 31 Dec 2021 21:32:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id x10sm17247299ilu.73.2021.12.31.21.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 21:32:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 22:32:21 -0700
Message-Id: <20220101053221.1995791-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: bump to
 version 2.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to full text removal:
https://github.com/aio-libs/aiohttp-session/commit/6a1c7f0efe006425b5387b089f4d39bc48765ed7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 6 +++---
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index f10827b616..3842f0c7af 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5	993ec277ece4765472d0edc0f6c0bba3  aiohttp-session-2.9.0.tar.gz
-sha256	959413468b84e30e7ca09719617cfb0000066a2e0f6c20062d043433e82aeb74  aiohttp-session-2.9.0.tar.gz
+md5  d57d463a9db13b681f7924b38aa77f64  aiohttp-session-2.10.0.tar.gz
+sha256  2af19af9f435937baacbb6420f887b21e5021bb34be146c2702c58e6ebf6b76b  aiohttp-session-2.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
+sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index fa724fdb86..a28b1ae143 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.9.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.10.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/f8/fe/53dfd35f5c7fcc7f2d0866cb29e722303e3fae7f749c1f3d4d11d361dc38
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/d6/3f/ab6288e8bbf4a9ae63ea0d3d5711bccc3a6dad1cb85a420c14fdeabc209e
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
