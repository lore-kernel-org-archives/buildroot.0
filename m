Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B8606A326
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qoMca1EZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36328409A5;
	Fri, 23 Oct 2026 14:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBCE-Y7TU751; Fri, 23 Oct 2026 14:48:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6C7AD409C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792766908;
	b=l5fbj8b/+Q7GtpWilmCAvApB9WURPqeOqAysyUgppm4UM0K/ow6P+Eu+LgdwSoeV2w6k
	 od1mUSDPyC697sgo52MBaVAC0Hj4tQJn8GK3D8cTPx0dUOp7kqnyJWjjQ1/AgKH6s+W9m
	 ZlElqONYu4E5khUYlQRm7ltD3KqQA+J9WibjXWVKWlAXJFEFe4EnVKwtaDtOFDZfeplOM
	 7stoXNG33VwL4win7752E2BMRiY8ieJ8/VaW1OBGHnym5RClh8mu+EPzVxs0n0Hp1OuL9
	 jxcFa4+CQOgNozmziMimUOCEz2I6X22FWdlzyfWRwd2hEnBLHQxb+ZlNlbtNOTLawuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792766908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Um3p5osdgXN2kElRNaxnJPh1RG0sUk+jARWOI3hVwc=;
	b=UbIHLh4vGV0bBkJz+JUD6osJip9WSiVqgprPMS1q9yNR4KEFMWzK/uboZboe1cRmVKcV
	 3NNB6ZwlB81d8Texnr97mTZRTLhemi7eAEVEzngE8kjf9BbOhtuoY9S2+RWZ9ROKUL9yw
	 MUpizQ8JBkF9pLttWeGLgi5fOliILcgOUR32Y5imSB4BqbWxWSz4yizTmJ6GnZXT5E6Ay
	 c7QL/KZc5MnPxM26T7O0GgfbMqg3MNrD4qC2B/O/oQ/tnV7LBDr1nKpgAcfh7NOKDSjkI
	 4BXx3qIVVAqYOtjMOZBXG7MtR7uE1s0VAKzFCytokV1cRghJCV34ZcvesLUEyJeZmsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792766908;
	bh=3Um3p5osdgXN2kElRNaxnJPh1RG0sUk+jARWOI3hVwc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qoMca1EZWNDhDqE7/8LlB/6s0YBzUREKEPl/V5it1JGH002+5dM96QH1lnMQ3sOdm
	 +BY82e2vKiqPgMowu0lypf/PP9SpE6nKQgBrOHwShXgZvfkThSHBWQQeHsSltsfSAW
	 avHfZlIlqD5EAVplWWZZ1LqDLdAgYbT3ZvBEbYpfjhGaLWMVH7YhohqNplNKNkrpzR
	 uS+te+DOQ4IBZCT1ch9DQ54hoLwkkDuhD4zHUzLc7D8uGqXmGT8GAzDMIztu87TJA/
	 K2AbaQpPvC+Rdf+UG+ziVswCyZaE5uQOQBLTh40jvgtNKoGSk9wra4Yapgrl9WTccB
	 i3b34/F9onqMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C7AD409C3;
	Fri, 23 Oct 2026 14:48:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E49C83C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5CA5409A4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gULMxrM91E7p for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B76F24096C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792766906;
 b=fAuVbBq9QuDjs9HtJwFF9svf0idIQO11pjTdK3jX42DyURi+N5RWTlpfXuWnoeBinw4f
 1DI5JUK/+65AdFgE8Xktjtkjv+Hy2zlABt/8iAPeUQBWyV7uTcynModB+WF7j1S5tk/xg
 4lodGz0tnHFA194y/PQ9tUFo23qnIk4qIZSAxbEMG3CsTqjynC0s5+vf/VS/S2moSUPXy
 xtoHEbqYeBQ089y94MAItKoJgZAGeDhV9WwhriqDue1VGaCSPUefkQLLuNtoRdTwUysFQ
 yHi0bh/KX0zuAx2iyLetZ9ziQK9A8FPPtSBnOwRDDJsELev7PICxByo9/SruG3XhzQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792766906;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=TKmpIavyx4zf1QaalM57kuxPzdbQniCfDpqnMqJtJU8=;
 b=sw+iuElH44Myc05tdwi7PjrO4686r/CrFa4NozmQrVIpfEO5EH1lFAvTvHA3KfJjPypp
 ICy2inJVv8ZmcQ5rixzhW1/CLm0uQqopjjnhehkCF6X7zF0FdL1mK5fib8tARr7+KyNlk
 9XxZJ4l80YEkTnRmJMlrgrNq971UemA9RuWHuhEtmiS0BUdfH63HOVUo9HgAUhb7VwNaG
 vyUAl3I7TdgbGM9o0HPqrk46DF9dF+10uFRS0UsYXvIDnJPUB0/LGQGQIzpx+RVNLMfE7
 suHFsMKuoLUHmYKtV/iaE9UKDZncSt379K8WOzlYNKqXMi6qm9bfZjOcdaLuRnSacIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TePLiqqx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76F24096C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso555244f8f.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792766902; x=1793371702;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TKmpIavyx4zf1QaalM57kuxPzdbQniCfDpqnMqJtJU8=;
 b=cwd09akSYOMeQ4pfDbOWY3LmCDbuK+a9hrfCuPsb2icSNdAoODG0w/cfDG3IBURmLs
 y0n2SWLuYYMdETigoJcss6eopuTZN+0VeFamGRrgwkJvv6+kXz0wJCmxRHqj1pdsgfQT
 nRgD9WNueoE+tNEtWDCF57Y7121uRAWpPJxtWvJkADWnCp6yKgRT9XD4Tszg04beYToz
 0hSzPZ4FsQ7gG1sL8PVbHqz+xxZk3oDfLFN+u6Yshbl8OYb26Vy33NKqnWR++6bTr5Jm
 xJiaQfvJuEj5H7fAlqr7giIk31o4wK3pM1P0XTOHSUMlG3teE+X+WOdv82eWZEJJ08e3
 s3tQ==
X-Gm-Message-State: AFq9FYK1b6YKXsZYW9hEtINOi9MaycdtZGyCda3DsMVulGgoDbaX1ynp
 em+IpYq0hyv7r3SSewATKwq50V5chmg+JaTw2h87iOwcuyJ+S14OjDqiauVsAaQcx5wAwJNj7Gu
 rM61sYUI=
X-Gm-Gg: AYBFou3c77wW9SXNFRCNz3kuM+Mm1S+l/DwKYgOcWlXrrLJGUEk/JDTTOUTHK9x8IV4
 mmNW39/Od8oVFCPHaVx6KI+QxfCjYvluhoQBXqNU2+su9W8tKW+lsxitiisBAdf+f7FmgLuBiRv
 EahaMbqYKXeR7mtDeg4+poB+oTc4dLZPA+IIsymArHm5CSUnz3iPjvrqAQ/ghu/erTISI7UrYG0
 o8IpSnvbwZCGiG93mM1nuIXfNNUnaEW9bbqlKEtkLHZ6RYE3+JtyaVGcMiCDvxm8Y2fmtUiw8vp
 f91ai8+d12jrINBq0Vm/j1CM5dyacznESiNI7bXApBdxUnx3JT0XAFsNsZBpcneqntx8VKzq7oL
 qIZmL+mCdzE3J0pwO6anfAhS4vZXhtzDn5FiKs7jb8vctjU8FIglHl1nK5xhi8/wKE7C+3xqQ3p
 hZNRzZsraWctxb0qguC/oX87/tCgrJ66nlzyxWeX/k54pLO1p/IyK643lHIaETjYOLRoEeb6ZWz
 axZ9UvPt8awnPCuslr3TobdihdCUY4ZC0jDtu2GKWu9ngoF1cG+GyE4bn1WKAGavAKfPDTJruYa
 tgo=
X-Received: by 2002:a05:6000:1789:b0:486:f907:ebec with SMTP id
 ffacd0b85a97d-48e385aff7emr4887067f8f.31.1792766902274; 
 Fri, 23 Oct 2026 07:48:22 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3d37c868sm319911f8f.5.2026.10.23.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 07:48:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 16:48:13 +0200
Message-ID: <20261023144815.1747831-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libressl: security bump version to
 4.3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VmVyc2lvbiA0LjMuNCBjb250YWlucyBhIGZpeCBmb3IgdGhlIGVNdWRocmEgaW50ZXJtZWRpYXRl
IENBcyAoWzFdKS4KClJlbGVhc2Ugbm90ZXM6Ci0gaHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHVi
L09wZW5CU0QvTGlicmVTU0wvbGlicmVzc2wtNC4zLjMtcmVsbm90ZXMudHh0Ci0gaHR0cHM6Ly9m
dHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvTGlicmVTU0wvbGlicmVzc2wtNC4zLjQtcmVsbm90
ZXMudHh0CgpbMV06IGh0dHBzOi8vZW11ZGhyYS53ZS1oYXZlLWEtcHJvYmxlbS5jb20vCgpTaWdu
ZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0t
LQogcGFja2FnZS9saWJyZXNzbC9saWJyZXNzbC5oYXNoIHwgMiArLQogcGFja2FnZS9saWJyZXNz
bC9saWJyZXNzbC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJyZXNzbC9saWJyZXNzbC5o
YXNoIGIvcGFja2FnZS9saWJyZXNzbC9saWJyZXNzbC5oYXNoCmluZGV4IDcwZmUxOWRjZTkuLmI2
NGRmMjg0ZmMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wuaGFzaAorKysg
Yi9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLmhhc2gKQEAgLTEsNCArMSw0IEBACiAjIEZyb20g
aHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvTGlicmVTU0wvU0hBMjU2Ci1zaGEy
NTYgIGVkZjAxYWVlMjRjNjVkNjllNmE5ZWZjYjlkNDRiY2RhNjgyZmY5ZDRmM2JiYmQ5NWU3OTRl
MWRmYTkwODQ3YjUgIGxpYnJlc3NsLTQuMy4yLnRhci5negorc2hhMjU2ICA1N2M4YjJmOGM2Zjk1
MDU1ODdhYmFlZGRhYjAwM2VhMjQzZDYxNWVkYjdlZDcxOTU3OTY4MTIxZmM2MzE2YmQ2ICBsaWJy
ZXNzbC00LjMuNC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICA5ODUzNTA3Yjg4
MjFjM2YyNzdhYTYwYmY1NTRlYWRlNDE0NDFlZjA2YjJkZjUzOGQyNDcxODNhZDI4Nzg5YjdmICBD
T1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLm1rIGIvcGFja2Fn
ZS9saWJyZXNzbC9saWJyZXNzbC5tawppbmRleCAyYjRlOTdhYmYzLi42ZDZkZTc4MjEzIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLm1rCisrKyBiL3BhY2thZ2UvbGlicmVz
c2wvbGlicmVzc2wubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi1MSUJSRVNTTF9WRVJTSU9OID0gNC4zLjIKK0xJQlJFU1NMX1ZFUlNJT04gPSA0LjMuNAog
TElCUkVTU0xfU0lURSA9IGh0dHBzOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL0xpYnJl
U1NMCiBMSUJSRVNTTF9MSUNFTlNFID0gSVNDIChuZXcgYWRkaXRpb25zKSwgT3BlblNTTCBvciBT
U0xlYXkgKG9yaWdpbmFsIE9wZW5TU0wgY29kZSkKIExJQlJFU1NMX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HCi0tIAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
