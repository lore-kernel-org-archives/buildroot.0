Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5062606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aoX6d2mb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4486404DE;
	Wed, 21 Oct 2026 19:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sxKTyKS9bR5; Wed, 21 Oct 2026 19:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A0F7640E4A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610669;
	b=PNvzxHLZqDmlPMA3aP06yw/QDIgjpgtAqD1W32c2oCOqqL5VY+oHDa418rZ8mahFyIZz
	 yaiHwsTscNTQKeNJuO6ugDgfD9Y6sJg3dSNlzFdTiy4aX3hfvMKojcRLtdNt8n16tFMJa
	 yv9SqxYN2EuL034sC4Iv+xWbROjW7z7BxzCDuuaZhnPcXMELWPVNwGnmfhpn0o6GN2DVX
	 1ywEUSUYjFX+HCbY7FLyq3oJrSdgX8SEldWRLs2kReYuMTD0CKuO5lDTOrCEyCFUsnofG
	 EYdsNj8bh2XNlgCr7cfcqgEZK0zV9TbRtl+TpyVygVYiT8Arl2GDe9Z97GM9BkwqLwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610669;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WUmzgglcqnUxar88OnPGJBEWkBi3QGWrveZ3h7xUYBs=;
	b=TAj5nEGF/ZuHNP0/kjBovt3Mjwy4Wbewp2cUhPWFgvba6orHSOdYZQIhQNEpwte/nC9X
	 njekW00g+JGWUiDZYReB/lL4RiUXeRYa8zcFOyDfccUWkqimfVT2TazkEZcj8u3/GRPli
	 oSQK+Z7thoBxfvs+gABTGv+gn8Le2RXgqhKjzdG1jXKDnUwhGOl35UEsBbgoUI1kDvcy7
	 7u2fFtCN8IU0TFeOwaSzi68e2q2vjOWDnsG8rvZvEkrSsZLNlaz30d72T/JTn9dWzZUnI
	 JmYEai58srr/3YKGZd/o2xK/QST0XpYMV8+RTJRXhfnHNN2DP3D4ytmT0b8PrtOAm4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610669;
	bh=WUmzgglcqnUxar88OnPGJBEWkBi3QGWrveZ3h7xUYBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aoX6d2mbpTsVW7yihnsx4jbum9Jr2eIqUHFyZrInGaKaYsAVdhirmCxmvITmxatTM
	 e1/+REeugrNTbG9dnweH3NlO0esblpC3wui8Fs45qN/hSTvzmiwqMUJFM7tQPSLWaJ
	 HZHwcojK6oksY5FYUPD5y/hvhnYvL3laqXO/wshHEEPESgcr8EujPqWt3oP8sNJmsS
	 71Uyfmll8w1kG8kll676J3phLFdI7wB75d9jBWg0HzMigAIhRYG+sASLSlm3Wfr2wJ
	 jjlEd4JbMKZ5SHOfnAr15kU96eoMqb12uOPhUXeYKRtI0BcPOtyFKfUvOg++u180Xu
	 41STcZMzoQLRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F7640E4A;
	Wed, 21 Oct 2026 19:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C76A3C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CEEB611A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2Q3-RJ4BiLX for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0FCB1610BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610664;
 b=Gmpf52qR/K4Y+FYJQqNesZkh/e1TmH/bNzvj5Hm0HTsg9lfiAArkG92JjDeoTmYrTzXs
 jco9QRNsfVB8PsnGq6k4PkZCGPfpbc+6VZuXp37H6ZCInb1M/pi5+zG3Fr06xB2+htlXq
 R6GdYSQaXLIOJXFO8yF2t6ui/p3u1+gvsoXzr9r/kcR4cn25dchsN3g6xAwIKSplTVABm
 6YbQAbHpueQDA51IitB+0dSh2a2TzBSynZeaaBqg01a1LtlhcVjThu34Wwcb6ffrqA54n
 lRMyjwG8ViAlpQUKpgPDyy6CxALD42EG4L2tkckR96T5I1hjwsG9J2FgwnG8YiK7KUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610664;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5tgVh0a0fwGH9WYL1DfQI3w5GCX6IesvltqQX88KgqA=;
 b=mUzcmLmXa9Fha12qezi1b/CJLYhA9gp13YZHY8ISo5nHE1DS9Yy+H1ocoU7m99I2T8wW
 WhzsDs90RFdZVypzpGnxUdxttCIQBizmFkYxLKXVPiXvGXZ129EYlZFA81T8vAOL4RcVS
 8GSxqPH2nBn+GuXJsCCZW9QW30jX/VhY7E1WugaSwUM2w4j0OEfz1m91wOvOw1xNCoX0G
 oUAmxF5iB7hhbQ/y2HRrJpm3jSBVBuXmbUMDdplwi+LmCYjEIAqVQg0auuT0jkcjmXhPx
 KqAPPJCRK8KbX1EVO80b4SeSYSdX7I1jNtqCsINdxQI1ve2MA1ic0Xg6d6Ul+DVdQSA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FCB1610BD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62AF899AC1; Wed, 21 Oct 2026 19:23:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:23:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3f718b33612ef2ab09640dcfd41cf417312302a
X-Git-Newrev: 75a1aea9b420ac97b9dd3058db172e6d0c46a812
X-Patchwork-Hint: ignore
Message-Id: <20261021192300.62AF899AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: make sure installed .pc
 file is correct
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75a1aea9b420ac97b9dd3058db172e6d0c46a812
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The libxxhash.pc installed by our xxhash package is incorrect as it
contains:

prefix=/usr/local

while the library is installed in /usr. This causes for example a
build failure of libplacebo when xxhash is built before:

output/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR: Include dir /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/local/include does not exist.

The problem comes from the fact that the .pc file is generated during
the build step from .pc.in template, and we don't pass PREFIX=/usr at
the build step. To fix, we pass PREFIX=/usr during the build step, not
just during the install step.

The problem has probably existed since we started installing the
libxxhash library in commit
cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8 ("package/xxhash: install in
staging"), but we tested in 2025.02.x, and the problem exists so this
patch should be backported to 2025.02.x.

Fixes:

  https://autobuild.buildroot.net/results/344af8504a77ae96e4009d76a77572180cf49b14/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xxhash/xxhash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 51bf6ce855..fc2084c878 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -31,7 +31,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
+		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
