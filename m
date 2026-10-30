Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q4Gp12/E
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3AF40E96;
	Fri, 30 Oct 2026 15:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV3dl-FolfVf; Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 05DA840E4F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374189;
	b=gUi9SshvGqNOZOTJZRb8LBeOHrKO5Wa8xDDIIVU7VMje5v9okLrmg0JgHPmLLbhI9IRd
	 Hkvx6nmyMtE6noySjdEwxPvCxNp2BHnPG7XcmGwM6D9D3l25kYpl7eaGXYUbu5QMyWF45
	 ZDPmMH5ayOhtE6MdUMa6KmqMHDC+6d0cD8PDio5U+SKMKENXa5QG2pFrDWC7DNqz8q95/
	 rHYyzycebOqAQyHXg9h3QCRvwKT/54ja4P7nCbSz4WdXntTHjz0mv9y6otcBWg3QjsiEm
	 vOU4W4Cs7W3at0L4N1QXYHNM5sxqcuBOirt9iTi+eXZ8ZudGJV2iaOzYKnm5M9ZDwXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0oGs56Pr1yxcyXXzmRpHUPADvZJCwBmrRgNFgQ2UrtQ=;
	b=FB9JwgMUwpMendE3T0EymP4AAcgiziZ3ILB2mglyPV3jIUvHGnJrNWMc/UNvNteOCZF+
	 tSr83Zb6yVXu6vNKoou4l/lNxs4Z4a8DHB4TKSrIpdZOXRzaAUIW4sEHroi7aWEoLXuDk
	 GpHj9Y8ieVtmYvOmi7etwHCuHQA2sMeubfUr9n8SlwNIsZV2f/glddR0o1JVLnv07SxPk
	 nF4AqVlWk7yu5VbvGCoOZbGekXOovSkKWpaEbCvc6q0df/5762pVXxFOy4ydFsRu9gqJI
	 1gaPLgIBB6NWMJRpClgs491SwFkolzKca5oOSlJCju1YD5v1oCSd8ciLLn8wwETDnxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374189;
	bh=0oGs56Pr1yxcyXXzmRpHUPADvZJCwBmrRgNFgQ2UrtQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q4Gp12/EJX5B+yWOeQozZZduoP+5ad9UZ87WPGhxy7zVDyJHH8/oM28eV2AtOQmfT
	 KIKiVXbdl5iWLAB1Lvd354WMeJwXJIlaKP82Yq9h3j3083vCJ53eMOfZBxwybwtmjR
	 LDfguW/3+VNyJmlwdfGHkqlHOQqr3vokHYZV4PPeDKyNWoQoLCDLBqDYjEnxxvJ+k4
	 vTw0hgrdKZgi3S4gOsM0WRQRZa72BISwUnESBIWeAWCr89isYAS2u4ZYUjuO7fUUuS
	 6tVdb/LdhrZkZFBkKLj0g4q+6moADU2CDL+8VPqf5p826RacWCRI51m0odX8v1caIO
	 MdwVaPyv3OtMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05DA840E4F;
	Fri, 30 Oct 2026 15:29:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F6BE235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5108860B58
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq5Bb6klvC0D for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5D4AD60B55
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374159;
 b=HStZ52eyVs0o3gKizTa+7dvn8nim8yxcqmUZhw/wfCAuW79M176GVByXWstmhn48Z6Pt
 P9q7TGnHMlmQY5bJ6IhgE248J+Izvd9XgRul51YRxzdTOXgJh4e5FiXGCvb3QvI8fvCuU
 burhEujjJmg4xeu1gJOraLy3T1DCls150Vh+8hMYD2as/FlzBabzQqkVzCUYrhoAVuZOM
 nXJCLxbe12jwXGi/xCRUO02CUhEfYrBI6RRMF/VFZoAfPuzIRO5DDUBE8MPEEIaNmVMSf
 x/BkHHiEiFVfM18/ApAEhP+rE80sNRucHddJ4sGC9UBnbvRWrgFW0mKSFRlxldU43wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374159;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PtTDU+sFyuoEKSV5fSXrXN2/wKIkgZT4/lUrVaySDXw=;
 b=kYjlBl3IYpv8hFXnONV+sue7qy1Gd6bJLjhrATxeCXZuu8CM8BqkptL0UWZzb23wgi5C
 iIC9i3Rk/2LSJCed5sHCXEbtBXqQqxCWGWqW9kT20vWnjS5GuSXYyhIX90ResNiRm+oiB
 ehW5OVq4LxCsS+u1rjye71/Cm16G6Zaw3glV4qmoOQ1xapbsKr7yS9DiXj9hLhlZq85W9
 0OYYtw/O+53Ra2Q5Cou3QQZcCWYwzAHDQlanLC1aKQgVEl/ApYF3d/QMLs9eppISzQdc+
 Ejfmbc6cDXo+Uaxz8z//WRW2kJLDwIoz3k6vLF6UGuOHEXPgDOsigeljJm1byXTsjYg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=H5yh+KGh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D4AD60B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so7257355e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374157; x=1793978957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PtTDU+sFyuoEKSV5fSXrXN2/wKIkgZT4/lUrVaySDXw=;
 b=oXD/4MNwoghL7mDMY6eNDiXUHwZbM5x1mKKmNxPYNGmcVnZnG5JkuzIeZW65TJdOw4
 aMNoJSHq+B+vInMxuer4uK61dmSDhlgS9dKSf5qCIKeZq6Fr40C3xiozFdLRmPRFfzCp
 IQE74h1iFj4NsoL40nAuo2KFSIfmZ+y0/BBzpndCb0mzIG166HfWvF8ur1ruadiAmkve
 /PeCNJEc3SJQTNLODQ1tj1dy0hitIkBQlMcuvd9ohfgqFulr9F1i23OgHAucBSNV5Xx/
 RoK87/SmIyqwkskLldhe/rgau4kGDf7gK6glld2ErSVu5AgKEDE9FfSc4jf6X80cUu0X
 9zmA==
X-Gm-Message-State: AFq9FYLSYDoWyI9+59BVYZ/1DYC7Tj95bwtD5hBh3u836TVLoblT4oaN
 BwxIBRSgm7CqBjEUBKd3Jn3iFkOsN1LbSfUcap5o1jwUfBYhDYUR4Zl95iZOyvj2ZmouY5pC1GX
 tNHhKQ28=
X-Gm-Gg: AYBFou1tGCDq55qFu2kWk0LNqRsX8MD/iy3usyOk77AgAQe2YjfxBCNr0FocasflU66
 jr9Elsn8r7vlaosv5ZfyyferKY22x+lP09c7Rp/CNWNetQTWieXCfnunH0HLLptsgdcdbChGPfz
 3FhrsVYi6JpMlBKnpLgy84n5zHQMcYC4XL0l2zUcbH2cZIsLT4coyC4yCoYbyyNZXh1atYZ+eYs
 tFI18d6WQiv/UyNkdauY7Pp3AN5ffQ7MauxGOQZs6Lwx+uQF576ha/Kav2Y26eJQjvn7srjrySV
 DlsHuoX0Z12TOVi+bDyc4JN9u9ZGyxWZ6B7/pTEneBMsUb4zTzu2amRx/hT+zHxNGOdBl1fmQct
 djiYkeQa7PUuakV3j29GhRr7UlDtOcddd4in+/+wY5YCFEtUPqH/vVLJQRnL0nE1lKIRJE7WW18
 867hhATVWEQV5WLClJ2ELUkGF2uVyrWPn8W8O3WnyLxJGLzLSLFQuz3Xh4NdtYusjGAbHLCLOVf
 L2nSTvCwh90+OBPkDD4KqAjwTJD50hc5MlKB4C1XBXaV1PPV9uOUMvC7P9a6VjVA5rlO0NrHRZq
 vSy6Ay34Uaegv83+GdTkvOuOkk/xxpYJFVBoypQS7pTm/t/m9rJwDRF+rBDaUXvTyf39ERoGlnM
 ZBEPr7kYLiwYPfM72kA==
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id
 5b1f17b1804b1-4ac17d16afbmr59388945e9.8.1793374156452; 
 Fri, 30 Oct 2026 08:29:16 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abe7700c3bsm67011935e9.0.2026.10.30.08.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:16 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:13 +0100
Message-ID: <20261030152915.1907804-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023225751.2614512-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/avrdude: fix readline
 dependency
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> avrdude automatically detects and links against readline when it finds
> libreadline in the sysroot (find_library(HAVE_LIBREADLINE ...) in
> CMakeLists.txt; AC_CHECK_LIB([readline], [readline]) with the former
> autotools build system), and there is no option to disable it.
> 
> Buildroot never declared this dependency, so the result depended on
> whether readline happened to be built before avrdude. Even worse, some
> external toolchains (e.g. the Bootlin ones) ship libreadline in their
> sysroot. In that case avrdude ends up linked against it without
> BR2_PACKAGE_READLINE being enabled:
> 
>   $ readelf -d target/usr/bin/avrdude | grep readline
>    0x0000000000000001 (NEEDED)    Shared library: [libreadline.so.8]
> 
> but libreadline is not installed to the target, so avrdude fails to
> run.
> 
> Add readline to the dependencies when it is enabled, and otherwise
> pass -DHAVE_LIBREADLINE=OFF, so that find_library() skips the search
> and readline support is disabled.
> 
> This issue has been present since commit dc776f0d0546 ("avrdude: new
> package"), as avrdude has always detected readline automatically. It
> therefore affects 2014.02 and later, including all maintained
> branches.
> 
> Fixes: dc776f0d0546900b22d1552f3e522be2080016c6 ("avrdude: new package")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - rebased on master (avrdude 8.3)
>   - sent as a series together with the libserialport fix
> 
>  package/avrdude/avrdude.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 5708fe2017..476f031c99 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -29,4 +29,10 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
>  AVRDUDE_DEPENDENCIES += hidapi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +AVRDUDE_DEPENDENCIES += readline
> +else
> +AVRDUDE_CONF_OPTS += -DHAVE_LIBREADLINE=OFF
> +endif
> +
>  $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
