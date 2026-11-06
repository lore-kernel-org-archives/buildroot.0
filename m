Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A7606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lEWRiE2e
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF65960A9B;
	Fri,  6 Nov 2026 21:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aouNmQPoj54H; Fri,  6 Nov 2026 21:15:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A851360A87
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999700;
	b=f/RENC1IdJ4iozASbVZHNTnNCGLhWVhzJlszWI5r2TtRWNx1KJlz7cxw0BQtgP8ipTtd
	 wLyydPTkWYME8Il+fqUyxHQzD8/rIN6SeAquY5xQSfyRhkdd1qz+7OnRUUB3rZletj5mx
	 Jh7FOkuaB5ujjrYdwOGqiE8ORv+yyPZAGC1N7d9SzgBqakLWtjDA+jGXRB5sksZvBuvii
	 ps/vckdCG2k9at+F0Boam2yMnCiXkuTYbfg4Q3SJWy2vN0iJ/QTY668xWOinRqFHEdGgH
	 qDmceXXyMLSYDmYoceikVelNMQxmTXAk+Z1QkijFgD+C8Rpq+FzpY+1WTuI09LdG8wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999700;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gn05DNXznxy4XXZ7yyAAK4FSNua35uiUR5t0iLSNeZ0=;
	b=R9hMe85cpiugTD2sdyeXilVMtgOs6HGfAtLmF6vdc4lxjxPehDvoRXTbjF3NA/SnX+hB
	 rdiwouI7NHIH56sFrW8+EdVrnryW7Yg7krUnhWL4XJcBRdNU5PnR6VJATM4pQtfnH15KS
	 4INHp+lNIy7ahp7c4toPHbEtgh5xzpEVnBkybcWWJ/iKizNqNT9nzRtp4asvf+l3k4+YF
	 Wwt7rOcLmAO3HKsxEFYBEoOD7eShsIfyt4VVqXajrNHJPK/3XHFF/LEAZcr+q6F39sAC1
	 +HkmBUL+pCrXcWaukXEiA2dElLzeenpch4RuYNmIP6gOT6skYfuV0hlbowxbX5+jQbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999700;
	bh=gn05DNXznxy4XXZ7yyAAK4FSNua35uiUR5t0iLSNeZ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lEWRiE2ec4cAzLl93FhHquYWm0Cx/mAMwXrlpBdwoxl6C+O7CsRFS7UbLMXIvnMRK
	 Yxd+G/TYYfOX4FC0xwgsdSd/pbAFU1IdNa46FXNFP/2IdiLK/aYRThE1wcOoxhQ1Rf
	 0wNf0ejdrdpTNs0Gx2cgrarDpWulviBVMG1Kbx5kNYPCDmuXSdoCcINH2vvEPCI1r+
	 Tp6V9q8Rtna+NWBfDxCuhO2HbTRCYrL3XZe2G6J2uvYeWdqOz74aso2H+sxE1EHlqy
	 9rfVFRlww/PdLtJtAO3O3eAjXgk7P9s4z/SzmiGn9OPzqGi23g4PqFVaCcNFUmQBN3
	 RjAzjcKOR6V9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A851360A87;
	Fri,  6 Nov 2026 21:15:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0241532A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F416440404
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcSnGqtQgfGk for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42752400A2
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42752400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F6869E0B2; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d3e4679f20bdee98ba4d1742fcded442d65edbe
X-Git-Newrev: 9252152d1c7f1c532ad75fcf6185dbb0ab27af94
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.5F6869E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-socketio: security bump to
 version 5.18.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9252152d1c7f1c532ad75fcf6185dbb0ab27af94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Prevent HTTP clients from dispatching events before their connection
has completed and the connect handler has accepted it.

https://github.com/miguelgrinberg/python-socketio/commit/0f5f4faafd941878b7ba815d3369d01777ddd121

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index d8360cbde8..8dc86acdd2 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  ed364a997052808b3d249630ca907817  python_socketio-5.17.1.tar.gz
-sha256  2a3183d7172e5ff772b9c24ef94f1fdf84a09b746925c997b7687ae8017f7247  python_socketio-5.17.1.tar.gz
+md5  ae54e4caee7a842ab49becb33add6600  python_socketio-5.18.1.tar.gz
+sha256  07ab0e7c94a52833a67af1dc05958ad6fb0de69adc87de9198a61b22588c40d4  python_socketio-5.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index c1a2d6a249..6ed2e5f442 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.17.1
+PYTHON_SOCKETIO_VERSION = 5.18.1
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/f6/a0/b3c6cfac960bec64ad52b83e7baed825ce256f8506b343aed10d2dc5f747
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/71/b9/4ab083267c1f8ece9a9e019808412af7c7a03321411a1263cd863321baa2
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
