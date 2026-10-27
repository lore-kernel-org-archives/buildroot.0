Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C6606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qeChZ40b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=E3mLwadV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD17280BE9;
	Tue, 27 Oct 2026 05:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMeC8d4jIrJC; Tue, 27 Oct 2026 05:56:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DBD9780BE2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793080577;
	b=nfEiBBcYQe5q90zaFR8dq0Sr4Bu1x9hcHalP/taWyXy94O9NQgpnjutDNS3mPBc+3VAp
	 tUSG6XD1GHst5uRK7StGeUeura5A5Dn6aiu/oz33y0rRLxaYZ3cQugSzeVrGjONHPhO1K
	 QvH7Ip1zP3iAr0Etv6zR4+sopBknmYO4W6MTkwLOIcpbb3F1RrpTb1QgU0DuXZntFHOF7
	 1gkF3NMw+Uv9K7DE8G20xY6i+rR+83iy2aW5p+sSLG3EXjcFbnIEzc0GmgB5SIcEc1g1F
	 kbT6h9jft/jY7leDY1BKqKd0MucupBNxGguj0HKDewr9i4DX6LOax/cz7hOfWZSnMfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793080577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=72JB5Cj/8BYi9xDwsbgfSgVrk0HQ2eaaRP7bO7SwNtc=;
	b=Kd7DlN6fLfnDf2v6qvUeMJxdyOK43ISxNa2KtOiBnPllqwsG+3FkeAWxJ8GGYJLNpka0
	 a6G5vatHgeKtvijLozB5cdmLidsA/Ua7r50wrUf+X6MabKwn3i6FZVjhDbWzz3cJw8rCm
	 N1Jb/RlES5ONJ5bonMSfA7iq/xgceZPAv2fNEFZaMAn2qvluPeVTrYtKt5QpdM6JLLy8i
	 dy4sZRhUafJqJoFi9eu5GtkyfJRWRO+3BBfp/l7sQJqJbixqrDA9NrE7/mHf4s2LEO5yJ
	 zhqCaXmrKuc9HK5niwt9yl5Yzt74wNkpwfewoUpC6CAjXcaUynFQWpRm0soW6W5KXdA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793080576;
	bh=72JB5Cj/8BYi9xDwsbgfSgVrk0HQ2eaaRP7bO7SwNtc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qeChZ40bWG9v61Z+K/PV5XvHfsoQtVvfOQOn+JN2e64BAOUspwF64Rw8QXEaYtwCJ
	 8SR9ed5YsjVIHBRByFlKhsSC4swpqw1+G9OVvyp8+BJLrr8YEYOJyF5s7pR7/pPVKR
	 rIYBdIRFzs7ViuByeCq9bny+yRFQj9CMqBs7ll1kZHWJYxIhfYjJzjKVcN8vfYQH2P
	 i+Iq2WrWTeko1IXr7RnVl47mhniEssafGTLAVvNhboD22zU4oYEMPyejHfpaOmc1+3
	 uFSfjFcZ6vs6DnFcKTTnuGxtYz35nW0nZ0Gzamqmf2vbuJdQhGSfVUMWVnfBei6DzU
	 v/nTCB+2Tz/tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD9780BE2;
	Tue, 27 Oct 2026 05:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35076356
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26F9F400A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZDkqHSmbP-1 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:56:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2506640062
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793080575;
 b=fLRtRnGZZ8Rrzhjw6nUazrS+AGHUI5Q1pcZ3q+swoTu6rIvLLsuTjwWbLgYAeXcJ4qGt
 H3otlBhCCRdYPC0nDysFnLO92YrAcRdeEn+++a963E2rF13foL1pTB2A5okNS7JetHyR8
 9ZksvN0c8DtUUOnPjAL8hV4ueklKvPVJTiDPnqcfWAwj1554c9ZYS/t1tPRMRiEcljxC+
 TAdlW2SgUeFw4jaoLBR8ziRMwwjiDIm077P+o+Yn8jwNKTWrHyFHF531zlAsoAygQvAAE
 1K08Kt+s9b0xqW07Za7CLRQSv+TzQkUtHTDJJokKLmgjVBHbjzBPne4izCDb+E2uDMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793080575;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GakgX66RO4mM7bgOREKyFUXGbvBCDFV1F5mCxVe1rKk=;
 b=ATx/hFJ+EiilYtH/X7V7Q7hxM3aZzXlGzD8oQ9FTHfSW06vT0+6Lbz9Kj7Shnz9uIAQ6
 bMYomhhP1SHQct84nBv7nZpFcbm3Eos6GdxiPHQI/NzWap58tyWq/i5zDLHHKeIGfQwFI
 2q3CXfpjDEaokYs8iomIRhPw/Fub32e752rut2oGw5IDahPUc/bDmZx+4GjspsFM6GLcI
 Cc3riGh/FKYdoshhSLkrI90teiqIVHKHj4zyphSdJtNxlFvnmAOjw+Uk2qRuSb6eo5JLV
 QEfkygn+5yzHmisJ8QpWO7HLHwh6xEyo/VGYI35Ka0mJckh9eM9DTbLZZpAlbZSD8iQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=E3mLwadV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=E3mLwadV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2506640062
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793080572;
 bh=GakgX66RO4mM7bgOREKyFUXGbvBCDFV1F5mCxVe1rKk=;
 h=From:To:Cc:Subject:Date:From;
 b=E3mLwadVZSr2wh9N32r23CacpbQAoa2NzDaDsCBoc56k4UaDhGHP6qC+4A1sCGkKF
 SDB7s2OHtVILk8vC5jtsXL+OdQuQhYi0+DEn90tCMUmjlWsjgvrU/ZWlrTq2gWjjPE
 ihssAl1HRmRFTyFS3EbaLJcbvjfcxHMSdrQCud77glC9bCSOhblu40GXHZjv8IYVjq
 7YjMdP3+0xFuDeUprdyONjnHZ12qtc740oeNqnPGvK4jDIkrF1ViNHUhLx2p75vgj0
 GvEvRYEMP5Ctyg3Qb/xTveun4VF3fROdbK6Ce87ez8ISL440goHuz8wZrdwjp+HJCe
 WSDuQ9Q42kEHA==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 +MGNL0L5UpmzXT8hjYZBtEKBugE5YWf6BqnoYMWQLGute1ERYYrnPW/Y7X4FBOb9dgh9phc2xgZ
 y7Ak3jmn1ZB+wEQqLu6/HqyakaXoHbH63HoI6+M3lDv3+veE29XK1OmG2Ewq8kIX+HS2dSiev9+
 /Fc6l9KrsT4x3t9/c+RjQkL6+2FbMj3wW82/4abL6qaVS2Ttdd0xI1fSpP/O5HdcnbRcghRKI2Q
 dl2olVhGM/x99CJMK9B0A4IASY95nwDQ+RLX+dQB5SZkoZ2lG/m9Tyx5FEAVzBr8wC93yWYSi2f
 XPdiB0gwOBLFBLdxAVyWrHS8hhLQ2P7ep6sKJG/162nypIlDqXrhuE0Bqh1NQPLwh6k73zZnkhq
 +crAiq6/0KrlgFVuhWsmg9kxDyk8qM8CBIcQ+vHnBiQGLD+QgVFY9SEhmYv8QqfisgLsjClXWgN
 8Y+J4anjxN4Z20SLCHOXZ/Ow1vWMlFFjXL77nJpaTZPXlu/pCgZ0b8bwgHxT7QWi7M34qSfbniR
 aL7cc3vE5O4V8V5TDm02JBN5YT+GUEkt5A/wJhcRs5+ulIM6WugTeEVMov+EITHJnbXBftCALwb
 PHnUVJuOlhscwMTScuWbL25Ghr0nuMGUZPQm84Vt
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87A83A4C6E96;
 Tue, 27 Oct 2026 06:56:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39032)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLaAO-000000001Q7-1uOp;
 Tue, 27 Oct 2026 05:56:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Tue, 27 Oct 2026 06:56:11 +0100
Message-ID: <20261027055612.16492-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 1/2] package/x265: fix build on i386
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes build error:

[100%] Linking CXX shared library libx265.so
/home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
common/CMakeFiles/common.dir/x86/pixel-a.asm.o: warning:
 relocation in read-only section `.text'
/home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281
https://github.com/rpmfusion/x265/commit/acff0da237beea2c1229d743a2eaa16c839e00b3

Fixes:
https://autobuild.buildroot.net/results/6ab/6ab6ce2e82a4ccd9ca58b2233a3d496eff697cdc/

The oldest build error of this kind dates back to 2024:
https://autobuild.buildroot.net/results/5a0/5a0040e1a5e352fdc7a37ac268083466ad80404b/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: split i386 fix from version bump

 package/x265/x265.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ad4285fb16..fdbdfc2cfd 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-nasm
 endif
 
+ifeq ($(BR2_i386),y)
+X265_CONF_OPTS += -DEXTRA_LINK_FLAGS=-Wl,-z,notext
+endif
+
 # disable altivec, it has build issues
 # https://bitbucket.org/multicoreware/x265/issues/320/
 ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
