Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B560A2612
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MyEkcouO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FAD9812EA;
	Wed, 11 Nov 2026 08:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjSJ7zZMXAAD; Wed, 11 Nov 2026 08:00:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BB4B812AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794384032;
	b=VJBndscelUQvQiR6DEFftrVbaIdRoDznjEKAuVWkjuyunVaR+usjaxbVK4OhKyb+Jxa8
	 pahsjQNw+H3cPOvsoDml+KSjiVH2zjeRHQIXOr1geO1nZJOUMfwaC9MCxtxsgHBLX0vfw
	 KTnuq0mwX11WBKFmKGywXho6dEOfXRPKhUkFuGEiSNKJ5X9Qx2avXu3wFPlw68wkQ+uFA
	 0pdx/+Ckch8hengQo/ZdACAH1WnQ2Sye+CkfKSNNeT6hZQpbQ2d45QfxetmHd/ZPavewz
	 zr1NeXWU15AHCyLJfCQ1ZZ0yKV9MegdCD+v+n6YQrZPTBOqLcAhw0dw2BS7xqzGsl0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794384032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rFYqb60dFRoElBPiRO22JqhkKy/iaxL7VMn7irXfMoA=;
	b=nyPKYWT1+OuLkNcdJw95cOgYGKRnIHdexguUh29qbZbHPbmf4euPTvhESB5sLytqKlog
	 08iErQSas7r+p+EL5fU7LN/F09gD/SBBTUchM/9Ysi3Zq+Ne2JMv5eJNqoNm/9IwY+AaQ
	 gXfFAwp4wlm1U3OogKpXUBUwsxgRlKZcdOthe/pVHJZAAQrxUVNvD+1sDBonPMPQN7J7u
	 EbcjOc1JA07Ge0YIkiACVlQwAN+FYe2jXQemEZJ+NGwC30c2q91IrhAaSdmbERg/brJKl
	 q0QovD3q/Uf2XuEjP+LxjAy9Q8Gz4GUUUHmw1V4DXEUBXA0qvfmki7nfcFRGILCX5nA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794384032;
	bh=rFYqb60dFRoElBPiRO22JqhkKy/iaxL7VMn7irXfMoA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MyEkcouOrqsAWxUNG3xynPlnJ/rKcGo2HGikB2mtlmI6WrpA4vAtGqpCTCEVn8e69
	 QZ/1TqrqZMUHk8r3+9fqlEjS87KIabWJnv1+XLu8pnqHyqi7SOXzTPFm3Vchq4XKrz
	 y/UExpAPOySuDLBXz2iYZUyunkrwFZp9dEUXZV6844sWRXIWfBREHej1OPRiFvpib6
	 tnU32vAt5OKD8YzEfBTWpefxfoPI0boIPEB/1klAONLGOYeAc1yZ8VJucJOY3g9CDG
	 50py6OFKEEs4cwaf+Js4RhiLufuoESnTRxuHqM0HgFq5RPBoEVfvuz9o2dXr1pp36j
	 /RA489qSUh9oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB4B812AA;
	Wed, 11 Nov 2026 08:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EEEE09
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 08:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58D0940318
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 08:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVso4uI_8eh1 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 08:00:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0DEF6400B0
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DEF6400B0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 08:00:12 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso450471166b.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 00:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794384011; x=1794988811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=57kdkaeLqoOPcHjzcc6poHujzMWvjioSl5TGu2H1CZ4=;
 b=rTehCKg32+ttvSBmCFzCoFk2nHPXAX10L8HOyQm81ZyxS9wvslJN3kkl9B67WJkH7e
 o1uH+oPHmrklvraEKYmPMYwx6kHy74EYwecXVNla2uerOB5k3z+mZWZkSqJ9P6pxnWOj
 3lJFH+1UY4yD3bjJdAmwipV+GASEp73YCQ91XVoAr5gUcnNW1buh6AzxmZEwe3v8Si3O
 9Dv/jp9+JAE9WLFg1oK6JHy4jtWWh70KhBIw+OEP1gQHbEZj/o5ttEiSGF+gTX1MY29B
 GvqUULJShZSRdfQqBfrgBgTStl2Ce5MIBS3P+79KgHjl8IOLqXRd02kyyVlZaIRspv+k
 z3pA==
X-Gm-Message-State: APuU4Z9CV7CUWtVhLx19cbw1WHu4ak63FO6RWHIMBmwrTpoeCGgJcj2D
 e7MlCyKqA1P8Ni/rERzxFmiz51PPBhoYQHdx3u0HZNRisBNqOQ+bEBrM5z5jcg==
X-Gm-Gg: AYBFou2eB8Mqltqfaits+omDYCIBYOojIAl/If0Qn2pwfeuRKNJFSqE9HQQD884Nc6L
 cuLHcCTrLUy55vsWN8hWC1lWQip6fhZXE6gf/PZQcaq0LyvoffCDmRS9MuLMLIg2Q/Zngz7grd7
 jjWLPpYankgrejTV5gutNDJ66ZP9eVa43gRAjVUDoCbJe/0oYHaa9fXcZYCo/lI+U8kUPlu3anf
 06ELMSVKRbM02UghX0KFEpKbf/kvc5ML81iPAANCTBmg9zVsph51l8IhMsX80Zbt0aqt1iIpu5n
 43chNcknxKj5eL3SUrgBSL38xz6PUqhYGE55uw61BKdSD7IJh21Bcwo0376BSmLpq6yDM97vr3u
 MDijziY1AwFPlJhPM1nhdw6YDodgblCxIrdZe5l93cOCMey2+xAPoSrdcVa7iKucR4MoSJ77rnp
 r67oxRa7kNdZxgzAbrlMElApOOPcD/XVm2CGI0axWPHZA9KkETbKaohsUeGcSXO2M/9Epo9SDAx
 X13Dokhqot1Wu2lMqGO3MLPYcd36g2LIrfH1nCaREmo5WoLm7kxMPYRQF7HVqHoGq9sLxe53Q2s
 CrdVFgHPoeQTFs1j2YinSUl76wfhFLDJB81uctnYAJamX9QDtVOz57KzkIKkWz/8ECRqFgQcGc0
 tWzoVDhBx3SCTN0WyLjdrQxRt+lK7GA==
X-Received: by 2002:a17:906:c104:b0:c46:8909:963b with SMTP id
 a640c23a62f3a-c5066ae9e1amr124979366b.9.1794384008728; 
 Wed, 11 Nov 2026 00:00:08 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a5701a1sm206667766b.21.2026.11.11.00.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 00:00:08 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 09:00:06 +0100
Message-Id: <20261111080006.3832953-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libecoli: fix uninitialized width build
 failure with -Ofast
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libecoli builds with -Werror. With GCC 15 and BR2_OPTIMIZE_FAST, the
build fails with:

  ../src/editline.c: In function 'ec_editline_complete':
  ../src/editline.c:304:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
  ../src/editline.c: In function 'ec_editline_interact':
  ../src/editline.c:657:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]

This is a real bug: ec_editline_term_size() only writes its width
output when both el_get(EL_GETTC) calls succeed, and these two callers
neither check its return value nor initialize width beforehand.

Add a patch, submitted upstream, that defaults width to 80 columns, as
the other ec_editline_term_size() callers already do.

This issue has been present since commit 5638ee04c8dd ("package/libecoli:
bump version to 0.11.3"), as upstream commit bc90312a4285 ("editline:
split in 2 files"), first released in v0.11.0, dropped the width
initialization. It therefore affects 2026.08 and later. The 2026.02.x
LTS branch still has libecoli 0.10.1 and is not affected.

Fixes:
https://autobuild.buildroot.org/results/a0a7e17f1a76588932a8a7f8db35a832d540cc69

Fixes: 5638ee04c8dddb9ebfb7b047efb574f657e1b052 ("package/libecoli: bump version to 0.11.3")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...-width-before-querying-terminal-size.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch

diff --git a/package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch b/package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch
new file mode 100644
index 0000000000..e2b833473e
--- /dev/null
+++ b/package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 10 Nov 2026 23:53:35 +0100
+Subject: [PATCH] editline: initialize width before querying terminal size
+
+ec_editline_term_size() only writes the width and height outputs when
+both el_get(EL_GETTC) calls succeed. ec_editline_complete() and
+ec_editline_interact() ignore its return value and do not initialize
+width beforehand, so an indeterminate value is used (clamped to 50..100)
+when the terminal capabilities cannot be retrieved.
+
+With GCC 15 and -Ofast, this is detected and breaks the build because
+of -Werror:
+
+  ../src/editline.c: In function 'ec_editline_complete':
+  ../src/editline.c:304:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
+  ../src/editline.c: In function 'ec_editline_interact':
+  ../src/editline.c:657:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
+
+Default width to 80 columns, as the other ec_editline_term_size()
+callers already do.
+
+Link: https://autobuild.buildroot.org/results/a0a7e17f1a76588932a8a7f8db35a832d540cc69
+Fixes: bc90312a4285 ("editline: split in 2 files")
+Upstream: https://github.com/rjarry/libecoli/pull/43
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/editline.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/editline.c b/src/editline.c
+index d286135..0751194 100644
+--- a/src/editline.c
++++ b/src/editline.c
+@@ -301,7 +301,7 @@ int ec_editline_complete(struct editline *el, int c)
+ 	struct ec_comp *cmpl = NULL;
+ 	char *append = NULL;
+ 	unsigned int height;
+-	unsigned int width;
++	unsigned int width = 80;
+ 	size_t comp_count;
+ 	void *clientdata;
+ 	char *line = NULL;
+@@ -654,7 +654,7 @@ int ec_editline_interact(
+ 	const struct ec_node *node;
+ 	size_t char_idx = 0;
+ 	unsigned int height;
+-	unsigned int width;
++	unsigned int width = 80;
+ 	char *line = NULL;
+ 	ssize_t n;
+ 	FILE *out;
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
