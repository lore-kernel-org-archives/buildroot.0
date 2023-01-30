Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC2FC61DA4
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 23:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA6B417BF;
	Mon, 30 Jan 2023 23:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEA6B417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8DZibPhd5wb; Mon, 30 Jan 2023 23:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9216D417A8;
	Mon, 30 Jan 2023 23:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9216D417A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2141BF3F3
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 23:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DBEB8234B
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 23:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DBEB8234B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1r7mMHhPJdz for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 23:12:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431A982348
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 431A982348
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 23:12:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MdKRpR2sd60OBMdKRpINou; Tue, 31 Jan 2023 00:12:48 +0100
Message-ID: <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
Date: Tue, 31 Jan 2023 00:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
X-CMAE-Envelope: MS4xfMcOR+otRUa9Eopkr8WQNbE2Qx5j2Fl+m3mDCUtclRtS0YAXqoA5z4X4vD4iCUfXkg7Oy99f5msdlNd5R7rW0dcFcGF1EgRncgndxGh49PxswT1ZWm/Z
 vcKoAkisl3F3cZEfI8B7aXaYJS96EaN08MC1IfJpdL5KNNfKzxB0r3V7CnoTiwcJxkBUVtIrTh25nfIuyPc6tiama4V/KgcgXzQjQH/Gsz2jt3jUFmKwpCQd
 rS+e6HYZ+tmaR0GYh+bGjjiVkWrkpdPc7m5u4n1I4nhTjYzGvvkOmiYcuPAfUeRwPIFSiXOO///GeqD3AhI6IUxwknqihhVMh/BnrCHfvTVOazcEKRgAcnvJ
 K4+3yCu1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675120368; bh=Nurdfa/PGygy0dF+6sSCdqkXQsfBaJD0MWHLJWTxUzs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=N0bWDEds6TypXaIY9PbFojQQ5EGHQloP6FyF3sO8r7fnfjbWnMwLnmQWhHxTzP/wz
 G9DZWTDlQPwVIY/+oPHy75Hj4Yq85MT+1lVr8ga/l3a3c/ZTifjsgAGhOkkllS6X2s
 aoUggBhjLST5dL9TejCeJR7PHoN0XPhGFNzorjGObREbLCv/pS440tGEf2H5EY6yr5
 zH7hjzy52Gyn2fJOleVsb+PEasSY3V/SuYhZsH22BA/jaaa3fjuTYalDMFDzSugnk7
 HS6djkzAxosFkphSS6qaEbcl80foYcivFvhm415NgsPqoEra9hFMfVO/NNkubp+YbC
 KGkX6xwbtWjcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=N0bWDEds
Subject: Re: [Buildroot] [PATCH 4/4] package/trace-cmd: bump to 3.1.5
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

I was trying to build trace-cmd but it hangs while calling the first
make on building stage.

I've tried with both make 4.3 and 4.3.91. Which make version are you using?

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 30/01/23 15:46, Maxime Chevallier via buildroot wrote:
> trace-cmd's dependencies 'libtracefs' and 'libtraceevent' were split
> into dedicated projects, maintained outside of trace-cmd.
> 
> This release, on top of bumping the version, adds this new dependencies.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>   package/trace-cmd/Config.in      | 2 ++
>   package/trace-cmd/trace-cmd.hash | 2 +-
>   package/trace-cmd/trace-cmd.mk   | 6 ++++--
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
> index 2d0accd7ae..00b9ebbd9a 100644
> --- a/package/trace-cmd/Config.in
> +++ b/package/trace-cmd/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_TRACE_CMD
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	depends on BR2_USE_MMU # fork()
>   	depends on !BR2_STATIC_LIBS # dlopen()
> +	select BR2_PACKAGE_LIBTRACEEVENT
> +	select BR2_PACKAGE_LIBTRACEFS
>   	help
>   	  Command line reader for ftrace.
>   
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index 4d39e4d5ea..c0c20dc317 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  a74d9ade2633b88d0ad199360d51996427e23f4835594133e456cd6e3bd3a651  trace-cmd-v2.9.7.tar.gz
> +sha256  9af1ea00e312d03639470e126fa9c786789f03c16df93a57c0bc90eeffbc7d50  trace-cmd-v3.1.5.tar.gz
>   sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
>   sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index 52bb99036c..049ec12925 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,14 +4,14 @@
>   #
>   ################################################################################
>   
> -TRACE_CMD_VERSION = 2.9.7
> +TRACE_CMD_VERSION = 3.1.5
>   TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
>   TRACE_CMD_SITE = \
>   	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
>   TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
>   TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
>   
> -TRACE_CMD_DEPENDENCIES = host-pkgconf
> +TRACE_CMD_DEPENDENCIES = host-pkgconf libtracefs libtraceevent
>   TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
>   
>   ifeq ($(BR2_PACKAGE_AUDIT),y)
> @@ -34,6 +34,8 @@ ifeq ($(BR2_sparc64),y)
>   TRACE_CMD_CFLAGS += -fPIC
>   endif
>   
> +TRACE_CMD_CFLAGS += $($(HOST_DIR)/bin/pkg-config --cflags libtracefs)
> +
>   # trace-cmd use CPPFLAGS to add some extra flags.
>   # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
>   # that causes build problems.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
