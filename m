Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF0606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TNO4SPk3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Whb7XYqQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD9640A92;
	Fri, 23 Oct 2026 21:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bN4-VcqefTQ; Fri, 23 Oct 2026 21:17:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8544540A93
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792790231;
	b=rCHDoaojU5QhlWM2QlJgRohOqPQ5Ktu7PTeKewErPPff3RGxHL3zO5jKBG6Ry8TwZ6kS
	 Zhedi4BtsIvXwLWG35r3CRfHgtoEz9k90ysKXpXyp9Pwq+3Q7gkYYaMFmHjB/kOX6wyAt
	 3QNBf0MHwbZqYrCVO+XefRPXqiOJvDWeiHWo3HS0SpaSgRi9JaidML5nq9rrT35siIm8y
	 /8MwWSfloDcf7iaCrBi1A8n5Lcl9tA2WnUNcn9wU68qN4yDksH/nx8bNKauU4yQdHCu3r
	 bJm1XExW5QqOROaqzF1iJX0GBSaq6GjoFxxycRaeMgoRzvhdAUUypObdq7u3whFvOmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792790231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ycZuHZ0thVvrj3o8+xEGEm8X4H05AdDVw/z9b2D2IGE=;
	b=pPrVGYN7S2Z71tqutRR9CStnwhTbhJsf1+XvO/o0mhohKkEeXWKgARSBU1q2SMrFpuYh
	 eqh1s3uHc8CFUDfhAO8LKdmuY7XlNr7CfXxWx/E6qJzAsuHgwXQ4h8CBvi3j6nfcmVk9D
	 ZPU4lOgYWT41NgVkQIYwr+VzP2Qtb1fLwgh4ZkxK+xVxsuoatCr4TCZLXwf5Ww4BmiTV4
	 rlluCRGgo/GjE49j1mM42XxPbSxhb0OhofPLvFTdBoBiLxuLpCtyUOsq3ZcPJ75kH+zdA
	 MZeHX76/2t415majRkr8QthGSbg3Ig7s1zkr+O1DEImPVphdDJbE1bvHfosZ818wUXQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792790231;
	bh=ycZuHZ0thVvrj3o8+xEGEm8X4H05AdDVw/z9b2D2IGE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNO4SPk3ipJ8Zx0tQiEJ2KYmxtlMpQbrCJltXgshxUpBEnTLh1i9RmmEezDZqoE1H
	 70kbRa6qglsAv8n1pbpboh5SSVOsZqrjXGy68OaIy8+dkL7QgxR4ugsrrukV3sxO+F
	 Nsu0MI6j8CLOV+tqVzBXJ6lc9eGC/OV7kXAKDMP23fIxDSdUk9qwHqWRQZuPkFQjMd
	 TQpjLF/q7KRQPuAzTSo2lQAoE+K1gmxBKeungBA5RC+rHv4YGIenf9/VyfkwO+8RvR
	 mpMVmBMk1qkNINLqIMkm1fSZrGoAB0hVv7jRfshm7BEeWCEzWBogDtpmJqztVkcis6
	 AdgTR6Zv5dWHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8544540A93;
	Fri, 23 Oct 2026 21:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB87371
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02FBF60A62
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfxe--NXAXwG for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:17:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5CF4760A41
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792790228;
 b=hRYHkcCtMZRDvNHvtbW2ewgCayIpAcebTYqvGBlv7+J5eiA4280P0/g5ZoRme9X6JqaA
 pxP5/WpBIcT5W5Hrp49JOORxuZdGyHGQXHMdrxTdU2Z8VFpDxOMvTAiw7JfCbfx3UGGEf
 uCFF/fv6CIzk/+h0QpLBFEIcIiweQDS9HlkVy+GNrpzqFAcj6nlC4zoFSo3pMXRc5F8Zl
 Utbk4WLrBopn9k6fmJKNdMWf8vriZ8cMUO54D9X9Q+oFLoYdqXiD8AsFG9yoriEVZSAH5
 ZlkBZX4oZ7x78Mz22MbNLeuAoHAdP280e5OImjX0fF1M0j+1bZvGNRRVyqLcSGYCQgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792790228;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iXd4X/j78KS7aUwv6YVa+rU8S3zN8d0xDLk8r9SMt6k=;
 b=jKihAE6M+7ucvz3Qdj8nj9X7IEZ+nUv0E7Ek2VWSQy6QsJHPhfWEG7cGEu92sRs3l1Ad
 HXw8alkF+7Daqt2xM0BC5fPbkz6eQ8Fw7Oq+7wnCpAofhKvqJxqs/1QnGj8kmJ6DKvek/
 +jEeP/XratGzXIXLHswSGCQRsuDKBc5gOS4fBwXTqngrYB3vDhtgHBqzHmF8Ugs5wpGKe
 dgmC43OwoTsjvET9G6EqBnoSdIU3Y3V6TggK3pOPrHWHj+bKVPer6DjMqtgRQD2uV7P6k
 /SamxZHIgR+2MCBBLJO94UMNijYuOhN8TqY5gOj18r2nXPGvL3/j8nwVjaO0HUMNIgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Whb7XYqQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Whb7XYqQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CF4760A41
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792790221;
 bh=iXd4X/j78KS7aUwv6YVa+rU8S3zN8d0xDLk8r9SMt6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Whb7XYqQOldgQcVO9wXIb0ToQZmKKpVc8pmryZpXYEfi8MDWHHCbOD7keRhc1T0/O
 F+/VpqrOdDks/PpDcCJ+JgTReFQ7+LPKmHCzLbC6rvVh8Ki9kEfZ7IgcosAOTZU9V7
 O/JE/dDU2mdQTRsTlIvwwNFqFBXYUPTu6gP4KG8Uj3Iyxii4D9QGrHUKEdL3CqXhDb
 xuKwJnBn5p776+PolgvUODLWmQB51hpXcyCMq/iWvTcV9tiykGDSZbB/EElKuHewNJ
 9nRsSHAdmbPQWKfmOA8NV/mYs6fNjLckEkelN7Vb06u1UhEjnCONFwyiFoc9VMAi5u
 NqQLOcG0eKk7A==
X-KAS-Sym: v3:f51bdf72230551df:YQnrCVOyQTYqHcX7/s5yotzTnrVz65+Dzp6MAZJ+SVYAZ
 FfXy6c8x4QD3oOA/6VMQJlxhP+bhQ6ku5NDC2l/n9r11qYAKdcXLuotMdBF85g3NTWv2f+tNs3Z
 +ScI2dQYrWUxgEnjKZpNXqu9rp4TuG1CgE+CGfSmRzU0CB4w4X6f1vObzjTrX0gZ9twAGRuIYWE
 pP3EUkO4N1q0JVwHe6KVzeYwyIUF9JsZJ5P+kVciIGvKs9ETulcxrjtgfZaatakimoOKpkbqCfw
 sWNp6hwY6fyz1Udjb4VJK9FcXAMv/mS8QbDtTBhSdADn3xBP3Pt0ssbLdetdlSR1h/soPpAQ==:
 2jR/uk3N5R0aAUTR7ORDgVyAMV07xXuerFyDeMcZi9Hg46t4II0xua7G8gWz3IcOPA+92d5pF3c
 +Pgj+P+h9DrIb1UVuuWtl3VFUw5zWFiXVMdUIJElFtjQiMt6KkabqgbXi/652pQuop3f7Z5a2yk
 KqhMj46x8dzo+EIClX14iaROykZu3X+1f9hxlS3ie07YgeuOUuzEkcSsHdJDHsbpmuwwv1ynydV
 e/S8JNgvfVNkGv5SuQhocAJDjNL2QIrOpJaogh6Z2NX4YMliwbqEv+DIgoQog7seA2oPn5zUuUU
 CZT32bFZ8bDi3lfE+Bz72B6IeUgpAFPSdQl35NoG6wzfQ3QRB3aGVQw0+27RIg4sj/f1gAA3jqD
 eVG8FujCVj62zqoRW63tRM+bHyoL2cjSLrSlaJAdlJuhM+iQn+OjF2OCS4FOzJSXlnf9ja/gn/U
 i5scWsHftHyMh3nq0N54Bj65u9wKitoKfxyDSkw/O4XC1ITrvVeCNYas8fV4Nii60xu5Ne4rL6K
 nhPSQxvymMo2S24csVxk7Lz4AyPP/5TaH+gJHfgYWgBP+dINa0j4Vl5Hzzcex8+EBOGAgeeBxsq
 vTvC55Zkyhna5Hma+2I04SNvmtOYFeBI3W9c0YqA5mSrkazSuGpxrXEVLubq917feAmn2dOWRgd
 JigWcymnu6zmJHlJPsQ==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D27F9A4C6936;
 Fri, 23 Oct 2026 23:17:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50400)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKMcg-0000000069z-1FJA;
 Fri, 23 Oct 2026 21:16:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Oct 2026 23:16:21 +0200
Message-ID: <20261023211622.2096562-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023211622.2096562-1-bernd@kuhls.net>
References: <20261023211622.2096562-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 4/5] package/mesa3d: i915 Gallium driver
 needs llvm
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 3e296a151195f9d32dbfd62d6c75d08b822be6dd bumped the
package to 25.3.0 which includes upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b8b38d38b1c14b60de0324ac2f98ff7f1f4cc3c5
that enforces llvm for the i915 gallium driver causing configure errors
in buildroot:

../output-1/build/mesa3d-26.1.6/meson.build:241:3: ERROR: Feature llvm
cannot be disabled: i915 Gallium driver requires LLVM for vertex shaders

Please note that
https://gitlab.freedesktop.org/mesa/mesa/-/commit/4235c39a9a8378f1e2dc0899dd4c3c941f27b887
later removed the llvm dependency for the r300 driver introduced by the
commit mentioned above so we only need to add the dependency to the i915
driver.
The configure option draw-use-llvm is disabled by default when llvm is
not available:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/37c7d19e46a4863c120186a99ac0344c2dd31260

Fixes:
https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes
v2: no changes

 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e18d25eb8e..f45a675445 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -147,11 +147,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
+comment "i915 driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
