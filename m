Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B2606A334
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 22:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FDjNtBJK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5675B80DD8;
	Wed, 11 Nov 2026 22:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN69_KvkH9zW; Wed, 11 Nov 2026 22:47:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 63F8F80CFA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794437236;
	b=STJhw1518RIVutrsyS7k1C66tnnnxI9BX0taqv6ria4VYBOub0k4gK7Fva+ZcJFZnxnQ
	 uRqGC9v4MOUksCWd2Bu/qaTpb3gkkA17XLOEuC/EtsqxS+eHpKj/LA5oT+ineRhgtCArK
	 I94dm5aLjr9q+lJSMUWDb+TyBQbUHnZpBOSJ4BFtUcFPSNdiQSIhRKOAtMJg7V9CiVHcq
	 fRqiDZ+uiPe5k6qus+QhvaAirw/CssBrfIBw9lG2AUOiNY+JZ3/+ojx6d99oe77wTZXRW
	 IbT4nD01olP2QghQaEg7yUzw1K1MmeZ5nH/F9LCZGcCXQWu1LmiHJ6NXf423ebhMn/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794437236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=Zak6YzuAbZ8QbEtuHbMpdw1iSoze14qnzqE7k7Q4axg=;
	b=btywmXxtfrF2rI3oygjwDKAdhHPLTFXlzvjpJ943y4kwgA42k5Lx3oR16V99zYzQQzhX
	 AuwT5Vym8Y9KOa6gC4K7e9SErwoIvph3Ftp/OlJSbq8V6qXb4ZdKVxZtZBkUCARM2/3VJ
	 MSPqWIwUohueQQQNHFN02vBObWKfDLcLhPWdHL07Pyp72V5Gcq4Gd+l5ZHR4jrQpaSF7d
	 HpiSAfE6ykVTbpETg3WOIv48WqyphwYkLwpex3G7s5BBNb8gU2woaxmG9FKQ5Kn2JZ+Ye
	 xT2Ivb1v1xH2i1/qiWha7GbVEKHcS2Q0XR4xCPcBfclK7d2AMkYlFpjXwqK4K3LwW6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794437236;
	bh=Zak6YzuAbZ8QbEtuHbMpdw1iSoze14qnzqE7k7Q4axg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FDjNtBJKu5B55r5KMUp8UjdrlXcNVTEu853KHNZsQdO67hyQORAhulKRZrvIbPBU0
	 xxLkk559rUq4QBOIKtiCULC32Z/W7wWqH/J4wGjDpLK5687hNEjEysh3zvsuXLxjWR
	 YNozs+bDnNheVHBUo132m5MZc6KIoWwtFfLP75zE68EE7pQYlRrUkS4wJDPX4m8nLi
	 2PGNIw0si4QTjke97+eOuGOlQ5n/KcPPiIjRgXh+CaTmtliN9ZvmA+jBmw1g0r6z7G
	 KrawcwrI+vpzaOUXyc6mbPZEAnmQhJobvY0drrMHPJgceszQGrsWF23/H9aNrw34tw
	 enJpQDcPLNmpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F8F80CFA;
	Wed, 11 Nov 2026 22:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CDBF31F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 22:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59CB180BCA
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 22:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFsV2Plnoz1Y for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 22:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12BD6811D5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12BD6811D5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 22:47:12 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794437230; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:ntb/U4Tqu5s6pN96WU/g3Z6olvi0
 gLWIUCExXB/fvXn3P0wsQwEcWUzb4ekfqtwT0xm2rLFkUnIOV/sFscgKFZBbCC9Lu6jGLrOhe4X
 qNTfKCgPxQi7OIe0XsYpdUAUzYxAyKkq/z8eXEA202HtXwvq31sbYgxh+sp30EA/JRsM/jwwUzF
 Mc0twHXQO5K5PX7calBaaURvtQCFDDMq4FzPc+bnKTUG+gKr3989WmREVEgpRyQm2hGtZ7qPm2T
 r0atSRw+ofwjUKODPKcgk+e+JXA2RfusRFzAx6XjuOAolAZ08xUlcZ7B9m27Qp28ewak1Wdmbro
 Yze/X8XjxdDp7g==;
Message-Instance: m=1; h=sha256: 8GvG5vxQyN0owbHm7tPjrzzg7fNwJ/WzLSJWGY9VTiU=:
 5YBzwJQGDGIWtPtfeWkl4wYfUpPeVBek4JrdlP0tHuk=, sha512:
 mQGd9imi5sOM1/bUdOxlI634Qvx9fPf5YdcJ3AnpO3yWclTSbIt1es5hZ7PfyMimiZhYJ/kpBc4Hs4QHHQ95fw==:
 i3BbDgGtJDfC5qcERDyI7Mz9adGmOKbSsiQg7zM6MBOj7S5HXEeVKc2ljX0IxPxDfN14BoLY0h29j50pm79FbA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1wyITw48xr-00Xmv7; Wed, 11
 Nov 2026 23:46:48 +0100
Message-ID: <4bbdf61e-541c-4c19-b168-cc33717fa2f1@gmx.de>
Date: Wed, 11 Nov 2026 23:46:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
 <20261107163414.560896-13-angelo.compagnucci@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261107163414.560896-13-angelo.compagnucci@gmail.com>
X-Provags-ID: V03:K1:lBi1F+b6LtioXPUZVRannLYnIBiCyTbxpLCHtsEOdWlrdLMd20a
 84N0m49edHKYT3ELpxlJF8MfECdqotKJHp/UU4J9RiyScCbLbhjvBQMc5FIVwWqEWHt/0sF
 MUYd5p68xJThdbwM/q01gwzF3EFZnA1heUb51/JC3HCt9HUEN+XtcCmIQ2mYK6VbirDIoz3
 6+EanJ67kSIyoti7zYkVw==
UI-OutboundReport: notjunk:1;M01:P0:YQxroEapnVQ=;vNgezhf0GfXDPx4b15rnIO/FtpX
 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
 CuGWEr8Fb4OfUk=
Subject: Re: [Buildroot] [PATCH v4 12/15]
 package/libglib2/libglib2-bootstrap: drop unused variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 07.11.26 um 17:34 schrieb Angelo Compagnucci:
> Two variables of libglib2-bootstrap are not used:
> 
> - LIBGLIB2_BOOTSTRAP_VERSION_MAJOR, set when the package was added in
>    11aa1cfa5a ("package/{gobject-introspection, libglib2}: bump to
>    {1.82.0, 2.82.4}"), is not referenced anywhere;
> - LIBGLIB2_BOOTSTRAP_POST_INSTALL_TARGET_HOOKS are never run since
>    866462e8dd ("package/libglib2/libglib2-bootstrap: do not install to
>    target") set LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO.
> 
> Drop them.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

Thanks for cleaning up!

> ---
> Changes v3 -> v4:
>    - new patch: fix a file warned about by the package infra checks
>      added at the end of the series.
> 
>   package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> index 1e512fd7ed..856e7e697d 100644
> --- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> +++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> @@ -16,7 +16,6 @@
>   # The bootstrap package is an implementation detail that nothing
>   # except gobject-introspection should depend on.
>   
> -LIBGLIB2_BOOTSTRAP_VERSION_MAJOR = $(LIBGLIB2_VERSION_MAJOR)
>   LIBGLIB2_BOOTSTRAP_VERSION = $(LIBGLIB2_VERSION)
>   LIBGLIB2_BOOTSTRAP_SOURCE = $(LIBGLIB2_SOURCE)
>   LIBGLIB2_BOOTSTRAP_SITE = $(LIBGLIB2_SITE)
> @@ -53,8 +52,6 @@ LIBGLIB2_BOOTSTRAP_MESON_EXTRA_PROPERTIES = \
>   	have_c99_snprintf=true \
>   	have_unix98_printf=true
>   
> -LIBGLIB2_BOOTSTRAP_POST_INSTALL_TARGET_HOOKS = $(LIBGLIB2_POST_INSTALL_TARGET_HOOKS)
> -
>   HOST_LIBGLIB2_BOOTSTRAP_DEPENDENCIES = \
>   	host-gettext \
>   	host-libffi \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
