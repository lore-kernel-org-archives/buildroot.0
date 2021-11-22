Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 20:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16504400FF;
	Mon, 22 Nov 2021 20:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYR1AdzJXs_H; Mon, 22 Nov 2021 20:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC3F540235;
	Mon, 22 Nov 2021 20:49:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E89B1BF5AD
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E08780D43
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4NlT8b9ytQ3 for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 20:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1E5480D30
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 20:49:12 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x6so70380461edr.5
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 12:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gof4aMmzse/x6XYguuxIHSgda7Sf5V1IkiWAY6VDZ/s=;
 b=aJWD0l/Zp0Wf8MWD5pZXZX746HR7QY44TgDTziIdaXhdK2lnJ5xnTGlYKfheq+FY2w
 8y0N7K7LRL/kQ71g3IkgC4mUSvvIktcKcm/6DrtcChzPEqKTuziaPWa3J3P299pKncWO
 ErGCBL+BbWoIqO5Zxm2KoHEgJFz1opnloMcsi8Kob0EZO3kl6UMqSpChMRF0BgBDUuPk
 h4+Zany4L/TSxwsdrpXjEsSVvKdRp1uDDc4mBtiFc++M000ILK1Q+HSwD8kow5VwmOrx
 rcTs6ClhxyajE9j0krShJXL64/O6XSC/JIDsAv1xwPC1Vw+omYHjfWes2Oyg8GavlSXT
 m/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gof4aMmzse/x6XYguuxIHSgda7Sf5V1IkiWAY6VDZ/s=;
 b=bAzVTwuFQmn1VODovH9US/taHRxdqHtKMrBJj3aFw6WkbP88zRU63oTNXidug46746
 CtyRCSNLSwmYsGA2IXM0FqN4XahPrY6FG4KPgqO+wHyMpnIk6rr/brmCRPy3033OA0sS
 aBALho++dsyv9WYoL5+7VRnJNR8P9kLBFBJcNdwVz52fRt4na20iwhYGcDZl0RGdDYls
 dCPtZevp1yHYHbIjIes9yEqA7rN7fSKDlWrHpLEx3FrlOJkCYqv4HX0lq+t38GR7RMry
 6Yc3ov9GMRgnIw5gLxhkihXYkilvKxv0wmIyB/Mkdn8BFbF3pUYL9xU6PN80/K8Y4++R
 VUAA==
X-Gm-Message-State: AOAM530OwmrOIF4SS2/w2wotnvi9HIRS44r6VIJ/iFIpIMXf3SPL6wxX
 4E+6PiiH2wY3D5vbK/RroIpJ0g==
X-Google-Smtp-Source: ABdhPJxVqVq72ZL8hVcS9xqFC0JjXjeDDX7kTQSf/U55YzxorBiU8r6mwHhNDUYpkRfowaBcsKgt8Q==
X-Received: by 2002:a17:906:fcd9:: with SMTP id
 qx25mr105095ejb.326.1637614150976; 
 Mon, 22 Nov 2021 12:49:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i15sm4622634edk.2.2021.11.22.12.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 12:49:10 -0800 (PST)
Message-ID: <65b65624-e345-91ce-ec24-50a8abcf0b90@mind.be>
Date: Mon, 22 Nov 2021 21:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211119074523.2115307-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211119074523.2115307-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: fix NLS build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/11/2021 08:45, Fabrice Fontaine wrote:
> Fix the following build failure raised since version 10.1 and
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
> 
>    CXXLD  libinproctrace.so
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
> /home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++++++++++
>   ...-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++++++++++
>   package/gdb/gdb.mk                            |  1 +
>   3 files changed, 77 insertions(+)
>   create mode 100644 package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
>   create mode 100644 package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch
> 
> diff --git a/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
> new file mode 100644
> index 0000000000..3d7534a48a
> --- /dev/null
> +++ b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
> @@ -0,0 +1,38 @@
> +From c098500aee945ee7a3021649eb0a2655b004103c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 18 Nov 2021 22:52:08 +0100
> +Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
> +
> +Fix the following build failure raised since gdb version 10.1 and
> +https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
> +
> +  CXXLD  libinproctrace.so
> +/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
> +/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
> +---
> + gdbserver/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
> +index 71c3c4ad959..e69fbc4dae4 100644
> +--- a/gdbserver/Makefile.in
> ++++ b/gdbserver/Makefile.in
> +@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
> +	$(SILENCE) rm -f $(IPA_LIB)
> + 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
> + 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
> +-		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread
> ++		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread $(INTL)
> +
> + # Put the proper machine-specific files first, so M-. on a machine
> + # specific routine gets the one for the correct machine.
> +--
> +2.33.0
> +
> diff --git a/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch
> new file mode 100644
> index 0000000000..903dc61df8
> --- /dev/null
> +++ b/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch
> @@ -0,0 +1,38 @@
> +From c098500aee945ee7a3021649eb0a2655b004103c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 18 Nov 2021 22:52:08 +0100
> +Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
> +
> +Fix the following build failure raised since gdb version 10.1 and
> +https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
> +
> +  CXXLD  libinproctrace.so
> +/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
> +/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
> +---
> + gdbserver/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
> +index 71c3c4ad959..e69fbc4dae4 100644
> +--- a/gdbserver/Makefile.in
> ++++ b/gdbserver/Makefile.in
> +@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
> + 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
> + 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
> + 		 $(CXXFLAGS) \
> +-		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
> ++		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
> +
> + # Put the proper machine-specific files first, so M-. on a machine
> + # specific routine gets the one for the correct machine.
> +--
> +2.33.0
> +
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 15515d6d33..4ff498230a 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -171,6 +171,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
>   GDB_CONF_OPTS += --enable-gdbserver
> +GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
>   else
>   GDB_CONF_OPTS += --disable-gdbserver
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
