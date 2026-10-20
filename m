Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B4606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B9iPU9lb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CDA607EA;
	Tue, 20 Oct 2026 07:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3D5u8h9Li9U; Tue, 20 Oct 2026 07:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DDBF607ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792480857;
	b=jNj9qOKLn5dBT+Nu4c2wQfcRyqZj6Gg2GbsSEZ3sldcvnEX/8r9M91FohZFOJyt3at5u
	 xSSotY+G7G1bvB0cX9GB+sXOEcchHfhp1Imu8eZ8U4lQupfx/RHxSlOwDRODuosZENAQ7
	 6/FuSpduRak3dvdoM+rQwGJhoiuZ/NuKJ68V3fMLU+DL+Ka4zCjL3L0BuFu6am8QaBvD5
	 GEJmChj1i4jeO1/ENSyxlnd7k22w7UMsxuPALYsg4aBpbMuLoPkLLsOM8cTFd+zjJx1Kc
	 1Qt9i/QozWijgvGF/LujBCOZSXGA8UZRSj4fK5t940j5oQDU7Z5bOjuCzg0IDZz72AQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792480857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M/pBFOPIruP80Obdgy0WSTcgSR9XP7m7IJv1QW4eRMk=;
	b=QzuvxCjhP7nRYAn07cuAY8QQw24hyxA33EZ/l14a6yndN/TbNoHNA8s5eMQykTh44hId
	 1VfWAGUNdf6v3eO3EvTFsmzhYpfj6LItah61mPmJPLxyo6zRUylQGyyNAAumgkzfpVzRZ
	 OOJDfCPP63zjKkpSsrHvvgJ/vCFGYfsMJL+F1Gw5hLDdvLtgEhcE7+9kJYUY+uI99jca8
	 pfXX4xT4cq8L8aHMVp5/fgopTprcW3wER9p7TElsRInFhW0Gs856sNJLG6HW5UMvVX0nu
	 c+XTc8k2YARu9EQaa+6kR5x3q6kkB7fUNBeZ+YS53eKodwdnQYucXXPycIcUJEptrGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792480857;
	bh=M/pBFOPIruP80Obdgy0WSTcgSR9XP7m7IJv1QW4eRMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B9iPU9lbCuLUeCuG7wBankFVLT/lKDjXvrLPdykM7VC5q+3B/Y2+FkQELOic1RQ5Z
	 Q7WNaRTul6N1X1lUxSwSD+RsT1Ca/nlvth01RE6ttne2kRxXdLfco1CqJDPkieo7oZ
	 xX20/xGfSUvBgUfeuUoNlqG5NmAaJOUoiU9V51jCWbOQxctwpmALANl1KCJogh8eMI
	 O2LcmR7A/a9zL/jXjgxW0rbCEYTZ3CELtBtWm6yPRWm8fybDUPu6WK+RMFd27QYCft
	 F7/GI3OvnAXhQFp+EAyqMIdwMeJylf1MPMDNYFzVvbU6JmbdEzk+Y/4PgJgIE2Eno0
	 7W6QZ2FMVccFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DDBF607ED;
	Tue, 20 Oct 2026 07:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF61279
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30EA440312
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHP2rH-qSaiv for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:20:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5BD994016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792480855;
 b=ROLhw+RH/Jsv0yHTJMGcol6XDBUF3ar4DUKT2ytla6mUacWGYg1zFVjA546eLD2FvzYe
 SSpRx7vRJy0VFy0lJqEY3gKGVH36bmX5eOo4yboBsUJqF5l4/5exf88DG1OqU5lGXV2xE
 2eojBI54O7ufCv6eOYIt+70WlMbibuywjDToa2koB6/xiAGg9N7WOFjx3iN6X+dpX0yaC
 cLY4FWZTdF6g8a1MeQfAqU6ozEmoiWJgvMPmrkgw7nh+3TsGv0Q0jD6rsfRct34MIUlOJ
 nznnW+ZxPwxignBqluvAb8KuRSqagxQXoQXc9moHxZIIb2QzHjCL7lkwgXMUPdJ0GjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792480855;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nkOd8MmnT90Critk/e3r/D/PkNrZLHBfb8PJI3WkvQc=;
 b=mRmEJRFfKYzg8/YMJDm2Ou0j2Txx5kQm2ddgYuhF6tuvoYadnfj50MQmjBW113QgTK+9
 1qMHmlmDYHsyef7oaOkpqL7dI86odFyNr5mX5cvimNbvvoY9U2SzIuiVdQcF26/SpNCEX
 DH4cKvCqbv33usWSQXzfaZtCMQ6AH5Ve7ZmJZ0VG7h14LG2M3Odzax5h8c2PslvX+90bR
 ewPzT/G8fGaFwwDV7Eiag6qztewqrZppccgsjOJitlnMIAazvBBRD6v00QeYWpNg+IUEO
 tHVgxKifKRfpIFQfyWMGY5ZIGtptyHAllo+fSY2bnldU7PE1E5lFcv/iemqqD48x9sg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD994016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71203996AA; Tue, 20 Oct 2026 07:19:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 09:15:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b5fc8431bfc234a80653db5772eb47d65305aae
X-Git-Newrev: 76c5a305d366f16b5b9839a7ee2688d415dc1fcd
X-Patchwork-Hint: ignore
Message-Id: <20261020071932.71203996AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76c5a305d366f16b5b9839a7ee2688d415dc1fcd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 03f85c2888..cf228a2062 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76f41c06cefc91d57e0b7d366b7a91b8420ec77939326491795f9fb26afca7e7  intel-media-26.3.5.tar.gz
+sha256  ff70ecafe7f5efe02009b723d640a05dcce5016eaf0a6df60c2276df0deff101  intel-media-26.4.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 8cf39a24ec..1367d3a59b 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.5
+INTEL_MEDIADRIVER_VERSION = 26.4.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
