Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E1606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LYmUgoFP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02790606BD;
	Sat, 14 Nov 2026 22:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6qYNxYvGZHr; Sat, 14 Nov 2026 22:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 585B36064E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794694927;
	b=O+T6bjPeRT8wJ75DhnUDRzlduI2lVFjRtdA5O0R4yfCtEEg8NfbNZ9WOzhDliI0ursCg
	 FSceVQwSi1ikPJV+knVOZ8gQ36NM+uxON5pQ3Sf7TKFZxEQGla6dPgH7uQTBjL12eDVaK
	 B2OJB71Cd/j+uOnw6HXwqDiJzj7OVf70pUFYHgO/Bl3ha3+6gq+e1BmsAQ/6NDAVadccB
	 WnsozDC0yi9nWDGtChbPPptAaAtfHUjdDC5UjjanyIhZRG9SeFkpykpArle7+3jGCLdkn
	 YPsHnBqsmpHKIP3RxHYlyssIM1lS2KzMwOg5+iW8pgOPgs9rR9WX07A83nBtOrYtJ/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794694927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Jrl4A3FK01QdX/VgM6bRcmHajywSJDyWDDD/rqGebU=;
	b=cthf58YrJHdUCJT38zK98YEFm/9zdN8rUCum3h6r1MaATe3a2a7hPba7RG6/VjxLg++P
	 oZHk5JDxetWhaw1c8Hu+YSwjzadrayLAScKk/Pxzijj56SFJ6sywh8SV887fqE0jKVaJ1
	 AO1pmxaYJ9V+H/8dVEercm1zM21ZMKM4X64RVdT8dhRKstR9iEXQq68T2sgcAqitGboEE
	 NGDtYoe1uJ/YHlKIYAOYbYuVGttiQFTZNdYMQb8HDxIOx94vUvzDYqniMkeLOzOfVJL8L
	 9iWsqe9mUc/EENLiYzny+3xlgVlv7GUPV7x3GTxYQ9k+eFa17zENQt5FTj2QmT+PYNQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794694927;
	bh=8Jrl4A3FK01QdX/VgM6bRcmHajywSJDyWDDD/rqGebU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LYmUgoFPityq5+6czCddl9lHRnWb2TGfuVQKsAmEZ3RcXRHgK+KkUaxf4TCUtqERb
	 gXKbDE8Kn53T5dZJUaT5+AXbw6TTFWAvVAorRIXHNj2lBDm1sBqAm1R190EPqf62bN
	 C+hCmpnLWXKbc8M8wtUF8l2Mz3/cbrn1WMz301SKXSt4ZI3WP3yk2oppdrBFtsqzCm
	 DxDf0l4zswgKA7/M31P/xTzspo8mPNsJWLVV1Sr6kQgBkcCagpO/aTwrfpChnMJ9XL
	 aqLiiiAgjT4vYfC0YBM6m3J12IzJzMnXeqP6IcNGzZGp5DruesP9Z05FGUTOJco8d9
	 7iIUeqQMvStww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585B36064E;
	Sat, 14 Nov 2026 22:22:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A81A1A6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D42D6064E
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAo9XTjg0C5y for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 22:22:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60D3A60634
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60D3A60634
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CB9445FFAF;
 Sat, 14 Nov 2026 23:21:59 +0100 (CET)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 14 Nov 2026 23:21:53 +0100
Message-ID: <20261114222155.1450949-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] support/testing/infra/emulator.py: globally
 disable colors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] disabled colors of the Python interpreter (which
introduced automatic coloring in version 3.14). Those colors were
introducing Python test failures.

It appears that more an more programs, not only Python, are following
this trend to enable colors when programs are running interactively
on a terminal.

Disabling those colors by setting the NO_COLOR environment variable
is becoming common. See [2].

This commit sets the NO_COLOR=1 environment variable to globally
request to disable color in all runtime tests.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3a6e2b4a0395f6e049cd847cf16406a4d0d998ad
[2] https://no-color.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/emulator.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index d690949120..4171ddfe3b 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -160,6 +160,7 @@ class Emulator(object):
 
     def connect_shell(self):
         extra_init_cmd = " && ".join([
+            'export NO_COLOR=1',
             'export PAGER=cat',
             'dmesg -n 1',
             # Prevent the shell from wrapping the commands at 80 columns.
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
