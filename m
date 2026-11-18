Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E5606A325
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y2sdA9Tl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BhGxMXjP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083F3606D4;
	Wed, 18 Nov 2026 18:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY6d8nrEJkjg; Wed, 18 Nov 2026 18:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 027D16068A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795025709;
	b=CboOwTFUMDmFq3aSjErFpoddPsKVTrtM4jnPlM50IqkHDMKOrAHksV9ZyVEFDqNrciwu
	 yO3b6VLtECVdHhc7ulCU+qSy1tqTlDPg8QFOXAP3TUPR4RWZ+u76wOFTRw64jWNjdv2fB
	 UU7mLy6RViEpXkq7fshsn8uXPKcjjMnNXurm9wiW6S1mjRrQjRAcKVcFHGN/fZJXUoAct
	 fd2PlGcEAflvkFXNPBlbYntyqB87orXI+cay6osUAJWGZHbsCuPnZ7QU7QX0coNhByevZ
	 ZgyGoZwSBc6G/Kl9WrK2q/cC+f222gMocGiNkEycFTmyZ4cVz7jcZmRX2yhhvs0bldQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795025709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bShaGoNUka7L53OwcEsd3JJu2wFOBmV2dtDZXJLvYCY=;
	b=hVKhp/ofBZewtcbje20j7yhnc/sQ1WZG5joZJV9icWjnAupomTdij6mmmTy5g44xuyq+
	 KwSH3QWJbUQsZZgCfd6Afz+zAyw1JQpG1aUU2um//1dJ6gg1blGBDR8g1nadmWdJqrLve
	 H/q5mevHmqoyQBvMsUOgwdK0z2M7SMx/cT152CBRr23dmYOB7wVEL08VgI7GvaRDDkYYf
	 6uFBYmR2ZpvUVcTRoxopFLApKPuejYT/V6R88zd5AMsQZP8xG4VsC8A6DeUqpSPBVK7ou
	 TpmxJp9LlA8w0E2F0Fy5v4+SKPs7fdxiC48UH35hVdeqWFsDJFCG1+I+VhuYWY2FoLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BhGxMXjP;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795025709;
	bh=bShaGoNUka7L53OwcEsd3JJu2wFOBmV2dtDZXJLvYCY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y2sdA9TlawVuH/mfiGZ18dBac5ErqDDpVGQZq0LC7IGjIZLLPZ+vVXeb3jpHl/I5A
	 98IcWi3V9R+Awkyd/Ygd0u3Z7NTqWrxbFdaNTBrFnEpV9bcN+sBODAu+uKXt4kp6LI
	 7JqStb6/ppfplrOM9EUaqMMF30+vCCcTXW0VUdfAJY9T1eSdd7uMk2IrTqyb0JErbo
	 mU8dHGF28f0KnTlcd/K2zFGzS1BN+aCgeXFYgKofa1iti/RHFPzhMqP+vl64fq+hjX
	 HzSFG6DHdN7eZr9lUW7yKvf6TVUlQ5akDFt3PzIz5paTpVMdf/Nme2X33KS0s1cTT7
	 VfSwQY/3VO/9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027D16068A;
	Wed, 18 Nov 2026 18:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C4E49B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F4916068A
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLwdS--dpDVb for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:15:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC68E6067D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BhGxMXjP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC68E6067D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795025703;
 bh=nMxORavwl4o8OgwDStMRR+XlXLX4DYeyw1yz2uFafjw=;
 h=From:To:Subject:Date:From;
 b=BhGxMXjPwgfrjs/jQQvJABlpz0hMmD9NqzW7Js1FH29fgqXD6Tlona/J6V3rhctHe
 u92V8ml608i259FJJ73RxkcKcwmJYNyI1W0qM5RJyn85uU2oM4ZCodxu5dKYnIERFH
 NuIFX85ZAkXgSlrIJum2sEg2vo0rcK5j+WtkivXrec70CtFljb0WZfilIWLS6ehrBK
 JliTSCYZXcOKK9JtiBWeXIQpO1wuBWZFW0RoWogueZdNyjARnuYOXOrdfZ2agEbz5T
 G6rtzfNNM3DldP3+VQsT7B86MkuBrrcbEX6rtd3XoX387rXFsgn2jgXPIOYky1EolQ
 HNmcyLbleY7ag==
X-KAS-Sym: v3:f51bdf72230551df:uTjvsLqhVvxkSox0d7Y5XZZ+Jjs78wyiQr9ZCKThLAoe9
 MtImAfJOaooxayjLNYA7mkEcmfce5S8OQcbG5wiMB8cjcZTc4L2N5FwLT3KKCmHjLyfzy/66vc3
 49pBdsohHmgFCw7hkF7m9M0zJItreE3fgdd8CvdrV9qQyFHFtvSaRUi6TOJDbz7LkJCMOiPYwJC
 KInrMQEWkIEWvviiDWvso5J3ESIX5WW4Ox3bz4THxUx4/uYdZX64R1GDXns3hoHkczEFNsbPRI5
 m8UJWOfELDH7JXbo80HDAHW0Rav9B/ads+yiSaL3JwtUKH9KV9nJJ30SMO+PoFxMzAdfZSrg==:
 2lgiW5lVv9N/vSJb1djLFrUfvKSYd9Ic4DTLygSrhZ5TtKEBpEWD87DSkfl1kDSq05vFhVytRbu
 TiFVwjVugBcVtGmudo1S3KS2M2SzRIqIaqpUFJ4rWm/1mggRm7FF1uPBVXNZY4o0FN36IqXEtb5
 TW2kEpVToF20uSawzlHfWwDx/pYXYAVlUB8LyfgMWhQt5NsuoKldqvsZLlpCkggJYhbjvcDHf+Q
 sPDsZZ8O78FnunMNLv//Rgx0DnlUXT4xjcMFTbKhH4S/r2rAYW0LgScQBg4A8XIkqbc6pRNlbPP
 ru10nbBqw6LHvTt4Dd8WXDpRL15HwwuL5mANmOWunaGFdzuIBuNcEgckf2eAdtEq/eCpk7neyqr
 vTaNTpPQM+9f1uN9zZoMA+W2K52pAHyCrbrnzRaUnC+hvTKor1JYHExdtT4HE1zd1oixufnuiBd
 sEPgxfDgscjoZqqETClFQskH14H1/fYGLmt3zOpNN7poE5C2z0wRFQf1gm2QENRJAE2dBPWdZrj
 4ew2CiOlkd1kfkiNRZQMLbN3tcefl4yA/SiYinS4Kw5aV7UnKF86DKBw9GIFm+lhtEE0UiH41oO
 BfQ=
Received: from fli4l.lan.fli4l (p5b3a00de.dip0.t-ipconnect.de [91.58.0.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 879D1A4C4DBF
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:15:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42596)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTkBT-000000001gD-0dHH
 for buildroot@buildroot.org; Wed, 18 Nov 2026 18:15:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 19:15:03 +0100
Message-ID: <20261118181503.157176-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libmspack: security bump version to
 0.12alpha
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

https://seclists.org/oss-sec/2026/q4/686
https://github.com/kyz/libmspack/blob/v0.12alpha/libmspack/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/746d2e1815b3dacf28e90e3bc5da7fa063b25aee

 package/libmspack/libmspack.hash | 2 +-
 package/libmspack/libmspack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmspack/libmspack.hash b/package/libmspack/libmspack.hash
index a4fcb61bef..db046894c7 100644
--- a/package/libmspack/libmspack.hash
+++ b/package/libmspack/libmspack.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b  libmspack-0.11alpha.tar.gz
+sha256  1834d1079a6e8db9546fa95d3a1fc2cf676124a8a60bbdd7f30b2db4eb4ad683  libmspack-0.12alpha.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING.LIB
diff --git a/package/libmspack/libmspack.mk b/package/libmspack/libmspack.mk
index 2f64e992fb..ce1f179715 100644
--- a/package/libmspack/libmspack.mk
+++ b/package/libmspack/libmspack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMSPACK_VERSION_MAJOR = 0.11
+LIBMSPACK_VERSION_MAJOR = 0.12
 LIBMSPACK_VERSION_MINOR = alpha
 LIBMSPACK_VERSION = $(LIBMSPACK_VERSION_MAJOR)$(LIBMSPACK_VERSION_MINOR)
 LIBMSPACK_SITE = https://www.cabextract.org.uk/libmspack
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
