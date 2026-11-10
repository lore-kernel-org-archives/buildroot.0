Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE84606A321
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JWssJauV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E47460A65;
	Tue, 10 Nov 2026 18:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-cdF8fTkWWi; Tue, 10 Nov 2026 18:33:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 528DE60899
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794335621;
	b=IvmsrUaq7bF0QT7LrDL10ptK5TmA3zHGr5v4CtxJgo9xhdXZ6+hlvUmpgzHQXTi21Pe1
	 d8QDeeYaiee7H+En+Vs+gnoAbsS6OTWHEJ9+q/H4z8kFCFqGnqfXogsHU6ast31qavzJT
	 alEe2RfcG6znQaoIffboWnCouZ3Sn3UEjrJtWHldCxfwOPI6KWWW7UikYHakOnZp0vCu1
	 A9vq7jZi1DQpDAoq9WOJBUzjZ4w41/FiERQqY0KqCLYUmZefw56uyHqd6EKnFDl32GBM1
	 QpRlrM2D1lv2DfwLwpvgMVyTb/05HWlLRFGVOFJY+WBdJ2Pzju8ZVd4sjeDMAGSfFsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794335621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=yGurVRfYgWIQdq+ySiNdH8iKrv0DbW11rAgOuZw5+ZY=;
	b=Q13igyvl3kQWtGdBHhMUJZZvuajLzwk7SFbTMP8T86tZY1rH7NAgqfvaYTJpuswmOarZ
	 Ai7fgcIBeOQ8JsZpFdfVVC4Zeb/jBn5qn4DXYVi36oJBrUpGVpjRumawFABSC24e1MYSh
	 F5Q7YHY4hGOVKrf/NFjxBUa8uVqOcish+LhZnwoxDCfqAfeMcmKjthXm4vm4qlH0kq/Kt
	 3No/rKD4tIheZsHgBg5l8QXZnDctxQPb6VllCZGv/73DW3xMvHY595vWQQtGSbJwT1+UY
	 XnBljwpaeZp5H82SRMd+xidyYOWesL9y8oNoHEd6EdSVmNddZ1Q5XDxbfTjsugb6nMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794335621;
	bh=yGurVRfYgWIQdq+ySiNdH8iKrv0DbW11rAgOuZw5+ZY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JWssJauV3h2/KMOER61NNYDcDqwcbqiTaX3RiY0SqeYimR7RzDvlR2+lP5vyVVj8L
	 t4DbdDl/h9twPFA1NfxnwATuXpLGPUR/O8u2obsW6MW4EC8EkK4RO8UxJ8zazmKR8m
	 BLokp/RW8PRbaZllqRY4Htt9Q12HO8Z+prOPRVNZFXPbpFtLo+/+fE407o6IVKYGpT
	 cW6qlqc0xc9wNHnY2eLr0JDKfNgkvuIJFla+J0zgR2MtGSx/166rObxeD0rNZk6VjP
	 BVkJbUakHuxiPCF92rMp4b5fn9fBaRc/RLAq7cN1nsoEfBCjDC+9QBqZWDPJDkgoZE
	 SGcQJ1FYC82sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 528DE60899;
	Tue, 10 Nov 2026 18:33:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E8D731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 18:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B7B60874
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 18:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfaUCqpbVQxi for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 18:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A05960634
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A05960634
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 18:33:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C35C55FFB7;
 Tue, 10 Nov 2026 19:33:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Tue, 10 Nov 2026 19:33:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 19:33:33 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261110165837.3684633-1-aperez@igalia.com>
References: <20261110165837.3684633-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <3b9b67f9f0f0224b0ab9f2f13dc5a083@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/xdg-dbus-proxy: security bump to
 version 0.1.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 17:58, Adrian Perez de Castro wrote:
> This release solves vulnerabilities that resulted in bypassing message
> filtering. Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.9
> 
> Fixes:
> 
>   
> https://github.com/flatpak/xdg-dbus-proxy/security/advisories/GHSA-2cgv-pwcq-wvpq
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
