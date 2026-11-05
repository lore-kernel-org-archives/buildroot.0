Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F3606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f2bF9bq2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C0581108;
	Thu,  5 Nov 2026 09:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUj7RVy9NrMd; Thu,  5 Nov 2026 09:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99B54810F9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793872273;
	b=nxvsQ7cjcqKMiyYj35lNA9EohEow2hYhxjTvCiCwXdoHRuPHKwn5xyz5ZL83RHL8C9rn
	 xPssDS98d4Np45Gyt8/ktobgLukhVmH8CyEdgasnrzmCSsuTQI6d6CCtTVn6oq5xqlNUc
	 1Wujiq+0iyQ8wfR1Ng8Bw9JK7gt/p13uBgitC/cmNn/mHlnEL8JVYzjx1cDnKzmvzUk9F
	 cmHSeOL40vzOkgydsuN1db2sWJdto9ufYiqlhszQjcThGVMN2hLT6rP2rSdE1eRdcfOKz
	 nUyY/fHs6nkSDa+us5JW6sdl2ra9zMvezhqhMCm5T0gmtfVlz0Uz2JNtipM/dG8nxuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793872273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j0/oqm45ta9Ll+5hzIl6FzayvKOF3Pj3WrE6QN6o9LY=;
	b=ZDOOAQ33cB86GwIs/amqmrBPAfJfJStCVhDsDaRIMWSB7dUnh6LpCJCuN57qrieleEdx
	 J1HxiTNUKbdIwCGqLq40KiX+2bBTMyReuOjhvZz5fHk+HAk3bGaRa+/JGWBWlTGn00U8R
	 e8qUznlNTfrVAGGsfQC3+KYKo0B3dWh9mvsUWM8RI5NlkG1GZNHBnyA33zOh/O5Uc8swa
	 85bKPpeLIDPxom17iOw6IsPzuRRG6ke+VUp7ga+REMWwGNZDMoXrmN7DB3ruONJ8uALkC
	 lzGwX26LBW11A+zxKucDx2cfM7Tjog4D0gFmMIliz8GXo2CvWR4ADUkfWP1HIgf+/LQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793872273;
	bh=j0/oqm45ta9Ll+5hzIl6FzayvKOF3Pj3WrE6QN6o9LY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=f2bF9bq2uAYScahZIG9ELfkv5zKlFEto/0E3auXtpNWOGa5eJZPDrqzbTPO38QDTH
	 fQD8NhcqlRRktHTi5V/f1zmj9OUM0Jm05mSkFE5mMpaZCNKAHu+Q/2gyPs9SQue/Mc
	 JCl2vD5xYfBrdEP3lv9oJOchTjSNv2XguOR/fK4WGFiP/sELRB/hwERX7sOKkE15sn
	 PBhZ6EOknWtXZd0XhdH3bvsoqMNu0FOF5tLx41m7ML4K7AID43+mZF7ssqOZGeCHaL
	 MSS6hvzjs757LmLAZ8qWvALdyDjIpX9qqJhJWDRD1E57G/X9lafHIGdFhBsjrgazh6
	 s91KCpyILltXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B54810F9;
	Thu,  5 Nov 2026 09:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 707C9AFC
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 09:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61CA0810F9
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 09:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id is4OU8UGO0I4 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 09:51:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB5ED810AD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB5ED810AD
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 09:51:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1wn6nP0wZi-00jn1i; Thu, 05
 Nov 2026 10:51:05 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  5 Nov 2026 10:50:44 +0100
Message-ID: <20261105095044.3677933-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EIMQmvvWvOr344U8YduTdpAn9YHgLTjrDSATpg3ujI/1wBGh1QO
 ncI1TZon8d542OzgIbcBAkds4H+TQrZOIVEy5ZycdjD3RH0O4esqRUJKOcuXZ2zIBLY4PIP
 lyrCO+F0oCyxuKweCdwW047KMeHn3WWvgILKsn9v9AuSqZsQpm0DBXg5JNOctF+5fhr7hNY
 9Wzp8yUk1McCYhhd0a/iQ==
UI-OutboundReport: notjunk:1;M01:P0:dkWUXUoG5jY=;2mLhQObHn4ET5XmZ1Qze+Ub8Ail
 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
 UrJxdOn5PjUySCkea7D/I=
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump version to
 10.6p2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Security fix listed in release notes:

> sshd(8): avoid password authentication bypass that is exploitable
> through sshd(8) that affects some Linux systems when built and run
> with PAM support disabled. We consider the root cause of this bug
> to be outside sshd, but it is exploitable via sshd and can be
> avoided there.

Plus a few bugfixes, full release notes:
https://www.openssh.org/txt/release-10.6p2

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index a53ae817a4..615223830d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
-sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
+# From https://www.openssh.com/txt/release-10.6p2 (base64 encoded)
+sha256  9ae44872090cf2f06b3cf9ff147e7f16f309671340763ed2f99248398ae29d5b  openssh-10.6p2.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 27cd5fb169..3ffc2328aa 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 10.6
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
