Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6931FC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0268081F29;
	Tue,  2 Jul 2024 06:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRX-cCY2vLvl; Tue,  2 Jul 2024 06:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E35381EF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E35381EF8;
	Tue,  2 Jul 2024 06:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8F011BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B600740104
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nQ5coJ2WPeX for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 391D5400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391D5400C6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 391D5400C6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:50:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42564a0d3ceso23676115e9.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903058; x=1720507858;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9obI84IcwT3qi6sN2MWhuv8vWjYI4YX4itCkf+ZDdM=;
 b=LBxY3CD4LEyGGbm2Dod1yeFfzi2xjuWBcmqsjo8BwrhJ5LeMhOMurN+LQnzg0Abiqo
 9Ei8fDEFN5lC+/u8b+743Gjhgf48Lv0ltgq1tAh8stzFvNN5Q0MyIs7yHrJqSS2Ogx3W
 qgL9KW17OU/6brd1DSl4oGVOHE6OKeB4/ATtb274ZD6eNaujaZUyfQ1HBXRGhVkNZgGK
 4kVf2tqLIzVlZQ/RyL+l+wTYRdju71NDhG7ap3pIKurIzB4Mbtex3zMSlw4rtyKeLeIs
 6g/KGIEn3SyRgjOlO1VmZnXijU/C0Crj8gIUKpKY0GV60yhGyH/5vTg/mAHbIF7S5KbG
 xvnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNOj8NSMv6k1oI2PLXM6s/qgiFSAMJ6zjnZPf0cMWRAMP+CKfL5imdF/apaVzYsiJqhJMKj42OfL9iwrM8SBTrbTlF0422RA==
X-Gm-Message-State: AOJu0YxDGxGDrniwQQf8K6r3zMcDxfI7BUVgqxL8lBmeiE1a/6TKt5ZB
 fFELmcJd/T9oaU0OHLCJe/f9XqQXO2f2u+2LBv8cvbNo2AhZOWk/dL//HfFy2+3IcLAcx2o/nCO
 6
X-Google-Smtp-Source: AGHT+IFPLqpt2g6MMElIvTbjz/qBFqU27LBfiTtAYiPULDWx4MAwlQn/FxNQTSur4/h39/EsgEShjQ==
X-Received: by 2002:a7b:ce15:0:b0:425:5fa2:60a8 with SMTP id
 5b1f17b1804b1-4257a02fc72mr54942215e9.24.1719903057696; 
 Mon, 01 Jul 2024 23:50:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55e61sm182138765e9.20.2024.07.01.23.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:50:56 -0700 (PDT)
Message-ID: <7f8d7312-6528-4ff8-8641-6ea953b1183f@mind.be>
Date: Tue, 2 Jul 2024 08:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <61f3addeba60f9b5b15aa135c95787ad2f29f81e.1719891841.git.baruch@tkos.co.il>
Content-Language: en-GB
In-Reply-To: <61f3addeba60f9b5b15aa135c95787ad2f29f81e.1719891841.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903058; x=1720507858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v9obI84IcwT3qi6sN2MWhuv8vWjYI4YX4itCkf+ZDdM=;
 b=CJAfPxSFPrV4fO9AYcNJN7Rl81/WvQ4MkEg5etCUlef1JnkPRTyqjzM3qvBZqlu+AU
 4NQUksLSuCL10UKBHXexEd6AdhCX/PF6zJsVNue5uQeJIZ4oGXSMdiIq7KmoNORggDis
 d5abPXrX4HPrbJaKm5BY8o/vheOOYzQGt6KSwOkkXrJz3GgDqDzO8XPNWq9H7pkLO+3o
 avSVgIJxCExwB1WJfVqPew3Dgxqo5trD/+ArBonAwFYRVdg3b6Tzi0tQiIQ7XYip61FF
 xnP3o5GL4ipbWhIVxFgC4stNVwaGtTC1khAc2yfYAJzLPBXtUUN3ywUHWxTdpGTbWjEo
 tzCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CJAfPxSF
Subject: Re: [Buildroot] [PATCH] package/openssh: security bump to version
 9.8p1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 05:44, Baruch Siach via buildroot wrote:
> Fixes CVE-2024-6387: Unauthenticated root login because of signal
> handler race condition.
> 
> Drop upstream patch and autoreconf.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...tection-of-fzero-call-used-regs-used.patch | 32 -------------------
>   package/openssh/openssh.hash                  |  4 +--
>   package/openssh/openssh.mk                    |  5 +--
>   3 files changed, 3 insertions(+), 38 deletions(-)
>   delete mode 100644 package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
> 
> diff --git a/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch b/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
> deleted file mode 100644
> index 1b91b15a7983..000000000000
> --- a/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From f9193f03db0029fc9c31fbdb5c66a2737446bd8f Mon Sep 17 00:00:00 2001
> -From: Darren Tucker <dtucker@dtucker.net>
> -Date: Mon, 25 Mar 2024 09:28:02 +1100
> -Subject: [PATCH] Improve detection of -fzero-call-used-regs=used.
> -
> -Should better detect problems with gcc 13 on m68k.  bz#3673 from Colin
> -Watson via bz#3673 and https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
> -
> -Signed-off-by: Darren Tucker <dtucker@dtucker.net>
> -Upstream: https://github.com/openssh/openssh-portable/commit/f9193f03db0029fc9c31fbdb5c66a2737446bd8f
> ----
> - m4/openssh.m4 | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/m4/openssh.m4 b/m4/openssh.m4
> -index 033df501c3d8..176a8d1c9282 100644
> ---- a/m4/openssh.m4
> -+++ b/m4/openssh.m4
> -@@ -20,7 +20,10 @@ char *f2(char *s, ...) {
> - 	va_end(args);
> - 	return strdup(ret);
> - }
> -+int i;
> -+double d;
> - const char *f3(int s) {
> -+	i = (int)d;
> - 	return s ? "good" : "gooder";
> - }
> - int main(int argc, char **argv) {
> ---
> -2.43.0
> -
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index 58297aa69494..44f9645035c3 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-9.7
> -sha256  490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd  openssh-9.7p1.tar.gz
> +# From https://www.openssh.com/txt/release-9.8
> +sha256  dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3  openssh-9.8p1.tar.gz
>   # Locally calculated
>   sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 5a568d5fd174..6d846f64df54 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENSSH_VERSION_MAJOR = 9.7
> +OPENSSH_VERSION_MAJOR = 9.8
>   OPENSSH_VERSION_MINOR = p1
>   OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>   OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
> @@ -13,9 +13,6 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>   OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
>   OPENSSH_LICENSE_FILES = LICENCE
>   
> -# 0001-Improve-detection-of-fzero-call-used-regs-used.patch
> -OPENSSH_AUTORECONF = YES
> -
>   OPENSSH_CONF_ENV = \
>   	LD="$(TARGET_CC)" \
>   	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
