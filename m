Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F984606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RJGSb1zQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuXpO1uJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032FA80969;
	Mon,  9 Nov 2026 18:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUc6a-U4ZBAt; Mon,  9 Nov 2026 18:17:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12ED38097A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794248256;
	b=g/Qclyym+0Azut3UJkDbS3ucxqzz0S72KqFVgbltUJm698HG438mwfO+kWVeHzptzwjN
	 ddNo3P0E85YovXv3JVGEfdk1wKI8QPDdRDa3SqUY12v8lU2s/IBhs/3YaKF4CoYAfgseU
	 fIRq8Ag9HtgniCdsQGsSSRoGe3EHw1wUec9lgog53WQar5DJYHSnnChcHogmBZnTBQ9Xy
	 Ks50y6bMqvd26G3Os4PWw8OurOh6xOlIpNWRjA6UX74Ga9ATwwsNIyhGuaWX6kTCF3cg6
	 VDrq0D1UPEL0fXDVm03EIwDWGkBmPkbmcytmci4cTH4MHL9VaScoyHHAGiVglaErrgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794248256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SxKpl6fmb/etk7A98+QGtJAcpQvhURvxZib9JrKz8BA=;
	b=qdvaE6OSJ+/tI/LSdsGBn5d3liiIeuIb9YqMvU0kXTCx840U8SR2Ge63X9BqgoSHwrLc
	 C1E4THbhEomLnRKoBSw4VJwD7a5JYsgfNivwNbIkkg6P6IG92ULbgu6oU7tj5k/E3yYtS
	 FqzDwdvhduZGOPA8G0iLik3NJetUEyTCHwD61jS/IpL5EG9rujrnFy37vfrFvpb+zSxfe
	 UXjM21nqeu4V36Z4LwFkcoXefqB15nZKohldMHujCDRdHMOOR4HnvU/bSLL0qVt6Gxg4D
	 naAJPPOT/j1KubuKsBILuSErM5ipru2T3Y77CzfJ2Qs/dsOyEzr8wBVUEbHhbIueYdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuXpO1uJ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794248256;
	bh=SxKpl6fmb/etk7A98+QGtJAcpQvhURvxZib9JrKz8BA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RJGSb1zQ1kFhrlOBaQrapEkLrGHdBqMk0OznED9VJp2MgwBvwBSOeRQat4h+HqsFl
	 mOSWcRtsGUYTlqVLa4XdnIBCcpjj8/LPU0QNAjWeJT5gkrGwCfaFoF97m694OG1Z/S
	 pqrbypHqKBjhM4uhCWgUAYjVF/8UcxKb3ejCNfDMUBe+Oruzj4LDFny1AomcZk/4/J
	 X+DDXOkKR8jrleXui3eNITerGX+lBiic9IoZ20GLFHsefsqL88L5kFf2M6V/pxPjzZ
	 UHUqGa5yjFcs5pVcSl+ncUjF9XtjTyDPvjE94zzcrNWcbni+sxF+xSkqce91DqOoHR
	 j58p3VSKxjrIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12ED38097A;
	Mon,  9 Nov 2026 18:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF25828C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 18:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC8C18097A
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 18:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9jtxFrdyf52 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 18:17:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4F5C480969
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=william.sherrer1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=BuXpO1uJ
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F5C480969
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 18:17:33 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-5365f9a04c5so15018641cf.1
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 10:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794248253; x=1794853053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tdUzBAs6+JnA6WUGNgKIByxIX+tcKNbeTAPJWnmB6z4=;
 b=BuXpO1uJ23be6P1/fPEJHnNYauvH6LNZvVYes4rVUZR6LQEnovblUoanivvyyLnc5H
 qboOyWgZwgCJ/3BlKaO8TmIfVNh8HFDWxHzkpCKR5RdZl2pbqrlbkGcWj2mfbl55kf1I
 BIpiWjWG/Kvd3w24YZHdksgstrQ67sM1VTr3LQStQKOrUGCF77ET9pBxKljxkCQ8vZJv
 jtqcTO1WArm9cmm+m4AR1+5TVmlwXW4PdHjBrdzqfMqEP7v/4MvjONA9+/UgkdjYg9z4
 FqmGxU5bPcF/b+/fxLt3gdQiIJXZZSqyaq8pHLFT5ZrohvIR0EdVRe65OY/J1HXuiy3x
 5JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794248253; x=1794853053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tdUzBAs6+JnA6WUGNgKIByxIX+tcKNbeTAPJWnmB6z4=;
 b=R1mRzo6Iou7Fi9OOEuC5azn/q7AYDijReGsBXeN2YZ73Ye5Mu9tEoQOaKJL7gWnyxN
 vpPy6ukq6TsqaDFXFC5mmYmJzNjJtQluMS6JZrE4OVGoPm7nyCQlLwKf9v5KKQGWPmWf
 U43WYWzc3r6GDP/2Li/u8nyLeDfojhGfA3GYVAOaVUadCzeZz4fWTuex6e/Jsj6Dztcb
 XtsNCRggkfgmwhAuLSTKC/6WIdzc8FE9UgRjKvttM0xygeXkRqT+EVKd8Cw1RO9ehNNn
 ItMmxYpJQYTfbgzE4o/+fl14EmXqMimp42im/LBedCEx4QMm8snl+6oFU+aqjh6TIOfJ
 9hGQ==
X-Gm-Message-State: APuU4Z9+0e436o5FQqnANZO+VfQvj1D87XOgHWiMb3vg7F0dAO7Os8OX
 IB9lysSLUqikyGkPHC3oOWK9QhwZJsb51wVqfUA/egZ13ZSRPC3l/Jh3kBmIYuzVcKckNU67
X-Gm-Gg: AYBFou26xct+q8+XKjDIW+88YGYY/zxjIpWdIwP8Vc719Pz6CEtnRZyLuOY+1h6MrL+
 oIC5G+RGEUnq3p+rk0WxWprzcRXT5QwgFVny2+uRe6sudxooaHb1hjyNVZNCRrVgA6yIqD+vYZ4
 2gKq2ldX6D82kuvK0HKbxh00k9V540xQ7ozoCBPnOBc4L6feveLSXpvsjNYopI7n2u031VAwn1E
 nWmRea6bFNFDMl1x3/eY3lhvRDaTCA72I4+98rAIw+JnHK6Aiu57maz1APzg4+0JCmAPSZbJcq8
 j3tWpmWXjLd9vxU9cjTiXk6PJqADsCLTBt2T7wJaaJGs1N1ys8GDrpWdF6ApNRGOLsbXYS24ALe
 XlYpDmuKwZ1mi19SpyKCW4waZVCoZPFqwmu+bmSO/MetfEVg5xJlnbM55XQV+lLqLTHLrzJ02wO
 Vf0u4Ddmhr+7J+3ZIUFSUq+DuHH4rsMW758OW7dGNQ/ZvPiRBAJ6U/JWQWAThJFOVCXOzz4GMko
 HmF5JQ2GSeZBMYDO0g2R8luKBe0K4mO/A5H1ouQ2Laio+zkvqNORy9z80QwRa++kQuTIjOpNEB1
 1zXf2puM2zWXaAcEnh+Xu7qm0tXzzyueNyEwSA==
X-Received: by 2002:a05:622a:343:b0:536:8e69:8fe6 with SMTP id
 d75a77b69052e-5552722f3f1mr2363101cf.14.1794248252513; 
 Mon, 09 Nov 2026 10:17:32 -0800 (PST)
Received: from scooby.. ([2600:1004:b054:a580:a9f6:5c9e:74e5:b67f])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550c028bc8sm3221241cf.26.2026.11.09.10.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 10:17:32 -0800 (PST)
From: William Sherrer <william.sherrer1@gmail.com>
To: buildroot@buildroot.org
Cc: William Sherrer <william.sherrer1@gmail.com>
Date: Mon,  9 Nov 2026 13:17:08 -0500
Message-ID: <20261109181708.768625-1-william.sherrer1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/scripts/mkusers: fix double comma
 in group member list
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When add_user_to_group() updates an existing user, it removes the
current entry from the list and appends the user to the end. If the user
was in the middle of a list (e.g. "user1,user2,user3,user4"), remove "user3"
leaves a double command (e.g. "user1,user2,,user4,user3").

The cleanup regex `s/,+/,` matches on the first comma but fails to
collapse subsequent ones since it lacks the global flag.

This commit adds the `g` flag so consectutive commas are collapsed.

Signed-off-by: William Sherrer <william.sherrer1@gmail.com>
---
 support/scripts/mkusers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 87a36a89a1..581df86f3e 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -300,7 +300,7 @@ add_user_to_group() {
         sed -r -i --follow-symlinks \
                   -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
                   -e 's/^('"${group}"':.*)$/\1,'"${username}"'/;'                           \
-                  -e 's/,+/,/'                                                              \
+                  -e 's/,+/,/g'                                                             \
                   -e 's/:,/:/'                                                              \
                   "${_f}"
     done
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
