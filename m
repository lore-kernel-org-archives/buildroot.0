Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF65C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408D583180;
	Fri,  4 Jul 2025 06:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dr6CpOmzZu1m; Fri,  4 Jul 2025 06:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492B483CE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492B483CE0;
	Fri,  4 Jul 2025 06:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 887D37AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F70240FC0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG5MDCdXhhZL for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7592340FA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7592340FA3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7592340FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so2638935e9.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611597; x=1752216397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AtOAhWcnM2ch6TX6t+LRqgOnpva2nt+bW3flmdXnDw=;
 b=OVvNKyH5lWtOHjL0/AZ23s//uZLUp0qRmaOKEB4sOzC/9KLLNfmO4P4npeZMIy7UoA
 OyVwuH6LCQP2tLfctOjMxCwC9FF8aD5pmY+U8NDdkKpGqiYvp/pvPcw7vmYHP4fgibae
 zSlplpdR17zNio+pLqp2oJFhvTCZTIouiNHEpiyYJdNLW7tXnVD2VMc1lNkgfmXrGl10
 cohyguVvhRTe/hQZi8x+CsyRXVIoItPDOOECmUb+U+BB+eMwW2yCCmZ63MNkIudnsEFI
 6gh/96iUTnBr9c2KdBiYM6WMuyQ5ClLu7wTiHKyMKTtvEfTXBXKz2JvbTuv9ag605yk7
 B8uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGWVdiM48mcFlLSed/K1lisb01Yru23obbaiJMTjmuDg3AqZrKgVt22jl5wGG7f6IF9Whxva2Tnkw=@buildroot.org
X-Gm-Message-State: AOJu0Yyk/H4pnw+F4YOKGtnSUk9B5ftGOmdk+XBBj/6x7qSxFCXiDvWp
 4WWYRggyZwZtxrhwhoNipW4QgcoquVCL1KJfgBRr1abKaZet3mPSYKNY3YJfJi9CF+o=
X-Gm-Gg: ASbGncugEUiGJMi7wD9BcqaESm0lFz5B+0+4z29dQ45luJafvv3G3AHXZZE5UNazubV
 n7fx01z1LVaGiIRUys0y9DWR8WK+n+6y3xQQPj3m4ZU/jJ1BIC3TNn8er4wKK5Si2Lcedi1FLdD
 xm5+zwf5+aMLPSVPASoi9r0227q3Xub83ku/NiH8e90KvVVXJ1BnUTiUAlEObi5+zciQ3Ezfypn
 CvTAXmcvgjZ/tjAQ2q1IX5qdxtapIbjxRHsxK+/DkBVk/gQupOdWuaYWkD3uczVfAGkoOMqAk8N
 P+8868ethm7CI8TcqTsgV9GQlbW8spqlbgfXgnCmSOafwmyEUaVs+mQY36iWCNcm6uwq1hNURzd
 BCFwh9s7OBg==
X-Google-Smtp-Source: AGHT+IEExAouYw8IUaQyX4geLy/ipNA2wAFrcFASF5PzZzY0Y5SjrGS1UcexZst/2iGVPAgHhu7Xeg==
X-Received: by 2002:a05:600c:19d1:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-454b317a29dmr12028025e9.27.1751611597154; 
 Thu, 03 Jul 2025 23:46:37 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030cdf5sm1634397f8f.1.2025.07.03.23.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:36 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:35 +0200
Message-ID: <20250704064635.4063757-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
References: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611597; x=1752216397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AtOAhWcnM2ch6TX6t+LRqgOnpva2nt+bW3flmdXnDw=;
 b=DuKPoIrmEzHxsBz/+54sHF2KjOV1kutjN71tPndrd5O4eUQxVufgDYpfoR5PNzQW1b
 NaDpr9LTi+zZziKNOdwNRpOVIs73DdwcC8w0kEv/HiJ9eqKvoStlsOoLPMS+kRHqY9mS
 DeBH++Cj9goeLr5SlyfjOo43Njl8HJC7vzGZ5kGY0774XLT515j/VNkuBxu0Qe0svX4V
 RJ/NgcKNzPeSzfRhrXCpvm6gpiBVv3wOH2T2smdkU3BCe7z6DO9zXr0ZXIWEcicrbmQ2
 LdiDK4Ei3I1kwYmpNfVBsYqpbrQfieoO5woqWd+42NUtN4puqgx8rOrW+q/4RnLBE9Vo
 y3qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DuKPoIrm
Subject: Re: [Buildroot] [PATCH] package/cifs-utils: bump to version 7.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> According to
> https://lists.samba.org/archive/samba-technical/2025-June/139484.html:
> 
> A new update, version 7.4, of cifs-utils has been released today.
> Users of cifs-utils version 7.3 on older kernels are encouraged to
> update to 7.4 since it includes a fix for a mount problem with version
> 7.3 of cifs-utils on older kernels when using namespaces.
> 
> [...]
> 
> Detailed list of changes since version 7.3 was released
> ----------------------------------------------------------------
> Enzo Matsumiya (1):
>       mount.cifs: retry mount on -EINPROGRESS
> 
> Henrique Carvalho (1):
>       cifs.upcall: correctly treat UPTARGET_UNSPECIFIED as UPTARGET_APP
> 
> Paulo Alcantara (1):
>       cifs.upcall: fix memory leaks in check_service_ticket_exits()
> 
> Pavel Shilovsky (1):
>       cifs-utils: bump version to 7.4
> 
> Z. Liu (2):
>       getcifsacl, setcifsacl: use <libgen.h> for basename
>       cifscreds: use <libgen.h> for basename
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x. Thanks

> ---
>  package/cifs-utils/cifs-utils.hash | 2 +-
>  package/cifs-utils/cifs-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
> index ea32d4dca7..e6a5eefeaa 100644
> --- a/package/cifs-utils/cifs-utils.hash
> +++ b/package/cifs-utils/cifs-utils.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  c4e1eb5f4ad880d96e16d95a1cdbc7ec978ab51c5b6d8a20ae09dac638f36dd5  cifs-utils-7.3.tar.bz2
> +sha256  53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  cifs-utils-7.4.tar.bz2
>  
>  # Hash for license file:
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> index 9c029342eb..9e1e822c4c 100644
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CIFS_UTILS_VERSION = 7.3
> +CIFS_UTILS_VERSION = 7.4
>  CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
>  CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
>  CIFS_UTILS_LICENSE = GPL-3.0+
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
