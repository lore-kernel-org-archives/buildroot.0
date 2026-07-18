Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28181C4451C
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104D4606C4;
	Sat, 18 Jul 2026 14:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bWcZboIQB_n; Sat, 18 Jul 2026 14:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B2660673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784385422;
	bh=P+fKFyUdvWSYqNjRGmfmf8/djPWxWcmXlBSMj0zlqzY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LxPq5+h2t4/QQqsKV6q9mHlE0e6LD3ym85QvpauiIK41S4f0yra9LqiAanwvdfitg
	 uBNaZatgqPyFjhUEZp+RxZhSw66EkJOZ4z1CTxTjv0JKmlrxZ3QNpjr7bqIY58R+G0
	 wXvEyPQeajLy61c+ti8Pk38WV370NN10Ox4wYCKFSHLemASt6KTvMJFQS+XFT4owua
	 Wf0C6Ng0cFdjXoj3NekUqrZGmJ3ArVEAyDoMwWU5e1fQ4/q/jHxB9YOMP7zj/6r5kd
	 17DOeUF6fK04+Bqfklh6IC2J14G3FKg8I3DI0bIHH7rcpSsP0lIHWr0raY471+0UYk
	 UTMxZnjRBUx1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B2660673;
	Sat, 18 Jul 2026 14:37:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 546B71F6
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 14:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CA8780D9C
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 14:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eazowii-870x for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 14:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2997080C95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2997080C95
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2997080C95
 for <buildroot@busybox.net>; Sat, 18 Jul 2026 14:36:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E8A3819F57E;
 Sat, 18 Jul 2026 16:36:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jul 2026 16:36:55 +0200
MIME-Version: 1.0
Date: Sat, 18 Jul 2026 16:36:55 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260612205029.269642-10-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
 <20260612205029.269642-10-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.17
Message-ID: <1edb708587e459f9ecf1d11a82413d34@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784385417;
 bh=csOaU7zyhjxv1n1yjgmWrLy/L1Ik0OMywZZOfYrVlWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jt6PIUcfUKeB95wv7bMLpY0Ndrh1qKb0GCttsHsmwy88cAY7zAentcmRC07g6xsZs
 Dvg2t2FxN/bCcP1o+FfrClgiVuv0x2NPr0AXEJciFtYF8i56/lMwpysHY6cT6d3c7y
 /UFlPcaobNKBBcFWTJBuSfkgNrjG6pa+YBhNzqmRJ0gMO7iN1A9zt8CwiAjyQfzn4Q
 jACnCV01AG0O+Z3X3qHDWWNkhgxHtYnkySwAvDsXBhsNrplnXoKxsE3sjHzcSsut6/
 s/jjpz9L08hQsUkyiY9U1pilzZCibdxwdLO3KQNPxMFafanwLNBp4Zf2yD6LGsXAp7
 0j1UmGEqPmBcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jt6PIUcf
Subject: Re: [Buildroot] [RFC PATCH 9/9] package/hare-hello: dummy package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

Thanks for the patch.

On 12/06/2026 22:50, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                |  1 +
>  package/hare-hello/Config.in     |  6 ++++++
>  package/hare-hello/hare-hello.mk | 24 ++++++++++++++++++++++++
>  package/hare-hello/main.ha       |  5 +++++
>  4 files changed, 36 insertions(+)
>  create mode 100644 package/hare-hello/Config.in
>  create mode 100644 package/hare-hello/hare-hello.mk
>  create mode 100644 package/hare-hello/main.ha
> 
> diff --git a/package/Config.in b/package/Config.in
> index aa8818ce7..7d1972b09 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2366,6 +2366,7 @@ menu "Miscellaneous"
>  	source "package/gqrx/Config.in"
>  	source "package/gr-osmosdr/Config.in"
>  	source "package/gsettings-desktop-schemas/Config.in"
> +	source "package/hare-hello/Config.in"
>  	source "package/haveged/Config.in"
>  	source "package/linux-syscall-support/Config.in"
>  	source "package/mobile-broadband-provider-info/Config.in"
> diff --git a/package/hare-hello/Config.in 
> b/package/hare-hello/Config.in
> new file mode 100644
> index 000000000..7551f280f
> --- /dev/null
> +++ b/package/hare-hello/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HARE_HELLO
> +	bool "hare-hello"
> +	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_HARE
> +	help
> +	  Just a "Hello, world" from a single Hare file.

When trying to build this package using the following commands
and config:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_HARE_HELLO=y
EOF
make olddefconfig
make hare-hello

The compilation fails with error:

Error: Command not found: aarch64-linux-as

This is because the toolchain name is hardcoded.
You'll probably need to generate this hare/config file. Maybe a bit
like the CMake infra is doing, for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/package/pkg-cmake.mk?ref_type=tags#L279

Also, is are those config variables file really needed?

When trying another hare package like hare-xml relying on your
hare build infra, the build works.

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_HARE_XML=y
EOF
make olddefconfig
make hare-xml

Also, while this hare-hello is useful for testing this new hare infra,
it has limited value to be included as a Buildroot package. I suggest 
to:

1. change this hare-hello package so it builds with the hare infra you
added (basically, you need to add a Makefile).
You can do that in _EXTRACT_CMDS, see for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/package/mkpasswd/mkpasswd.mk#L14
I also suggest to rename this "hello" binary to "hare-hello" to make
it more specific on the target filesystem.

2. move this hare-hello package into a br2-external tree to be used by
a new runtime test.
See for example the openjdk test:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/support/testing/tests/package/test_openjdk.py#L8
https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.1/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world

3. create a test_hare runtime test which builds this hare-hello.
The runtime tests will just have to test the program executes and
prints the expected message.

Could you send an updated series with those changes, please?

> diff --git a/package/hare-hello/hare-hello.mk 
> b/package/hare-hello/hare-hello.mk
> new file mode 100644
> index 000000000..ad23f17ed
> --- /dev/null
> +++ b/package/hare-hello/hare-hello.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# hare-hello
> +#
> +################################################################################
> +
> +HARE_HELLO_VERSION = 1.0
> +HARE_HELLO_SOURCE =
> +HARE_HELLO_DEPENDENCIES = host-hare
> +
> +define HARE_HELLO_EXTRACT_CMDS
> +	cp package/hare-hello/main.ha $(@D)/main.ha
> +endef
> +
> +define HARE_HELLO_BUILD_CMDS
> +	(cd $(@D); \
> +		$(HARE_RUN_CMD) build $(HARE_ARCH_OPT) -o hello main.ha)
> +endef
> +
> +define HARE_HELLO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -T $(@D)/hello $(TARGET_DIR)/usr/bin/hello
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/hare-hello/main.ha b/package/hare-hello/main.ha
> new file mode 100644
> index 000000000..943c97169
> --- /dev/null
> +++ b/package/hare-hello/main.ha
> @@ -0,0 +1,5 @@
> +use fmt;
> +
> +export fn main() void = {
> +	fmt::println("Hello world!")!;
> +};
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
