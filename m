Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224D4C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE45B605E5;
	Sun, 13 Sep 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2sz6w3VJcHR; Sun, 13 Sep 2026 10:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0ACAF60621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789295218;
	b=V5DitTKiAJZ6sSl4sHzz8LJXCa9gn4qnXdNwcWKK8rSiLlHEOWmkOgikP6MrW778dXGo
	 hRj+mtiS5EBznX1u/Fw8w0e6O4FeuS1jSMf5LDNAXD9yWWdO7u5CpjOD9CqZ8AC+MHLZH
	 RApEyBFJK8ise5s547G6FCJGKJRHi+nMql676UC6yL8xIvfIG3lUc8Cc19/4GZeIw9+TB
	 fWdFmMU5z3fqOxZlZUwsQ/duANYESy7D8xgJXFmeebDxH+kpDtos95OHRORZjJ1xCE8jM
	 IFrBnQqSkYxHs/jVQDHHvnX4WgMXsFFFfRZHY1xKHq92gNpWDpKsrc7un/zdgjOuYMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789295218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=pXLANUxsiPAzlJ4Wrsn+csBJ0rziIyXHYEluDVjZ2fc=;
	b=NmqcCJJK7DDMIigGjCIM2PRiT94Q2uefD0ICx3rQLns1snhMhDSC77WNbBBVWigc4i0z
	 qGf+EF4W/8roHtkwLO41Np70M5GvV4nf+grKXZ6dHtld0Ab/lkLqraXjjD7PXWQ/ofsS+
	 9rVCUjnPbL9+TY+CytdyGFcg60GYJdsKD5HdY9kqiJNK+FiP7l7p+inQ1BNYNd3Nl35z4
	 e+y3fSKQjd3p9qXrs23vV6B384hN80aiqDCSNiDGIQZllCbryZas/fnktPYWzPsGKraK4
	 6HxrWzJodYB2MsjoX8SEkHRt1xGnlGRbLGSVcn+i514Yl5GO8LIaRAQxegWHKFgJipA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789295218;
	bh=pXLANUxsiPAzlJ4Wrsn+csBJ0rziIyXHYEluDVjZ2fc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mhAj33QAmZtS65znqB9mtO8sx0WJZmz296rIyFbgdh6PQNhrZAzbL9gNCi+e9oRPd
	 d4suhk+os+zRE4C/3sG9lX0cSB6I7I17meBmsfqVMsRYd72m4k3g0Kr819s3V9+4XW
	 m1I5Gc8SxM3WlMAj4+h/XDhaiKE780T+6ZnRZuL3hErqWsuE9MTLN+moEzy/CkGXLd
	 fxUWJRSM/fmr4WHulRHXWA8thm4uEqOk/6uVl2Cpsbv7Tyw1uI7ELllHU7y2KBvebE
	 5rVYLYoxyXkyRPPaydLErWmAflItGpToutgL863vZlN+Ed+itAr4q6SdY4ctA5JWKF
	 lrHjgydmLKOqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ACAF60621;
	Sun, 13 Sep 2026 10:26:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B2BD32F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0DFA60621
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCjPo23-QhfI for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1A788605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789295215;
 b=L0pCjjViCWfjAIoINuUo/7Fz+Ue7TPglfTFns92Sntb8IKc+opG5Y6ADjqf6yLu9sjBx
 gdudtBnZpOzlJ4F/PCcOMDgkrUOw85uebeZeSTaNuBvxFh/xD/r/FM2nOBV3IKieM4ZtG
 b3u7zgzDyn901+KsSZHKL2trq9ngSXuGHgPHA1OdtTRUtLiKC+2b+j+EJrYyY3QI15WOa
 Kgk/gTdU3anVH7ZZeUNYQmYSrRGM5nkXD4UTlyyty8ZhD8nritb3Z3aDwUCQ93/GEaz7+
 RM8SEZ+P8mulrBwxobKA1+jzsmNbt/wr6xNaIDTpeo0JDMRnEPjV7n7316a8kfOh5Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789295215;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7g7O6FAjc1tj+qA9P+DL9ZHJXRg9YNz3jqMH493TgZ8=;
 b=C8LB4Ovyo+ZLCMEJ+YzKi4lkaa083c2XAe2nAUWFL80yqPvHJv3sJWl1c4g/Zma8qHEu
 +JOgd9p9mfJehVOM/0vWrYNxN7aWWNOH/t18iGqKctu+X8xUUQv0ycfaHeNI5FfW8qUBE
 wXxi3MrYPOF7O+9EVYNmMv+iBmF2V74PeBPOF1FeReCZm0HSteaoP6yr7njat95aGRJc1
 xRlZJ/ov574hdMu5eoeDmiXeKrVH1c5+Kd4QhpreBBzoCtBf8BVq+WLURavaBwRRBSEWu
 s+HkwsK8j6cwyVTK1BqI2dBb9VdQEu2A9EMzNadAZVPkRdNqvOnnbecIgHt4rLVeY3A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MzUfLNPC; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A788605E5
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:26:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CD43913F86E;
 Sun, 13 Sep 2026 12:26:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 12:26:49 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 12:26:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin@orange.com>
In-Reply-To: <20260909111918.3705686-1-bernd@kuhls.net>
References: <20260909111918.3705686-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <87fd68a5f26fb40d188b059e10f5f564@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/skopeo: bump version to 1.24.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/09/2026 13:19, Bernd Kuhls wrote:
> https://github.com/podman-container-tools/skopeo/releases/tag/v1.24.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
