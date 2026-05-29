Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957A8CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69690423AA;
	Fri, 29 May 2026 08:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGtWj3gJ9yXN; Fri, 29 May 2026 08:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A2E4239E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043455;
	bh=cFVoaC38VlE/EjFuEih9bHDH/p9bbUy75q0TSsX62lk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wvh92rZmYiZevfnkl2eTpHC8mYbg7sneoEOgaukb/BwFN5Zmwub3QVA3KkkfNlDN4
	 co+yROQ41gyjgU2JXtpTbcotuxeo/N9MLISqa+SW0cXdJmukphgio2Ktd9HP38oDvk
	 v9NcCLtoMyzetlG9OTVQxMBTUWu0erq5ZOT0Fuk1CvDhJK+JoOfm67o9tHqy7hPI/Y
	 /hyDRD6RbvTC4ElRNk8pMifLtnnrxt6foW9AunVtM0SyrRv8LQ3IGj92KbAWwTGUBR
	 wH1cOPPGVwCQiDt2mBp8bQ5vNlUUjHaYf0+aNz8/rcWvwkKhMCJIT6vvym/NJaAaqH
	 9GF+tYd6VvAgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A2E4239E;
	Fri, 29 May 2026 08:30:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6C1288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C640613AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPynDbYBWA9S for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38957613CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38957613CC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38957613CC
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso59458025e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043435; x=1780648235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2UoyXSGqqUuiJDCWz+bjRULhBtfycavaCNf6Fv5A4f8=;
 b=Ks3YtypGizsiZ+PryokMcmCkX9fqVWnVJlvAm633LPfsKo99G5h2ngEvayay/oNHiV
 F3vTpx4oxkTcoy60aPPQM6jNLUcMN/eRpPNTHau2mX2s9NUUwAlmHf4uXXI2sAL6eXEU
 VH5ANJU7Uy0pyW2vugVaDPimT4GuTY7LKAWUa5MeuDJzd0aJ9lscj39+KBo9DPcLqd3w
 /PxWPGSlp/LlqghgSXDLnW7V5MbFCExudCyHaajJXq0eZtJWh6aqT5x3cteUWt+z6bRT
 +VWb70vLJZX0vRhxYMTRNNSr1Xlb3rMB3+uGMXnKGTPiZFGsbPZQItYoYSKUkSzqT3Bx
 gEKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+tNZ2hN1sGAb4CBHZQN0X05vLaD+OtL2cwlnHICXHeuDCIch3pDhwLSoUh6LkQ/Hkn5sCVH9b/2Os=@buildroot.org
X-Gm-Message-State: AOJu0YxT1vRxYfO1y7OFB2J/m8GtV7uDuHrb/EO6oPncVTcrABkxdMu1
 GaH4Z+sOfTN17BQPpj8qfLS8AwKgwQEUbUSLNQS4yQ+Fp5E4SNI450ra42ORtrq++daZgb8it+G
 veOq9
X-Gm-Gg: Acq92OHxuEVH8UpuSk1cXP0gVjwvw1F2GIDV8mcrX9YBX67Mb0V2Vujttnxjg7r25bv
 G9AUPDiZj1X6fDtZ9pGydKT8dUuNA7BNY4usyXVWxVYXSRUUJe9+mmnuiue9fqLklxHsBNd7Nxf
 BE/rxKo55mUIdiCKc7NdbwtgEUDhmkgmmzqomQNu3J3B2sBJL0JfzMM+cUHiJdXhAeJjjU/P4hV
 MbZZ6hBil4onuo8e9omymbz59lbAv4YNFQpJcGwQgDLxp+7fcLZhw1vOyRnRNX4wibhPiw9pTm3
 kn9gPJt+EgOBMwqheNTc+hN1zVNYpXd0jS9b+NlvcOCuOQTZX5Ddiuka8a1+ckivtVb/4XBiwTW
 AUmnRLZA2C1pdXsqnTPPJeCqtZvGsH0gTQMl5KS+lfI+akEuJ7fHyoO/U3pflrqIzm6Gz/mdO71
 UV5jknuwrFIlfyigbxoQWhRMAp1mRkxqvYcK9K3AYjf96dCqs1JBbHb0U2rw==
X-Received: by 2002:a05:600c:6995:b0:490:6869:46d2 with SMTP id
 5b1f17b1804b1-4909c028863mr36266935e9.0.1780043434947; 
 Fri, 29 May 2026 01:30:34 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm31968415e9.1.2026.05.29.01.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:34 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:34 +0200
Message-ID: <20260529083034.60040-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520092415.665898-1-giulio.benetti@benettiengineering.com>
References: <20260520092415.665898-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043435; x=1780648235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UoyXSGqqUuiJDCWz+bjRULhBtfycavaCNf6Fv5A4f8=;
 b=A/VgCqo+tolyDH+EhsN1WUj/RMoVUHbXmN/9LWRAJLS4UdlJeABamzi3w7V4B36GUF
 Al1kKgsoo2FOWgqFsW4ee/fgjnAdE6D+M+hicGunDyWL/qHwskSVwNDdFohEqGAnfkKr
 NGOV7/U//qRKhccCdPxPaoq0KxmYxfbW9huFEA80ptlm1d+EDE0mnOzGKBKEto2yxdaa
 yzQZYx3f7/KuMFzPdbipXgikdD3Qh4VDiSarRrpuKNPv+P1uLBMLIrQglnuQOzbVc2aF
 z0fZEz7qC3RRyC87SDbukyjNsYsMWoP1reeVEUo4yUq9ulO0EpKZKdTbeGImtmeHVJtC
 6MDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A/VgCqo+
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.49
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
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.49/doc/arm/html/changelog.html
> 
> Fixes CVE-2026-3592, CVE-2026-3039, CVE-2026-5946, CVE-2026-5950.
> 
> Fixes bugs:
> GL #5804
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5804
> GL #3589
> https://gitlab.isc.org/isc-projects/bind9/-/issues/3589
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 7b268a49b4..b719012de7 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.48/bind-9.18.48.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  c742a69bff2561c23099d7c70c6984c145bcca1c1e3c67fac1f68a8132e8e7c5  bind-9.18.48.tar.xz
> +sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 17ea50c5f4..6c0d2f8a03 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.48
> +BIND_VERSION = 9.18.49
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
