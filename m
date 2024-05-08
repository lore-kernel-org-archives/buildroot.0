Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B101C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 15:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B4E4018B;
	Wed,  8 May 2024 15:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6CJbeyBYSw9; Wed,  8 May 2024 15:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 565294045C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 565294045C;
	Wed,  8 May 2024 15:07:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12D061BF2F0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B9108230D
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6XvIxl23sL6 for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 15:07:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 935DE8230A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 935DE8230A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 935DE8230A
 for <buildroot@busybox.net>; Wed,  8 May 2024 15:07:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.127]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLR1V-1sLZDQ2YiZ-00Ljz0; Wed, 08
 May 2024 17:07:19 +0200
Date: Wed, 8 May 2024 17:07:18 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240508170718.6e5c9cc8@gmx.net>
In-Reply-To: <Zjk5YgT6u3PT_rIe@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-9-ps.report@gmx.net>
 <Zjk5YgT6u3PT_rIe@landeda>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ck+aaRtNnT/9qcZvsbOv5UPTxnflQ1CBPxUGAusEh+gnSBLqCxg
 zNGvJpLuC4ELCNlx8YRpWbtLAaLYAxTZKj+zutoF6ldnXln7F/F5+7LgmvCImhUpMeH5K16
 jaEdBWpCIuuBmOjnfMzbHXgKm2MjnNeB90x02sId357+b5qcpaoAVp2ajSpr/PrTdForbzn
 NwMgZVaGolHZtX7WBD73A==
UI-OutboundReport: notjunk:1;M01:P0:XyPnpJe/vfo=;Clj7hGPRp+aHIwzBgWd/zaPwIzG
 6PdbNXhUhNojpwQfNapbXjTstp8aFcOBdnOWT4GIv2MsPiaBT8VNrBrXCp671r4XFs76iqeTQ
 Bic84wfbgu9k5fAONFa9JtWxKYXY2LxxVRGt+lntngUoJvqBAWAaJjktcEs84LY2ESzeIevy3
 yq0OWUvQtvyUfuMZvK7Tk7RZp+PV6KqJUK77yZx3/NyatiG/UH31Jpmm4+XvfOtri54c19qAN
 xRZBmbNiGCGLwVP3Cr+iF6sbXLJr7NnmGk2il1sGzcL5mltVOQLY3JcNg3Jo+ca5Ob2doS5sK
 AqRv3WlL7Q3HGx27sOG9cICZ9EqfbaSnS456YCOf0C3iiZ7JBswlj6Y45wYscmTy8yu7W807O
 ST7OoJ6WT1LpG1LeBC6lrWHXMx+lFqAGeXdsZ1bUI82xLnlreHVT2ms4sEyjEmDQJYmBcpyKI
 3ZfpLYLvFMwtQqSgi8wUXHramwppNrTVyCYS2q8ChOIX6FZKyAyp7cOPiwWQGZh2OIaKPCq9U
 L7WkUO/mYBECtpwLg5iUSaEv5KV/EaLQvaXoeJ4VML3APN15j0s9LKiXlT+/2IqceSXvpjgvW
 Mvc7AjkivXEvHd2JWdB09+nFxKSvFMeDIh8iKJdY3LGOeR66RM42XPXWegmYRaY5rEIqHBe2i
 IFf8BCLGUkfooA/Ko3H+yZSsk8KwrIj9PVG5tBbz6k5gX7B1DWBLv98vbLHblYNJ6EeEc6a2m
 gl023O9rG9elylH8DzKCQ0Y7gFXVJRxkZ3Z/QoutiQSnZiC94mydxwNYeBEiT/MkN/yjAIU9i
 wbyn4ZLo9ZrSrMiHxGo4Srh2mjG/ZsieIc2IrzV36SpXI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715180839; x=1715785639; i=ps.report@gmx.net;
 bh=hypteS3iiBSqBuuz90T/zin7E7KFCHqzwyXew+2luVk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RhqYOm0xptpnzOvZhx/SMEzrTnZoIEwr9U5il2JckAsPNTVG4dIdPWqYv9xHsMSF
 Ta0XvMVspjnEvcS9qIgh9RDIfMaZvlF+RDri0b9vXHAQAWKG12/BqasqfjqY7wCp2
 hSidn6ip76H9JYvXDojXWxLOMxoIYWi3O657QyvFyHpAK5u75nKSeq1sK55B0u6Lw
 sMTAZhulnkeq8yLad8xlXzwC1tzQXaymC6tB99ql6iTpENGTt2eG+u9B+GVzVPBsD
 Nr0sSs3+dO4Lm8egnPsitiaYgUe/8k9FEpVOl1HJtGKFh/VWdM2l6RMbJfXotldVr
 xVt256uhYbT+uNbbvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RhqYOm0x
Subject: Re: [Buildroot] [PATCH v1 8/8] package/openssl: move
 libopenssl/libressl source statemetns outside of the choice
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Mon, 6 May 2024 22:11:14 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> Peter, All,
>
> On 2024-05-06 16:45 +0200, Peter Seiderer via buildroot spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes/ToDo:
> > - with this solution the external support needs to be splitted into
> >   two imports/lines...
>
> NMot sure I understand wht you meant here...

Short/compressed note (and not clear), but see below...

>
> > ---
> >  package/openssl/Config.in | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> > index 3d14988d99..fcf996f03f 100644
> > --- a/package/openssl/Config.in
> > +++ b/package/openssl/Config.in
> > @@ -28,8 +28,6 @@ config BR2_PACKAGE_LIBOPENSSL
> >
> >  	  Note: Some helper scripts need perl.
> >
> > -source "package/libopenssl/Config.in"
> > -
> >  config BR2_PACKAGE_LIBRESSL
> >  	bool "libressl"
> >  	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> > @@ -44,13 +42,14 @@ config BR2_PACKAGE_LIBRESSL
> >
> >  	  http://www.libressl.org/
> >
> > -source "package/libressl/Config.in"
> > -
> >  # openssl from br2-external trees, if any
> >  source "$(BASE_DIR)/.br2-external.in.openssl"
>
> This leaves one 'source' statement in te choice, which is no longer
> accepted, AFAIU.

'source' is accepted here, but not with all possible content...

>
> >  endchoice
> >
> > +source "package/libopenssl/Config.in"
> > +source "package/libressl/Config.in"
>
> I think the best solution is to move the if-endif conditional block out
> of package/libopenssl/Config.in back into package/openssl/Config.in, and
> add a new choice entry, so that basically we end up with something lie;
>
>     choice
>         bool "ssl library"
>
>     config BR2_PACKAGE_LIBOPENSSL
>         bool "openssl"
>
>     config BR2_PACKAGE_LIBRESSL
>         bool "libressl"
>
>     config BR2_PACKAGE_OPENSSL_EXTERNAL
>         bool "from an external tree"
>         depends on $BR2_EXTERNAL != ""  # Or something along those lines, adapt
>
>     endchoice
>
>     if BR2_PACKAGE_LIBOPENSSL
>     source "package/libopenssl/Config.in"
>     endif
>
>     if BR2_PACKAGE_LIBRESSL
>     source "package/libressl/Config.in"
>     endif
>
>     if BR2_PACKAGE_OPENSSL_EXTERNAL
>     source "$(BASE_DIR)/.br2-external.in.openssl"
>     endif

Will test the proposed solution the next days..., alternative solution would be:

     choice
         bool "ssl library"

     config BR2_PACKAGE_LIBOPENSSL
         bool "openssl"

     config BR2_PACKAGE_LIBRESSL
         bool "libressl"

     source "$(BASE_DIR)/.br2-external.in.openssl-choice"

     endchoice

     source "package/libopenssl/Config.in"
     source "package/libressl/Config.in"
     source "$(BASE_DIR)/.br2-external.in.openssl"

Splitting the external content into two files (two lines), keeping the 'source'
of the empty files as default (the first with the choice content, the second
with the regarding configuration entries)...

But either way the content of '.br2-external.in.openssl' needs to be
changed/adjusted...

Regards,
Peter


>
> Basically, that would make for an uglier state, but that's the best we
> can do given the new limitsations introduced by upstream kconfig...
>
> Thoughts?
>
> Regards,
> Yann E. MORIN.
>
> >  config BR2_PACKAGE_HAS_OPENSSL
> >  	bool
> >
> > --
> > 2.44.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
