Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD3606A338
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KgGhqC00
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942AB8183D;
	Fri, 30 Oct 2026 15:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecOKHMsyW5Mu; Fri, 30 Oct 2026 15:29:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B129817E4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374155;
	b=jx/BMcaq60zgOHMF6GlMcM9Ojs5h/mu1kIynELqhe/bKwQ3xmhVcjmHd5jVppvHmNukU
	 Vv4D6/pacstU+MbR/Jnu+OFebf0myC3NNYAl/kgMBJlgG2QfkOoUFPH2D8i2y4F7XDTar
	 0pbEp3qKyuLtz0DGEdqLj+8svacdBzjCnfv9Ahes9EO+w56z4gIZuVZdJ11llK71bW7i0
	 wBepks96ADZepdoTyYndD1urOy1Wo1dgIb46wNGWlycHaTQQ21uK5uT+/hgvnJU+cldQL
	 d2ENAHADYZee/BE8DCpwNbjiV82hIR91/VjQ6KeSpadaiKIIMFQm+N+aen1aQ8MraVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Hu+Osl4dnpv0uFqjh9IHvzV+JNqhLBWRyvk7nMh3uU=;
	b=q0wSe6SmkU6FWcIilBioXjWEoaUmmHH4A1plZ1TYDjs+qH6L8RQXhXVx8uDMm/kiUAPU
	 0se72r5lbCw9lGGN3OTyh8/kkQ1lJvwP2Fe1O5dmPLz2Lx0NcCLg/5n3PtWDr+29s889L
	 AfJ6P+7+yvyxlNPXXUQVPfkscPb2WTkLeT8bd1ZNaK9CKki+5xUvxnz6i9oQW4Z32HJ4I
	 qp2g/cc6h2zrZYs9+aCIrFTOO0PtbIztvCcyD2iAcCoJbP1otMrdsKVhBNVvFS88HUke3
	 t1Kuj+CvsUj57gowT6elagIJWdcm5hf93PJxaVQyiUYZQCYnmrkjlpfz9LIpBxCZUBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374155;
	bh=8Hu+Osl4dnpv0uFqjh9IHvzV+JNqhLBWRyvk7nMh3uU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KgGhqC00KoJib4wsn8jVxBc5OQhlV/wGrrx+zkeW7TkpFMGMqv0BM56dwNN0BjMsB
	 VAKxsgBLXmlrXIasX3rH0JOl5V3wUbGaOpKL7EsWrkcVl/5WiXYAXCU7Lhn9g/bGau
	 y3sQ8D0coCFix0C1+uCvQReIhqhVoCCbkhR1ykR/H/YyjH+2n4CS6pcEklUo4N0O8/
	 khm3DCclTNeaFoF5OK1RkpKZdpAvLrs6yqNlqU3GvBPV60f4/SEZAMujfCEmXmnauh
	 Q2aj3BUW0pmKujg45uMwa4n2KfQTTOtX6ZKHXSzeQeXcnnOVKxj+937b9V6bvLaTLS
	 LBjPwgnxsQ1HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B129817E4;
	Fri, 30 Oct 2026 15:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44AEAD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 362D740CEF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Os2qQ63KqUtP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 337E340C9E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374098;
 b=gRfyC8TiAet2aJ91O0xmCqaO0swJyBP8AJpscpC6/JbnNtpjpek5HV8q0Snfl964v0nJ
 HCroSRaRCpiYxHQ15cn78m1FFmzFC3qGGxkr/36mEtk9ozU3z+HSqP8GRvAhQLldCOZdq
 p3YqFIke+kDE5ZkbKJ+OAhLgqRG15EaJy4wGO1r4T/mYI69bGAEo6bPhcQrQVL/9VYNC5
 743pBNe0VzjQZTehWAhp9IMDHRK6aS4DsZiqI/bZjUnVSVeko+dKoznkWXvY9YCdQlh/M
 9m9U2Yl5kELCPm+fGHIlI+Pi6OSEUT6zmw81p5R+Q5lZvm5gu5Zgd8AWZ+nOMh6AHAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374098;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sJJ73UXsNQWTIrlACFD4YbwaLpIvlcZhvyGY7lJ1FRc=;
 b=EhqitZ0BCflF1FoNiK44RGBr6XBRXT+5GFQAOk0tYB6hUgJXF7GrFuwkIrErJ1NGGrWd
 S3Fizj3ZsruG1xS4w6bquL/FUoKc1KBx/hJnTqUkT+1OGJvPJ9R67e2sAi4PTVMIjZWjq
 D9erq2yGLLXQ0jFcaBeoFO+9+rm+zCyyr7lh6CosIKK9ueiaHOL8sneJuugO0SmJe+Cc/
 6jGqf05ov8bkbb5StrmfAxbENDdOpwc3NA1jsPGxxpy7ycyRwSX073MeLrgYYZCqiSatY
 /GENb4Bhhtaw0DQ5Lgezq3OdD/FK5YWx73XpOJAVHksYWEpnkxRzbifuP9Y13s3sYSg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=U1lTyp5C; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 337E340C9E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so6756035e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374096; x=1793978896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sJJ73UXsNQWTIrlACFD4YbwaLpIvlcZhvyGY7lJ1FRc=;
 b=dZwtAP4PFSPnjkwkdFP8ntGTl5xJrf8JG/2eO7ugqyN+C4fiPFk/Erv2nO+4z1nM8R
 kT4IrA4qlEwThcveSJizX+m4h5BR+xSAjx7zv98oFUJuLyD8VZJLBVXxDyPpIW3qnVKQ
 DYmib7JWcGmpZpeptJGYvrRHQCh3g0v1tOt6d2I72DasujmojsHHqm1d8N3g6c6lBsA/
 GEZwMdiBOHTiCFjzFvzlIw8WCZg0beMFnCf++XphKsqQQHaR1Fg4kgmciFEv7h+wV5Zg
 EUrmSG3tLHdEBbI3yVjtxGCgERjiwN8WyXTh65v6UUASC5Feps+OSMA3g//3PnseDNZQ
 91ZQ==
X-Gm-Message-State: AFq9FYJZw1gAu0kgqvXnrrmRhHZIlYFYkrFbNYfKWOMG3QFpte89i8mD
 Xqa+3AmsX5r/kyO3SW2fPyKL6roRmm5N8OHKYWO25qz/F4OOE1/WXTk/QSTTO+FN0wMInmHFa/K
 KHPpsC3M=
X-Gm-Gg: AYBFou38DXW+1aA2bKheDEcX/sCxJNAyRop7TnMGWoHorZtKp+Q+yK8VaYD24IIgtP2
 ilQ/OamS8CK+6fVtHYtGZt/p5UO0LxEYYd/nax9oqP+y6XZZJ3cD9AP8Q9oJ2g/CKcV3bNKeg6P
 uoMkJEl8sak0MOOkAHO2hGjkj8ksfpA/lHQZqd2U8v7NTUM8XrY+rOSO0P+LtPtXBgWentjVdaa
 cexr0YEcsxHcfIJi0b+Be++/uWYJREAD03b7bqhm95JwA6xRkKldx0AtUTP5ucHRQmFcRjk8i2v
 BDuUyI+vwPjk+jXPGeE8F3YlEQsJxRKThoymgXdzV2NNTAnzeMARUN3G1p5BclYohWKP2aTRzJW
 DXqOpePENPoV1UkFen4z9iTxI45pV40xzBXySmCIEOB8qF96UqgOD+ys2ouCS96/UCWv95Od942
 Kpw/ygSAoEPxJ0ua4jJK6bHyvwYSz30s+ir2+n/AZm+4iIw9LnMsHaHoCsUdMct/Ouch603EiyZ
 i1D6LVRwlRy0UvjidiQ+Lbhe52Ue4rlZj9SN4mW996zFh4voyL9V6SX2L/tYJ1Mi9YE1YZ149Vt
 jgiRJhriX03kFJ4fi92AKShNZhN0xkCnVPFVvMX6inLWPH3nlsTgycaqt42EothHBiJPvsBq
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id
 5b1f17b1804b1-4ac182dca8emr59677955e9.23.1793374096096; 
 Fri, 30 Oct 2026 08:28:16 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78a1dsm3705680f8f.24.2026.10.30.08.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:15 -0700 (PDT)
To: buildroot@buildroot.org, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:13 +0100
Message-ID: <20261030152815.1907219-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022181803.1291476-1-florian.fainelli@broadcom.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: fix PCI endpoint
 tests build with recent kernels
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
> tools/testing/selftests/pci_endpoint. The existing build commands still
> use the old location, causing the build to fail with newer kernels.
> 
> Detect the selftests directory and fall back to tools/pci for older
> kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
> under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
> explicitly.
> 
> Update the help text to document the binary names and installation
> paths. Check that the selected source directory contains a Makefile
> and report the minimum supported kernel version if it is missing.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to 2026.08.x. Thanks

> ---
>  package/linux-tools/Config.in            |  5 +++--
>  package/linux-tools/linux-tool-pci.mk.in | 16 ++++++++++++----
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index b9adc25ad51d..1e881c3ab4f0 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -61,8 +61,9 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
>  	bool "pci"
>  	select BR2_PACKAGE_LINUX_TOOLS
>  	help
> -	  pcitest is a tool for testing capabilities related to a
> -	  PCI Endpoint (only works with specific Endpoints).
> +	  Build the PCI endpoint tests (only work with specific Endpoints).
> +	  Kernels before 6.14 provide pcitest in /usr/bin. Newer kernels
> +	  provide pci_endpoint_test in /usr/lib/kselftests/pci_endpoint.
>  
>  	  These tools are available only from kernel version 4.20.
>  
> diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
> index 17246f5d7ed2..52d7639bb102 100644
> --- a/package/linux-tools/linux-tool-pci.mk.in
> +++ b/package/linux-tools/linux-tool-pci.mk.in
> @@ -6,22 +6,30 @@
>  
>  LINUX_TOOLS += pci
>  
> -PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +# Linux 6.14 moved the PCI endpoint tests into Kselftests.
> +PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
> +	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
> +
> +PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +	OUTPUT=$(PCI_SRCDIR)/ \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	LDLIBS="-lrt -lm"
>  
>  define PCI_BUILD_CMDS
> -	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
> +	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile ; then \
>  		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
>  		echo "At least kernel 4.20 must be used." ; \
>  		exit 1 ; \
>  	fi
>  
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
>  		$(PCI_MAKE_OPTS)
>  endef
>  
>  define PCI_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
>  		$(PCI_MAKE_OPTS) \
>  		DESTDIR=$(TARGET_DIR) \
> +		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests/pci_endpoint \
>  		install
>  endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
