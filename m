Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4D606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SQAf804D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=gI5H5KOs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61A8E40ADE;
	Sat, 24 Oct 2026 07:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mO95s9GD_wz; Sat, 24 Oct 2026 07:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80C9440ADF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792828594;
	b=YSuqzjeZAtHSAAn2IkN+Q+lWLCYpURxl3vAY84V+ya7ks66O9bvs2n0LSwC03qSgV7qF
	 dxFrKlKXI5FOwjBADcGWY4YJyBjYG1LQiaSRtBG8KvTMZe7Dm3mlw2PzLVkhlRT1ZPhpY
	 iWoJR9eRRMnNxmDQ5ZJro4nNEZ8gjeGhzktM+TBPdBfea1pN+fnfMqfnZD4t61D5rSj+7
	 +YpojJiNAiF3sQhhLfzMKYUKlYo7doQbMJCB7NjwxGsKixe3wvecfDlvZPPUvPxE72Q63
	 QoQXypQlNZV8di0ODPRGVRclPq/Oi1BiDbxSye2auj6niIRElRhITkLjiOu1NCd4Xfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792828594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MvFBoUJmCNYYOoLc83klDkZ17/tr+l5sP4FU5SD8K8E=;
	b=JIxizZpae+vh0HhY2Dfnap/lmf34XZAjSPIsKt/s9xDUiv7WYjxxVPS6pXmOhZ5adpZh
	 T9mBHkO5mpc5MmKR9jNSyVAeDAh578/KGds5NFMFwU4PTkrLhoNw+ihOGMrKoVpeKkpn8
	 cBzKk3UC3OHDorbPWHrWr81IF/oAc7KegYvTn6vGcE/CnXAKniEJQazO1msPl3NrqwXCK
	 w8WFW0PzHuGs3wdR/MWPjTuSQsY4dGpwIeuXlNJm7fK6XnS21DJMt+7q0/uMnxvzg+/QK
	 qYPO4NCgik0RECIEI5pPBfrnDOVmGJhATUCrD68aFxlMEE4WVliTX/cqLUHXAmRDEWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792828594;
	bh=MvFBoUJmCNYYOoLc83klDkZ17/tr+l5sP4FU5SD8K8E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SQAf804DDn/g40ZXGRRpEe2Lzfjer8sQzTKqtsxwfj73AjuK+u+k7Fs2/xdHEvWhs
	 ldyYR8FDFq7A1XnAQ/E+fF3YsXABZiij5QzmphrxzQKS4fWZEDqmRksTtikNUbm5Ya
	 5n0zj04KtEHttpBji/2m9joY+xdPE4oR/9WD7nwu23v5viKpKQ5jUo9Of3eM3Xy3RH
	 3oRO0at2XLnx7rs60nGXELCpliNGNxUSwQDxTVr6Q3k8i6dqQbTs5An+iDHHr3onOV
	 MIHyYZlZRTZKozhnPARGF+tz0WoSmKkCxMvbNTRRZMCbvh5F9qEx0Sa17w3+jHZG2i
	 dYfG8pOmbq9tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80C9440ADF;
	Sat, 24 Oct 2026 07:56:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 095174D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEE0F60A6F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMWrZpcpUaBB for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 07:56:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D84C60A4B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792828592;
 b=Skkrlt9bkyUGRT9KdOrjCOqyIq3Bvr2zqmo2raojogUm0Uwkb4rI97LFKSSDmACpmEXB
 j22Ttq8j+aP1Vz3BW37z/hY7Fg+tRyZ4ufQIREYQ6fh5Zaexow0skXhj0NK/GkFqPesN/
 d4mafRhTAXJetRhBu7W6nYlz4Rl2fpMUPXAFERlj+1OozrnoHij43ve8FHUSdJDs8q37Z
 CuIxbMBr6nQiL3dadyWk7YlnxQPr1ZkCeCX6L7x7ITtvl2HzL/Q9Zzg6r6WYfEcdscgt0
 NRzXMBCXco3qA4VNdKEoZyWuAgKmIMtOKTEiyMv0VFFebRqrDUPvYqhy9MnbMHEV0EQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792828592;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7ztUCAgLrAqS306XlZoSDUy/d2kz+4/PG/IgwXAxcHg=;
 b=OFcURgIhFAdpzN7rY7yTFSllPzkNgZhCV3XGmx+PeZJZmgy28sYlTH+esK0dRF+oP2uH
 gpgKomzuXPq52Nmr0oapZTFTK0PS6bAfolgvyy6q8VLpyC07fidSltxiZp7ZtVaNTaKga
 TmGJp9Fa1UJGKvvOvNpJBgZ4q5BcTKouuhZC+2Kx1egN8d6UsXO3D6fodnDlfRTY4XmHc
 tKtsen6JzmRvQluUozft+uf66bUjMVr+SkAPnecwfgmom4NrAmfh6rGpNnB4R8iyoywpM
 n/ZpbEdzHlcjiWykUFXLMC4RE8GmEmEhFWttC080QT0J1d3/kdZwEqYIwWRXdUxYJNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=gI5H5KOs; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gI5H5KOs
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D84C60A4B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:31 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6b1b13e09ffso2106045a12.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792828590; x=1793433390; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7ztUCAgLrAqS306XlZoSDUy/d2kz+4/PG/IgwXAxcHg=;
 b=gI5H5KOsUCNEmy11hHWbqMjWngWkokHHxU5clSB22glbXo0PGG8ww3VsNzojtnvgyL
 v7RS91mL5iVZlQmw3GKYG8EwIMrDBZ0rkAA3uTi1rOMrT51VkcBMJzlOPHzURlBo/bkK
 q7cbnzbXWehLb+sgLJ6JOupheJRRIVxb83a9dgHw+BCb9AOrRN7ho2iZm3bZAirhOGtL
 wA5CTLziazzy68xtE3u4nsFxcKnAzJHEkrShQ6/O9ZT0kbI82FU9ifSfNMlG5BDJRRxA
 6H5/u/5GrLcyzPVIO28GezpxIztxiE5SduE2oGXEBn/vmU67HsUJGHjWVGKx1pYs5RQW
 TgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792828590; x=1793433390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7ztUCAgLrAqS306XlZoSDUy/d2kz+4/PG/IgwXAxcHg=;
 b=cz1NJvG/hFS0KfEURJ8JNx8si1VDFEpVbu7IJCWMULCbSsTGULfab3WbrssYW/aDQX
 OJdiqUzmR59TkzGB+6bW889umk9NqDvfEWCeJ0j9lER3NuY4wmcwOVWc6TBEKwA301Fn
 IYpb4951kyCh8WjJGi8FB7b5qTq7+yRfjfrU8FIv3szdunL8luNFWxpTjGKJjoh2eI3C
 3nU/iXlhuyXvxNDKm4eZGUPP6jlFsM2L38Muer+rfG1xrMJkrMO6bz/g9zAZZWBRahO6
 aSDOgxj+Rw980T5hOCAqGVlwq4DqWD95eltekYg+CCwiGq5BlfubdNdmn3sibeMgMemn
 XVFQ==
X-Gm-Message-State: AFq9FYKEPZ7a3vgPJHnWq/Q7WG7tFhnv/P/9ELM43zyaDRrPKJ6RimYf
 VDUz6P1lnFlMGCq8bdAUBbVGdy1MEzoW9QPndZ+5rTUbcA+4/stngT8D9Zg/LA==
X-Gm-Gg: AYBFou1/S7GV4b+mn31f6a2n6gPaesoaBMj0exP8ix4ber2+kI04tH0d0xyFkXfP8wW
 LNEytholH8Xd4hIlGH6YyajS37JrYTHKgp5N6WYBdvuS3fbSr43tp9ML3Sb8YX9nWGkEa/OaCVN
 I4dqcaxtw9xFLBL8KFXeAYLkOlT2RZU28Sh/WXBT+XjdqpfQCYN5HxdqTTYwdMdfp6VaJVUDOo0
 eSgsOm6mdr6Ihijhm5WdyTQnxtqZh94MKNcrndTOzo+W1H5BNsNNj0VFrI5HvfyESh3pg5LaRB6
 Kt/BoGzVIDuzeHcFre1qfsG6edaTuFSDt79Xk1IQjEnzmCziy7v96qPwC1q0BQm9o5l9aEmwD/A
 6/jxtOemKbnxBrt2LiGHz2slO/Ofnz2fOC3LKjKpclD4FHRXU8kEmb/f0hXAeJd90gMqFmZoYvZ
 Xq9UE3A+xBnhVLIkpjd/YFVpn7yt2Dmr6O3UUIFtDumQ4ZL+ZLxdMq/NQ/2IHpRQJuIajZ9pdHL
 Cp0c9+Lv2F+qBVaTtQKlvBpyc+sTmpXNmQ/bm130wh1KXT/YWzT5JCeiKNfPeSprlNJtCjhZ3Zv
 YaG9rquZGLYSUjn7UuT9vRfcm3UiI7fI5XY=
X-Received: by 2002:a05:6402:64a:b0:6ac:773b:9c55 with SMTP id
 4fb4d7f45d1cf-6b443001c60mr1096425a12.40.1792828589433; 
 Sat, 24 Oct 2026 00:56:29 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445984ca4sm708564a12.26.2026.10.24.00.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 00:56:28 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 09:56:26 +0200
Message-Id: <20261024075628.3205436-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/jimtcl: install pkg-config file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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

Install jimtcl.pc to staging, so that packages can use pkg-config to
find jimtcl. This is especially needed for static linking, as jimtcl
lists the libraries it links against (e.g. openssl and zlib) in
Libs.private.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/jimtcl/jimtcl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index f2d59265ad..5e09e776ad 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -71,6 +71,8 @@ define JIMTCL_INSTALL_STAGING_CMDS
 		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
 	done; \
 	$(call JIMTCL_INSTALL_LIB,$(STAGING_DIR))
+	$(INSTALL) -m 0644 -D $(@D)/jimtcl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/jimtcl.pc
 endef
 
 define JIMTCL_INSTALL_TARGET_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
