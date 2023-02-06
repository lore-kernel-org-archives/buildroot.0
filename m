Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A54C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF46E60B4D;
	Mon,  6 Feb 2023 16:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF46E60B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id An9GiVypbAju; Mon,  6 Feb 2023 16:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9DC360B5E;
	Mon,  6 Feb 2023 16:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9DC360B5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 687321BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C0454035D
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0454035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFzPXKvXSFpv for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:52:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E062340184
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E062340184
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:52:21 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1442977d77dso15825406fac.6
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 08:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hiohe9GlmOIwtjmunlsm8Bh9k+CSm5nfxwpR7zcS7vQ=;
 b=hp0MFhYsyTslUKeLues0UzC2S/xx2ATSI9Jx2Oc95KaSMXcKZfsko7QxuMDFY9Y7gz
 KUb7UWQtDocs3jPhxhxf/B1QMtVNwIaJgdn04Yqh2sOlzYMtZ1KBC1kq6HAK12Qpl/cu
 yIYVC2kt8xqfHBhd/nc9a/KrEwN1/gAKpypiFQGa0JE9JyyjIQX5hnYka8W6WmjANOqg
 wT3Q2EYAlpkK55LSHp1y1z6CkeQUj7aa82sTJtheAtQWUi4ot4dJ/vrGoAy2+9JQXBbC
 JT4ebbUAmLx1HPubF61lrI8pRfujlvti8UR0y+UkcYTIuQY4l7tEwhJ7CcJpYU6ag+7L
 xnpA==
X-Gm-Message-State: AO0yUKVvfE+ST+NFs/DxDs+RMR+oqYebF62ED6/qNK+PLET/3z27yn5r
 0mvAeY+Sr95E0HWVQ4Ycuo0bahhu0xrJ/qjLJi9YhgukXNg=
X-Google-Smtp-Source: AK7set/ZYo6UbMc1YluewVIseYWgoM6PaintusxUkjiSeRY/OW9Ko8eZtCOEiD0CbWdP0582oAQoGhc1wuxSEcIOtbA=
X-Received: by 2002:a05:6870:219e:b0:163:501b:e7b with SMTP id
 l30-20020a056870219e00b00163501b0e7bmr1373690oae.18.1675702340860; Mon, 06
 Feb 2023 08:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20230206150847.3621475-1-james.hilliard1@gmail.com>
 <3edf52e1-0ba5-c8d0-8501-079a6e21abfe@mind.be>
In-Reply-To: <3edf52e1-0ba5-c8d0-8501-079a6e21abfe@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Feb 2023 09:52:09 -0700
Message-ID: <CADvTj4qHYVKuW373PpP+H5ZVJg+qtddaPq2bNcFBkFGwcMv72Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hiohe9GlmOIwtjmunlsm8Bh9k+CSm5nfxwpR7zcS7vQ=;
 b=ZtyA5z3bs373T1BOrO/zOo/qo16hopt/j+9nvwKfpX+r7KEGW9gGZ9140fIs4tw6Uc
 A3MZhTtoeCIjujSxknIvRVLThE12MoLFJNW2Vf5wC66Sc3z22ZJEePn+f9DxVDxf8k4v
 1KjGU0q7BSWP4u5VyiPwmNskbnrDS+RDlIAYBWBjv4ZxPRsXVCpo+nvB9MNs1XWDLolg
 5LV8gYbp5bhJWq/U0an4Vxgipv7KliZS/lzQbs0TH+mSYI6BbmBojBz+J5rHVcTl/OGO
 7ZqblX/GJZPWCJmSvjqaqBa+c6pmzQjcwRWpvChuChjAXNKN3KhYjplCLy2Ptn6GT8sf
 G0ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZtyA5z3b
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: switch to
 async/await format
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

On Mon, Feb 6, 2023 at 9:50 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 06/02/2023 16:08, James Hilliard wrote:
> > This requires python 3.6 or newer but is a bit cleaner.
>
>   Does it? According to [1]
>
> "The async def type of coroutine was added in Python 3.5"

Hmm, yeah, must have mixed that up with something else that
needed 3.6.

>
>
>   Regards,
>   Arnout
>
> [1] https://docs.python.org/3.5/library/asyncio-task.html#coroutines
>
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   utils/genrandconfig | 62 +++++++++++++++++----------------------------
> >   1 file changed, 23 insertions(+), 39 deletions(-)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index b3576f8a51..8947898d88 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -28,11 +28,6 @@ import traceback
> >   from distutils.version import StrictVersion
> >   import platform
> >
> > -if sys.version_info < (3, 8):
> > -    from asyncio import coroutine
> > -else:
> > -    from types import coroutine
> > -
> >
> >   class SystemInfo:
> >       DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
> > @@ -60,8 +55,7 @@ class SystemInfo:
> >           # --
> >           return None
> >
> > -    @coroutine
> > -    def has(self, prog):
> > +    async def has(self, prog):
> >           """Checks whether a program is available.
> >           Lazily evaluates missing entries.
> >
> > @@ -76,11 +70,11 @@ class SystemInfo:
> >           have_it = self.find_prog(prog)
> >           # java[c] needs special care
> >           if have_it and prog in ('java', 'javac'):
> > -            proc = yield from asyncio.create_subprocess_shell(
> > +            proc = await asyncio.create_subprocess_shell(
> >                   "%s -version | grep gcj" % prog,
> >                   stdout=asyncio.subprocess.DEVNULL,
> >                   stderr=asyncio.subprocess.DEVNULL)
> > -            ret = yield from proc.wait()
> > +            ret = await proc.wait()
> >               if ret != 1:
> >                   have_it = False
> >           # --
> > @@ -159,8 +153,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
> >       return configs
> >
> >
> > -@coroutine
> > -def is_toolchain_usable(configfile, config):
> > +async def is_toolchain_usable(configfile, config):
> >       """Check if the toolchain is actually usable."""
> >
> >       with open(configfile) as configf:
> > @@ -180,9 +173,9 @@ def is_toolchain_usable(configfile, config):
> >              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
> >              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
> >              'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
> > -            proc = yield from asyncio.create_subprocess_exec(
> > +            proc = await asyncio.create_subprocess_exec(
> >                   'ldd', '--version', stdout=asyncio.subprocess.PIPE)
> > -            ldd_version_output, _ = yield from proc.communicate()
> > +            ldd_version_output, _ = await proc.communicate()
> >               if proc.returncode:
> >                   return False
> >               glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
> > @@ -193,8 +186,7 @@ def is_toolchain_usable(configfile, config):
> >       return True
> >
> >
> > -@coroutine
> > -def fixup_config(sysinfo, configfile):
> > +async def fixup_config(sysinfo, configfile):
> >       """Finalize the configuration and reject any problematic combinations
> >
> >       This function returns 'True' when the configuration has been
> > @@ -210,8 +202,7 @@ def fixup_config(sysinfo, configfile):
> >
> >       BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
> >
> > -    has_java = yield from sysinfo.has("java")
> > -    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
> > +    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
> >           return False
> >       # The ctng toolchain is affected by PR58854
> >       if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
> > @@ -654,8 +645,7 @@ def fixup_config(sysinfo, configfile):
> >       return True
> >
> >
> > -@coroutine
> > -def gen_config(args):
> > +async def gen_config(args):
> >       """Generate a new random configuration
> >
> >       This function generates the configuration, by choosing a random
> > @@ -713,8 +703,7 @@ def gen_config(args):
> >
> >       # Randomly enable BR2_REPRODUCIBLE 10% of times
> >       # also enable tar filesystem images for testing
> > -    has_diffoscope = yield from sysinfo.has("diffoscope")
> > -    if has_diffoscope and randint(0, 10) == 0:
> > +    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
> >           configlines.append("BR2_REPRODUCIBLE=y\n")
> >           configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
> >
> > @@ -728,14 +717,13 @@ def gen_config(args):
> >       with open(configfile, "w+") as configf:
> >           configf.writelines(configlines)
> >
> > -    proc = yield from asyncio.create_subprocess_exec(
> > +    proc = await asyncio.create_subprocess_exec(
> >           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> > -    ret = yield from proc.wait()
> > +    ret = await proc.wait()
> >       if ret:
> >           return ret
> >
> > -    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
> > -    if not toolchain_usable:
> > +    if not await is_toolchain_usable(configfile, toolchainconfig):
> >           return 2
> >
> >       # Now, generate the random selection of packages, and fixup
> > @@ -749,37 +737,33 @@ def gen_config(args):
> >                     file=sys.stderr)
> >               return 1
> >           bounded_loop -= 1
> > -        make_rand = [
> > +        proc = await asyncio.create_subprocess_exec(
> >               "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >               "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
> >               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> > -            "randpackageconfig" if args.toolchains_csv else "randconfig"
> > -        ]
> > -        proc = yield from asyncio.create_subprocess_exec(*make_rand)
> > -        ret = yield from proc.wait()
> > +            "randpackageconfig" if args.toolchains_csv else "randconfig")
> > +        ret = await proc.wait()
> >           if ret:
> >               return ret
> >
> > -        ret = yield from fixup_config(sysinfo, configfile)
> > -        if ret:
> > +        if await fixup_config(sysinfo, configfile):
> >               break
> >
> > -    proc = yield from asyncio.create_subprocess_exec(
> > +    proc = await asyncio.create_subprocess_exec(
> >           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> > -    ret = yield from proc.wait()
> > +    ret = await proc.wait()
> >       if ret:
> >           return ret
> >
> > -    proc = yield from asyncio.create_subprocess_exec(
> > +    proc = await asyncio.create_subprocess_exec(
> >           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
> > -    ret = yield from proc.wait()
> > +    ret = await proc.wait()
> >       if ret:
> >           return ret
> >
> > -    proc = yield from asyncio.create_subprocess_exec(
> > +    proc = await asyncio.create_subprocess_exec(
> >           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
> > -    ret = yield from proc.wait()
> > -    return ret
> > +    return await proc.wait()
> >
> >
> >   if __name__ == '__main__':
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
