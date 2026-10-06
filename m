Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EFDCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569D680E6B;
	Tue,  6 Oct 2026 16:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOArjClY9PgF; Tue,  6 Oct 2026 16:32:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 590D080935
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304334;
	b=V8Q7UqRk2pKhKvKTAWFT7SFNfKfD7GFeL8qVyoXtKc+dOCDOTW3YduvcsHWbvCZxVIWS
	 GwAKXPe9j3DBhIgqMgn8zpDbr3d/F8wGfiFu1TdaCenUoFeJuIUN18HhYNoe5vyUHn8ot
	 4eMdbLTyd7/UjtF4HX2P1rcQQQIBZuSDNho77QL8tdTnCRdUrWc8Z09OTT0T9xP3WBvug
	 Lk7iqpe6tgPAo8IkxIkXl++LWtp+y9zZVSvOYSxiW4BAyC/7KWMvSHZXgBREzeTZoSQvc
	 xnZWl+FLWu0WyvIe3fMNOzRdFoLpuXXmw8hzQrRYx3qtlZthULoqXqGUX66F5vbYv4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304334;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	b=IHVUEmHtaycBowhnW4z3htVF7ES2MCsEkUitpKDbjoa7wQE1BKjTFcL6+IC1yqblm9zz
	 MheZXIgQP5uqP+A3mwchSkJ7tNi73a0Z1GYGaxifYqLr36/bXv/Yvhlm92iieQqxFHs55
	 DeW5neme70kpjsgER4NrOzZ4DDADHDh6H51YzfA4W23TY6rnoKJUA3diknlXg7NxrjYRc
	 tDA08IpQ5Oxu0hiIXzhJeQAPBpON28hn6OVvJW2DSr3o6NiUFSOkQoLYPh5I9IFs25Q9j
	 WRgVuw8c+03SMOA+UbWs60niRvAxooSmV8jVcogfF0x9QYN/GJJLDO0hGyDF2iozwHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304334;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dU25ivnjfeVMBprCR5uji74SBeuK/l3GoOnt0tGIW3Uz/UAfbZVG8T5Sewbm2x5+7
	 pOmwRODOpC4HycXremXp4QqpAJOYhfGn8X2nXZibP5DZrABvTYCJQNeI2gsNnTwmUQ
	 FyWuM17ryunFb1WQrktV9YQyTFbJQQ/K/fsF7+qxdhPFIk9vyMt/sauWokAvDydTNP
	 7QkZ8cM+vExzedLvdUefXy5v49MpKpwZcCTGoPXY12ESE5od1YbA3GMPCeAI04bjiy
	 NkWoQMvPyCFviEWlFJubLET+rORmlVmaliv2GjOX2aElM+cW+1AvbUWQ+ayFJjnXRT
	 sZ4GVsSPco6Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590D080935;
	Tue,  6 Oct 2026 16:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C37371D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C12DD606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LerBjoysjzCF for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:30:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6AC29606BF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304204;
 b=Oauk18XdJzI82711R+v+7arJ+ZHAHKHnEKWuXkx8oWpAvy3rbSkUruu9idwDTLiRmFwi
 SwNZl4bGkD3u6JmwuLLx7ghjcN1+yGwtEYSjQnYAdmy3V7t/MBMmIs2iMOgcHsFJUjgox
 wboG+qsBNL9VQGDVmUdSkRm5cmZ5d06IgFZ/5exUyB9ondSRG7KgI9AxRLkjG/gPZXX55
 udIZ0kDddblK9fRv/8mkbnPDjoAMueOU8EYJTZYxazQRrWAjj0rwg/lPNJ4tGLdaa3WnS
 E+cUqN5NWN2j8Xsa8WkzAjmU9OEzPXUaGtRYSaz6sUsNWJSn8nfdfNHqEYPkLFUxvHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304204;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=396Yd0cDXtHL5UJquEEANIDjZ5YaL973TXF94IgAf08=;
 b=JJrlqomn9xxdQYBT4z0d6y2Rm2L6yuk7+dUMQRfemY5hA9XUvjJ7Pz+oCf0kmHVk9Pcf
 T7v7xr/CegUtgLmI+qUDjxWsrPaDs1SkJQWuUOSzrS4UH9GF/zgVEjDCF0U1H/JlBBtsJ
 PtqUpJyjr4I2WSRJzBFYF35qSnH3PUuacYwtalFsMgDc49Snmmu//ocZYemPg9I/cFmDJ
 AGTfaqO9iogawAZba7K7Wi75Zr+tefY7jcuR4aJknZefcc/A6Ra2pX7c6Px+ZqVi4/A1r
 nm7CLFflpYE2u+hE9CJstUoL9leoc3skrwJOO5SBcWYWKze/Fe/yHl5MXXKBgr5FaMw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YXjbN6MC; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AC29606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 933C3780509;
 Tue,  6 Oct 2026 18:30:00 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:30:00 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:30:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004201853.915471-6-james.hilliard1@gmail.com>
References: <20261004201853.915471-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b4134b0d181a1f9a592ab33fadbe8024@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 2026.9.1
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

On 04/10/2026 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
