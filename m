Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BD3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 02:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F2C40C94;
	Wed, 23 Mar 2022 02:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o92zFNqgYVqz; Wed, 23 Mar 2022 02:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9275140C97;
	Wed, 23 Mar 2022 02:32:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC3271BF5B4
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 02:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3F9540C8B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 02:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKq7GO29UxNb for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 02:32:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AC124013A
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 02:32:23 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id kk12so272819qvb.13
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 19:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=cWh04Xk8ldSPfyT/fY9yR1DUiJdASEK8G6prvA25agQ=;
 b=Heq6p8i1Ukw5NQaHp5mFKPPu9nptXEXXdMq+uYw6ej/z9HoW+kcDGQ9wDqxM7btHNh
 ZaQMK8Hjbu9lAoAtbn7tjo2QCVsTF1L/1V+w/B9BbYRYSQBlbmwq/CqO8+ti40YFAZGP
 niBkkd3jISCgnixtK7ITpHSCSoC4Bn36nheR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=cWh04Xk8ldSPfyT/fY9yR1DUiJdASEK8G6prvA25agQ=;
 b=wwR39F5AbIWnhj8oPQlUuZmbC+pI+3h4NnhVwLwLvjQUkJYFqp4WUpLE1XKhWcwrWM
 CDsgERsmfBRPGTC22VHGa/LdZ0KAp/ks+y4W4G5rztgV7c5tv6dCYAtTxivw/oClDAvZ
 MJHCCam6RPWtmduTTACfIeqQe6qOlNWiyGBmzZ0l1AZJrbsuUob2W5IrBuTb3owNPAiY
 3EKgNg9ElKWZbTH/pzqC6YVLZ9Xo2STSyoUiVKPqaKA1lSX2fIPZaoBvAwFNwunQS4F8
 FcVsTSJ4tuxX6pgST0sHFGin5OgNubhDUO96J1PeE/pQl7XJuzyimO8MS7P7NvvOeBF2
 iEkA==
X-Gm-Message-State: AOAM532j+OC06p+s7kk8Jtitw5B39ODWWHLLwlGXsam28QwDjbqWMvHJ
 6adyABIGzixulLrAcZsPNaedsdAl/u4CoW+MVPxb/SnKCaA=
X-Google-Smtp-Source: ABdhPJz2FkGg0myhQqpnt8KoQ9IgrhLMUndR5RBohDsbeXBGj/5dPx/mt0fuaYVFsqgnLVSe42GglbNPT7p5ROKJ80w=
X-Received: by 2002:ad4:5f4a:0:b0:441:52e1:2ca9 with SMTP id
 p10-20020ad45f4a000000b0044152e12ca9mr3207506qvg.65.1648002740600; Tue, 22
 Mar 2022 19:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220315130737.428449-1-joel@jms.id.au>
In-Reply-To: <20220315130737.428449-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Mar 2022 02:32:08 +0000
Message-ID: <CACPK8XfAZy_b+pSM5Q17PGSChfPOAk4ByvJZHPQ1nuEnRzThqw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] fakeroot: Fix segfault on ppc64le
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 15 Mar 2022 at 13:07, Joel Stanley <joel@jms.id.au> wrote:
>
> When generating a filesystem image on a power10 build machine running
> Ubuntu, we see a segfault when fakeroot is running chmod.
>
> This has been reported and fixed upstream in Debian in version 1.26-1.2:
>
>  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995393#53
>
> Add the samae patch to resolve the segfault.

ping

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This isn't a commit in the fakeroot tree, rather a patch from the Debian
> packaging.
>
> I would appreciate if this was added to the 2022.02 stable tree.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../fakeroot/fix-prototype-generation.patch   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/fakeroot/fix-prototype-generation.patch
>
> diff --git a/package/fakeroot/fix-prototype-generation.patch b/package/fakeroot/fix-prototype-generation.patch
> new file mode 100644
> index 000000000000..38d32ff3b22c
> --- /dev/null
> +++ b/package/fakeroot/fix-prototype-generation.patch
> @@ -0,0 +1,59 @@
> +Subject: Fix prototype generation for openat
> +Author: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
> +Date: 2021-12-30
> +Bug-Debian: https://bugs.debian.org/995393
> +Forwarded: Yes (implicitely)
> +
> +    As jrtc27 pointed out in IRC, ppc64el is more strict than other
> +    architectures when it comes to va_arg handling:
> +
> +        it's that ppc64le uses the elfv2 abi, and for variadic calls you
> +        must reserve space for a parameter save area
> +
> +    So enhance wrapawk to create a proper prototype and argument
> +    handling although it's specific to the openat call. Also add the
> +    missing documentation for the sixth column to wrapfunc.inp.
> +
> +--- a/wrapawk
> ++++ b/wrapawk
> +@@ -37,7 +37,25 @@
> +   argtype=$3;
> +   argname=$4;
> +   MACRO=$5;
> +-  if(MACRO){
> ++  openat_extra=$6;
> ++  if(openat_extra){
> ++    print "  {(void(*))&next_" name ", \"" name "\"},"  > structfile;
> ++    print "extern " ret " (*next_" name ")" openat_extra ";" > headerfile;
> ++    print ret " (*next_" name ")" openat_extra "=tmp_" name ";"> deffile;
> ++
> ++    print ret " tmp_" name,  openat_extra "{"           > tmpffile;
> ++    print "  mode_t mode = 0;"                          > tmpffile;
> ++    print "  if (flags & O_CREAT) {"                    > tmpffile;
> ++    print "    va_list args;"                           > tmpffile;
> ++    print "    va_start(args, flags);"                  > tmpffile;
> ++    print "    mode = va_arg(args, int);"               > tmpffile;
> ++    print "    va_end(args);"                           > tmpffile;
> ++    print "  }"                                         > tmpffile;
> ++    print "  load_library_symbols();"                   > tmpffile;
> ++    print "  return  next_" name,  argname ";"          > tmpffile;
> ++    print "}"                                           > tmpffile;
> ++    print ""                                            > tmpffile;
> ++  } else if(MACRO){
> +     print "  {(void(*))&NEXT_" MACRO "_NOARG, " name "_QUOTE},"  > structfile;
> +     print "extern " ret " (*NEXT_" MACRO "_NOARG)" argtype ";" > headerfile;
> +     print ret " (*NEXT_" MACRO "_NOARG)" argtype "=TMP_" MACRO ";"> deffile;
> +--- a/wrapfunc.inp
> ++++ b/wrapfunc.inp
> +@@ -9,8 +9,10 @@
> + /**/                                                                    */
> + /* each line of this file lists 4 fields, seperated by a ";".           */
> + /* The first field is the name of the wrapped function, then it's return  */
> +-/* value. After that come the function arguments with types, and the last */
> ++/* value. After that come the function arguments with types, and the fifth */
> + /* field contains the function arguments without types.                   */
> ++/* A sixth field is a special needed when wrapping the openat syscall.    */
> ++/* Otherwise it's like the third (function arguments with types).         */
> + /**/
> +
> + /* __*xstat are used on glibc systems instead of just *xstat. */
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
