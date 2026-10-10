Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A86CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E1360638;
	Sat, 10 Oct 2026 15:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96PS0sFRhHuI; Sat, 10 Oct 2026 15:49:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1254260639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791647384;
	b=Y+4eS+gTqrgcEXHF9BpKM7SsC1ZEvugffimxQOPo3Os1STEmCKHnLpVvsnB8lZCQiP4b
	 YSN+BNb+0T+aqt68SkHbQgt07a5VDsqChRoYI64j6U56P4fzcS/BC9RcORYUCMdRfPYYj
	 DEaCVp4PJTSYiTvaGpu7ukan+Z5r6Dhd/DHQWQinq8jUqm3WIxOdqaMlS85bJDuycDVmv
	 vxeMBs+ADFfPVqtYN9Fa4PtWPPIX9BTPNAm05inGw7c/cqB/t4YdwKu6dqvXg21XHy1te
	 4H6fVKYXxxFf77NBGnGn6D6HWtkRfs6Co0t8CoP2nME+mpD4hSvlCBjaZYVTpD/1hqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791647384;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=iJQcJPmBfJv/f68Z2mz51sqpw5LkZySblGzFkn5U9BQ=;
	b=hjy5aBW4NMC1ZWXorkbQr+TWBSgCltAAGwrv/0uaskflJynIEpur11KbrT1E9Uercfj8
	 Oip33c88wKZg+mdZOWSW8Y2tt7ufxnHXVszYjtBLU1c+p6NLj0A2FFwqB5iCJN0HK/JlH
	 MPiff1sk2zrnHBPBpX3+g6vVuOiMflEABd0bKqrrC3zvj2jNpHB0yHVWUbmMySFEAI3Bu
	 pGwRfxFhs1JrVvZ7qnp9rq9aypkxR7EkCyNJdpArUaOsQkqSNtSBIVpgyVdo+AzLhOdVc
	 q4490uRtjaRXj99AV6iGWpbtcSnHVPlkAZtYI8GjkC//vOE6P8n+VcTRBDrOS7i8VMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791647384;
	bh=iJQcJPmBfJv/f68Z2mz51sqpw5LkZySblGzFkn5U9BQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qPLsd6R67AHfEjdvlED5Yxu5D+M6n4cQ5rrJHPzR/x5Mnuwy3Bd9Knj74e7z5Tags
	 cnA3sqEcDRuLjbTtFedJ5AcMk7/2CgSisUheXmTO0v1zOj0ApQPgHms9EVvHSkQV97
	 iY00Yvx1SwNFk6rWD1R6HnByMafTAxQnLH+tXjdmnTX4RZQXlmPRWwvNm9ls7TV8M7
	 FKWuyf5v+urxg1GkPuavcp7wa4nlmwHFX93ZbA3IooR/PgZiQA0cnBDN2vhK5EMSaL
	 Ai8bBfWMRUrjhsjDu0MBjF4TwnR368GNk5gfYeclXyHOgt/JkyliS81ZLbSQ0kTp7r
	 N/0MNUgt5HfnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1254260639;
	Sat, 10 Oct 2026 15:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F12B122B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD61811A1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6N_2-6aMRm7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:49:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A247C81188
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791647379;
 b=B/siW8VNSwRG31OtEQ1ZOqiTbTFH/bGUuTs5BnB6HvwaqDz7M+libqPd3NLZM0I0vhWR
 msJvyyjMxXnGY/GmQn9kjlAP4mYWdxlTZlHTIUIDkM0DKTZk4Cdp7Qgjf2wETjay3obh5
 /kY0C7hlWqdbf5yd6jqEdZq2eCloddDG0/VWaQD3bLH/6K7lkcpVjk3qXUSDlpcoowxNZ
 eBNkBLrum6vHZ8mGbVw7blOUHgjaWgDQ/JJtA/c7CJCqTI7lO7Sbaz+2uvpU8vkkQ9GfF
 J/uPjSMugk+U1cQPODKVTValD5HEpqyPhvoQU7bpQUxBtM8WIAs2iTCAQLis73AxXEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791647379;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=K25Gw9UZqc6jE6Zzln+3mT7FKPwFnpHjf8Igr4uwpY4=;
 b=afXNlWiX2l/y3iAQBCAy3Nlz7sPbCt8SxswQrE/IlMZ7ETz+AwOu1cMRzeBiD4hGKpX+
 F7A5GC1WTG8KftQZOm3OJHvJYbYOq4709tL/bSzrLJBSZE49IvNd+SEOTNB5nxcRbmsR5
 89xbsODisHdkMwdI8o43CpKBIPhdtedugTljdSMwPpeGCpbnLdK3OkvwoJ+aLLJkSebGV
 1Z6DY0bdEsot7esqGRXhJRPe5L0uA1/fdgxnR+tb2zrs96d9XIDP+LMxrZcKAhDo+1VZ6
 QEv5x/7WCA8VBHLet12H5dcsbYXJ02a9f0fMGd5lMhLAbS5NKyqaglBksecZyxp5ZSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="MHL71+/v"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A247C81188
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:49:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95C67B978F6F; Sat, 10 Oct 2026 17:49:33 +0200 (CEST)
To: buildroot@buildroot.org,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>, joseph.kogut@gmail.com,
 andrew.smirnov@gmail.com
Date: Sat, 10 Oct 2026 17:49:24 +0200
Message-ID: <179164730454.164174.2181715572466350670.b4-ty@rnout.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260305094946.344077-1-chakrabortyshubham66@gmail.com>
References: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
 <20260305094946.344077-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/zstd: add pzstd support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 05 Mar 2026 15:19:46 +0530, Shubham Chakraborty wrote:
> Add support for pzstd, the multi-threaded implementation of zstd.
>
> The pzstd build requires C++ and threads support. On some architectures
> (e.g., Microblaze, SPARC), it also requires linking against libatomic
> due to the use of atomic operations.
>
> Ensure that -latomic is passed in LDFLAGS during both the build and
> install phases. Consistently passing LDFLAGS is necessary because the
> pzstd Makefile re-links the binary during the 'install' target due to
> its dependency on the static library.
>
> Fixes build failures reported with bootlin-microblazeel-uclibc and
> bootlin-sparc-uclibc toolchains:
> Pzstd.cpp:(.text+0x17e8): undefined reference to '__atomic_compare_exchange_1'
> Pzstd.cpp:(.text._ZN5pzstd15BufferWorkQueue3popERNS_6BufferE): undefined reference to '__atomic_fetch_sub_4'
>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

 Applied to master, thanks!

 I removed the config option for the host - it's just a few seconds of extra
build time so we can just as well always build it.

 Regards,
 Arnout

> ---
> v1 -> v2:
>   - Consistently pass LDFLAGS with -latomic to both build and install
>     targets to fix link failures on Microblaze and SPARC. (Joseph Kogut)
> ---
>  DEVELOPERS                  |  3 +++
>  package/zstd/Config.in      | 15 +++++++++++++++
>  package/zstd/Config.in.host | 10 ++++++++++
>  package/zstd/zstd.mk        | 29 +++++++++++++++++++++++++++++
>  4 files changed, 57 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e983ae113..526f2b81c1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3563,3 +3563,6 @@ F:	package/shapelib/
>  F:	package/simple-mail/
>  F:	package/tinc/
>  F:	support/testing/tests/package/test_quazip.py
> +
> +N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +F:	package/zstd/
> diff --git a/package/zstd/Config.in b/package/zstd/Config.in
> index 9fa70c65cc..0331c5e446 100644
> --- a/package/zstd/Config.in
> +++ b/package/zstd/Config.in
> @@ -10,3 +10,18 @@ config BR2_PACKAGE_ZSTD
>  	  compression formats
>  
>  	  https://facebook.github.io/zstd
> +
> +if BR2_PACKAGE_ZSTD
> +
> +config BR2_PACKAGE_ZSTD_PZSTD
> +	bool "pzstd"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  PZstandard, or pzstd, is a multi-threaded implementation
> +	  of the Zstandard (zstd) compression algorithm.
> +
> +comment "pzstd needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +endif
> diff --git a/package/zstd/Config.in.host b/package/zstd/Config.in.host
> index 05751f8fbf..a4ab64baf5 100644
> --- a/package/zstd/Config.in.host
> +++ b/package/zstd/Config.in.host
> @@ -6,3 +6,13 @@ config BR2_PACKAGE_HOST_ZSTD
>  	  scenarios at zlib-level and better compression ratios
>  
>  	  https://facebook.github.io/zstd
> +
> +if BR2_PACKAGE_HOST_ZSTD
> +
> +config BR2_PACKAGE_HOST_ZSTD_PZSTD
> +	bool "host pzstd"
> +	help
> +	  PZstandard, or pzstd, is a multi-threaded implementation
> +	  of the Zstandard (zstd) compression algorithm.
> +
> +endif
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 70da1e7354..318a2709a7 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -78,11 +78,26 @@ ZSTD_BUILD_LIBS = \
>  		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
>  			$(ZSTD_BUILD_LIBS_BASENAMES)))
>  
> +ifeq ($(BR2_PACKAGE_ZSTD_PZSTD),y)
> +ZSTD_PZSTD_LDFLAGS = $(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic)
> +define ZSTD_BUILD_PZSTD
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		LDFLAGS="$(ZSTD_PZSTD_LDFLAGS)" \
> +		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
> +endef
> +define ZSTD_INSTALL_PZSTD
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		LDFLAGS="$(ZSTD_PZSTD_LDFLAGS)" \
> +		DESTDIR=$(TARGET_DIR) -C $(@D)/contrib/pzstd install
> +endef
> +endif
> +
>  define ZSTD_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>  		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>  		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
> +	$(ZSTD_BUILD_PZSTD)
>  endef
>  
>  define ZSTD_INSTALL_STAGING_CMDS
> @@ -96,6 +111,7 @@ define ZSTD_INSTALL_TARGET_CMDS
>  		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>  		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
> +	$(ZSTD_INSTALL_PZSTD)
>  endef
>  
>  HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
> @@ -104,14 +120,27 @@ HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
>  # We are a ccache dependency, so we can't use ccache
>  HOST_ZSTD_ENV += CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
>  
> +ifeq ($(BR2_PACKAGE_HOST_ZSTD_PZSTD),y)
> +define HOST_ZSTD_BUILD_PZSTD
> +	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
> +		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
> +endef
> +define HOST_ZSTD_INSTALL_PZSTD
> +	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
> +		-C $(@D)/contrib/pzstd install
> +endef
> +endif
> +
>  define HOST_ZSTD_BUILD_CMDS
>  	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
>  		-C $(@D) zstd-release lib-release
> +	$(HOST_ZSTD_BUILD_PZSTD)
>  endef
>  
>  define HOST_ZSTD_INSTALL_CMDS
>  	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
>  		-C $(@D) install
> +	$(HOST_ZSTD_INSTALL_PZSTD)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
