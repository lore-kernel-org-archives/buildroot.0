Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFEC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PVV0xUrd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447D860A92;
	Sat, 24 Oct 2026 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hipNgnU9EUeA; Sat, 24 Oct 2026 12:20:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 472666064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792844432;
	b=Mm93KAxJ6rdJ5ET42dlwYHE64Tmi/cz3tD14Bxqpm6/DHb9OCGhuXyFPcs1kM7I2YlX/
	 wcJT9K2BBAFSlQkFxWpkge+z8NZMUNzPoaOE9QswuXZ1n1Osi+0dZbBxuaT7yB2hKWVI2
	 wakQCJKWnluD7tQEuisTToFub6SaTSHI+B0enm/Zmw2Veowo6Jhvq9NtvgPd/nipdk3Up
	 4Pc4XL20fr6NL/KtmX/mTQH8u5jCI25NNZAdsnujwLBVF8N4qTDbxtkSXTuUyokXYkT6f
	 oADh7AJQAE0n4X41JgZghrtZDMaw9R1yL37B5N3oQXgJuAnRikzG7v2l6KjaP4LD4Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792844432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ui/EiyHH+KiJf5OygRP84jtVcyHq6pcnop616JJvouo=;
	b=oEw0EqKKjuI0ZmbZYhjlvPADookSOYyMe+LhxQJRnE75RMrnKiU4Z/n7ReO8pz8uNgYb
	 TxH38ndhjzAequLW/tvcojbFvJgSMwDNbvi/4NdOGNpnQXscnBcTDa93SANc6KyeFccf+
	 +1rYCYwAVWjRqodGMtI1kSWGd2HfkoD1YHg/r8PAa7pDQx/kWwhQgcOqHwcbIyuprQJST
	 OjrLiGezWiXO44ZYU4JgNBxzFvnk42Iw77b+7VME0xjLNfS5SU2D9yU0OjIYaAaXzN/ok
	 6uYwDaII5N52UEWy/pq65FKXbRbfaaax4mDmmMWdyPNKo+vo7QJmBOZy7HQAs9FaPBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792844432;
	bh=ui/EiyHH+KiJf5OygRP84jtVcyHq6pcnop616JJvouo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PVV0xUrdHZiJrWCwVllXP1DqBHwNYJSHOcDvBaOAMDeuVX0ZQ59v/FXqKv2LApT1H
	 KzHWjYDVK+X3ApQ6jZdGGfBuzJFRNaOE03Kc8wRoxk0RskIG2nxE39NTuaIkon+orA
	 m+eB5XnWUBWijeSGpSFMYnY9EVft2GcGzHSQz8VPUP+klwbRv4elFXWoHwV46beQQ5
	 t9WVzKN0sT5WYwTWwtLjKBBvUdHygQUFGxIeX2qfIEkp0JYDdhohE3pph/tXVrlocW
	 DSLuyVDsvi1hRl9R6lUBor0SrD6Bh/kGHCNX707Bniga+v/ui6BsnQY0zuf/++7OAb
	 VJiC53yx0QLkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 472666064D;
	Sat, 24 Oct 2026 12:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1726979F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07F1960A4B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64QhwF4SM5tz for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 12:20:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 58C856064D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792844429;
 b=Z/1hcJlzArARlIcrWPKruceDZmy+9sqf2qCOzeC0zyj9uPmZ93ENsei9ycgfPVEl0sx7
 I4Q8bQUkV6Cqj9I5VEDebdoRsxSOqy/VPawTHmXKGngvxEmRDZ54ht1iyJ5PVTSZN2WUB
 LwaV8rATBtEEoXDc22FWfJBu3KxfWw+tyyAaLRlVUwf4ptg3tlf1RZCMlKdAnrjGVENjo
 qQkTZ0hIEuHZv3MWEpf2fwGDTxRUs+OVSEd5C84l/UTmq8mYuQkCEpSe3zl8DDDMTU57u
 IZEmIY4c3sKgXKSa3SDkuwVwQhl9CsOfQMJuU5DT2/J1mzX3G9Nka50jKFdzTKUs+uA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792844429;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5RWM9iyi0I7LpoUecLdiIrzdoXX1+6i54EOx7Kcqp9Q=;
 b=Dj/nXOW2NNLu1HrH0fKKTVtclERXllGmiRAXX+b7XheSZEParpo2yAq+0UEeWcCD2hRT
 6Wn5LVVELthL+7eUtfFirG8nAHrcDbU9M7abHo6PGUbpqY2Qdi6CF7YyfBjJz1/bckr6p
 Hw4gQdOuSrECZ0zPaQaqR2lbQHsqNTd0UJvNcT/j3IO4JrUhwp8wqthElb6nyQ5TLzSJR
 uxMnxGwJxB5x7Q5KRrNiqwrkr3Dbb+JyatsLSWoD1F3enyPWc0YYFM/17iDWjAxdVsMhA
 JsiCzQep+UHHx0W16k3bkae5cm1/3Sf4fLlmhqlSj72dRzcBj0UvaEEyOe7Xyo1JIPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C856064D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:20:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DCA89C7AB; Sat, 24 Oct 2026 12:19:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 14:07:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7f397cd5d099c979cf32659d88e39af57747f69
X-Git-Newrev: eaba571a623aa695ea4efdeb8bc5e205ca3f6aa8
X-Patchwork-Hint: ignore
Message-Id: <20261024121902.1DCA89C7AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.161.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eaba571a623aa695ea4efdeb8bc5e205ca3f6aa8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index d45c91abee..ed222d8e6a 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  252e224309e54dcf795e8ffee564823a  fastapi-0.148.0.tar.gz
-sha256  06ee16c50e429daf993a58ecbb5306d284c4c1ee8135380af39a5e1cfa715187  fastapi-0.148.0.tar.gz
+md5  9319a9bb00c891dd4d6df45dce5b34e6  fastapi-0.161.1.tar.gz
+sha256  4076b88434452e20289379068e976c4a04c65ffc8e6be31510106e150a422f0f  fastapi-0.161.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 4ef5141a5e..547748417c 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.148.0
+PYTHON_FASTAPI_VERSION = 0.161.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/72/da/e962004c32f34fb630e8393456cadcd08d4300b6fa0099ec0ae5052b8418
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ed/3d/2cc1a0dbc2dac6e157b4ef12bac063e1016cb7c6d7395f76665e439cf1aa
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
