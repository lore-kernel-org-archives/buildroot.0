Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F0ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 295AF817FD;
	Sat,  3 Oct 2026 15:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4h369gRC7NE; Sat,  3 Oct 2026 15:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4362B817AB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043012;
	b=NujXTK/lj7Pxs+usRtdoPfxDbng1fKbCkVzYyTToi2hMtTB7UJOYvPesU5+DpraSc34N
	 I2trtatKQ0rImxjvtv1LH3C7D987P4viqpZaU42NXrqhHdTmwmY1LoGZS/Zvs0IcnA139
	 5fK7ZMqk6WbC3HysTk0Rd1X3IwCgmKE4bZXNAKdTsmd3bOQ4Y4tOmLVxexSkGG+XrnRMt
	 0BpdqUnNcXTHN9DAMYfYhAnV+EqxjKDNcL98PlrVrzT0B9VmNJvUYvnU30iXVzuJQJw1a
	 W3yDPQobnwSjhlMbc9Rx1oSGa5N7IxHRwxcD/sDcEjycWnFa1I3+wQ48wJrIEGfbuzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tfaHac8YtaDn7MeB8Guu81QJSAackIIiVSx48tfOYh4=;
	b=Nmj3yM6lROcTkMAIJ/fhC1OUoCCS+B4ZybPhq9Iym2bYCtFwgTqWtzGm+xRQ/Db1OP9w
	 UaBqGZbiP5udrPCyCUJYbmDYWc/l6lBGCk0AMz4II7QcXoNML0k300+8OoEP+bMwqnRAJ
	 mj+JH4SYtopG073GIbb09cv4wXHBkMZQwGgFUmx3CQJiQiqxZpRNmsHFmXosXorU3jNqb
	 Vgp5qx3sS5UkTfMxL8JXJl90GJ6sXjf+D09Vrz7R6QLQNpQQINuiggmqej0ks5EYPfTt3
	 v4k0szFkGhoJ25Rv+sMT75QNxfqrMYKOH+mGWq6DjrJWB+mbfBFHRyHEuLw228QI9dQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043012;
	bh=tfaHac8YtaDn7MeB8Guu81QJSAackIIiVSx48tfOYh4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VZAkZuz6sIMUbFVjYoIvcNTf85dL0lAyKOFmDOvwrBYL33W+NQ2m+NCmSDEodt1Gs
	 hgbq/kUqHt81aQS/AKggBNDnpO2/LDKd6PxTfyTGJKUc4Hpj3gHA3bHN8jpRUN+vg6
	 Xjr1aWq7LjwZ6i8aNOlUXTbxU8CrUxllqLVmVtGJ6/eNTbj4/+OWGWqVwP1CCayuDT
	 BtbpKXfJ2X8lxhLaB9g96iBrOV6LUKxKMofKJ2KIT4DH7VfiivYpgeh+Yt9CPB3jpx
	 De4581kCXx4oMtJvFJMDav1p0d9Dx3KSQr0s3xDDjO/jqIYpupYUhFF0wGvv9fI3Jt
	 q96ne6pYfa+MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4362B817AB;
	Sat,  3 Oct 2026 15:56:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8542335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0DF60673
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMzcgXdQIQkx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1EABC6069F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=UvZLEqsAIpbhjwVFWwjxXbcuegsPYu4ftrwEEnOJpIkeUUCaeVHWLuy3b/aGbc3DPnap
 d2Nn5spE26XkmlmImAkQ3ddUHhvCzTSoCCXYiTcjAS0kJ3exn+JiyoPvruau6GcoWP0or
 Zhaq5zjpQEND8sBSfdXGYmp8HEodIrEHgIezPUAZYtAwHgpaC1doUdD8dy+c2YAe6p87C
 JYpW3g9+oOk3UsApVw9XXKmcqu+QshZGQEXip3qDdoAyzuURhTHnVPj+8HsKR0eMEFZWH
 LdlWCl/cYlx7TQ80I9Imkjhh9JJjdlT9FFfFE3QrgM4eiy+Ki6dlNNFrEOMb+xqrQKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3pwVBudByuIo2fLK7dMvvTRESS6z5dFN/EesdnY0W2Y=;
 b=QrgJO7stkQfTHW0IDeYJIDEufeBJPrdzLFZH4Z1LwgOr1Waw9w5Hx3sFrWxtF9gZzCuj
 cbcOGGrsdUYXbGdQd41b67D2NSGM4jOZaTaXqtxohurzA78gJSzR0MMG0wxNtcEAcQ5tK
 AdtGh3ms2xsYVUbEvDNv7146dTX8PB+o+BfX/u/qgn4a1vY7570IbjzaOGATShImDp/uN
 4t8bdkC72vNVregpou5dccroI+Cbzh8nGLLf+i4C8wczYgfdxr1L6v8HEQzDUoR87RE+C
 Mpv/etq3CI8q11QTWHIt28xWbbu2qjV+AYmVGi/WdEmhttCV/M5mYgmGi9RkGKGENwA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EABC6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EDFE886C6; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2b49a43a8194a3b352c6de5820519c8edde06d2
X-Git-Newrev: d72da002ac4277c9761cbbcd6cdcfc2dbf9d44bc
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.5EDFE886C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lmdb: bump version to 2.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d72da002ac4277c9761cbbcd6cdcfc2dbf9d44bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
