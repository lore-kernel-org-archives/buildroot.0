Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DE606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YDoICNxd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F54960AA4;
	Fri, 30 Oct 2026 15:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRPamc9gMj8e; Fri, 30 Oct 2026 15:26:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CB28A60AB0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373960;
	b=HCSxol2xa9WMIHLXH4ox132R+Tv/Yn0h6Y1AkRbckj4Edoi6T40CrV0mnKiwxpTmFtVQ
	 Le0GvsXJCHZI+QDL+8PHnA/vKM50iP4asi9wJSOqgyPJgh3UXvilmXK0Zs7ccYq9kW+Oj
	 yfqfDDb5Ze9BAGspgyw3qT6mUpSxVInP47o1g0L1TuoJ7dwD4GeXJC8Li+GnjKWkV1lj1
	 1HgjNKQmkHhQQ/Xgurixf0UqaeRxRHjifJ9UKN63JyhJKiABT+oKZcjgbpfEBipHcPl7s
	 VUr6UDwewfGLmHk6Mrd5JpppPL5//8jVkxPODLNBO+k0NQErGLwFRnMYXF9aPNigoYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5jCGujE1oihu9rzMsR1v/FcLh3rhjhk3quz0GUPI/JY=;
	b=lzezSJWGrFmyDADn0qgDpcYqueg0xlphc41JEIRJwatQ+asZcDKsxb5fIQe4oCKBH2xI
	 AtJNuC5q7IAplO19Kybk5FiU8iwDaJbQSxKPMSTPx1jjZaRpJoU2CFFIcJcI8qpHBZ3XV
	 fdCYdjz82yVA4qClfqIECWIZnC7+JdDxX3Auy9IoAik9OzmbFX4Z+6LJAATizcDRU9WQw
	 Ig6sOeB+JbN4wh2yxCvhh3UZ00nLjvD0+7ZuDaOTOGtRgLgbYrA+FSblyd2wnKFAdw7NW
	 BrHY6BL3KQ74D87SYwPj5FT9oAXZYAkx/lXazy5LM83gXiYilHowP4lWEDa3FAFO9ZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373960;
	bh=5jCGujE1oihu9rzMsR1v/FcLh3rhjhk3quz0GUPI/JY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YDoICNxdv0ScErvQlb9tZjxtt71Hey2C7vChfUyHu8y/UELwztAZGe1zAYYJh3jZ9
	 GeRvTkvqad4voGEYmItCqTgsULxcfdbn96Ll7hM4fkG/JTmwAHSs8NWFpxVFGXoSxx
	 HGFR3Hg64os2SGZmIgv2LzOIBEFWQX72UJmoONj8higfGl1kzOa1R6M0WMWF0U6FL+
	 MkhOiaUnhoCUGttnsdSufOSfijNz3Pme2F9sMgV64p+sFGi9qiccPmuBA5KhUws4H6
	 kXI/mQHRpqj0bCxN1od6gzyGs3FR42QR4EVsDcA31csb2pyT2imBoRUX7/H3j9l/Ms
	 k0OsVBV+C0PJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB28A60AB0;
	Fri, 30 Oct 2026 15:26:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A76B7362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D73360AAC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgTcq-RI57Ry for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:25:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4D5F60AA4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373956;
 b=c8Q36GqDZmbkF7sshH1mhOCt1aEqWZ8DWFwXGiTt4uvWv/urftsKleOUUHmL6Sv+65WX
 xM3JV6PF/6cdclcfDu7laSB0jL1htZYgXTHY3lml4wdSpV/qMIjRljZKNajvQZgrKFDs2
 jUg8a/5B06a2mm5oYOvbxt4vVnwSdM7ibD//h74ZNNRJvHrj85Mwbk8qHdf0KLkJKksQI
 NDpnl8LSUuGV5NNNMt/IT4PWRwotgeQwI29NuMyiC7Dc/xnlXTpynHJASAxMyvNNiFWc9
 LZD7nNrr/0fMhkEuS9dAMiq23sAuo60Pvrt0Kid/LxXu6XkNcbcsMOvuXcBlfBJzytg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373956;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=IOMVCiwfIffTqgDBY3mdLAQELwlnllpfGMwxL9c1dbg=;
 b=a68rF/Wzn6BkAJtSG0vR/XeUY4JIHmQEXPSN5VBr1FjWbAyiv+w8pkS+x+tCEYUFt3tq
 fZnQfx5A27wdvL7gbV68RRxomslL5QMEFPE6dtGquLZ7f8KonbgjHSEzXmtPS1bzzoCSw
 IMXQ/ZMxcXwThEfIG+uCB4KIh1Px7H6c6z2mT3JVomNo0HIyhcRtZrdzFS5EjAn6Lj2tJ
 Yd4IjiQh+eB8mSsojY4M3SGTVgim8b+R5ONbGrf1SAWMQl52BlRKDuMp+OsG6kf83Z1ge
 zIr/78dsJNumdxIFf9cLJeeHwJeae9KBG6rntWM0LzEcYplUYAhS9LjsUwdpPLf6qgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NKF9GBKB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4D5F60AA4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso5900125e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373953; x=1793978753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IOMVCiwfIffTqgDBY3mdLAQELwlnllpfGMwxL9c1dbg=;
 b=bW0AlXNyJmWK/HvaRwEw//5ZDZvt37casZVFsUApf3DPuV1DxZ5d4FLcgBBR1QA4eK
 TqC7kDtpiDVas1b3qKpn4iGwSjMWwg5TVbNvdpV9SEIsJMrSQ0zOMQkORn3wy8SfCr1G
 uIwd3zWs0FsBlKN42b3000X+82B13TM9Ly++BJxih6Y+rnKlKHJ3GsW4E5FmLA/XkGUa
 wj9ZGJeQH2TekHB8MVmBxUOOQbFZuOCPt3qyzFvTMYPr41oRbwffsMGYmSRgZ4gal4qJ
 S1UPO9r5B+ZAG8YhDb7Aajp3GO6v3FyqEdJspTcLArqgH6FvruKpqqFZuXTF+BWv/H/V
 p1ew==
X-Gm-Message-State: AFq9FYKW0awQUc5K5JYuyPqvPKvaWg2GEXaa6qpMXhIVvndS9dzzcIjN
 BVCkScREJtilGn1HsbOnTx2OdecnO/H1rBHOtX8bqHiyr5/JBx7O7N6llcOy66Q4BJ8D4ptOwjV
 mDd/VD/M=
X-Gm-Gg: AYBFou07RJ4353Z+qKGT12We6B3TUTIng3SHxo4n0SNa5luwVxl5LIPvW2RT1lAsZXe
 Dj/i7jGI4dFdWJIBT+Tad4ZxDfIWLEErhx5T1qEltPpQa9+hMkisikqavzcdmTW9AQVPnFY9W3j
 5nX9+TX/QoO0mQyE98kX90cG+kvFd3mV0nxJIFEsfNEJEbsOBHDmSD5zJl3Sux/EM3cpsd93LZW
 krPaImgxsllgm6IFg1zo5gGJc1GCaEazKpFnrk0FfwGS2QOKSk7VsSVkB6FWq0CXGhL4wD6/W+o
 W3BWWCNdU9sYal+ON/hUNuvp0dpYq7fDqovhIrw0pYa61kUr+wv5QDzIDvYzKhqkaWpmYLXR9VG
 /RihTgI4rdV+vUZfkeLVpFiFAZAC57tCrZ3KSgffWFHDlzVaLz/EowM4Tau44A/mZVz+VfKepAW
 +wtgv15027oRP59oFzCI6HzTiwFrYy/Gv45PcOq4cTqAeIt8QL5Y4oiw5Y83Ra8PLxJIortddB4
 jHQ4qNAYDF2tliiW9uMgFIrV8yl9ipzYx96agbJjZKRCCt7L6NKOTAn19n/ybwrGiqfJEs7mI/e
 Xx56XGw4x7mvJAp4edqN7BTg58GwLPRlGOL77Xz8sfFSXpkmOP8dBGc/ncYeS4yR09Xlo/wFp8m
 f4EePdTnb/iVElnrvtw==
X-Received: by 2002:a05:600c:4e41:b0:4a6:42cc:bf6c with SMTP id
 5b1f17b1804b1-4ac16acfbd0mr55571155e9.7.1793373953201; 
 Fri, 30 Oct 2026 08:25:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f3229dbsm142933445e9.1.2026.10.30.08.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:25:52 -0700 (PDT)
To: buildroot@buildroot.org,
	Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:50 +0100
Message-ID: <20261030152552.1905805-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260816191830.533747-6-alseycmiller@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/8] package/sdl3_ttf: do not build the
 samples or install man pages
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> SDLTTF_SAMPLES builds example programs that are not installed, and
> SDLTTF_INSTALL_MAN puts man pages on the target that Buildroot removes
> again. STRICT makes the build fail on a missing dependency rather than
> quietly dropping the feature it belongs to.
> 
> Also state SDLTTF_HARFBUZZ=OFF in the branch where harfbuzz is absent
> instead of relying on the default set above it, so both halves of the
> condition read the same way.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/sdl3_ttf/sdl3_ttf.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
> index 12441e243e..130e07746e 100644
> --- a/package/sdl3_ttf/sdl3_ttf.mk
> +++ b/package/sdl3_ttf/sdl3_ttf.mk
> @@ -15,11 +15,15 @@ SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
>  
>  SDL3_TTF_CONF_OPTS = \
>  	-DSDLTTF_VENDORED=OFF \
> -	-DSDLTTF_HARFBUZZ=OFF
> +	-DSDLTTF_STRICT=ON \
> +	-DSDLTTF_SAMPLES=OFF \
> +	-DSDLTTF_INSTALL_MAN=OFF
>  
>  ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
>  SDL3_TTF_DEPENDENCIES += harfbuzz
>  SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=ON
> +else
> +SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=OFF
>  endif
>  
>  $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
