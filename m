Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F87606D806
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H/wn9ufN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E5D60A99;
	Fri,  6 Nov 2026 16:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxvzAGFcKws6; Fri,  6 Nov 2026 16:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EF8B160AA4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981438;
	b=Gcm+KA5ZNHtCPWWl1lRuXqiWEHVypSp9KZROMEyEjbqlzbRY/yrQLTF9vJFJagaGM70D
	 BQmRaHKe56N7+fdte4a0fjU5btMyuirV47/s0mzns9B+KMuKrOCYNoaYzNMI6CVd84zWN
	 4vqwbbUVOoJ//ZbYGSGMfF3KSwwk/3540nH+nZGlzZpMVHTjlmWoY8pn8851Kg8jbbHgn
	 7Yvi+KGFzz8sCVicLa5cc4+v0yAWRQ88sRPczYa++yYvnEuuerqynXBRUq6hiTK0X8PE5
	 Wgopu2jCEB2mHL42dj7SMPLxmX1RJlGuBrbh5OR+6lroLjmhAFaSX2o4W+SrJGVtraQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981438;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QMWmCFaXt0az0UGQlKJh9GtCWGs5HnGE2cNlVdXdOHo=;
	b=S9pUjY1l8EPykQX+VG1IYWqdWTXAClbSNZFBnIGNgx0QvqfBh3fl+1YEqBRoT1NTa/Mf
	 kH0wV1Z2MQNy3ropvObSoDIAmLlueNWneIbCm0bRAjjI7H2+AHkD4QdHeQesi7Z8rgVg8
	 +PlIWMMHqCkn+6GN9QEtsau+D7tSStpIFDXOPWL+5lUR5EKuiOqzp+ImQJSm2aCN4OR/M
	 58zFv0rux03gxj9pVVXcEmuEw8wXqBervAC51nVAWs69xRePZ+a3G+f3o11R3Q4NHRdwE
	 XaFgf6EDKsH5M08isTA6POoaiuoT6rg5TAfbvJGVMhqRzjs7ikjUD3s2a8e0dOrOx1g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981438;
	bh=QMWmCFaXt0az0UGQlKJh9GtCWGs5HnGE2cNlVdXdOHo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H/wn9ufN/i9Vqz3b+ZJy4kH4dUPF6L0J1/T1E1j53HQHsqNFdoot5uj14PP6COaPK
	 Omlr6XhZKPngzPwP8U3uyDfi6QJsGVBjC0DFH/ii4R6Vd8KZDwCTfROlIyfxut/7gs
	 CRxFsT9JRyTdckuxYsBdyVKhBdzuUZNS+/hYog1S+fi2JC8hxBMeR+bN4I5aFLW/Il
	 q2Mw4qU3yT79FN7lqjCbPhQ+H2bKfEWhEFIZu/t6CGxrdITOlR+6Ab+IsbFcsFWjjh
	 vs5G4c75jiLVg/gHHeTESqd/Ni78GYSP5mI+DcSs2ToUX7j0FErawj0fmJourSHVnm
	 dpgEidc9A3CHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF8B160AA4;
	Fri,  6 Nov 2026 16:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD2D4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B24E160A99
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9sSRzsz9PIv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 448A460A7B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 448A460A7B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so7599765e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981432; x=1794586232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Jk7GkPJKj8IGfEIRUYdD8ABGfAzAujoRq+9FAYdums=;
 b=FqGiQECe/RO+1fWZ2DJ+LhiRvajT55kmJhKq4/Y0+Xll1Ef+1DE5B37GA7MPaHJxyO
 Y8v9FEgDu/SqDFjhnimhJKcVMyp628BrOPineuY4A7zkJSSCY9ZcdNPcwp3yVxa38Vt1
 eOlwsgVKU4jqnSGVFCyo5GPrchrs9OgbzTiWTGxcaqU0Aros6w/svBGMEZFAxBmHMTRw
 X/fuGQpn00DHs2/uCaT5Jy1RuW+vjemla3EKzBCiSE04FWhu9JFz1uZsdEZA6yVsCYox
 YRqWkKpeOrY8UhFjsY3QAyxXmen28WHxIARHHmGf3bR2heBnW3h0julrQsIoPsB1FkW6
 EqPA==
X-Gm-Message-State: APuU4Z9u0VtUxM1gRCh/IG6wAFHO2tKou1vn2AfInQtChDlLq4uaEoe2
 1dhQ75gzXYLkQDY4p8K7Rc+u2a/5OEJz/PNnSiwBwRZhA/oOTQHcosJDE/U3VS7RMzg76JEsIK1
 lg2+j7SQ=
X-Gm-Gg: AYBFou2/1oLUqq3REvMdNZEwCTZB8R1QIJQRqYZigdq/S83PSF3jOuDseEVhr3tatYQ
 nIVnmkQ0sNtCPOXZsdkoqdiI21W+GP0fA+0dShm5UJ2I5YnPGl3o1rpFtA8OBdAjpvNlper8IoI
 7utU2Sw3eoD2tweyXwrqC08Rp3dxzq5vcFcg+2mrdX8QTmKty3OJhbnMFVX8bdiyzg+vfh7tUJ+
 6nWVtzQZEmHnhimQyvYyesCGJVYch6Hn85HdtPHkEMNJqvr2AaIgH5w8CaNtutnsfX6dj4fOVnX
 65J+nPdUHcO9mGajA91Pa7CaxzqkgmorM4e3kF7BMZLNuqbISnEYFUvJaUweT9lqiK2m9qjyvn5
 5e/mGV2klJFTd/WVJyUd0rwv1Z7XW6QQosSBzudqa4uScmxMoz8t0FuF0joDD6ndr/Isi0I2Mrs
 Gf7/rihL2kP+UEIwKxqe+qp+9MosGHWtc3coMBRlXIff/fZ42DyYlq3zJZt+2n1EJ/hIpaZimKA
 31GpnnYtvP7Qdba+bUSDp7FG84pdwPNqovg9pK9NLgtlUh0BdntmMS1TUHKky3A3IRgf9gJJd8P
 cCc5PTa8MZOTzHiLaPueZVbmfPD8sBI=
X-Received: by 2002:a05:600c:154a:b0:4a3:18ca:806 with SMTP id
 5b1f17b1804b1-4b6dfbac630mr52243565e9.20.1793981432054; 
 Fri, 06 Nov 2026 08:10:32 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6af5f0c63sm78728865e9.6.2026.11.06.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:31 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:28 +0100
Message-ID: <20261106161030.607664-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030113514.1090450-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/newt: fetch from GitLab
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> pagure.io was shut down in 2026 and is now a read-only snapshot that
> no longer serves release tarballs, so the download fails:
> 
>   --2026-10-29 19:13:23--  https://releases.pagure.org/newt/newt-0.52.25.tar.gz
>   HTTP request sent, awaiting response... 404 Not Found
> 
> newt moved to https://gitlab.com/newt-ui/newt, which hosts the
> releases, and Fedora also fetches it from there now. The tarball is
> identical: it matches both existing hashes. As the CHECKSUMS file on
> pagure.io is gone, note that the sha512 also matches Fedora's sources
> file, and update the homepage.
> 
> This is not caused by a Buildroot commit: newt has been fetched from
> pagure.io since 2016.11, and all maintenance branches are affected,
> whether they use https://releases.pagure.org/newt (2025.02.x, 2026.05.x,
> 2026.08.x) or https://pagure.io/releases/newt (2025.11.x, 2026.02.x).
> 
> Fixes:
> https://autobuild.buildroot.org/results/929378a23fb9a936487332a6c92aef78ee64d96f
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/newt/Config.in | 2 +-
>  package/newt/newt.hash | 3 ++-
>  package/newt/newt.mk   | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/newt/Config.in b/package/newt/Config.in
> index 42a9eca729..b1d2d382d6 100644
> --- a/package/newt/Config.in
> +++ b/package/newt/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_NEWT
>  	  Programming library for color text mode, widget based user
>  	  interfaces.
>  
> -	  http://www.redhat.com/
> +	  https://gitlab.com/newt-ui/newt
>  
>  comment "newt needs a toolchain w/ wchar, dynamic library"
>  	depends on BR2_USE_MMU
> diff --git a/package/newt/newt.hash b/package/newt/newt.hash
> index e8c945e4fe..ea76730335 100644
> --- a/package/newt/newt.hash
> +++ b/package/newt/newt.hash
> @@ -1,4 +1,5 @@
> -# From https://releases.pagure.org/newt/CHECKSUMS
> +# From https://releases.pagure.org/newt/CHECKSUMS (no longer available),
> +# sha512 matches https://src.fedoraproject.org/rpms/newt/blob/rawhide/f/sources
>  sha256  ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82  newt-0.52.25.tar.gz
>  sha512  23f239ff599f63fdfec83ba32256a4b4e081d84fe7844a32a9770a0776df7e200315f794d031bca0f7c3526a9730fb3f62973bad40bf96618de6e336e97a8096  newt-0.52.25.tar.gz
>  # Locally calculated
> diff --git a/package/newt/newt.mk b/package/newt/newt.mk
> index e74f87d01c..78620b5cc2 100644
> --- a/package/newt/newt.mk
> +++ b/package/newt/newt.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NEWT_VERSION = 0.52.25
> -NEWT_SITE = https://releases.pagure.org/newt
> +NEWT_SITE = https://gitlab.com/newt-ui/newt/-/releases/$(NEWT_VERSION)/downloads
>  NEWT_INSTALL_STAGING = YES
>  NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
>  # Force to use libintl, otherwise it finds gettext functions in the C
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
