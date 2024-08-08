Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BC0C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 05:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47BB81224;
	Thu,  8 Aug 2024 05:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhvvVW0Bu4qD; Thu,  8 Aug 2024 05:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A202280F17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A202280F17;
	Thu,  8 Aug 2024 05:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2E3F1BF2CC
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 05:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD1C5608E3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 05:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOesGUsT0zh3 for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 05:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 753FF60683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 753FF60683
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 753FF60683
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 05:30:44 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 5DB3A3297AF1
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 07:30:42 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id P0SEQ5UyXMnz for <buildroot@buildroot.org>;
 Thu,  8 Aug 2024 07:30:39 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id E8DA230EC7FA
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 07:30:38 +0200 (CEST)
Received: from int-subm015.mykolab.com (unknown [10.9.37.15])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id BCF2C311BB28
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 07:30:38 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 08 Aug 2024 07:30:38 +0200
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
In-Reply-To: <20240808052443.86164-1-zgyarmati@zgyarmati.de>
References: <20240808052443.86164-1-zgyarmati@zgyarmati.de>
Message-ID: <087ec276f1e5357bd8bbb90fe4725dd4@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-type:content-type:message-id:references:in-reply-to
 :subject:subject:from:from:date:date:mime-version:received
 :received:received; s=dkim20240523; t=1723095039; x=1724909440;
 bh=zcsrT9GkfkQmMcLkV7RrkPqnsvybthrELDHhtfBdwV0=; b=tJgZjeuJynb8
 EvdIoCUZlu+A/o5/HhzqCbb1slyg3H4AbMzMjvy88Ej4P/pmvglBfq2b56FNGNpi
 s9qZ5EgY708yjKmU5B8r7+0IHpt5Ymq1vQkmbicFmMsLCDc2EOmMPt0bCCW90pAl
 HQiV+S7WtG+3HaFPeXtwH8xBZOUgOQYR82AaAvfrp2bbkoZMo5CTKwncTuwgti26
 nOSf4lkjYxfu0gAazGVrIh9+Vq3Dd5rVR8cl29rAEnmOpxbT623U/Yp+PAPvtebO
 6iLtufeGF68tpjGxS/ZAothTfHtAY6ag6F1XWe3V1RsqFOaGjubHF5jgUCTsKUr+
 eC2DYyUtfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20240523 header.b=tJgZjeuJ
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [PATCH 1/1] package/simple-mail: bump to 3.0.0,
 enable for qt6
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
Content-Type: multipart/mixed; boundary="===============6061630195364415096=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6061630195364415096==
Content-Type: multipart/alternative;
 boundary="=_95556394e2af0b91b164257ea95859b5"

--=_95556394e2af0b91b164257ea95859b5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed



Dear Thomas&All,

please disregard this patch, i've just  read your e-mail about splitting 
my grantlee bump&qt6 patch into 2, gonna do the same with this one...

Thanks,

On 2024-08-08 07:24, Zoltan Gyarmati wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
> package/simple-mail/Config.in        |  5 +++--
> package/simple-mail/simple-mail.hash |  2 +-
> package/simple-mail/simple-mail.mk   | 10 ++++++++--
> 3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/package/simple-mail/Config.in 
> b/package/simple-mail/Config.in
> index 681a8410db..fd82a224d3 100644
> --- a/package/simple-mail/Config.in
> +++ b/package/simple-mail/Config.in
> @@ -1,7 +1,8 @@
> config BR2_PACKAGE_SIMPLE_MAIL
> bool "simple-mail"
> -    depends on BR2_PACKAGE_QT5
> -    select BR2_PACKAGE_QT5BASE_NETWORK
> +    depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
> +    select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
> +    select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
> select BR2_PACKAGE_OPENSSL
> help
> An SMTP library written in C++ for Qt.
> diff --git a/package/simple-mail/simple-mail.hash 
> b/package/simple-mail/simple-mail.hash
> index 67d6caff87..4de1525b53 100644
> --- a/package/simple-mail/simple-mail.hash
> +++ b/package/simple-mail/simple-mail.hash
> @@ -1,5 +1,5 @@
> # Locally calculated
> -sha256  
> 2026f2017662508b0f25da72694f1dd13ab3ccf82c0454f7c40f8a6cc450c410  
> simple-mail-2.3.0.tar.gz
> +sha256  
> f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  
> simple-mail-3.0.0.tar.gz
> 
> # Hash for license file
> sha256  
> 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  
> LICENSE
> diff --git a/package/simple-mail/simple-mail.mk 
> b/package/simple-mail/simple-mail.mk
> index 68484f79b0..9f2929345b 100644
> --- a/package/simple-mail/simple-mail.mk
> +++ b/package/simple-mail/simple-mail.mk
> @@ -4,12 +4,18 @@
> #
> ################################################################################
> 
> -SIMPLE_MAIL_VERSION = 2.3.0
> +SIMPLE_MAIL_VERSION = 3.0.0
> SIMPLE_MAIL_SITE = $(call 
> github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
> SIMPLE_MAIL_INSTALL_STAGING = YES
> SIMPLE_MAIL_LICENSE = LGPL-2.1+
> SIMPLE_MAIL_LICENSE_FILES = LICENSE
> -SIMPLE_MAIL_DEPENDENCIES = qt5base
> SIMPLE_MAIL_CONF_OPTS = -DBUILD_DEMOS=OFF
> +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> +SIMPLE_MAIL_DEPENDENCIES += qt5base
> +endif
> +ifeq ($(BR2_PACKAGE_QT6BASE),y)
> +SIMPLE_MAIL_DEPENDENCIES += qt6base
> +SIMPLE_MAIL_CONF_OPTS += -DQT_VERSION_MAJOR=6
> +endif
> 
> $(eval $(cmake-package))

-- 
https://zgyarmati.de
--=_95556394e2af0b91b164257ea95859b5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>Dear Thomas&amp;All,</p>
<p>please disregard this patch, i've just&nbsp; read your e-mail about spli=
tting my grantlee bump&amp;qt6 patch into 2, gonna do the same with this on=
e...</p>
<p>Thanks,</p>
<p id=3D"reply-intro">On 2024-08-08 07:24, Zoltan Gyarmati wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Signed-off-by: Zoltan Gyarmati &lt;<a href=3D"mailto:zgyarmati@zgyarmati.de=
">zgyarmati@zgyarmati.de</a>&gt;<br />---<br />&nbsp;package/simple-mail/Co=
nfig.in &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;5 +++--<br />&nbs=
p;package/simple-mail/simple-mail.hash | &nbsp;2 +-<br />&nbsp;package/simp=
le-mail/simple-mail.mk &nbsp;&nbsp;| 10 ++++++++--<br />&nbsp;3 files chang=
ed, 12 insertions(+), 5 deletions(-)<br /><br />diff --git a/package/simple=
-mail/Config.in b/package/simple-mail/Config.in<br />index 681a8410db..fd82=
a224d3 100644<br />--- a/package/simple-mail/Config.in<br />+++ b/package/s=
imple-mail/Config.in<br />@@ -1,7 +1,8 @@<br />&nbsp;config BR2_PACKAGE_SIM=
PLE_MAIL<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool "simple-mail"<br />- &nbsp=
;&nbsp;&nbsp;depends on BR2_PACKAGE_QT5<br />- &nbsp;&nbsp;&nbsp;select BR2=
_PACKAGE_QT5BASE_NETWORK<br />+ &nbsp;&nbsp;&nbsp;depends on BR2_PACKAGE_QT=
5 || BR2_PACKAGE_QT6<br />+ &nbsp;&nbsp;&nbsp;select BR2_PACKAGE_QT5BASE_NE=
TWORK if BR2_PACKAGE_QT5<br />+ &nbsp;&nbsp;&nbsp;select BR2_PACKAGE_QT6BAS=
E_NETWORK if BR2_PACKAGE_QT6<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;select BR2_=
PACKAGE_OPENSSL<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;help<br />&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;An SMTP library written in C++ for Qt.<br />dif=
f --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple=
-mail.hash<br />index 67d6caff87..4de1525b53 100644<br />--- a/package/simp=
le-mail/simple-mail.hash<br />+++ b/package/simple-mail/simple-mail.hash<br=
 />@@ -1,5 +1,5 @@<br />&nbsp;# Locally calculated<br />-sha256 &nbsp;2026f=
2017662508b0f25da72694f1dd13ab3ccf82c0454f7c40f8a6cc450c410 &nbsp;simple-ma=
il-2.3.0.tar.gz<br />+sha256 &nbsp;f93e93843d11da5c4ec44225eba46ccb3e9710fd=
594a27b966901745429ed4f4 &nbsp;simple-mail-3.0.0.tar.gz<br />&nbsp;<br />&n=
bsp;# Hash for license file<br />&nbsp;sha256 &nbsp;592987e8510228d546540b8=
4a22444bde98e48d03078d3b2eefcd889bec5ce8c &nbsp;LICENSE<br />diff --git a/p=
ackage/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk<br /=
>index 68484f79b0..9f2929345b 100644<br />--- a/package/simple-mail/simple-=
mail.mk<br />+++ b/package/simple-mail/simple-mail.mk<br />@@ -4,12 +4,18 @=
@<br />&nbsp;#<br />&nbsp;#################################################=
###############################<br />&nbsp;<br />-SIMPLE_MAIL_VERSION =3D 2=
=2E3.0<br />+SIMPLE_MAIL_VERSION =3D 3.0.0<br />&nbsp;SIMPLE_MAIL_SITE =3D =
$(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))<br />&nbsp;SIMP=
LE_MAIL_INSTALL_STAGING =3D YES<br />&nbsp;SIMPLE_MAIL_LICENSE =3D LGPL-2.1=
+<br />&nbsp;SIMPLE_MAIL_LICENSE_FILES =3D LICENSE<br />-SIMPLE_MAIL_DEPEND=
ENCIES =3D qt5base<br />&nbsp;SIMPLE_MAIL_CONF_OPTS =3D -DBUILD_DEMOS=3DOFF=
<br />+ifeq ($(BR2_PACKAGE_QT5BASE),y)<br />+SIMPLE_MAIL_DEPENDENCIES +=3D =
qt5base<br />+endif<br />+ifeq ($(BR2_PACKAGE_QT6BASE),y)<br />+SIMPLE_MAIL=
_DEPENDENCIES +=3D qt6base<br />+SIMPLE_MAIL_CONF_OPTS +=3D -DQT_VERSION_MA=
JOR=3D6<br />+endif<br />&nbsp;<br />&nbsp;$(eval $(cmake-package))</div>
</blockquote>
<p><br /></p>
<div id=3D"signature">-- <br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
<a href=3D"https://zgyarmati.de" target=3D"_blank" rel=3D"noopener noreferr=
er">https://zgyarmati.de</a></div>
</div>
</body></html>

--=_95556394e2af0b91b164257ea95859b5--

--===============6061630195364415096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6061630195364415096==--
