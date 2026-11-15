Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hGCOYc9G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=plRPSZTA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5E680F4F;
	Sun, 15 Nov 2026 17:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa-7egDA18ik; Sun, 15 Nov 2026 17:46:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 50E0E80F38
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794764797;
	b=N3dvh3331xBZW2y4JQL70LZypLaUXR4NYmllbWGAv+oibMACYYui1AmfAmt40F7GvDZm
	 WF40Z8WEQMtx/PjdH8arRrf4eznhVCYdSxDtwhbuHlHl5u7ERQ0Ltq27xp7MA/fSwMuEn
	 t0keNWXaMSNNeaIt9tIiR5EaVt6k8KxQ3MIDDu/94EYghnKjFsy6mHwZLJB36jaq5wEmL
	 z+3nZWyuPKLUoee/gxN2yVHh+s+ua7FJG230DlfdWSsWeGGl1+m5g5nXVenlIlrg9W5TN
	 k3gWLqcx2wInbi/wgeMfHN1ysWsRkiG3DEIDOc/E08/UL9kYTqB0+WbL+NkPLe7q5RQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794764797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hWjpEZIN70Ti41E+hbICbPYc6txLvFB43y4x6BaCg0o=;
	b=MVgr3Few8rnhO2jMG9dE8Rdtp+X5mHciw2sLMHTo3lLw/QUcJs549nAjfEo5srIP0ISq
	 PXIPWUB/1Mo5RUYbsbc+yXiEAgrg1zZ6zwDtf4Svn4Df8Rn9ybGgLB8yxJ95sh03PAsNp
	 CPfdYEwgCFMVCurKma/SjcuVYME42vs9KYRBibib8sXr4PkhEd47G4FEveNt3jcqKAwJ7
	 9FYhXfEtKUwqEVVqbhRm8IQuE2Z35+9zHQSjNjOHZNpQI2RYt22htLA6vAWGT5W4BGDU3
	 BB/sVGuhs0/oHE8G6b3WDen5e9hUgfmkFZMlii7O64r9aT8T3Ei1UJqEjcSGxUli9wQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794764797;
	bh=hWjpEZIN70Ti41E+hbICbPYc6txLvFB43y4x6BaCg0o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hGCOYc9GpPzFZqVVcnUWP7v49x0CJ1fSxij90gPxE/BcQdMagef6BZMRdBG/1iNGG
	 AZlyBeT49Wywe3f2AeWK4qXo6i8pPQEhaqYr+p5G8eZFPKWU1e6kAg50PKMtP0rZf8
	 07KoPDuAy93+Ssu7byf7brm8IqBjpD+tK56oYDU21gZiUpvX8SgBwhKe4pycFCY5XH
	 2a+PP77CwBkJp4ytFmdJzXl0LvLzrgA2kdHtS72U2/IPU/H2S7iJW/jv8YMGLE3Lv0
	 kanS+Un4plCeefTzJxebXykvOcjcmlVtTj+zj2/vF5T4socfWwkSnS5E7pKamcKxXf
	 vWKBYwP1AtOPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50E0E80F38;
	Sun, 15 Nov 2026 17:46:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B968F2E5
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 17:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B67A760615
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 17:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIN-TsXG2jF2 for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 17:46:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B78660603
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=plRPSZTA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B78660603
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794764790;
 bh=njBP18nN/wMaQ6p8AnZQKZYv55hvwEvyuSk4ntCVURw=;
 h=From:To:Cc:Subject:Date:From;
 b=plRPSZTAtv9H12REUQ1ni92ZDZqanQKA9D327LJqPzsv9SN+IKUrHio/W92YrsFXP
 ADaifVXgay1WFb71NU/mv+nTiGVuRGKZ/oylVsSgo2QVb5fvFjVTFYkgB00mMTr+t5
 PzXQNCWBwvNCyIdgWvDgcjfoNtwjqeU1JUqgcE8IbJyhUb+o+zDYk1ZPcemtc2B2V2
 s4moH5E9OWyfeqDmQ2siVtBOKkWN4FKw2CbgWzMkEOTSsNTc2FLhaPOiLg0E5+irlE
 yFTC0a+oNpxqbu58+mZBf/3FA64vMyh8J7sBKx/wBfMR1DlRL2rN3Q3UUJVDaTWwQS
 gxzFzrkSmM4rg==
X-KAS-Sym: v3:f51bdf72230551df:QqBf3oFuxsOOxDpp1ssVBeFExYtz5GNNOfIxQJmvT+E50
 ppW5VqRKu1OEDQyYUpFk6/sZJmah7rcuuLl6BbGp7JN3HMHYAV3DevqHNt56PXUBm/NWMxSqsph
 JAjP6zFnxhdvxOJ3sl4XlzStI9qIcb1HDsWpj/ovZMz2LOb3S/+FQbG3hchHWHkG3hwCytyMrNW
 Ar1lLLe8+a/kHG+GvpU8owgWFdA0unNC2xiL2yfNhlKSXoQGsc/GUJFzbkXCiXFLtKPUr14fblM
 omJ8XwHozsQVa815Mbk9oMnC8p+gZkpJ0vhADO8j/6MBI3WhxvdwKn2zsJ9LpsjfbAIXcpDg==:
 MrrNTa4gFPehqP0qby7TvUMhxULIuR5RRKDVaJ4bRfYLZaVYfRh128XUqUbBV9ns8rXhqZ8xzGf
 X62rtvr20Zhy2YUVg2BP2GP50yuYTroqQtbGhs0C2WnnQQuIp+9geVGhZ02YBVj3GAEiho9qXaF
 Y3ho27Svq6xRYygbOET3qiSyvnaqyfVvGAg+K+/R4CMq/QsmFmFkMDBbTwHKAC7Toou+KhFGvWj
 D+ISHzGTMsEI/3fSfKUSggryfPhigb91zG7Go6zXL2SX2ksnEujBqHbd5NCKyd69036NNN/XglX
 gnBDjtcwiPAUz/ScPwkz1CLI4Gx4+Mt9Nu+KDNE+LyXgI+pnnbxjRRsN2iLpzfIVjh4fQ2Zk3lg
 9yvXCxOx7myTOqjJqY/6vHn71XoKwMr4g74X9yroPI4Q+IO07QcoK7scUmTsHFOpvJWypFltDJK
 kEh67tQGDoiOUbMF9JBlrVSS++dZDMiOEE/hI61+5QPr+N6ET5orXyrubYFYkoaDQ6QRszKO+Ck
 WKLcme7RWtGyaOPQLKeAMx2+ei+8Gr3lh251KPuOWwlMHAds1t+N1vl9vYOTXCaUaCoVnXU3p9U
 5VYzeQ==
Received: from fli4l.lan.fli4l (p54a1b069.dip0.t-ipconnect.de [84.161.176.105])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91F9CA4C4D88;
 Sun, 15 Nov 2026 18:46:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60476)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xSeJ3-000000002e1-0cCK;
 Sun, 15 Nov 2026 17:46:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Nov 2026 18:46:21 +0100
Message-ID: <20261115174621.3986836-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/strace: add optional dependency to
 ncurses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit aa5e3eec6384cb73d902a4de3fffc279683ea5a5 bumped the
package to 7.0 which includes upstream commit
https://github.com/strace/strace/commit/19642150d613312dc4bed27695a83320dcd5133e
that adds optional support for ncurses.

There is no configure option to disable ncurses support so we need to
use ac_cv_search_tgetnum=no.

Configure during runtime test finds ncurses:
checking for termcap.h... yes
checking for library containing tgetnum... -lncurses

Configure log with this patch:
checking for termcap.h... yes
checking for library containing tgetnum... (cached) no

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158691

[BRTEST# strace --version
strace: error while loading shared libraries: libncurses.so.6: cannot
 open shared object file: No such file or directory

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 8eadb7eba4..97f2ddb6e5 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -19,6 +19,12 @@ else
 STRACE_CONF_OPTS += --without-libunwind
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+STRACE_DEPENDENCIES += ncurses
+else
+STRACE_CONF_OPTS += ac_cv_search_tgetnum=no
+endif
+
 # Demangling symbols in stack trace needs libunwind and libiberty.
 ifeq ($(BR2_PACKAGE_BINUTILS)$(BR2_PACKAGE_LIBUNWIND),yy)
 STRACE_DEPENDENCIES += binutils
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
