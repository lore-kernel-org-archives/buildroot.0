Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C5606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GxPEEHVk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CCE160BA9;
	Fri, 30 Oct 2026 14:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_kmqogckbNp; Fri, 30 Oct 2026 14:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A04D460AD8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369308;
	b=d04LcFXd7Z4Fj8S/mHhS8lRaG53Uoz4fQ4zOVDqf7/hu2HSN3MTgXhd/d6yAmusbDe7c
	 SM5xck7cGVWIBt9eApPkAuKhurd/EjdjfNEkt2Lpp8V4W1ugfNELGHs7J284UYexbU9aD
	 gXiqNNNRzWZrfx9brSxnM68owcg0c1otRZTlmkzuca6NX/7sk3vhvXOktcMxImNEILiO7
	 yu8NBcxoxJ9436Ull90ZI0hfuztB4O6+fcmjSIaBvH7ny7XIm2ZvYGFju3dXwkc+asETl
	 Z63YXHo9umJgAZRDrciyGt2lvMcYUrg39f/0ey/EDboMK7Na2dt/7p/tOxAe7CigJOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Anw2Nhtd/f9027QIkZERPPV0J719eL17LIgDje0YAe4=;
	b=DveniMB+IHJi7z38aoXMFLgIyB3Ri7xioSRS435XljPrxhxlCquD+P2dyXZpKoyposNh
	 QN8HDWUmNsIVuE7VDj+Xi5AVEa3sT0TKQ0LKFr7CRTf3n/4gF4T6GBcv/FS7XFnOukD7u
	 dTgl36QcJPehQgsmDjKcdtzAFGdpNsEz4FK+iZPKYeCIo5gbdHjpbQLepLduTiMg/sTUt
	 G19iubN4kEtU4yZGPSbK5YcYqFndKI1BHsLoRS8ZZ4tj/jQvaofg/rn/pUCaRnRbHUnae
	 snS9VNljU6tudc9a0NFAk5Aab0t3aDIjub9cz8Xcu1jENxqpqEFCCg5YRytGS6XgQCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369308;
	bh=Anw2Nhtd/f9027QIkZERPPV0J719eL17LIgDje0YAe4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GxPEEHVkskmnJJjPrpczcX2NJ0OxxVkqZhBxjCl6kkAijQLpHUIxQXgwU/wemDU1A
	 g8Lg/ETx8QIipTH2P0A+Ry7KAprDyEt/gK4XOYm9uDc99rlUKTDsma+l3MkIj4C+3y
	 CG+5LHo3YnW5Yq/wYKH/mYsy8U5K6qQb9o3S5PA9b9xmgw3rEvZTo1QKtWQ6uBkDPU
	 jQY+vybSjSSPD5Ece/eSC3q7haNHJa3TVV2LqbTyMDmbZr6ytIQ/A1y6vpbRQ6eK1r
	 tqsotLXX42zelOfqn4wS8sowOvL/np/2/VN5ucya4vC+4C3wWb5MmXp54z+4lyiMgb
	 JqaCVEsPF4lSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04D460AD8;
	Fri, 30 Oct 2026 14:08:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4ADFD44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0AFE607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DopsIOqygGwU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0EA0860AE5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=Bw2URlHMrzUzTpPFkbcMyNuZAVHRkVI/Js+cCd2YMeo+2d3cQg3PbCjPVXyW/+S7tnxB
 Vu6Gnqye5RUM49rz3g6pKPHWuh9TjwqGGdDgPJ+qJg8ToO+jJtAsOSdpRX5s/p4id5AoX
 USG562/cY+VrbQTHgoppIJ5UoI83zNiKg5+wBZukHGZi3LiuFmT4FNSp0ty/iNZr/+FFh
 z8wMUzGJtIjb+qGlnU7NiTBHHaI9D8ScU0EQLd9zWs4db5Sr3FHe0KpNM/aOAB3p+1DZs
 UGfR051AqYGA/QuWvKbUGQyCn5yESEUwXfnLHJC4GLVPNhACV6J9En40QPZETTBA1GQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QQZi4fX+SRZZpEUsrGt+loodjaYcCKiaojXsbxbcEhk=;
 b=VNGyA3VyJwB7zKYqHqW5RcKwS4rRKqMgv4ZMeletUPkYVLTgT5TBvBEjtk9YAW44e5Uc
 TaA2G0ECFO5jlnnJL/EocZ3puwWcs5UvAvrZE6BFwNJXBNjt2BTF+ASAMMWE34O+pe7P9
 NoCcsf6wr+UBarY+tXHZLxOwjqmurYz+A1mcGJlCZtCwRRXxfSapi2RryLlvZhIWdPV7G
 O7CHyY8SLJrIIkDaU0QZRBXmtSbeyJ1j4maZL86/29Wd/qaUY/eXLAvG4baW3XR8qVPyo
 h7WhttxtaDnBaaX2owPmbY3TCKRCuWq1ylcHzlvnExkWzGuCoUo3s12M4zQ2uj7KPHw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EA0860AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D4299D38A; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 63765701c65b00045e1f7dda3d451c6dd3c86808
X-Git-Newrev: b7cae2efbb4e4785ace024767d2bea7f6e0fdf29
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.2D4299D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh: fix
 build on MIPS before R6 at -O0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4803932547153732324=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,WEIRD_PORT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4803932547153732324==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7cae2efbb4e4785ace024767d2bea7f6e0fdf29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

openssh fails to build on MIPS64 (n32/n64 ABI) before R6 with
BR2_OPTIMIZE_0:

  during RTL pass: zero_call_used_regs
  channels.c: In function 'channel_set_xtype':
  channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408

Since version 9.6p1, openssh builds with -fzero-call-used-regs=used if
the compiler supports it. On MIPS before R6, gcc rejects this option or
ICEs on functions using the hi/lo registers (gcc bug 104820). The
configure check usually catches this, but at -O0 its test program
builds fine with n32/n64, so the option ends up being used.

Disable -fzero-call-used-regs on MIPS before R6, through the configure
cache variable already used for powerpc64le. This doesn't lose anything,
as the option is never usable there.

This issue has been present since commit 3c047ea463e2
("package/openssh: security bump to version 9.6p1"), which switched
from -fzero-call-used-regs=all (always rejected by the configure check
on MIPS before R6) to -fzero-call-used-regs=used. It therefore affects
2024.02 and later, including all maintained branches. The cache
variable only exists since openssh 10.1, so for branches with an older
openssh, --without-hardening would be needed instead.

Fixes:
https://autobuild.buildroot.org/results/68d260341341afb0dfb7244f641f5196df3649a8

Fixes: 3c047ea463e27ceaafde76d64406862c3322daa0 ("package/openssh: security bump to version 9.6p1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6b111651fe6d4320819536c4135f40dc240ab4af)
[Raphaël: fix conflicts in package/openssh/openssh.mk]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/openssh/openssh.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 29e29008d6..c409ddc836 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -74,7 +74,9 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
-ifeq ($(BR2_powerpc64le),y)
+# -fzero-call-used-regs=used is not supported on powerpc64le and makes
+# gcc ICE on MIPS before R6
+ifneq ($(BR2_powerpc64le)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
 OPENSSH_CONF_OPTS += --with-cflags-after="-fzero-call-used-regs=skip"
 endif
 

--===============4803932547153732324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4803932547153732324==--
