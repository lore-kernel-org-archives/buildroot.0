Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019F8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 13:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8075240C96;
	Wed, 19 Oct 2022 13:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8075240C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZamhHU3muUjg; Wed, 19 Oct 2022 13:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51CC440C7F;
	Wed, 19 Oct 2022 13:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51CC440C7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56C7C1BF375
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C18560ACE
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C18560ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTI-3H7pmMVB for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 13:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 398F260615
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 398F260615
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 13:42:59 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n130so19247719oia.6
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 06:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yBcEG4LN2LJIk7jZZs/m7n/5ubU424pnRpXJMPJtyY0=;
 b=Xl0VXD66V9J2bBGIDh4PAFjFmavnROmIO+LwGCB4zK22Yzsv1GQ1YFGtzhtIr37gy4
 /R3J7M78A7Qgli0jcExQNsSv6RccIJsqAcBX5ldD5yMXgl6w7q1VDnnm9IehYrvQSCmd
 qLOOVTqOAyEsv6mv6otsNpvsNYpFURie2vQmcKSuY8R+HFaOijbbnyTwiyg9j3czCeMv
 RytOruIT1EqUqI3NxwCR1ZjC9s5e3C9WZU/29agLog1HskXyQ06WU3SOHm1h1I2+0+bm
 bAbHLUglQ+PZkjdeYKpGhJCnIa1cNrsP8gnaV/N4sNZ1J5D3pvjx0IW3xM1WV1Zxnn2v
 JyhQ==
X-Gm-Message-State: ACrzQf3FBlWWLbKvx4ouJ09ErrxwATbw6otgILe8TeZi2tZHmTu05Nb+
 VOTwPobNNPYLrcJ72mCHvGcbphLCxMo7ADbf9AX89dEwF6w=
X-Google-Smtp-Source: AMsMyM79VDXUSc8RnpxDH3k8eTwy341gYPQI6KCG4dmUF0QSAAF7ZbrU01lytdCw/j9ldKVdBkHrCK8FuKagJIiaed4=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr4509941oil.254.1666186977889; Wed, 19
 Oct 2022 06:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221006155217.626248-1-dumasv.dev@gmail.com>
 <20221019124017.427199-1-dumasv.dev@gmail.com>
In-Reply-To: <20221019124017.427199-1-dumasv.dev@gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 19 Oct 2022 15:42:21 +0200
Message-ID: <CA+_SqVZCHQ7HhxiQPNiDagdBjbL1iKmFLgX7ya_Rh4JSW6MCwA@mail.gmail.com>
To: Victor Dumas <dumasv.dev@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yBcEG4LN2LJIk7jZZs/m7n/5ubU424pnRpXJMPJtyY0=;
 b=FExxCdok90e+o08BWy+zK1o7l+cNOpP2SxiBQCDsuK9T0CYX2BkSwAQVYsCh6wplgg
 GR5iSrR8UGy70Q7HQ/VayKgTVGvkvkvw3uZokf9HTGlbFM7mv3OFRFrZ6LXwUDi5SBTR
 T90BliiZyavkP+FN2EfyAvktz0ItLabLQ8UBo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FExxCdok
Subject: Re: [Buildroot] [PATCH v3] support/scripts/fix-rpath: parallelize
 patching files
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
Content-Type: multipart/mixed; boundary="===============3520948354680767102=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3520948354680767102==
Content-Type: multipart/alternative; boundary="000000000000f2665b05eb636278"

--000000000000f2665b05eb636278
Content-Type: text/plain; charset="UTF-8"

Hi Victor,

On Wed, Oct 19, 2022 at 2:40 PM Victor Dumas <dumasv.dev@gmail.com> wrote:

> Using "xargs" instead of "while read" loop allows for the patching of
> files to be parallelized, significantly reducing the amount of time it
> takes to fix all the paths.On a larger RFS(~300MB) this script was taking 5
> minutes, it now only takes about 30s on a 12 core machine
>

I think you should split the commit message, it looks to me single really
long line.


>
> Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
> ---
>  support/scripts/fix-rpath | 66 ++++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 28 deletions(-)
>
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index 3e67e770e5..7ed1851aac 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -58,6 +58,40 @@ HOST_EXCLUDEPATHS="/share/terminfo"
>  STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
>  TARGET_EXCLUDEPATHS="/lib/firmware"
>
> +patch_file() {
> +    PATCHELF="${1}"
> +    rootdir="${2}"
> +    sanitize_extra_args="${3}"
> +    file="${4}"
> +
> +    # check if it's an ELF file
> +    rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> +    if test $? -ne 0 ; then
> +        return 0
> +    fi
> +
> +    # make files writable if necessary
> +    changed=$(chmod -c u+w "${file}")
> +
> +    # With per-package directory support, most RPATH of host
> +    # binaries will point to per-package directories. This won't
> +    # work with the --make-rpath-relative ${rootdir} invocation as
> +    # the per-package host directory is not within ${rootdir}. So,
> +    # we rewrite all RPATHs pointing to per-package directories so
> +    # that they point to the global host directry.
> +    changed_rpath=$(echo ${rpath} | sed "s@
> ${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
> +    if test "${rpath}" != "${changed_rpath}" ; then
> +        ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> +    fi
> +
> +    # call patchelf to sanitize the rpath
> +    ${PATCHELF} --make-rpath-relative "${rootdir}"
> ${sanitize_extra_args[@]} "${file}"
> +    # restore the original permission
> +    test "${changed}" != "" && chmod u-w "${file}"
> +}
> +
>  main() {
>      local rootdir
>      local tree="${1}"
> @@ -123,34 +157,10 @@ main() {
>              ;;
>      esac
>
> -    find_args+=( "-type" "f" "-print" )
> -
> -    while read file ; do
> -        # check if it's an ELF file
> -        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> -        if test $? -ne 0 ; then
> -            continue
> -        fi
> -
> -        # make files writable if necessary
> -        changed=$(chmod -c u+w "${file}")
> -
> -        # With per-package directory support, most RPATH of host
> -        # binaries will point to per-package directories. This won't
> -        # work with the --make-rpath-relative ${rootdir} invocation as
> -        # the per-package host directory is not within ${rootdir}. So,
> -        # we rewrite all RPATHs pointing to per-package directories so
> -        # that they point to the global host directry.
> -        changed_rpath=$(echo ${rpath} | sed "s@
> ${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
> -        if test "${rpath}" != "${changed_rpath}" ; then
> -            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> -        fi
> -
> -        # call patchelf to sanitize the rpath
> -        ${PATCHELF} --make-rpath-relative "${rootdir}"
> ${sanitize_extra_args[@]} "${file}"
> -        # restore the original permission
> -        test "${changed}" != "" && chmod u-w "${file}"
> -    done < <(find "${rootdir}" ${find_args[@]})
> +    find_args+=( "-type" "f" "-print0" )
> +
> +    export -f patch_file
> +    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P $(nproc) -I {}
> bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@"
> _ {}
>

I'm seeing here you capped the xargs with nproc, but that couldn't be
always the optimal solution. On lesser powerful machines, that could suck
all the core for a very long time (experimenting here on my machine ;) ) .
Probably you should cap to nproc-2 for example or look for the BR2_JLEVEL
or something similar.

_______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--000000000000f2665b05eb636278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Victor,<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 2:40 PM Victor =
Dumas &lt;<a href=3D"mailto:dumasv.dev@gmail.com">dumasv.dev@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Using=
 &quot;xargs&quot; instead of &quot;while read&quot; loop allows for the pa=
tching of files to be parallelized, significantly reducing the amount of ti=
me it takes to fix all the paths.On a larger RFS(~300MB) this script was ta=
king 5 minutes, it now only takes about 30s on a 12 core machine<br></block=
quote><div><br></div><div>I think you should split the commit message, it l=
ooks to me single really long line.<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Victor Dumas &lt;<a href=3D"mailto:dumasv.dev@gmail.com" tar=
get=3D"_blank">dumasv.dev@gmail.com</a>&gt;<br>
---<br>
=C2=A0support/scripts/fix-rpath | 66 ++++++++++++++++++++++----------------=
-<br>
=C2=A01 file changed, 38 insertions(+), 28 deletions(-)<br>
<br>
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath<br>
index 3e67e770e5..7ed1851aac 100755<br>
--- a/support/scripts/fix-rpath<br>
+++ b/support/scripts/fix-rpath<br>
@@ -58,6 +58,40 @@ HOST_EXCLUDEPATHS=3D&quot;/share/terminfo&quot;<br>
=C2=A0STAGING_EXCLUDEPATHS=3D&quot;/usr/include /usr/share/terminfo&quot;<b=
r>
=C2=A0TARGET_EXCLUDEPATHS=3D&quot;/lib/firmware&quot;<br>
<br>
+patch_file() {<br>
+=C2=A0 =C2=A0 PATCHELF=3D&quot;${1}&quot;<br>
+=C2=A0 =C2=A0 rootdir=3D&quot;${2}&quot;<br>
+=C2=A0 =C2=A0 sanitize_extra_args=3D&quot;${3}&quot;<br>
+=C2=A0 =C2=A0 file=3D&quot;${4}&quot;<br>
+<br>
+=C2=A0 =C2=A0 # check if it&#39;s an ELF file<br>
+=C2=A0 =C2=A0 rpath=3D$(${PATCHELF} --print-rpath &quot;${file}&quot; 2&gt=
;&amp;1)<br>
+=C2=A0 =C2=A0 if test $? -ne 0 ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 # make files writable if necessary<br>
+=C2=A0 =C2=A0 changed=3D$(chmod -c u+w &quot;${file}&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # With per-package directory support, most RPATH of host<br>
+=C2=A0 =C2=A0 # binaries will point to per-package directories. This won&#=
39;t<br>
+=C2=A0 =C2=A0 # work with the --make-rpath-relative ${rootdir} invocation =
as<br>
+=C2=A0 =C2=A0 # the per-package host directory is not within ${rootdir}. S=
o,<br>
+=C2=A0 =C2=A0 # we rewrite all RPATHs pointing to per-package directories =
so<br>
+=C2=A0 =C2=A0 # that they point to the global host directry.<br>
+=C2=A0 =C2=A0 changed_rpath=3D$(echo ${rpath} | sed &quot;s@${PER_PACKAGE_=
DIR}/[^/]\+/host@${HOST_DIR}@&quot;)<br>
+=C2=A0 =C2=A0 if test &quot;${rpath}&quot; !=3D &quot;${changed_rpath}&quo=
t; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PATCHELF} --set-rpath ${changed_rpath} &quot=
;${file}&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 # call patchelf to sanitize the rpath<br>
+=C2=A0 =C2=A0 ${PATCHELF} --make-rpath-relative &quot;${rootdir}&quot; ${s=
anitize_extra_args[@]} &quot;${file}&quot;<br>
+=C2=A0 =C2=A0 # restore the original permission<br>
+=C2=A0 =C2=A0 test &quot;${changed}&quot; !=3D &quot;&quot; &amp;&amp; chm=
od u-w &quot;${file}&quot;<br>
+}<br>
+<br>
=C2=A0main() {<br>
=C2=A0 =C2=A0 =C2=A0local rootdir<br>
=C2=A0 =C2=A0 =C2=A0local tree=3D&quot;${1}&quot;<br>
@@ -123,34 +157,10 @@ main() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
<br>
-=C2=A0 =C2=A0 find_args+=3D( &quot;-type&quot; &quot;f&quot; &quot;-print&=
quot; )<br>
-<br>
-=C2=A0 =C2=A0 while read file ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if it&#39;s an ELF file<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpath=3D$(${PATCHELF} --print-rpath &quot;${fi=
le}&quot; 2&gt;&amp;1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $? -ne 0 ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # make files writable if necessary<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 changed=3D$(chmod -c u+w &quot;${file}&quot;)<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # With per-package directory support, most RPA=
TH of host<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # binaries will point to per-package directori=
es. This won&#39;t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # work with the --make-rpath-relative ${rootdi=
r} invocation as<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the per-package host directory is not within=
 ${rootdir}. So,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we rewrite all RPATHs pointing to per-packag=
e directories so<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that they point to the global host directry.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 changed_rpath=3D$(echo ${rpath} | sed &quot;s@=
${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;${rpath}&quot; !=3D &quot;${chan=
ged_rpath}&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PATCHELF} --set-rpath ${change=
d_rpath} &quot;${file}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # call patchelf to sanitize the rpath<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PATCHELF} --make-rpath-relative &quot;${root=
dir}&quot; ${sanitize_extra_args[@]} &quot;${file}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # restore the original permission<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 test &quot;${changed}&quot; !=3D &quot;&quot; =
&amp;&amp; chmod u-w &quot;${file}&quot;<br>
-=C2=A0 =C2=A0 done &lt; &lt;(find &quot;${rootdir}&quot; ${find_args[@]})<=
br>
+=C2=A0 =C2=A0 find_args+=3D( &quot;-type&quot; &quot;f&quot; &quot;-print0=
&quot; )<br>
+<br>
+=C2=A0 =C2=A0 export -f patch_file<br>
+=C2=A0 =C2=A0 find &quot;${rootdir}&quot; ${find_args[@]} | xargs -0 -r -P=
 $(nproc) -I {} bash -c &quot;patch_file &#39;${PATCHELF}&#39; &#39;${rootd=
ir}&#39; &#39;${sanitize_extra_args}&#39; $@&quot; _ {}<br></blockquote><di=
v><br></div><div>I&#39;m seeing here you capped the xargs with nproc, but t=
hat couldn&#39;t be always the optimal solution. On lesser powerful machine=
s, that could suck all the core for a very long time (experimenting here on=
 my machine ;) ) . Probably you should cap to nproc-2 for example or look f=
or the BR2_JLEVEL or something similar.</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--000000000000f2665b05eb636278--

--===============3520948354680767102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3520948354680767102==--
