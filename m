Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58880606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mjNeohwp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=qOjZD1sb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3322E405B6;
	Wed, 28 Oct 2026 11:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOTY6eTM2UKv; Wed, 28 Oct 2026 11:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A5A1405E6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793187222;
	b=cjKzxzGB+MW+CnEaFldEJ7JFWHYccMDZezZTaqUDnc4wksS6hSLgZnXYTyw86xhzsLjd
	 8tDav760ZNH7qcri/ZuLdxX8nXLWlXm4+1yRl73+880s5sGcr0kHFIr2zUPsc3fjMzhBY
	 MowZTC1bZAhb9Ito3DvVxD2XmxWNspkX1i8X1Npz4h9fnPKGUBpQignppcbBzW9k5L1Tl
	 tSAFkyZu/viDkEcC5lu2edChcL4iwgBdZywHsGG6d76ow4X/yUiq1eYYFXcF+n/38MeqG
	 dDe5SOtb7iGbHtfqQYB5f+RArbtvcvtRlpt8YeUJ01NyjzxDdByTZHtFqL9KiANMuyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793187222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CwkthyYkXBD2Wv7IN/qzuLGCidHf38gKxL6MEDBZZJ4=;
	b=L5Tllr5F3ofXsf2hpjly5MRbgQPn/JcHWKMww6IEdEg3wzt1c0hAkW2s0aK+3loFXqgB
	 DEAuAJujDYy+Db2E1oyoel69G6EdkwlwxB5Sxhu2ymJd5ZJGohr6gkrBLzSRkeofsTyWW
	 wnuv1b4uuKeZqyDc9lp3/Fzgx3+JAT7sdsAmeld9mmvHSpI6jXOCmeoTlQLJEoDZYKUTY
	 QcE2SJUvXlASSqLm/CLoliW7w70Fmf4pVNtS2eRMWiS7D74ycwmSTUi3OVWtMtmlW9Dqp
	 Q4+FSso/QYsShZz1sJ2mUzGywY/aB0km3nuyZnG41hwexar1qtcyCSnr/LNJ1V+Y09w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793187222;
	bh=CwkthyYkXBD2Wv7IN/qzuLGCidHf38gKxL6MEDBZZJ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mjNeohwpxksKi6FiRzUltHm34rVflQVELmAfwyvm2bv4JaboFRqunu1+RkvXQPKRF
	 77eu+nmb49GfbIgQ0fGtgYXNeV+JvoYly53vt8ih1qfkuOzR5uJ81Z7VBETpxxjuXp
	 NRn2ku63CJJemkMhwW7KN8ARsvrtb6dKEoRmDlUqy6qASVmkvUX00MdaqdLCSWSJq7
	 B8naSTHrb/rmyz6M5YFWQSi+RtgG06hvzoxMcnXWjizmGM8vITR3ZU9IMGVajfPHfs
	 UFH/Cr64NA0PkaKDmMFKMZZC9Lb098GZHobZcYSIHgR75MNBob0b/Bhth73Ap1dWhr
	 NL6PqvYxOQhxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5A1405E6;
	Wed, 28 Oct 2026 11:33:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15128529
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 076B5400FF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u919z5vvfi_w for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 08C3D40087
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793187218;
 b=YIsIOkn8/I1JbMYnnet8k+5pAmhO/WK+gJ5YpWHdhQS83cpyjZ05TJ3y0rfvVI+rHK01
 qB8tAcP2bZ3m9rr5I9XALrO5jcSiMA1z7KE8HAVFRPKJcuG3gj93TxvVedZk6g1jT0b35
 +JxrFN/5LrkqqVX5Lnl5Er4eAhzXU+qBm6XJbIB6VfoHuptUHWdsiYWgiFWOmEpEFCpdo
 k5omACwUCOyhSs0Nlo37HVUqaj6QK1PtYFeg9C5K1XNtPbtij7HPI8lLYoxt9tuS19SYH
 l9xqXHv9+t4iziQxRiumUMUS2mViOC43UkJBQXigVXh5ms/GwPrukOivmspR2LYJwVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793187218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Ij7WEie85yHogAoMV+7A5q9xGrKrwXap3tP662pOefE=;
 b=MKUZwaO44QU09CnSo7XoORGwSSZu/AGdzTdYWRUKBT42VjVp61qy0E07LBApW2HWhrrz
 YoCVMN3drEzd5FCiLZMOWdUc7vGcZt6nNuqntpqYDxrC6bb2VurQDz9En4PG/uhNm37eE
 1TD/WqpkSdK/H0tp9DpOVdacTdAJxnyFn9IHzuqFuOYqGgu39Cj7hLSzilYF9R8sv1y57
 Nnzzc41vHfwB5GOl2Rqknm2ETe2gYLMzpdB90ytTr8oEgCSV90HoJ4/vJ4fhw84qx8E3u
 CpMMdD/Hj4JeIbmKrMxQE/hk5NoNtJYg5nRro5UnCZ7ag+dRHUVzeFkoF8Bp9XJ98BA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qOjZD1sb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qOjZD1sb
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C3D40087
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c40aa03a96fso8274266b.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793187216; x=1793792016;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ij7WEie85yHogAoMV+7A5q9xGrKrwXap3tP662pOefE=;
 b=qOjZD1sb1IxQWvT6iW7FYnBaw2iRotkBsTiM1f2oFfCR3nYYFk/9HeOtuDubw2GYUS
 FBoxB6vaWZUmNm5Bq0p3j03h0C27kTM0nluIbcJ1Rl5nT8FNklmDiqobnr68UXZDj32d
 Y8ZtpdoqulsQxNrrg0ygGTG4zuBGMGGrfc1lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793187216; x=1793792016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ij7WEie85yHogAoMV+7A5q9xGrKrwXap3tP662pOefE=;
 b=loZlJYHtqU88Odh1sgcRpOVbSNA34EbxF6TbCjt6b0QziVe90fcu88UXgroSDib3ah
 k+cNFMbm4YWD51k1cbfEVZ4H7aneZMgPAfQalaUPimXrKfrmb/Nb5suieDQWHRWBZkiU
 cLExGr+JYeOlFVNhZXeAYcHFoiNYBxLeIuO/wh+kbHQcfOo6zgOh7tmj+3bJ2AaBwwBs
 EJ/A7rTAAX8oDlfZUL8D7gPYUOt0fTchlbVgaOKrTsAVggW0CQIMfKZQkB/JZlalAP2f
 X9UicZPdPS8JjHoReq7XqBlBWrmrXMv3zaVBG/mVqrB5TlyjjFF+vYXmOJfJ0doRtLZ/
 659Q==
X-Gm-Message-State: AFq9FYJHvQ5gHOO6lzZUgj0HAGqTYJBCsmTG7sHx9cjZr4EVBtLBKdSV
 RVhIlSH6p+ZvMclMvEvXdbe5TbKgLvDAd4sxaG4fWG/fdBUK/5dLkNUTWUxY+6ZcJYUKTQI+bQC
 Cnbc1UXc=
X-Gm-Gg: AYBFou0S6HepitI/PeY97mW8jTohEQms1cJPRHwJIQAXJCLSgxdAuegLOE8lAPZ3gUz
 fEVlqwIs+C4H+nj+WHTc3LBKiBQAGD4v66sYDPR+CUja5ffVuIZZsstnyARlEYSjnmeQnXbEX+n
 yfq+g8VEdBgAATV+vC8m0B3nm6okVfp+blAI++Hsh7wb4evn9KApenalSfoePHwowA+KDVkHatF
 VGUkGsmOd6uXmejYT0drK3j6jnJRNuGjGwPxN7Vfsyph6+PLhtFQbf0223dCgoD+rXsNcxJHoT4
 4w/YtOGu11q08Y/8Ey5FzeYd51CLxSeB7eqI+SV3sUSdmew0Uwu4ZcDMMSkr1/wB15NAY/Huroc
 WrRiUicripnZyqdcIkmbEJhQKp31KoD3o0w3nb7/dyiBr6EIqvsV4JGB1tPJJ6nF31qSEcdizMn
 oYB6AoWtzqBp+fcH2oJ40SgPHqDgcgLO35vLZu2VQoxMbP8sguorUFMj/WWkz2wtshA2Put+e6s
 gI/8RTGzN1Z0OHcabFk+nGDmKeOoEAK/8+Ucc8kfMrTVlkYH8GKqfB37XwOwkyEQUpK7UjNaD1B
 w5kZn7zyKR8tBFiV4cdL1VxKTIX9C0nmX90LBRtHvLj2mHyCo9uWb4a72wnbzQs1O0jvdCYYfK4
 QZu2nSOL1Fp44b8rK6ubkeTNFGmS0FWINnRwHjOp3CY2T/vKxSpIi9QPngKVG8xfO5YwYv39kUi
 8SCo4/lhgh5WvJ+SpuoDXr3yli1/V1IuLvJjJY4FdvLhFskA9lyHpvK6fVXg==
X-Received: by 2002:a17:907:180b:b0:c25:2ded:ad36 with SMTP id
 a640c23a62f3a-c49bda65ea2mr242472066b.0.1793187215709; 
 Wed, 28 Oct 2026 04:33:35 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6f7sm592468866b.63.2026.10.28.04.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:33:35 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 12:33:28 +0100
Message-ID: <20261028113331.2960539-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/6] board/mender/x86_64: add a udev rule to
 create /dev/root
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As /dev/root does not appear automatically, add a rule to
create /dev/root. Without this rule, even running a simple command
such as `mender -version` outputs the following warning:

```
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
```

Note: This rule is only guaranteed to work properly with the
mender_x86_64_efi_defconfig example configuration.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Added a comment that this change is only guaranteed to work
          with the mender_x86_64_efi_defconfig [Thomas]

 .../mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules

diff --git a/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
new file mode 100644
index 0000000000..7d2ae8cb89
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="block", ACTION=="add|change", PROGRAM="/bin/grep -q root=/dev/%k /proc/cmdline", SYMLINK+="root"
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
