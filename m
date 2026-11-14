Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C2606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MnD08JsX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=P7u736IM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC87C60686;
	Sat, 14 Nov 2026 14:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYwDL0_STGtK; Sat, 14 Nov 2026 14:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D13556065F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794666144;
	b=BkZeZ3MIDtzWLWwwCmQEwuXv8Y2UtCR/1V5F/32ORNN5K1uOmtHRyLEMg1RHaGenAl1w
	 Ahmo/fHBAmOLO8li9sb2nDTuAwJdpEZU59W7cdab5ghFyt8jqzVAY7AhdSo5JPl1veMZz
	 sPfEdP1ye+trzoSchY1hY1kKUVPaE2sdkjSfwVg+raGeAg+nQ1Sc9MlJenGV/lIRaEQTn
	 gOR7YbdfYhFBGkzlakMs0+25GyvFofKUVPcR9YmnY+yjYv+RP+sAUgpOph0AOEoGlxPzA
	 yo6e+/aYKJiHQhicA1CcOC3ReivR5xsA/pPQ9dzq4KojeFg25DRyyGDEnlHDkj5YtpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2d7JhIwxZZPNwnyhODGEEyDmyivPy32j+IETrRKuYf8=;
	b=KKBE7g753Ir8/xVGuNd8kL/VhRUXHUQTzsYgE5aVumxd0tC6ddz1oiJoW84N17bcPpJF
	 2v8F/BDs6A/7G9hmoVrZQCAurXomne7mgDb3s/l1I8G3rA/8Sey+HmVdkhaI/u30pgztM
	 XsP/ZashsTuXFcpx1JVaj/HHWOWiK7o/0j+yGhf5yql4CQ9F8F7MQ1KXixqaxgWGGlTd/
	 YnLQULHeFbJjTYGPXaN6eXNzqdMyuGWT5uATtk4dQlCj9bCQDVNHNaO11WRczXzckZ5nO
	 R0/1OWgMVIr4Z+nPzcxQvopLeTajwwp7wc7EqXZX2af8bMST9hoIOkpUCM2e6ccfFoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794666143;
	bh=2d7JhIwxZZPNwnyhODGEEyDmyivPy32j+IETrRKuYf8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MnD08JsXeSqlhUmnGW1k+1AComC4ASgQWE7IoG4LTUWTPsC/LjSPtF0AhcpQjdTGw
	 CCwMOzf4cEqJKhMJrxPW9YtKG7frarDSyKyaSUBVpVR41gPC4dxH0Vwv+Tt2y4Xj71
	 oz9GKiIGxrZZW3WbrpVLR3LSkeo4e3XI+/HdLEwgCHlFdER0aGsgZjs47VR/RWDumc
	 fv/hqnxBtbbx+8lrYIiCdYfH0dk34Iw/IdMcBXULU+ybvd0aXdogw1OCdvK1cIr9Ub
	 mWXQkLYdfN8TC4rKf26Jlj6uEi4591BXCALYtv7dpu17uuHqPOO1xDyN2D8iAuYCJ8
	 mct6IqTODS0Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D13556065F;
	Sat, 14 Nov 2026 14:22:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF8109B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCEE54004D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uppRq_MVCEiA for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 14:22:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 117EC40111
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=P7u736IM
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 117EC40111
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:22:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=P7u736IM36pfcnTIoRHwUWNziLlj1nOE77OuE1uXqVdWjmGkWuNAAo/HcJvxfPqdu3U8CuzlNH710D1zES1nmtT62uka24ilMHXP/hW/y/0pwlSswDPy0XVqtGFH8FHo60EAWkQizCuOwdXm6pBM70QnpR4/sC1gXotnNl0duw9PXiT5O37vrrW+xGDijLNqNLOkIoQpxrBsg4caDPuaYnLpt98l/ABCuzIrP7/GDa06FgZ/G0B8oZNs2Y9Db8AMIjx/FQA0eMKXqPH9BGd4il0lwuhspNLUjX/w62pOdHfFPMFbOI96evmB/kSLLXUjP+VIOdUEXBWWakzro1bUnA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zmyc0OLPdMALBTWjgkhMrxFJAtKl5GPumt92wrCVeb4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1023663768; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 14:22:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSEdw-00000006F6g-23lq;
 Sat, 14 Nov 2026 15:22:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20261113204216.1400955-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 13 Nov 2026 21:42:15 +0100")
References: <20261113204216.1400955-1-bernd@kuhls.net>
Date: Sat, 14 Nov 2026 15:22:12 +0100
Message-ID: <877bif8pd7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: needs libopenssl,
 not libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot bumped the package from 7.0.3 to 9.0.2 with commit
 > acda85c85827c123a5238f3628009d8ae3ec0735.

 > The bump includes upstream commit
 > https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/0486ad61ceb71b7a45976e6e45a4d2a2813aef75
 > which was first released in version 8.1 and forces the usage of
 > libopenssl due to missing APIs in openssl forks like libressl.

 > Fixes:
 > https://autobuild.buildroot.org/results/31b7a6c2f1296edd0ff23657f92dd6e8854c32c2/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  package/ffmpeg/Config.in | 3 +++
 >  package/ffmpeg/ffmpeg.mk | 2 +-
 >  2 files changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
 > index fce2fef993..f4b5368cd3 100644
 > --- a/package/ffmpeg/Config.in
 > +++ b/package/ffmpeg/Config.in
 > @@ -17,6 +17,9 @@ menuconfig BR2_PACKAGE_FFMPEG
 >  	bool "ffmpeg"
 >  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if \
 > +		BR2_PACKAGE_OPENSSL && \
 > +		(!BR2_PACKAGE_FFMPEG_GPL || BR2_PACKAGE_FFMPEG_NONFREE)

This is not really needed (E.G. we do not do it for gnutls), so I've
dropped the select and applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
