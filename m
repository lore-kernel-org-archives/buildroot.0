Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A55C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8567761008;
	Wed, 26 Jan 2022 22:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0af8Fe1Aa3w; Wed, 26 Jan 2022 22:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38D561002;
	Wed, 26 Jan 2022 22:35:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAD111BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86F34015A
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLBp5urhhZoH for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 950CC40143
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:35:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso739003wmf.1
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=etyeOQbvQKNZVWlMJ7FaMBDyORfrsbznjgIzaIgXSp8=;
 b=DZ0xVgxKgxFmk/qVf8Cr4HCIlIpxrUWx6xXtWqXloB5iaqIDvGVCB9JT5HS3ewjXpR
 erRz2XkQdZd+PX87nsryNcCgKmqIXeYyIWZMfRi5vBFoYB0Y8HhW/hV3ZWLuV26IM28S
 F6O3SvXLjlMOO21Zs7kt4dehHzJ/RoP44yOmn6B6eCP2gIWPqKY1NZZ0l4IjrH0hUFE0
 s2utTFdSM/1Qee6LPoOMMbgOapVLOLpI+EvdezIfT4oOuC6mXVkfGMgPQv+zcFh+Bue/
 3nUrlnEWEQF17k/osbQaEms/cBp6rLExSfthX0LA07oWupSF6FDwEdTD8PCOkzzXYR7u
 JQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=etyeOQbvQKNZVWlMJ7FaMBDyORfrsbznjgIzaIgXSp8=;
 b=hP5f71jr6iLv5tNEfOgQlfWprN04y3iYdzKP9q4wUEsya24c4MCXPJdDasftKThIQP
 7L9HsBd1WZib/rAqjV/9OsOPcCeckm6ei7f2W3Z0Kw9Mf9eK37tD8r5+CkxB5X6o6VGU
 Yj+RvTEAAJzt4Z6ZV2HyJOOfM2bDknsXJjcEYd9C5ZSyvGcmUZOXn33xuF9qnJ/QxrO3
 OLntO8ly0hnOWYD3nZK2A0pqxnSHG83dXrbNzs9CrXwvBL9WqWD6ESDtmemJCKTqi2fy
 kFp7nwa3A894CDfkwpQ8PdYl8lHzk0P1CnKWyC88kAi8SaDX8+/DD6XY8cXBbOQ4h+EO
 4Zzw==
X-Gm-Message-State: AOAM5325OfB0g0NFelWz6OP93ZPoRQnjkU4Q+SjJEji7gd2k6GJrVQUS
 kazX8x98MEALMIqcXGV6mi5ioROdlWABUqsK
X-Google-Smtp-Source: ABdhPJxuSVPgTyFErxoCYquCMMllNYrexVk5IhU0EvdSRoFvCcIu08YIJd3xGoU5GJtbBDbMTTVa5g==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr710289wmq.129.1643236522804; 
 Wed, 26 Jan 2022 14:35:22 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id n14sm523134wri.75.2022.01.26.14.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 14:35:22 -0800 (PST)
Date: Wed, 26 Jan 2022 23:35:20 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <YfHMqDVHD1nwpTiG@pevik>
References: <Ye9BMW0NhkDBKOCL@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ye9BMW0NhkDBKOCL@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.40
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
