Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ABDC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B82D81324;
	Fri, 18 Sep 2026 19:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZLrGysV5YxY; Fri, 18 Sep 2026 19:36:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6616E81325
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760206;
	b=jhaIbBgm6zXbT6lZvCmyrW3LgEFAgd0s4ABPE+vo0fCGNG8nTxeiAbXIUf+O9BB+BRPV
	 HvNrkETLxpKSP2diPUCuA534Ygbo5D71vZIgDzMYU30St5/a0TbJWwfvUYwrIvmDas8Xa
	 c8ts70FsAGmMsBAqyU2jZre89XNewPE807/PWRlQ7P1KcgU19UsSGXfhNk1KYawfoQAuM
	 yE0jmrPfK+bn6JpctJpNqGpFp94RwBZLmJ/7XL2vfM8ohgaNOP+EBQq82fFCLk3x6NCFM
	 sNJXeiS8gnRJOywAGQpvum5leLCoKzR+u8f810KuOU3QVvpAHGkLjoYwnVCWnikbxXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760206;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wAWo0TPT05tfcW+sW1Y2mVcBZ4GPFOlL+Cf6anUct24=;
	b=gluFfrJY5xyNVG3rgB835O9LcOv5Uivls9oGF7b5WYOdCa68oEY60VZrrcd/93pi6o7I
	 ucxSPxFr0aCHR+jZLJ0D/xw3lHVkh7aBSWDID0Tet4utnWwBDEyEr3PkVXpBBbOidyEK+
	 ASb+T+YmJazlZdXXMgnp3uTuhjUC+bYFuQ8VW8auS2MWAdOBajUUXxCbi/onPrhVF8qCw
	 N8sxH8O+660tdFkYQL0oxjoeHXS7aYpiYo8ZCKHd54oxOEoicmNy3KStwrx7BOeKHDJiz
	 1b/v4wTvtcfbjzZWWVLkAjc3p0OnhuXGyAlg4BnhDnoXEO0He5l39ZKybWJOhmG9fuw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760206;
	bh=wAWo0TPT05tfcW+sW1Y2mVcBZ4GPFOlL+Cf6anUct24=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kEOBvA32uJPjQdAkH/2gMXURzxq/8X1VcG/KA9QawMTduPig4U1jZECYuSYCaglAi
	 mr0KxwzfaR0IJ6p5Fw7MOwhjqjTyhFuqQRPOfzQEeMPvwvZtXT+KXT/HSAih8wzwij
	 H1CJAzGkf5HphtXZR4SI/RAsP4WoetxS0yt3d4Z4HJhz30//iRLnp3EfjKa9gubnAK
	 GQ8pumkCwr4duPpJvc5T6tm8R7OJ2suCLRPLe67VJwcIeqHt8n8lJCKuALTUp5jQIa
	 ks9cKdnvsYLAg8HbisSuCX7ZG3mQsIlsVFt4EpgJACsKQZECA5a3CHyYBOzFo22IEt
	 eOXCcQErCRK6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6616E81325;
	Fri, 18 Sep 2026 19:36:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B08F713D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9633F60E16
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bND4L66JiJhu for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:36:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F404D60E0B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760204;
 b=M5P5tqBn3nwZ/zmlE8DqeAEoYSZWwd9Pr13iGJ5YKDR0lmprYBc3mtNeoqHaUhkwH4a2
 icDwy8hBJuz0uYsGlLx0YLI88OVpU3mrv9qDJJzqZhM1MxbKE58TTCJGFoxFhhn/lPax5
 no7IfcMU5BNwrF5vyDVJagBwh+oZrzIN1AnJyJPKuBfRFWA2ACixYO/LFqpK/r1Vs2H+T
 Bmwd/Oh+cPDpY0VXFqL2a0hUmxQP1l7P+f4kIgwQynQ/WBxK4yreDbPsWAkd/WJfno6Z4
 XYuC068VCu3kRPjVCLSK4gJAzwxOYmb/R9AaJtoP7HzLu48Kf8+nbSJmtCbg58KqyNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760204;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Kr9P0cBM8pDR8/brqoCTxOjjIiMxMf9k5CRlWicGlVU=;
 b=OvimkNsrXAqeScXcXTvzzbHzB2l7iUfStnFz674ZFl89bEBeTVGvUmz7wWqtmZK5cPgn
 zG+YIote7K7Sv6c5jUD09WWB68HrgVP9YzM5zU648tY13Yz6ij4oE6z3PRda2esBMtVa5
 W1X5gfoSAgQst1tw1Z5KpD4loOkxNp0OWM3Zn5kPTTZsbA2uoO1SO/ZgcoT5JFhvPHr/H
 FakZfWhIhvn8fLnEjcw77InkEw156V4iwNJyppeGcQlEZeozbcbrP3vwCCy/LQYPns7/c
 xAU57vGUcR/F/0AViDF/W98Blc76i9CoC+QJO2VjkQKaidpISEraonBPHBSdzbzli1A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GfPmSWxk; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F404D60E0B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:36:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 60A5C60179;
 Fri, 18 Sep 2026 21:36:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:36:38 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:36:38 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
In-Reply-To: <20260915214105.2026512-1-thomas.petazzoni@bootlin.com>
References: <20260915214105.2026512-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <0f1afc663ca6385d86b24c53de3a8d2a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/opencv4: update gcc version
 dependency related to protobuf
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

On 15/09/2026 23:41, Thomas Petazzoni via buildroot wrote:
> Another instance of libaseil-cpp requiring gcc >= 10, which means
> protobuf needs >= 10, and that wasn't propagated to all reverse
> dependencies of protobuf, in this commit: opencv4.
> 
> Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c 
> ("package/libabseil-cpp: bump to version 20260817.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
