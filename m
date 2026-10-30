Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165AC606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 22:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FmlwFIx0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZlJe8YwG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3BF40B0F;
	Fri, 30 Oct 2026 22:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sT09M2ryQC0; Fri, 30 Oct 2026 22:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A803840B09
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793398840;
	b=mojUSSV1G2grAaSer7vlod7Iw5tBoVp+qdicJWu+k+97EcCqiqvnxyyCPKDT8O5PuVhG
	 78FiccSmh6lAuOD46MRX1ntLYs6eDXbld9621XkqoVpfoN5ZSAyrJJu7q0RUVHy94gD2q
	 RcWoLYrLvHN++hU+XkjTQ7tJFajp7iuaNgfoSYBTfuK2arHvCQXDnHEcHskgEvC8pkUVS
	 OfzZ/UDpXb9S79UXvkD1Olgr90ZSXr+e6uoGm7CctIM21cOhzHF4LKmxynU5LBeD+ZyJ8
	 /RYTGX9ipVIJWEDZyXlAvn68pk8XKHT4GlyH4AsMHNQw7b94OX1vPCtjg3N+AIfJaCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793398840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xcjWSX+CAQox8QK0Yc29ANjgvYEZ3C55pweJz1ni0nw=;
	b=JqJ5erYoFKZZH0REo0vk1qzH92zPoT9U6cg/EOuX/QeSxFF5l3nLfRTU5R1L+8c0WjYa
	 JkPPEa8zksHbR1W00FefTDRQDpEuLl/3Cba2gLn1lQhBn1mPR8k0gGmzCFR7D4gX0DWw3
	 61qk42x1kdakwHWklydgEirhKLinUrqk1HAwRQs+WHPEwnm8VvWUNjl8TTHgpXVYsPdGL
	 pF2vCjnkjOxJ9qAa6Zchgx7gqveGLwhBBnNX1q+z5O3N9jz2OO/e56Vb5CGZjlvxxD4w0
	 mURRUlhO7EEVCeJc3et5BglBuPqfIyJ6V0AeSi/9E5PxcjrAjE7nEpgpmBkFfmxeqZg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793398840;
	bh=xcjWSX+CAQox8QK0Yc29ANjgvYEZ3C55pweJz1ni0nw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmlwFIx0ID2YLUa2FbS+0Q/0m8C+pAxCdsW0NPa6HjRYjHukoM8wm/W5u9CMQwqZX
	 eNAJOLXuo9PULwBnpJq7EitXdsnYqJW7zjFh5EKDxt0nalx17dsqiiSp7zzHsm7Vqb
	 NDswzxH8D3HjdVOQ1r5ImQaWMBupxb4++T99o8PKBFm34RhVU17wZt8XV+w/ynTXYV
	 xuAu1/vbhu/4Fg8YalLKd3/aMnQuFqZjJ5qa4AkGKzCu1HjG/AJlLv1CaA8V1eMkgR
	 hXdViVoOPCwmQ/INDX1IpdZjUlC1NGNKgQSThShEnSH0hKXF5/HVNiYe5Ex+o443vJ
	 09dqutL/eP0+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A803840B09;
	Fri, 30 Oct 2026 22:20:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B2B92AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CDFB60AA9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjJ4_EPQ-v4b for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 22:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E75DE60A90
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793398838;
 b=sU3VxKsBpZ5yig+cWmamQdVrIQmNcidyS3gH1+LUwhQAbgoo+HdSNfty1LqkVc7+dlDp
 pzSzqPq6ZbNQjjHjxVszbGzVUzlwUA/dbEJ+EBHkxn3Iz6stZ+cCSH/cb+tlI/44QLNGL
 8TmbUClLgRx3JrQpU/20BZpWJSq3ALk6buY81JHdUM/D5zg0KtZDTKcBFxs3bzwAWsbKg
 y0Gi8ZkesN3mj5tAOzQe2NilIamnHjzAz3V1buskYM7Bp50CO3UXuCl//4ruWSgP1viBy
 PGxaewWxYtGmpO+sEFtCLjsDLqwMzGrDqYddEbJQHYUujFINJDMCnUJQdGvftFGmpZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793398838;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t4B9go3vWKAjJVnhkgXSpRrogd6f331oRojtu5M8QGw=;
 b=fPpKPhraulrvFucgEyhAErhwws2HsU+gM6MspN2KkeV8lE9WdD8amC0iH2O47wq0yLy7
 wMznB5DxzFtM9DVJ3PB5v0ru2aQcvCgAne4IkYrbLUxiNgZyE5eK1rMsiaDJA4QmUgOMQ
 CiO+twQxGClvFviknYgh2oSoVPygkvOCO5OYlJ/Lx7C5dUrD9BAJwFCk/ZDnmNP3/0Zzz
 bfncbZQzxzJF3XkWhqRcNDR5Zps37LfParv0DbbZijwEkuaL1Tj8A38Cs0tbhBRjZEgPk
 STWOhpfXI1dBBt4aZH4zozCDzqzyVUoW39O/rx+xYFuLM4kPUBjaXJhpCx2aqHO+kWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZlJe8YwG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZlJe8YwG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E75DE60A90
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793398819;
 bh=t4B9go3vWKAjJVnhkgXSpRrogd6f331oRojtu5M8QGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZlJe8YwGCTeCKIYIOZ7wPIrcgOovWkjkANZrNUqckvhrdHu/WCeBmmFfCFepGHsXV
 4fp6NXXMx3FpUAdCqLbS35tluM5wczWPzvfTsARjN3W98iDhtRMOLWfvnH127SjqEY
 mikXc1Ck4JUy2WJ4keoT4CtI006Qp4rXPVdU21oEHUowJ9aZt5gEZRxWie+3x+N93k
 rUaas6/J0wbdlTO0CKRyvDddUxyfve9Y36CCGHeQ636GOX5Kcd45/Krm4zO392uOxG
 ZkuR8n+XqeBOSFiT2NLdR7S+IktNWOamXp4cbv9n4Flzb+R720Y3WPB8vwucC2msL5
 e/7UBCerFcSQw==
X-KAS-Sym: v3:f51bdf72230551df:Ufy+umaY0aXg2pGF0jgD59Bc85Y+wg1oM1/kzTqqu+mBM
 dFYHYAm9Fh4qui+rqGAZHHesZ6H21uLiXsSAkIGXjUtRqqCiKHbXhyIj6JRaFK8XTriTyuqe/xC
 IytvUG3P5TXLzv+lIYUhKDglkLNSIaYT7O8s/EkIuSus+IUF31qSbG+vqMc3S1LygJvKuuj1CC3
 jqLfY9AAI6L6su+dtGtIbT9QtleJ1+VAY0h2wyubGrUTA1erC0jXuSmtfInIDMO/xyBIFwz4tNj
 7HENI/JY9N1cXl8nC01dEcHyCGeekx/F1GFM8oz5U5LNpHtniMm3kmCh1pNceUqmnJ8o+R2g==:
 eNRKV7PDLxifvLgfCgwrqsAc7FGH2kEZbNEamM0//R4aav3Rfpw4dtIaSq2kvIAX3Ua5b1fWuGx
 geqq8R597GSGIPX4dERshNVajjLgdBSirAHUtIsrMSxEA1sd8+2zl4hV6Ie3gl2SEY0cKO/SFRC
 Q4lGliOOw6NDdjv6L44zwqX2M7e5KXv8UMpcZbc0JkYYWs06Psu1sIQOMWRSm8QCGQCadUSz0UD
 +c0NgMWCP0piySR8SYFz1hhTkVRaxbOB9NKV9hHdymalNCx22pAIlXbxBVaw4G9LfeHRird4PnM
 vgtbOXXKu+BGdTyl5MzN6fOGjEmjrIpx7mAcezxgQt6k2V6SbmoCZgVvTN8nNzzsoReVkaTCtUG
 +6BHI9FUu/MOMj93IVAxaWq4jeFHPYSFqfNrhq2HiFTNy/On6frCDcM4q6VjWzRoeOO4akPsGRb
 BcTug0rQTEV/dPyu8sxZSzARc441uFPlLVowG2Un48NAv0Gw6ke4PHr5KAY43wsCneQBI2q/VYU
 abTXyt48f9Nxj7wfJtXr6SjN3KMnTXhSPiWKCKJxB8XyWYvUydtrVBzHt4zq1dpLaCRb3VzJY9a
 6TUYiUJX18scjJX753BPePUnnMNhRyCzD1+9dH47T5CrsIPC6QVPcyPQft4=
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62F1EA4C0CA1;
 Fri, 30 Oct 2026 23:20:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56238)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMuxO-000000005rA-43c2;
 Fri, 30 Oct 2026 22:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Fri, 30 Oct 2026 23:20:18 +0100
Message-ID: <20261030222018.1092294-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030222018.1092294-1-bernd@kuhls.net>
References: <20261030222018.1092294-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix build with uclibc-ng <
 1.0.42
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

Build error was detected by the Gitlab pipelines:

  Compiler lacks support for C11 static assertions

while testing the defconfig br-arm-basic.

The build error is caused by upstream commit
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/0d43adcbef9a061c95db60eb351937c27e2a0609
which was first released in version 7.0 and included in buildroot since
commit b68bde564339e96397929b45c04d137bb65df43e.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/6c31212094f6bc84e21d23582f366368beff90bb

 package/ffmpeg/ffmpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6eb3afe277..47cf560b16 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -586,6 +586,9 @@ endif
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
 FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+FFMPEG_CFLAGS += -Dstatic_assert=_Static_assert
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
