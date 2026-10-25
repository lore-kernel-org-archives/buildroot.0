Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB01606A321
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BDjkm0/M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC64B6062A;
	Sun, 25 Oct 2026 20:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amuTFy0QiWQr; Sun, 25 Oct 2026 20:49:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D76F6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961396;
	b=YgxrcTopVbb+vHiRH3WOwZWUqbcoMu/79uyTyDb0hNnzpdCQx0ua0CGpEtl1DOIvMgLQ
	 wVSn8pfT808vhCpwWxiSWlInbgXUuuFgrP/LGkphJgv1n8uTg89hIePAaWOOnT4hYSB4q
	 y3BEirTsVgSR2mBePs3ngPVmubu+W0wcrOldgFOIqqt3o2mFmN64EbVTSNZpN0aHTPg7U
	 vR0L7z6HHrJRaSYX14dQYTzi52CXUBUFlEv6g3r+XxfHoHkAYpjVfI8C6Y3SFNCEg/X/W
	 RNSTiOoeyG4RPzfzWYHVyITkoIoa0eEZmHRUS4MP0njFm+q2bDxyp3PNdC0vF+A+s9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8EXXTZaESe1K/eNsqmQOzXeagd0XGvS+uZB5heDkycA=;
	b=Gc48marVb0ZFdY83wqi3zlBXysmhxZzvXg+WpAER6jp8+PduDh8WLSLwzsPj9dKddi67
	 1reeoyns33jjCU+LbBr3Am61kuQmIUr88qpD/ag+txK4dbkWkqpzChzvGdG0vdOjYEkNT
	 xALz5pAI1dVuglsmd5ItqbwHp4WrkOK4Zau2t+dhVH5UyXl5KyZHLxBTe+xHM9mA7tUyc
	 DhGdsDfGxgb7uBUPDx61tKPf1AtpLZrD6lqlZX7KMSpGzZvzACuW6wR6gFocEoPzL0xmg
	 ACBjI9SlM+8y1VaPKbZkBD2uHl5AjDIhlsxsSxMR7PBpjxJZs242t2S1f1jgcGGVdQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961396;
	bh=8EXXTZaESe1K/eNsqmQOzXeagd0XGvS+uZB5heDkycA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BDjkm0/MCNmjVcxnwEWIYeLPLNtKSIHwLjx4yz4OZe7u+xF1KBa1eIKAqL2T59+YE
	 1WHYXDfO1gYHHDpyuAsCVZ70nBdR89LFpxcvq1RKVp29psjKlPtIBvyNLfXi6R3jFN
	 Gt26qLr9xvsiOXWCNS+HD12xDWAlqR7uko+AZRyb7/6iVjGY1X99jc7aheeZtL+Fgf
	 w8afQ1Q2wDSx1Ny/cEfKKl/lvWFU0N3SXP0Cc0d+KN3HzoSfFm01JD1mpL1HdPb8nO
	 1nLaEoq3w3AmEj53cV6r9g2LszDZc2AuJV6z5R5o6Z9errfrcUcArLlixBJ+QYFYvH
	 1la87Vusl21qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D76F6060C;
	Sun, 25 Oct 2026 20:49:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA0EBD33
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D74A1405F6
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZvoMuhUkmgT for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 33D6C405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961393;
 b=Sl3dXBm5fsPjz9TlnGm9rJz5gnmcjCktgUAYY3xBRNwuKtCmmeinYRn11c3RJQy8L/OB
 /JKRapuBC5AR3H37gaM0WIdCtFw9CWBk79KTjzSBcJm9nD1KEEkg6OkwcK4SLGIeiktvJ
 XNr7rwQBejlqgMRTTatXMVokJL5HMgaYP/5Y1pKcz7MlvKc3QIJty2JkL6S39bJ9V3BVr
 kkWUj8dQweZtCWRKeqzU4olfhoSE3IurAijpQCJtBi0SH+NR6rrFs4VFn2RCeuqRLbJoG
 g+tBqZN4jkBje4VN0b9c3K2nigEouFZ+uj9pFcLi1XEKWbq9QzkVEfoMwAtfYZ9Wh6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961393;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=56tv/MrjhpRKu/y8xInQcYC9UOcis1AxwNszJ6zZgzI=;
 b=iKZvppF6rf2NzgRSDq7yLU+sYgmAY4AmFgr8vLxmAUq7vXoGfEvMC1sfCi8d7jyCZdPX
 6qWHPDRYApTdfoadt40geK3WXYgQT2tNJ3TXEdvTLubAU9YCnhTQGFIjWoME9d1EZ6lBc
 nT3jxHckZGnBsKe/pDzRwlc23LYUoAcJ2/CzED4e8JM8MOZIDdBol1gAyDaYAR0I5w46i
 EuV2Pn8WHtIcexMYi7SrUhYqeAaP53m+7nOdF9vGiB9IvB6JsU37IXzQVBn6HUN+KIe8/
 hdg/M303nCmPg3MJXx/N0eGDsUrfN+uHdCp0teLQFC4ZvfIJn1KD/Ct2LAx5yyUi4XA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33D6C405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FE139C7E2; Sun, 25 Oct 2026 20:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:49:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b111651fe6d4320819536c4135f40dc240ab4af
X-Git-Newrev: 3a578a247dc13a96563dcc3574b0d4604826fc87
X-Patchwork-Hint: ignore
Message-Id: <20261025204827.8FE139C7E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/acmesystems/acqua-a5: remove
 linux-headers.hash
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a578a247dc13a96563dcc3574b0d4604826fc87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit a8b9c6f9f512 ("configs/acmesystems_acqua_a5_*: switch to
Bootlin glibc stable toolchain"), the acmesystems_acqua_a5_* defconfigs
do not build a Buildroot toolchain anymore. Hence they do not depend on
linux-headers.

Remove the symlink linux-headers.hash -> ../linux/linux.hash.

Fixes: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f ("configs/acmesystems_acqua_a5_*: switch to Bootlin glibc stable toolchain")
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash b/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
