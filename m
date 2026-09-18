Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C896AC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FB160BDA;
	Fri, 18 Sep 2026 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3tPcgQRXU5s; Fri, 18 Sep 2026 20:47:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4FD9C60C0E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789764468;
	b=ayMAtd7I+o4/jMMHYmTNxmQS6zlMcW+lkrLQ5zkDodygHyJYLm2SL8CrujSZAFkrXbir
	 2L4fw/Dg3Wgu6wpsY52hr0SYeMLGXlCfGbls7YAYvnEE5+kvwpRd1JMMihWl/n0cL+ecY
	 LpnA9Baxlc8d4AMrFGR4JzYAuo/JiRNKOAP6fDxuSHCrHKzbz2F+giueHLQ1fxgKP+X1r
	 dfNXBNw8LhPeo+9Stl+AGhPJ6s4ep6w3u41yORqSHBFrCaDbwd0Nmko2dwzegwjy+s2X0
	 89NO11bmc4hoAEYbVNEU+G0YFX76FUm1+Tc8bOIhBR5etP5mBBUd89UNbfdzHtVCDcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789764468;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ps4vYVXpfTu7lACE25ZWTK1sNiOReqaJLQnUYBvMG10=;
	b=dVJirJtJU49MtTFvqDc55B+TOtXK/LFjT7PYoSU5SYxfYWA407IYPej1dJv5AunOjFwk
	 R52cZ1EaIOeYJJAsni8liY4ady6hxKsES5lFOSiyLr0EHgXeVejjVHqF577zxjeIhL+eD
	 7LGsxHrwTKDO7DHkkrrH6h6ZvOWPF7wMrS/+rXpxJyZRBAQSCCBp4KuSiD6/9VU8arRUw
	 ZmP3ZZn9D/OtbWbxdiILFwlv8c1oPpyowuWtiQ8XoKEw8g7wzHvkIQm0TlmNSCxXndk7/
	 WM6DNp7Vfk1h7TkuX/IGgXUGQs5ju6bVCD0IN5aqapO+/069Xi9shPqjiOxW4V2s8Og==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789764468;
	bh=Ps4vYVXpfTu7lACE25ZWTK1sNiOReqaJLQnUYBvMG10=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p/UaM9ncb9NKJePzDsmX8pn0Ba+Re81j3JrdpYAZvg0ZQHUpIz63U3xeggLoUY562
	 aT4SiYJw5ZiVkfuUHeL0NExKzK67PjQLydIH5HCRNPLep2/MAc3zj3A8QZ8JXjiXaZ
	 Qort3MGDyTpiU/rMzv/Ry49Wb8kFeaqKg2Ead0JMyMMFv88LKdbK6y4Hi9sQIz+TO6
	 qWpNTq+1kAm21HHlDnhJly8C507S+vVVWWO9FypYgJO3PlJOqMqgp7tMvN9T5Dr+Ds
	 3KRP4dhBr6AAr9AF043dRsib+eJOBJ5UJIKii7KUFtiMFCqHIIrpOuRTTql0Q/Dvfb
	 iH/a/bJrIWt/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD9C60C0E;
	Fri, 18 Sep 2026 20:47:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A48F613D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 960A0812D8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rx1EjdaUKHgM for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 20:47:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 24A52812E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789764465;
 b=dmQvm1oZ/pZCZKF5I21I1oZ8nADaSkvgaadHU8XDkY2A+2G4sdAgVYiFBwtN08rDN/Lz
 twD/FN5lIBnBE4zB6dR3CXTUks8I40jV0Kw9wDNulnVYFNqZ8VXNrve1/7d5fKffT4ai0
 Ha1bzmPJQmQXdTqiL5a9nSUV1yf4ARCdTyC7BFl4JSt9q8yzyNUAsGCWmCUBZwZk6xQJc
 kNwCBshx0rI31riwIGXKEz3HKWIaLF2arxzS8eGLUozn0syjUr+kf2ddYPwNJzOnOXU5c
 WPa/MmKiYxcqjeKE+v4/KEj8FtVo1l+sTg4kcvSZNXsJNnLnPf6pO1aJ0a9MKjcm8RA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789764465;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FhEmr5m6haoi1Y5RZ+ZXfVmcVFv4PMmiGha/v7BwZwE=;
 b=C87SvyS1iaMDQV2kC9P5Wu6JxcQ8Sil444DuRe1n4x7IcXN+wlnOx3i+SRL9ZqlxTCR0
 5KhtAOfI0EbAzikKdYG5q1Ta9jE8IsJqqO2jAjV+LV3zE5XFuyrY1ftQNeGCKN03cTgfw
 WAftrWfS5QqJ95PoDazZZ0Bjlxq38FLVGthGiXjp3IKPrWXfCj11fhGrP96WZUkUtoYcK
 FcjLyqNIRWvQCQi9gcbUbtzrBhkkcPPZoQd3BZ/s/v/o62P/ExQyNNmx8PFV31MyRgoF+
 q8QvW7MNx/P/jbPvCha7HCJk9PgXVepz9Z3BejSJT+6gi1HGUf3yL5rehTCAV8RPTVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tbzRSbEJ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24A52812E5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:47:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E938A4E40885
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:47:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B542260649;
 Fri, 18 Sep 2026 20:47:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1678310329075; 
 Fri, 18 Sep 2026 22:47:35 +0200 (CEST)
Date: Fri, 18 Sep 2026 22:47:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aq2jMX3bJCjX4yz6@windsurf>
References: <20260907120257.2988186-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907120257.2988186-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/xmlstarlet: bump version to
 1.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 07, 2026 at 02:02:57PM +0200, Bernd Kuhls wrote:
> Upstream site switched to Github:
> https://sourceforge.net/p/xmlstar/feature-requests/50/
> 
> Release notes:
> https://github.com/xmlstarlet/xmlstarlet/releases/tag/1.7.0
> 
> Removed patches which are included in this release.
> Instead of patch 0002 a different fix was committed upstream:
> https://github.com/xmlstarlet/xmlstarlet/commit/f300cd048d22ed5291f885346c62779b92c4aca4
> 
> Switched to pkgconf to detect libxml2/libxslt expect for static builds:
> https://github.com/xmlstarlet/xmlstarlet/commit/27063aa63c96541fe6db335aa36e5fa29bc5f0e9

Not your fault, but this makes absolutely no sense. There is no reason
to handle static linking without pkg-config...

> -XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
> +XMLSTARLET_DEPENDENCIES += host-pkgconf libxml2 libxslt \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv)

[...]

> +HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt host-pkgconf

Not related to your change, so I've done a separate commit replacing
those += by = signs.

Thanks for the patch, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
