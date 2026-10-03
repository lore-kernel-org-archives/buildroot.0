Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E978241132;
	Sat,  3 Oct 2026 07:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxwXO9UxlZSV; Sat,  3 Oct 2026 07:22:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C972A41137
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012137;
	b=FPZJg0ALZLYGYk0wtehiWzAQ6HIXZ9s8SKyqaAFF0XRetGWAV3X2GLWB/ELXHAOUClhG
	 4mBZForAHi4ZzzR9XQ7eTrFo53hSbcUHGC6warAaYhMvwEndSwg8+i+FoyQqkM2btNSAC
	 kqv3ojJzqoXlcvhJo7TJeW0OyHKItyXMIh/0dLyyan+jSQf9IUo7gXOIJctf3lrajRt3v
	 OEzRjSTRIy4qPnfjNJhU9dK3rLxRsqGr7sWG4FTzKhVyHR8NcHDe8mq9CqshuKFWqYRbJ
	 OieNOxF2ultP5DfZUi3NJpmzQOn5vWmwRkCU9MBogDHHBwRCaQDN0WRfYgunb1LHpVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cdu7cjumGkO+SC7CD48K3feQnSA/EN3VRhHowEX9gdQ=;
	b=WehJHHRxIVFsA5W0LZm9O9IjrGSQYzzwdRg3BfntYwdJTbjGol/q235+GP8fKSVz96E2
	 EXpEeHLfyLrnIs5a0MGfELUtvA+Bv4sRoz8XDu4O3kjnj7l2RNCflOC2CZivRLvUshNsl
	 xGi/pdv0p3/MRv+fxGutWdi2mu3VyEG+f5RWfAnEY8QDT7wOoDm4qyHDYfSn8PCc9Z59p
	 duFFNTbxDuw/YLCtqiKBFAnAbyOQhc+o3PVHDrpGXN1WEJ0170utBGIAtFrSkTJBjnNLI
	 ZOp6LDxWbvDDqMPMF1oRcWvR7fZ8D0l85WW+6tAFRSKoGOHo7ho/WrpmkfMKFwTDIfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012137;
	bh=cdu7cjumGkO+SC7CD48K3feQnSA/EN3VRhHowEX9gdQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M7YVVE/1Dg0OOw3srirElWnB0O7c9BDgMNmpx+McZ4UGiowMEVw0ft3mmxUOFLB2K
	 UE3KB/wA3Nj1HgIRMwF3WJBcfq3C2pYweijZMXnQdsqzuFc7qnJgI3BrsFUMWQUadv
	 JNOGveMhLDDLQEwruxs0ceTGW1Oty34sX5G8k6zzdRUqZ/ZV5m8D7adKgAhcZUzUct
	 sbKWazs2fIGmHmzA7odITBLjlgAo+5GB5MDlK79eu4+WU25wqeK242xI6jAmZv63ql
	 okViCVxOmqCt4lMQ7bdQR63jkxi4ttm95ebg67ZegsxY9A9DDOmT6mZ+9Yhq9s5N2a
	 eZdzoNmN08azg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C972A41137;
	Sat,  3 Oct 2026 07:22:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 447FF179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41BA860DBC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqj8rR1SKBs8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4407760DBB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012135;
 b=ksnJz+hVie6G9OvnoLzstff+wvJOY3NZbCl2bF5Ovmk4v+rF0r2iYUFLtrEl4hz41hRL
 /04MZ5vv+kmTzOYJWoqc8ffvGjgf0UVzI5DDX2/EKLD3dnOBfTbWvEgbZwL0OCncFtkf7
 LS55Q40Z3GWrFyVZFTghq/uu4+NXDbey/80Zpwql+LgIMLPzSmoYhcp/nJU2/+tZ/YsB3
 DOMTgo6it1lKjq1iJzgj8nP7r4Xt8eBrYsiBCjCj8egpl7kxPMmrAfQ0ExSVBySCdiWW6
 oN+P/tJJxYO16DkJRe0Upyq+FELjNG2CLCCV0JHRMCi95BkyIy5KQZMboMD1dszsmsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012135;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=93K23Ho5XTc/ee06vXbzYk8ZRJAjqWPyFNwHrIvYB7M=;
 b=Ij4Z8w/1dtBHm1OZT/PVwqbRgrOn+BJjVTMdCx5gRECpO1cXlQDaoRnJ/3uYSJN+lMBn
 3Aw1aIInvX9OPleiySaWPRcNJaup436twWaQaC5qfjbHqm6LYHfkVaDJO8bo88PNReTB8
 Bw/KGUHxshF3MWkmQ8LLLpDqeRSPUg01XFUAm0no00wnxZSipbmtFwsCQrODbSaUvMQ5+
 9JF2DI5dfdCINW5zwN7MIJaS68EE27U1dlIJxjUF+0wDCUTeJdi2+pbE1Mu/F+rHi8FKB
 Ho2iRzD7/VoPA+zPmVsy0c/CCC2kk+yaYroK1h4g8Y7BTBRlAfVL7ZnwVdBet0gAdiw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PuUT9w1i; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PuUT9w1i
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4407760DBB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010941;
 bh=93K23Ho5XTc/ee06vXbzYk8ZRJAjqWPyFNwHrIvYB7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PuUT9w1iYjF81o0zmqftk9Y699nNf44sfgIS5kRc4nPtG6Z52B7B/+5I8/0nwsC0i
 cAxjhJXfTaF/h2DOOdb3cRX4I3Qo6oobBB4nfiaub9L/kutQz/Oe5+nJXRtfQzsxG0
 k6WC1XcdEttl6fYfgnOiFWRpdILy0EhqRn7DT0zpq9/X5DsTdQRyv5yXZmWv4fQlfO
 nujVGk+a1LBCEnOl/wQPVts5i3UQWqSJwIPv4ratyVcUMXJUsmdjXHvMVcEGvRkQwQ
 PSHUURrJC/3l82WqK8nokjzMbYz/Mc+d05HH273ROQx3iMlnHRWC8Rzdh7pyTvj22q
 0wYvyv6AjuvmQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 NcVELdyZZPspM9gUCBESVlRDj9KQhPGfKCFKQdRLzj3NQszbSmwdFdiuX49a+0SHVcxSwQ+iPUA
 B9ApLpSngDDw4Go104/l8FTsIz4yiKlyznXC4HkLx/XsnhF2DG880e76+x9oxUSxmWmKfF2lQ8q
 GXX8pqnkAFduIpJ4rd40d9RTguvJcpt9K9kdtMkvWCWgMlSlvmVtYxd5g6JdF+STIxis+IfuDvN
 9JotCuT2ckz6PBlwyUrytCAUJVTay4IRQC4CvAeOj9QtroMyuzJqV82jzqqmxPonknyJH/jVhLB
 NZHyDA67zP8EC7oMLKcWh7ijY0QMYZwQK85AqMk6XbWVvejxI4uBHQIDvWDLXfdo5o2+Qea3Iqz
 1O33tNUiDC3X5G/qJBGrnbA+sf3aKWyqGvH9KkUz6JDKeawVVaBuqVrlmLrlmcfnBejs1lS2y3z
 U706L2zt1tS+KxXtbJCepNfLarAxNXRDZ1NVfaRJ3q8KFGEDr031fej488wSmQ+3Xm3oUiUQN/P
 Gt5Luh9bTqhpl0kEO77zsycqJfb6Ok4ybL7P/Gzc6ipISInqFom11U63s9WAJtglEfvSt4HCSpH
 h+hrJjwwjHjIM2RRQn7W/PkYU8HLLXCM8gRid3i7yVZnmyKk90zvq5UaWIvGPqZ3
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19B4AA4C5519;
 Sat,  3 Oct 2026 09:02:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-09Uq;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:10 +0200
Message-ID: <20261003070128.1295458-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 038/114] package/python-lmdb: bump version to
 2.3.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index ad111605bc..62ffc2e446 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  f6f491b825302966f63b3fdee2ef80fd  lmdb-2.2.0.tar.gz
-sha256  53020e20305c043ea6e68089bc242d744fba6073cdb268332299ba6dda2886d4  lmdb-2.2.0.tar.gz
+md5  0fb37c0c840141773ac8b4b0e9679fd9  lmdb-2.3.0.tar.gz
+sha256  260f443640ee2da3cfd059a84258659319ff39ca912c16bf9748c324076b9d09  lmdb-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index ba3d257fdd..b5a0db5dd6 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 2.2.0
+PYTHON_LMDB_VERSION = 2.3.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/21/44/d94934efaf8f887b6959f131fde740fcaa831edfd13eb5425574637cddd5
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/aa/0b/17f271b2d2d314da9c9bc7620676ede1feca5f565f3a46045319351f7bc2
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
