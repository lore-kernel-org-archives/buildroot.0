Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9D9C43217
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 19:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA28610FF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 19:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFA28610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8B2404C5;
	Wed, 10 Nov 2021 19:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOL74TPjR21d; Wed, 10 Nov 2021 19:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FD7404BE;
	Wed, 10 Nov 2021 19:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2AC1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87D018177C
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 19:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Z8b8BxLpRhn for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 19:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3482B8191E
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636571171;
 bh=I+7GE2N+6TmXk8XMLoHz6QySAQKd9EY+L4RJsJEI5o4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=j15h/6oQGWEfwnyfyDX0mfnym9YZCud0EsbosQebXUouwc+AtDPC3Tqufqs1j/akn
 TCPpPortrpxkIo7seZLy0+O5S54ywYOGy99PIXVCBwC0XO07977Y8J7MQHp4DmW+PC
 ixar4rT65MezsDyN0qcben+PKHbUqRQ+sjgMJ0/s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1maOVf43GT-012DGk; Wed, 10
 Nov 2021 20:06:11 +0100
Date: Wed, 10 Nov 2021 20:06:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211110200610.63a2ea4e@gmx.net>
In-Reply-To: <20211110185133.52B178B8FF@busybox.osuosl.org>
References: <20211110185133.52B178B8FF@busybox.osuosl.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:IDezHlSaTjbB4RXracYoKKXjKIrwZpaBBYMrH2yC02xvX5143wV
 dUKvIm9LYcipgzmR/6cQWj9uwOfJltS2YaZEfu51IA5hauOuC3btd+xuXq5RHezo+h36QC2
 hbM1QDpe7zUlrP/ntpjmd7cyuBoxRk3ilmXXRCm1AGzUDolqx3So6wT9LBJOzqFfWnQDbDM
 Lftbqraj7xB63mqS+olsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zm+hjtmJs5Q=:UxPOe28s3o3EW+HSOR9rT/
 XpF6TSJFhga/rlQJOpB8tcbjB4DxIqsvcURjgbbsdmdtLCThys9GMKEN9wTxtqu6VADyVkAFS
 ojKg6QG+q9Os4lh5EvsMABWiYrt+Cmox83mmhtCWDV1jFWgtSL8KbZX4OZLcP9kHuzHgFLLnD
 gnHoFkSWtPrrM5zb0pd0tkUHZRUDOAw0GveXdDvokf701ksWZ/PINJ1OfrsBIAOp/8YdxJm/R
 dAxEk84spu6IXyKPNXKpTss3HJSa78pyF6Ywf2yhKuDd3zdPUZRZH+2XocB8tgYVqyH9bvwpZ
 8l3VNOSXCQ5GzcK8kTiY21tR4Ab0sNlU0ptw+hI1iWqSY/jXcZAB9B+Oso/UgoO1byVukoDUZ
 qDG2meOuuFeSfTHhJsgdguDXQf9L9MHng7z+Hi7tbkiYGTSVIAXjeOuyFMqx6NAEhCA4Byib/
 ZcHyFewMVY6NWZdvk3Q3GcUywBRz+ZqKOak46+I9/V0JnkOIxG6gGMd7V6cadUO0bNJXqzQ0e
 MArWbLaix7KgbrnT6GsRSBnmuVjGRuxZxQtZYm0u4Ir5I80zKNlKqBGiQueZgnYG8P5s0dv1o
 j4j8meDuRmi9WUEoUfdXcOQAponQoqktvIa5KYyxx/ECZ8MVjv7izwewrph6Qa6dxeufY8ihU
 p0nFLAW5O/t1UgQ8I2P68QV3RP9n4ndsYoFoqaSRRKDbhIDyP4Z323sPaS2GGpStOCEyjO1yp
 HKJPQt0sbbShqQUAf4lfZ4FNADtUvfW5OhSgu0GXFrrl2AVquPhwTSD6G6GUgECoWigFxknus
 9iPFmA/CidGBWWWO8wd2ZL4q0x8bu1wKEI7fzGLxKWqFGhD57aAEe7ZKuVAf/0cV0rxM7OFb+
 ol0gRnFam3IfxYEqDJz/Aobfj72jmJ29qEkBMOBNjxADqqF9sqD53jipcM0B7VK91hxIrId8V
 rYkpLKXkphl5wQb4dN2NY1sIthywLZLaLEZ8d0ZKaDLs4/Jx1sKWrCpOA9g50lEBW204+0Hkn
 dlsSx2ddJXtRESFSHOcM8tJwUvDlmVeFv10Z8j4hTECWoZKPhkq7aHCyVkS6vQVb0KI3nEV8t
 AuevuVNmPpW5R0=
Subject: Re: [Buildroot] [git commit] package/meson: disable meson wrap
 downloads
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Nov 2021 19:37:34 +0100, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=12ba3563655e3ebab252e52daa6c710864fa869f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> We don't want to allow meson to download wrap dependencies as this
> bypasses buildroot's dependency resolution.
>
> This is badly documented in the meson manual, but there is at least
> an FAQ that refers to it:
>
>     https://mesonbuild.com/FAQ.html#does-wrap-download-sources-behind-my-back

https://mesonbuild.com/Subprojects.html#commandline-options

And [1] and [2] for some past time buildroot discussion on it...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2019-December/572391.html
[2]http://lists.busybox.net/pipermail/buildroot/2019-December/572391.html

>
>     Meson has a option called wrap-mode which can be used to disable
>     wrap downloads altogether with --wrap-mode=nodownload.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [yann.morin.1998@free.fr: add pointer to FAQ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/meson/cross-compilation.conf.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index 37b49eea3b..7a7ece97ae 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -17,6 +17,7 @@ c_args = [@TARGET_CFLAGS@]
>  c_link_args = [@TARGET_LDFLAGS@]
>  cpp_args = [@TARGET_CXXFLAGS@]
>  cpp_link_args = [@TARGET_LDFLAGS@]
> +wrap_mode = 'nodownload'
>
>  [properties]
>  needs_exe_wrapper = true
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
