Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7A8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 340C8408A9;
	Mon,  4 Apr 2022 19:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PXPuIDEyWw1; Mon,  4 Apr 2022 19:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD1540928;
	Mon,  4 Apr 2022 19:27:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB491BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0757A60B8D
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFpkFR7gA0UY for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:27:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C226160A99
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:27:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qh7so12060908ejb.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dxM4gofBoyHKJ53fcOIb4pV/FZv9ICZBc631FmA/tvQ=;
 b=V7+VBzb3vlaMf668W1tl1qATQ9MZ5nity/op3DzJRasBHg+bLJzDSLspkQvUf4Sta7
 5ZFiDSBVFgGfg45/3HZc0zYfMiPZVpGQUcoyfwKaEvM/o8Oz8HEnNwiKMH9Z288krtOP
 y2AB4d+/D4uufY6YBZuFZPs9RYy6NalzkDnlKC1Ei2Pi4ycjYp+u3wv+GG0C0cBjSK4Q
 F6bThfmhj61uSiOJrk5xYUgazgZAoF82uDTZeClsTSIjqE3C3D4MinY9PKz7dlYJ35jT
 5JdFMvUoXahlVNPEcaVOIK3jS897OWNbSOseyk1E/BmlhwNmS2ekLLSPWm5fQuxcCi/T
 SZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dxM4gofBoyHKJ53fcOIb4pV/FZv9ICZBc631FmA/tvQ=;
 b=DADrfBB+KetbUOjtDvTKKmIEJ1HhRJH9lCB77y9SzadiJsztrW1soG1olbbp+KjP7O
 puhoaBy3rGdqcZOBw5rfRriPnJOcAfNs1Ucn1ChkC3eP8ZkZXZiueFTBSFMdnF7ZJPVU
 a7qgksX76BbYhbdtFwfIByejUe4PJKfk38DmlHYgTYfeBj1FtfmjGBss2W4PIthFyq/j
 dgSJxCWqHbv6AaHtQ6HdkPDJagtVqJ6PtJSy0ehzvOSdhZw91cGLSFh1cAHrGmMNgo3s
 fAXhdM3bQ1ppiOl/R3ZDoStOk7diARddwoyuq1Rx99D5lrMf57TRNIu7W9ymuINM9vLW
 qrDA==
X-Gm-Message-State: AOAM531/bKG1/ufPCog8BmBpaLydnxc92ZwB9WqopLCmVfJ2rwGbRTXt
 ghIdNASB2yzTYtFNjzho1jbFVJpJ/Ao6uw==
X-Google-Smtp-Source: ABdhPJyXugaWa2zLz7jMbBuyQbtbOvRdiRq97L4ByUJTdIIcmxp5qIeBZAexbqP5ixBFAZYmQEigdw==
X-Received: by 2002:a17:907:8c87:b0:6df:fc27:c82c with SMTP id
 td7-20020a1709078c8700b006dffc27c82cmr1635901ejc.378.1649100464824; 
 Mon, 04 Apr 2022 12:27:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 nb30-20020a1709071c9e00b006e02fed8472sm4683487ejc.104.2022.04.04.12.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:27:44 -0700 (PDT)
Message-ID: <5130f261-7f5a-0b2c-d277-8028b37ce1bd@mind.be>
Date: Mon, 4 Apr 2022 21:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402200118.1193238-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402200118.1193238-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] fs/oci: depends on
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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



On 02/04/2022 22:01, Fabrice Fontaine wrote:
> Add a dependency on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to avoid
> the following build failure when GO_GOARCH is empty (e.g. on mips32)
> raised since the addition of the package in commmit
> ccda2f4bdc97d2f5a4a1efdb357ece8e5b57e10d:
> 
> printf '   	rm -rf /home/autobuild/autobuild/instance-6/output-1/images/rootfs-oci\n	/home/autobuild/autobuild/instance-6/output-1/host/bin/sloci-image --arch   --entrypoint "sh" --author "Buildroot" --user "0" /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/target /home/autobuild/autobuild/instance-6/output-1/images/rootfs-oci:latest\n' >> /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/fakeroot
> chmod a+x /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/fakeroot
> PATH="/home/autobuild/autobuild/instance-6/output-1/host/bin:/home/autobuild/autobuild/instance-6/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" FAKEROOTDONTTRYCHOWN=1 /home/autobuild/autobuild/instance-6/output-1/host/bin/fakeroot -- /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/fakeroot
> rootdir=/home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/target
> table='/home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/full_devices_table.txt'
> Usage:
>    sloci-image [options] ROOTFS NAME[:TAG]
>    sloci-image [-h | -V]
> 
> Create a single-layer OCI image with the given rootfs.
> 
> Arguments:
>    ROOTFS                 Directory or tar.gz archive with rootfs to pack into the image.
>                           Important: Archive will be *moved* to the image, so make a copy if you
>                           need it. Directory will be preserved.
> 
>    NAME                   Name of the image.
> 
>    TAG                    Tag for the image. Defaults to "latest".
> 
> Options:
>    -m --arch ARCH         CPU architecture which the binaries in this image are built to run on.
>                           Defaults to $(uname -m).
> 
>       --arch-variant      Variant of the CPU. This is typically used only for arm (v6, v7, v8).
> 
>    -a --author NAME       Name and/or email address of the person which created the image.
> 
>    -c --cmd CMD           Default arguments to the entrypoint of the container.
> 
>       --debug             Print debug messages (it can be also enabled with env. variable DEBUG).
> 
>    -C --entrypoint EP     Arguments to use as the command to execute when the container starts.
> 
>    -e --env VAR=VAL       Default environment variables for container.
> 
>    -l --label KEY=VALUE   Metadata for the container compliant with OCI annotation rules.
>                           If KEY starts with a dot, it will be prefixed with
>                           "org.opencontainers.image" (e.g. .url -> org.opencontainers.image.url).
> 
>       --os OS             Name of the OS which the image is built to run on. Defaults to "linux".
> 
>    -p --port PORT[/PROT]  Default set of ports to expose from a container running this image in
>                           format: <port>/tcp, <port>/udp, or <port> (same as <port>/tcp).
>                           Aliases: --expose.
> 
>    -t --tar               Pack image in a TAR archive.
> 
>    -u --user USER         The username or UID of user the process run as.
> 
>    -v --volume PATH       Default set of directories describing where the process is likely write
>                           data specific to a container instance.
> 
>    -w --working-dir DIR   Sets the current working directory of the entrypoint process in the
>                           container.
> 
>    -V --version           Print version and exit.
> 
>    -h --help              Print this message and exit.
> 
> Please report bugs at <https://github.com/jirutka/sloci-image/issues>.
> make: *** [fs/oci/oci.mk:99: /home/autobuild/autobuild/instance-6/output-1/images/rootfs.oci] Error 1
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/44da17a393421dfcb8bbdd63074cb82b436dfa94
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   fs/oci/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/oci/Config.in b/fs/oci/Config.in
> index 176785810a..8f36c91c8f 100644
> --- a/fs/oci/Config.in
> +++ b/fs/oci/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_TARGET_ROOTFS_OCI
>   	bool "oci image"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   	help
>   	  Build an OCI (Open Container Initiative) image.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
