Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2133C67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA334090B;
	Thu, 27 Oct 2022 06:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA334090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObmV9AEnjCEG; Thu, 27 Oct 2022 06:49:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A53B408DE;
	Thu, 27 Oct 2022 06:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A53B408DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 712911BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FDA160AA7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FDA160AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwdWXkgVuC9e for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE9560742
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EE9560742
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:49:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED609E0004;
 Thu, 27 Oct 2022 06:49:46 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:49:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221027084946.7ca40b33@windsurf>
In-Reply-To: <20221026201736.327835-1-fontaine.fabrice@gmail.com>
References: <20221026201736.327835-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jA4KGDSr4A6hcfNaB5qzzHPLwi5ZRA3eDYGPhTD0wJ0=;
 b=kKdcBqfOXlv0yxW4Sa/m52DVrLXNbYdjM8K90Q9Wr76kBcAeFXGwQkEbQF2uZwNOtzvR2T
 Aml+OQBrXhFmCDufmlvlQuA/a2KHrdLSKGcvcfOWj+9MLTv6ObxkYgqutWmnnnRT9COddX
 UCjsWWgXzmGLsb9yOKjHCG0TGRtVHlsQ7laC+iHs/bQsMaTPWwIHLGAAUJI0ko1ACR4RNT
 ddwS1epZIzpsMxhyZWXXSJ4estkyQcWpUuH4prJOOig7jDrba9oeSynbvbk9G0Hx2OgR3A
 4TaVte7F2KNcV4Sc3DzdMWxX0WtxvjiaxgLS9IexCESfVOL8AiI6Xlshk0SCyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kKdcBqfO
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: fix build without
 asciidoc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 22:17:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set ac_cv_prog_A2X to disable build of documentation and avoid the
> following build failure without a working a2x raised since at least bump
> to version 1.1.1 in commit ad21d84a589458fd4542993912891daa503d72dd:
> 
> a2x -v -f manpage doc/man/usbguard.1.adoc -D ./$(dirname doc/man/usbguard.1.roff)
> a2x -v -f manpage doc/man/usbguard-dbus.8.adoc -D ./$(dirname doc/man/usbguard-dbus.8.roff)
> /nvmedata/autobuild/instance-5/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e41950f3cd4bd83d9b067af498757cb9d2f207ef
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/usbguard/usbguard.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
