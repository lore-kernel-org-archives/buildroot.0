Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F8FC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 09:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320F440F99;
	Fri, 31 Jul 2026 09:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VElEGdgtBrAe; Fri, 31 Jul 2026 09:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1689D40C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785490616;
	bh=fL5HY4tSWUQfH/jhQYH2uVIJn7SsnyXjyM84yFnZYhg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UU2VKIYWx/+1ITC/d/odwe02A/UM4pxvby04rgBpiaB/+IBBcMWsfHKoCitq6E632
	 5r7mnfPzRfifDdm6WKU0Tl7oHil07eYOc5oe424SJUAUjwDRkk7/qWblrR1LEN5Z9P
	 q9PVZxlDSKoJHW/3Iv7TjhCx2A5G4xdUN6ME5gcNNHj0Vw+z7gpMBxKzMieTYZJLTa
	 rI0rBAaCJJ6OTJlNplWYXdP8UiBgaE/In+mIkVfZorVbilYZxVqzQRgVyVv3y/BUTI
	 G+lj9dDyeABiwRXiT2r+qZUTMS6l++0YcYTKLQ6cnswzfa9iiaoPhdj4rwBkAm/bdd
	 mV1rB/9FDIfUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1689D40C09;
	Fri, 31 Jul 2026 09:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24DE826E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AE666083A
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxU9BiC_XkgB for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 09:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.159;
 helo=fhigh-a8-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22630607AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22630607AC
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22630607AC
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:36:54 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 4EE201400154;
 Fri, 31 Jul 2026 05:36:53 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 05:36:53 -0400
X-ME-Sender: <xms:tWxsao5hiY7w20NdFYH9IefPKMqcAQCe2IyjpWA3Wotbqg4UM2jF7Q>
 <xme:tWxsakvxmgyCJmTpF_SYexXS1X3vqMVLA4Kyg5sLbIhBna4Xei-lh-WzLPzkn17hV
 OeWVb-bNVsE2MOcpS2cPqEw0Gx3LBXNNKrJoId2OGHtaOnb0pZpsno>
X-ME-Proxy-Cause: dmFkZTGUHyrQNQd9mCicDBmGhczD4V8CH/KoEBiDMLSLi0ABTy6aWsw5MxAk0ZJWw1keOC
 oLtp1dqZigxRw/+LZ19P8bG2glffoEek09WIn5cS5/bAVVFSFXoW4dqVm+NtkkzljGNpKy
 uaHXBvLSvYr9mkPJV+CtwvbQcLRbBtK+RnnjZTdShfnJPpn92XvXW0833xXBzAzGGutjBE
 VregDWmJNnzM3fM03PFYBm8u/XdCp/AaFi3sXBOW0TcH7f7pZasrbJIaZVmqF0aRbKgTut
 u36cy1wcPu+mFGfNJHMx4+c+kj2DMgwYHheC1pHZQjjGb6RVBeHERh+4S2Hii/K4pZQRUO
 2WvJMogDikzUZXZsKIGPxOwL338/DQZ/p8tMu7PZNXCVlVGpg4xMTyoD7nPRoZ25jsrTHY
 peT0EGNCRvVMuRcHTNrjVC8RZ0DvDOx3r2Z3TFBQAPXyc1B6hqeQ2agYUjqmrVc6s6IvHQ
 sodWlSmOQxVrxboh+iXVAXFmeCGs0tCzLlc2zWLXt5Y4trcyqAMXF3rdlkG+dHbGWbi+Q/
 siE7iirM8K20xCpxsWLKUbe1GcZW4QBQf6DG+yFiBOlcmTbIu2T0mfEZOTHs5NB9ab8KQn
 0WyDcRxFZ2bQGsGtQH7zGXqy8oJlf2ruXFMDa8YlKlLAk7StNRCEOpqSHKFw
X-ME-Proxy: <xmx:tWxsavaEEAxKQNzycXSELpAKA50kT-VMS-cGd9ZI3aTFSjgmKJKVPg>
 <xmx:tWxsal2YF5Obi-gzUsWH4miFX_I5sNC2tPwqE51Ohj78eFLwmhuj_w>
 <xmx:tWxsavV1KSRi4-SEJy8sy46C_ifHgQIG_Af0N5MJjj65KxoU_oV3kw>
 <xmx:tWxsavXaR8LDMpqSEdBAjdu334yXMtDtq0o4EmjJ2McGXEqWhFFjVw>
 <xmx:tWxsapCN2WcRwU6sdR1GQKaZIZCNZg9FuY-R7U-gUTXaSJiuekISZxC4>
Feedback-ID: i0df9467b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 218142CE03C2; Fri, 31 Jul 2026 05:36:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AwIGRUvjqRY7
Date: Fri, 31 Jul 2026 11:36:32 +0200
From: "Michele Comignano" <mcdev@playlinux.net>
To: buildroot@buildroot.org
Cc: "Bernd Kuhls" <bernd@kuhls.net>, "Will Newton" <will.newton@gmail.com>
Message-Id: <b1e72582-a5c0-4a57-b849-16f3f8c20ccd@app.fastmail.com>
In-Reply-To: <20260730103740.23943-1-mcdev@playlinux.net>
References: <20260730103740.23943-1-mcdev@playlinux.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1785490613; x=
 1785577013; bh=CDd7WW54w1k/VgEgg+c9CaLqMmTqD47Im2MMG7Xv1c4=; b=g
 s33YBHDMyN1Z8iSGM76og8eVcDpHmixaaJSMxE96lvLk5nprNy7pvH3d/sxc+XVC
 eCd7ct5oI09e6ZN2s/RnmnPjVK6QOYIdXREGWNLlTImGiYjkV8dWAUq013poYVOo
 L6LNe/SoWNao0w1tIQ3aSqCOl29FXmf5lC0UatpRhTt/S1etZ7c+KO0snDDJDCXt
 cS8OgHdtPiuMC08N2KrQnTSsdUrDmkOo0k2tSehTAV9NHSK8ojWp2wBr+0jT5XDg
 joG3LkE+bHYqy5R59HfdzOb4uNtxPI+8BCF323i79lkI/HigWgQ8f+T7+WtvHVkR
 HyFhDcM2Ig/b6tvPLCQwA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785490613; x=1785577013; bh=CDd7WW54w1k/VgEgg+c9CaLqMmTqD47Im2M
 MG7Xv1c4=; b=CsNMdnystG5dgHfS1inc1Sovt64I8CAmEvhPQp0EjeFM5+kLNY1
 SwH5YmqVgLEPpA1ZEWcrVO2iDJYPvLRXdNA46cWRT7fyplEuJH9iSGWEUjbVQWvN
 CBrutlzpjESudv5LZR3mtqyDjw0JZk5f2pPYmPuPffe7mJ0uxnJo8LvMiSyzRYFe
 2GJujy2U1mUQnPvgWGs6R9NsegO/TFOooLUN4LHm/ei7GCjyyjyx3TtGa+YtbVTH
 sHa4n5quQZlCxCO2+vWbFk/Z5kZQDVq6x+xXk31ZJekToAPQkAh9dpvuSkVW7ad6
 cndnapIj9PTYHfVMO8T9XrW4rWxN7o7Quaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=gs33YBHD; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CsNMdnys
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version
 1.0.8
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
Content-Type: multipart/mixed; boundary="===============7888357427825855831=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7888357427825855831==
Content-Type: multipart/alternative;
 boundary=05815c8570d5f21fe9ebd63c0692ea1e4b072831

--05815c8570d5f21fe9ebd63c0692ea1e4b072831
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Please ignore, this is superseded by 1.0.9 bump patch.

Il Gio, 30 Lug 2026, alle ore 12:37, Michele Comignano ha scritto:
> Signed-off-by: Michele Comignano <mcdev@playlinux.net>
> ---
> package/libmicrohttpd/libmicrohttpd.hash | 2 +-
> package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
> index d342eddc9e..d96098cf08 100644
> --- a/package/libmicrohttpd/libmicrohttpd.hash
> +++ b/package/libmicrohttpd/libmicrohttpd.hash
> @@ -1,3 +1,3 @@
> # Locally calculated
> -sha256  827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98  libmicrohttpd-1.0.7.tar.gz
> +sha256  0763970a0e39f8f382123366e3cf5d03f70aa1e2208d3101e84da3e2cd674703  libmicrohttpd-1.0.8.tar.gz
> sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 605291c046..f9dd2964eb 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -4,7 +4,7 @@
> #
> ################################################################################
>  
> -LIBMICROHTTPD_VERSION = 1.0.7
> +LIBMICROHTTPD_VERSION = 1.0.8
> LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
> LIBMICROHTTPD_LICENSE_FILES = COPYING
> LIBMICROHTTPD_CPE_ID_VENDOR = gnu
> -- 
> 2.55.0
> 
> 

--05815c8570d5f21fe9ebd63c0692ea1e4b072831
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Please ignor=
e, this is superseded by 1.0.9 bump patch.</div><div><br></div><div>Il G=
io, 30 Lug 2026, alle ore 12:37, Michele Comignano ha scritto:</div><blo=
ckquote type=3D"cite" id=3D"qt" style=3D""><div>Signed-off-by: Michele C=
omignano &lt;<a href=3D"mailto:mcdev@playlinux.net">mcdev@playlinux.net<=
/a>&gt;</div><div>---</div><div>package/libmicrohttpd/libmicrohttpd.hash=
 | 2 +-</div><div>package/libmicrohttpd/libmicrohttpd.mk&nbsp;&nbsp; | 2=
 +-</div><div>2 files changed, 2 insertions(+), 2 deletions(-)</div><div=
><br></div><div>diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/=
package/libmicrohttpd/libmicrohttpd.hash</div><div>index d342eddc9e..d96=
098cf08 100644</div><div>--- a/package/libmicrohttpd/libmicrohttpd.hash<=
/div><div>+++ b/package/libmicrohttpd/libmicrohttpd.hash</div><div>@@ -1=
,3 +1,3 @@</div><div># Locally calculated</div><div>-sha256&nbsp; 827250=
db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98&nbsp; libmicr=
ohttpd-1.0.7.tar.gz</div><div>+sha256&nbsp; 0763970a0e39f8f382123366e3cf=
5d03f70aa1e2208d3101e84da3e2cd674703&nbsp; libmicrohttpd-1.0.8.tar.gz</d=
iv><div>sha256&nbsp; 7399547209438c93f9b90297954698773d4846cea44cde5ca98=
2c84c45952a3b&nbsp; COPYING</div><div>diff --git a/package/libmicrohttpd=
/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk</div><div>ind=
ex 605291c046..f9dd2964eb 100644</div><div>--- a/package/libmicrohttpd/l=
ibmicrohttpd.mk</div><div>+++ b/package/libmicrohttpd/libmicrohttpd.mk</=
div><div>@@ -4,7 +4,7 @@</div><div>#</div><div>#########################=
#######################################################</div><div>&nbsp;=
</div><div>-LIBMICROHTTPD_VERSION =3D 1.0.7</div><div>+LIBMICROHTTPD_VER=
SION =3D 1.0.8</div><div>LIBMICROHTTPD_SITE =3D $(BR2_GNU_MIRROR)/libmic=
rohttpd</div><div>LIBMICROHTTPD_LICENSE_FILES =3D COPYING</div><div>LIBM=
ICROHTTPD_CPE_ID_VENDOR =3D gnu</div><div>--&nbsp;</div><div>2.55.0</div=
><div><br></div><div><br></div></blockquote><div><br></div></body></html=
>
--05815c8570d5f21fe9ebd63c0692ea1e4b072831--

--===============7888357427825855831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7888357427825855831==--
