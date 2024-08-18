Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EEBC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1DC80F14;
	Sun, 18 Aug 2024 10:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jaBhpwNYlVg; Sun, 18 Aug 2024 10:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 320AD80F17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320AD80F17;
	Sun, 18 Aug 2024 10:11:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC2A11BF297
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B64CA4026A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agt2YymYyNkg for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5008F40268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5008F40268
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5008F40268
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:18 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A7AF635211C6; Sun, 18 Aug 2024 12:11:15 +0200 (CEST)
Date: Sun, 18 Aug 2024 12:11:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZsHIw+TLPfA7tort@waldemar-brodkorb.de>
References: <ZsCjPIEVSPj9R2Eo@waldemar-brodkorb.de> <ZsG9eKK5aBo4DSjF@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsG9eKK5aBo4DSjF@landeda>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723975875; bh=D454v70iLXebibiGurwDUYuFCj7YkfZSmttXuIWCLbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qmrjeB/MrZASB46f3ITHs43lTyoAmwxZWTCLXdOsN0+6kRrLW4XLTVghMWhur3oY0
 Oyx3h7ZfIS4RjumhD8d83JutpAx/aEvpRlGu2vDe/D5sjisMMb8afft+lQk44hhljT
 QvTuTU6LHshtVXZ1QPJ4gwILTKlu9JRzwvW6N1VFlab5//TZFd5cW05vQz5BIlHlRV
 +c8uZEKpd5KZ8azOgio9Qso7pzmpZFHIhsBc96hO3XVVKyyXR9NuPedxh1WhyDws8w
 bbco8wmzdpGVeUSDjaaD34js9orEvBwRpoT0QsYKn5bdm2/vi0U9bx2s4lDZ4IDp0B
 6AFVRTigXchfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=qmrjeB/M
Subject: Re: [Buildroot] [PATCH] package/avahi: fix python install issue
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

Hi Yann,
Yann E. MORIN wrote,

> Waldemar, All,
> 
> On 2024-08-17 15:18 +0200, Waldemar Brodkorb spake thusly:
> > Since the update of Python to 3.12.4 in commit
> > 76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1 avahi fails to install
> > python subcomponents. The reason is that the obsolete imp
> > python modul is used. Add a patch to remove the imp dependency.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.net/results/2bf/2bf391b93362204917a560705bc402585334ab3c
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Applied to master, thanks.

Thanks you.
 
> But see below
> 
> > ---
> >  .../0002-remove-imp-from-py-compile.patch     | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 package/avahi/0002-remove-imp-from-py-compile.patch
> > 
> > diff --git a/package/avahi/0002-remove-imp-from-py-compile.patch b/package/avahi/0002-remove-imp-from-py-compile.patch
> > new file mode 100644
> > index 0000000000..37534a3f7a
> > --- /dev/null
> > +++ b/package/avahi/0002-remove-imp-from-py-compile.patch
> > @@ -0,0 +1,50 @@
> > +Remove optional imp python module dependency.
> > +
> > +Upstream already removed py-compile entirely in their git repository,
> > +so the patch is not appropiate for upstream.
> 
> This is really weird: the git tree removed the py-comple in 2005, and it
> is not present in the v0.8 tag, but then the release tarball, that we
> use, does carry that file.
> 
> Could you see with upstream how they end up with py-compile in the
> released archive, while it is not in git?
> 
> There is a risk that that file gets added somehow by the autotools
> packagng process, so it will eventually be present in the next release
> as well, and we'd have to carry that patch forever and ever...

You are right, py-compile is generated.
But in avahi git you get one with following code:

python_major=`$PYTHON -V 2>&1 | sed -e 's/.* //;s/\..*$//;1q'`
if test -z "$python_major"; then
  echo "$me: could not determine $PYTHON major version, guessing 3" >&2
  python_major=3
fi

# The old way to import libraries was deprecated.
if test "$python_major" -le 2; then
  import_lib=imp
  import_test="hasattr(imp, 'get_tag')"
  import_call=imp.cache_from_source
  import_arg2=', False' # needed in one call and not the other
else
  import_lib=importlib
  import_test="hasattr(sys.implementation, 'cache_tag')"
  import_call=importlib.util.cache_from_source
  import_arg2=
fi

$PYTHON -c "
import sys, os, py_compile, $import_lib
...

So I believe newer Python version is handled there.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
