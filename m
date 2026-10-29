Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB913606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k3AS2s2k
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF776067E;
	Thu, 29 Oct 2026 12:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fJ4zz5KBZxq; Thu, 29 Oct 2026 12:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC37B606CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793275859;
	b=QBhgf72PONPuUUIovIPM9ZHQxLQospD3DXTrA3GMhnYv3/eUZmZ1BkZ3YPVCY3sMz6/X
	 GZcROuYa+d6YWTXGBknjnOpoEW0n97n25TFSRPseDzM1TfWoLmNRvV73Hr/ZsSfMl20Wq
	 9JMNwKtHfiMoo9+S9WvToMlh4Wk3R4HkRIdC8xjxBaLlkBnHuwionnb4lczfP6KYdOq7w
	 /WmpqWxpIBF12L/5m/MPh7TKEOujPqqD2csFy23N1M+iNQKscnysLzK12RIYo0eC0yANR
	 DayXXgv/tUue4gjt7/bNroUr4wulcmykWk5yGZiYiwWOiRZARuUbFhASysI0k1vQDSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793275859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f3FWJ2xYRWH+asQYtK7ixA+LVPdlKcG8oHpKtk1hlWM=;
	b=UB8cU/CEPW2f4MdV7ok+2CrQFrfJqqrgoVnrSxDIxR9dB0LYN0md8yZ8vgYaPZVdMMsx
	 jycYC0tNubpyr8wb51OR4WLrkScmkfqx9t6L3232TJPD+fBIPDZSQhpjoLBIbeHFdXP+b
	 ivDbwLe4+C54FpBfzs3cHiuzpXueSq5Ll6eUNL9lsIzb7TCQlhc+A+a+K21qRf3jN1usp
	 bM2sxtz0Bvn8hGrXqvWz51i1BQogaw0dHI+awfCubG+HGMzoncn0iBmtcj817/skXeW/I
	 GcAsNzFaQZbITQuYc08FiIH6rmqq4dVTJsgzCsVZ58JeuztlelMExy9hW062m1iAfwA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793275859;
	bh=f3FWJ2xYRWH+asQYtK7ixA+LVPdlKcG8oHpKtk1hlWM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k3AS2s2kIj6MgxRGQMxm4qFfOxMOze3RmS8Prxv2YYrAXofrPKFM9lr6AunIoII07
	 PX/lEkMIWT1xGZoFY7U/GWj6QSgjrrYX03fmLXMn/Fs867ey82RkO0rKB1K/yP/p9j
	 DEs9eWDI1czBm1+5R/wIr6xvsuVXPAkIPfXIB5AD69d93GluQWqD6Pel3Q4wPsWU4c
	 EoMCA6iv38z9R/wvh0rYFRXFbyxtaK5ahMfiz1XbVVUdfR8ndIVnD7tH5kjjCdPo4f
	 TCMV2viggu3s3ld0cGmKlaidvy2DBSCUsXHgCXtJ8vFH6fmVxeL9emD86BaqPskMzM
	 ipAyJL+uS3C6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC37B606CE;
	Thu, 29 Oct 2026 12:10:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19AF42E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCB0809EC
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KssLC6GIc5N1 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 12:10:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 10AEC80E12
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793275856;
 b=bcndBpAia/2OLPJd7jLEllrN7+YpQgax2STcZFegeqXhG0L9nbMb8ESQNCph6DQGJVaC
 3ZXFrQ+6F6epYHgIxZfcDwtD3RXDdSdPDHXmsczxUoSQ3lNXbp44v6zbG6rLfwc76mFFL
 zckTaBX9xDxpFWtYo4rr9dlhxNsRd+E8GUu6H4QAy3Nk+7aBoxbiF0aSUkkj/tVf4cg3R
 y/7yt4ZQr1bDdrXIXUBUf7ivpJ+it1NdbpQpww6MSVBF3z5lpS9FSOTqYfudSA7P5H0K2
 8XxFT4I6aFgf2K1uPz2BgAn/9Mvu/bHff1qsnGm/G1Lrhs0FczhgKS5Mp8ucZ/eU5qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793275856;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=t/dSy30DQoX6rmqv4/LTlfrrhlmqNG9UDvk2EFhmXYg=;
 b=WBgydfOqB3elc6SUYBrBPdXIR6J2fSwvnl07c0joGbJOfZTdSdiMR7hU1dHc/ADEKoUz
 Ofc8VGA17UsTFz4WiYbGZNVMPu+uDP5g5CZhYGMczvHvJqD9tep6D1r7AfYXQMD2ZFO09
 JuFzaoFY0jMK58Su7RJdbnXygOF1t6Xu70bAtnNXFnYhK/xU0q6HET978oJ+vo+zYSexO
 IEDOYM/arurJGyRIbF4S3eCjosWubSLP/YotZKD+kFPSAiO7A77aLktMNuAChILcEEOMD
 LewhYW99aVM2brWu4cGOmvHxCvxmdgJW55D9ozjZB0Mcu7njihSXs+0zVm9mX0BcPGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hvq8gQCr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10AEC80E12
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:10:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so1693037f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 05:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793275853; x=1793880653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=t/dSy30DQoX6rmqv4/LTlfrrhlmqNG9UDvk2EFhmXYg=;
 b=lYATI6rXJ6yJDLQTp3jwmWca71ZWL9Pd5IIAQjaraZ7FVzVhlfNPKV9qfuJH3mBqpG
 SIh7z4k0lcmmNTKXDZXMT3+7+dewe0oHu71gggzXg21bl1+uuiHJrjAUVdxB6mXEXtkr
 Qn4k1b+cRQpmKpugIpor0f3P1itnheLnT2YxL2MnkJ0rL2uuml+eWIGX4Zcukf9Nk8q0
 oFypl2+12hNr2aEcltK1x5n0rJNbCjdB5LmQteGimRtAndILylYt9xRSJKZJTSoKZYQb
 0FD6PnjdrgyBU2Wtzg6ayE0yE9StD7vGdee3pCbJ1qrReTY4FoogxovVRyKTdsKei7hL
 ciyg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzx9rLGFJlTPyeP9imwLocTQ7jHThQeNte9jUMMHQTwyKq3z9SVTCZEGpgIFWANkuvoWS092EV8XEg=@buildroot.org
X-Gm-Message-State: AFq9FYLLXAsZYfoCBCt0oU+LoUWcOjD18x4+4hYni/qJUyNq+J6wx/jS
 thYtHTrxt2aRQIQFoZWpjC2XtMhmvsWPZR4tcZ3Ky9cdAdV7fUKEA7Ka5X0SrMISoCE=
X-Gm-Gg: AYBFou2AssKO3wJC6sITYbxjpy1tE0Z1OTf61CIkuVj9KH7va71QA0cYtBdqk0T2UKj
 dIpNE69+eEDvXvlqF/vDyMgOHr4O8/hexjdF2c+INzcWX9SjC1x4OHBZ5ANX35TvtOKjPjNsy7x
 ZZyCsZYbPOUqthnj2pvljYk7b4VHD2NfZdoUzqJ8NizQvkdwJriDpndZ+cca2EArVyIhXTUVrLJ
 X4Cl3jCmX+cvcDiAgEUmGqM8SlrZxzgwMT0Leelwq+xgCDTALJ0FZWdRXpO5DUrjzJzbWxFsboB
 0/U4jX2kUxeFfoPtuJi1qP3pO56Cdkx1vDL8OzgCpgmBLYFxEmxIfPkf8JYKdZSQ9sZVNSACi/j
 l6R5vKg0f/y2158nDh7nLQqzoOw1EtKJ8i1ys1MY4N+IXjCYLLe2XI9ujVQFhUkcPd+FJvrfzKu
 imaGkD+tCF/J5n6FhpQKMNAISydYyFRcJNdHtvmi0A8qLimSJ+6nsu6o7x94ReR60fFaIfoigP1
 yIcKEAl6TIXyjm486p4Z/1uvdmWKL3af018Axw1U6PLRWZsjn45Vu0N+GFLiISO5EmZUZPVscuu
 VZMIx8LXTOMI+mM64UCJ513UHBhyjb9kDYYiheN+XKn11BwicfSMwACycSTdmuOFY5Q0QMqfevd
 EZcrk6zr4wmPO
X-Received: by 2002:a05:6000:250b:b0:488:7dc6:4e9 with SMTP id
 ffacd0b85a97d-48e5d44e73amr12776750f8f.10.1793275852834; 
 Thu, 29 Oct 2026 05:10:52 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb40733sm26710550f8f.0.2026.10.29.05.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 05:10:52 -0700 (PDT)
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Fred Lefranc <fred.lefranc+evs@gmail.com>
Date: Thu, 29 Oct 2026 13:10:52 +0100
Message-ID: <20261029121052.199693-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027143901.402-1-fred.lefranc.evs@gmail.com>
References: <20261027143901.402-1-fred.lefranc.evs@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/openssh: fix
 CVE-2026-106583
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fred,

Thanks for the submission.

In reply of:
> In ssh in OpenSSH before 10.6, a $ or \ character can occur in a command-line username, leading to injection.
> 
> https://www.cve.org/CVERecord?id=CVE-2026-106583
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>

> ---
>  package/openssh/0019-CVE-2026-106583.patch | 41 ++++++++++++++++++++++
>  package/openssh/openssh.mk                 |  2 ++
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/openssh/0019-CVE-2026-106583.patch
> 
> diff --git a/package/openssh/0019-CVE-2026-106583.patch b/package/openssh/0019-CVE-2026-106583.patch
> new file mode 100644
> index 0000000000..f116edf016
> --- /dev/null
> +++ b/package/openssh/0019-CVE-2026-106583.patch
> @@ -0,0 +1,41 @@
> +From 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2 Mon Sep 17 00:00:00 2001
> +From: "dtucker@openbsd.org" <dtucker@openbsd.org>
> +Date: Mon, 5 Oct 2026 06:03:40 +0000
> +Subject: [PATCH] upstream: Further restrict the characters allowed in a
> + command-line
> +
> +supplied user name, disallowing '$' and '\'. Reported by SecBuddyF KeenLab
> +Tencent (CodeBuddy Security).
> +
> +Backport to OpenSSH 9.9p2 with the existing username validation patches:
> +drop the OpenBSD revision update and rebase the functional hunk.
> +
> +OpenBSD-Commit-ID: 13671c178f492af63b5c1296f284818c7809ed9a
> +CVE: CVE-2026-106583
> +Upstream: https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
> +Signed-off-by: Copilot <223556219+Copilot@users.noreply.github.com>

Can you confirm me you accept that I set your "Signed-off-by" here instead of
the 'copilot' one.

Best Regards,
PERALE Thomas

> +---
> + readconf.c | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)
> +
> +diff --git a/readconf.c b/readconf.c
> +--- a/readconf.c
> ++++ b/readconf.c
> +@@ -3319,14 +3319,11 @@ ssh_valid_ruser(const char *s)
> + 	for (i = 0; s[i] != 0; i++) {
> + 		if (iscntrl((u_char)s[i]))
> + 			return 0;
> +-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
> ++		if (strchr("'`\";&<>|(){}$\\", s[i]) != NULL)
> + 			return 0;
> + 		/* Disallow '-' after whitespace */
> + 		if (isspace((u_char)s[i]) && s[i + 1] == '-')
> + 			return 0;
> +-		/* Disallow \ in last position */
> +-		if (s[i] == '\\' && s[i + 1] == '\0')
> +-			return 0;
> + 	}
> + 	return 1;
> + }
> +-- 
> +2.34.1
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index b3a4b0274d..29e29008d6 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -48,6 +48,8 @@ OPENSSH_IGNORE_CVES += CVE-2026-60000
>  OPENSSH_IGNORE_CVES += CVE-2026-60001
>  # 0018-CVE-2026-60002.patch
>  OPENSSH_IGNORE_CVES += CVE-2026-60002
> +# 0019-CVE-2026-106583.patch
> +OPENSSH_IGNORE_CVES += CVE-2026-106583
>  
>  OPENSSH_CONF_ENV = \
>  	LD="$(TARGET_CC)" \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
