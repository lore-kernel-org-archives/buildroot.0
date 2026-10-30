Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B25606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HjheahB/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B798A40F29;
	Fri, 30 Oct 2026 15:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJnDkn_QYgik; Fri, 30 Oct 2026 15:31:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FF5940F36
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374305;
	b=MUC2p6WBQBiWyDEJ9AqBI+eFA6PLYgNUNtm0JG50vlE1Ezbz87AZolEI5o4ee7Bw1ZZO
	 zbO343tN/eQeF9bRqTHJp+LG6TMlbFBscn2pg9IZLhH0WZ4L0nhEh/NtjcTg/kCJ9mKTk
	 s2fQt6S86WTOX+6d3xthabLMKw2iht1rZMpp+9GVR6CTBKGfmAjGp0XIRZGus3jy7eMH8
	 cUqE8LnCW1lxI8c6SSDbl2d44lag/bBLy5vxn+D0qKYWKxdmdkbdZJYBcPTPuUfL0XImg
	 3iMTl0OLr+dzm7OVvIPr4vZCAuFac58Q4OHfYxTANaN/ZiJdemC8ag7LvDNpfnAgDvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y2WFgy1C+Vf3/RLcPdwOFCGcYfIJGsCKfWqrWOSzH4s=;
	b=rr7Jv9mz/ENYYhnzAWQsGJJ16f4Mc/CuwoEFbmsqLE8uEFSC4rp5JI5rlLmu5wY9BO1P
	 jU9v2QNiPDzT2aS2u+HjXzUcbH1r1XvAFOuV9wg3LiWVoHDaaGykLwhgVbCT1EfglBQhi
	 LKN8mPpcH1WJHwvIW5jWP3AQXuJXBsRECBEtnyXTvQvF/7dLxtiFqcBA6xLVC3Nw+I3NB
	 HO1rxlLeguQ9WP/VjaaKPSGxHsf/PPjPXMZysEMRMr8Cmv0LtN4wDoNnmMzXrXjP0YcFn
	 14njYgu9tATMF2wAmLrQAVYHCt9XLpkNIks9iUgCyg9usgk7r/s4jqbAf2WPTlLxWuQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374305;
	bh=y2WFgy1C+Vf3/RLcPdwOFCGcYfIJGsCKfWqrWOSzH4s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HjheahB/9z4kF1IOIHO0gzvVFCF/neIWL6gAaNmKx3YQ880ZAGzr1n85ebUjmeG6w
	 nfTKZCBkl9RoqrpBcWeQkKWt1Pbzd/7a88f5pVP/eUElvkew6SYo79rjsfKifPqiUE
	 1J8CA0HYavRPYDTO/E+6mZGDBOR7madR93Ck0fHx/q+BPo7WD9agxLnDGYuP30m/X8
	 BXOWOIXY8hUzuLwxEJCwd3tW/dodsPwr6Tdy7sotWXwJKidGoSnKxWvP6w37xOmdEv
	 nQRIDYBj9EJNUFEA0KTbJuCBb0OUD6atp81flangjxSZqVpu/CuW9oz3DsVYhWXEU9
	 VlxIQyiDBXYcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF5940F36;
	Fri, 30 Oct 2026 15:31:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD1E4235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C2181CAF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRiQE1_z6cPs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E8FA81C40
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374222;
 b=e+eutQ3viENrEPRr/tB+ual7bNsb0Mz9VHHb5vtEmEBrJkIAq8ySuHbnvF1A/ixpLb0v
 9b1OpZiWe6iDanEp1BS0YUly4fCi8n/c8+IliUGWeShBdVeegp7xhFSxnb8a3UlHgdzo+
 WnUiBlNkgn8FepJQ+PeH/Zdqm882gABMEMdijGO73OC0LERrzgyRxZeO7vGp2Oa3gfokt
 f//A+5kLKiWiW/fz24uvi1AT/SH7alrZH3oZYXxVU9/s3bR1lH1lioZVBkap6E+7lINFY
 9c93fFHADXsY9Xyb6blqvrey7+4su7Nt3nidg+Zv9LYInbJTTPmtS0KbvrccCM+FnXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374222;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SiMN3A/TMRW1ELhgsn3zU3Qv+IZQrCmYBoaT6Z7mT7Q=;
 b=WnIK6D2BdEKB9WmMulV2CruLpkmS8xozJlBUZNyVOxDRnCF7QyLIPRNN0GYvwQGZnr3m
 7EammlLkJ1jalpuCuKfx+bu352jDGlXho6aeVgiqDkRfiKiibs8eoekPGQmiqQk+IdVdA
 jDgzOAONTaACyaIs6/aSJ94j4+b+rjJN4rKCURkyvnqjNbnqh97Ga5f8TpPHGuygNctNr
 jDerPRaF9Drc4pMOMqcXPWcRwVg6vq/7+yYXvzBaLR6P3Za4xXHI/27MdIrUQygoBqD69
 XTxTT17bRmrv/H3IsSkEyuURR5fL+ZdJho8Cv+/WVvt831YkXrf0Px87q9fZaIG822Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F77xkiMI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E8FA81C40
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso617267f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374220; x=1793979020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SiMN3A/TMRW1ELhgsn3zU3Qv+IZQrCmYBoaT6Z7mT7Q=;
 b=27BCxQTgNO6Pfnnv0H7uZN8kixNe6VDK8DOuxbf3fFKbBEsQHEIx5gGfq7VFMaA2Gl
 qwPq0t5zNVFFvLaZAZSe960v1ieMJqFedImPQytRtJU21LZ/+pT0qekokfbwub5C2jNK
 D/MfPd0xvC+JFhG6nBbD100uNdVlaBkHzcunEGY6CLG9A/nrI/EIBPZX1PyOZZNjpH+v
 Qj+GFvptfYW44iPNtzIF9litpHxfCwwf3FwU8/WzTqLA24+SGvT0zqBh1o3GHQq98u3k
 BeaqwmXlr6wrzzKqTpCNDOoecn++72eFCyCni0foOk7dFa+JNcWTSJUiiZ93uMTgn1vz
 7/cA==
X-Gm-Message-State: AFq9FYJPgIHTcKXq5Rq5Ni3ZeE4XxfbSDWCps7BNKoXmwa/LnzvAgRVX
 3n/kRBGeRCqkknmIl8IF7QeLWhwMMrnNQvJmX9o0h7sX3+kMyyvOXfjStEPvE2FUVb1jr+gXhb6
 blZgysq0=
X-Gm-Gg: AYBFou3QBIRvMX8KXvekny0CfM8sqRfWhWC2mNVgnq9h2VBi+DDTBI16I0Bao2owLlM
 cYtC5RvRBn+kDcuER1l+pQC8dhAG2NDle7ji8GOurpEDtGgMFvdf66IP0kAH00VKvcMWB1WgCHk
 pOTsMwUQ4hjXKlba1ZKSRk1qVAGuwrLfd0s7EaIxRKZr/wNE8kkZXm93iRY3MmkeomX+/MW2RFz
 CLE63EktsTDCmNUokV8KgoHeMjaYUCY1NqbLO0HmVs8s3zpb8YcxS8IWgYzuQlG9IeYBp8SioGF
 6yEe94uWc9HP55atNaMyIdM6Skz8owtdDNc/k6VWa/GisTghaN6AEK/HzaHsJrRzKuVjGir6wPS
 WnLnA8fA+ee9/KxTqZ/DuHWiLKFv48coR+cMb/1Ym4/BPEEhM88vrKkORMuX5Mwk7Hz91iJIXDP
 awoofEC2TRFKh8rm/JsPgBtIay+BhcfHnIu4StXFk0ZNBEK4VGSNTE49dyJ4sh5ZFBGx7ql4dyU
 VQvE1l4N6yqhKx0+hB6ara/sv1TwMWqpV1tN72dj/OQWbNaahm2wfcMsYBI5cD+546ES4d/F6UM
 AARRjWm1e+LK8WIdlyjzbNUIr57b2gqITw75mz579ShkBxg6gKKp4arBgxccwVPJ40GygFGc
X-Received: by 2002:a05:6000:1842:b0:48e:3cec:b852 with SMTP id
 ffacd0b85a97d-48e6e500962mr6971140f8f.40.1793374220042; 
 Fri, 30 Oct 2026 08:30:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80306sm4155461f8f.33.2026.10.30.08.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:19 -0700 (PDT)
To: buildroot@buildroot.org,
	Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:17 +0100
Message-ID: <20261030153019.1908423-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027143901.402-1-fred.lefranc.evs@gmail.com>
References: 
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> In ssh in OpenSSH before 10.6, a $ or \ character can occur in a command-line username, leading to injection.
> 
> https://www.cve.org/CVERecord?id=CVE-2026-106583
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>

Applied to 2025.02.x. Thanks

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
