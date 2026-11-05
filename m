Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12602606D804
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D4RF3UH8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57AD14087D;
	Thu,  5 Nov 2026 19:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwRQmbKS-TAl; Thu,  5 Nov 2026 19:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 022824080B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793905751;
	b=sApIRBTgEs2RxDrBESBJp6XNX1MRbQVt7NPxC/qJcGlE/VxIZ3hkWGwdtyDYBlYoUuHP
	 Dag4CsZ2nzSkPY1jIK1v0z8oD4Q8UdqRyaymf2gCjnyRCPTFuYzQND00mXtfItdKRN8Vj
	 dRhI8TqMrksCXZLHHJiYAJYSUGBGfyuAljsKEKT8acl5hyHt413aWXlhiTPTaP35GYcGH
	 1ZSe//VIGyhEYL75/BI+di5dSUsqCYRPUpZlhuRgzclieQ17aDhq3GubSfVKKPQzNoJg+
	 ouGFTVv/femHaxEXW7CjiTnCPn9Ht6rJva5MRcvsJLAJOb3/ofGyaTjsSKQ0GDNn2YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793905751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=LKhc0+DauJe76iFsf1eR3RUxRdiUTA55JAaatqu9DMM=;
	b=bEnmnqLwh0AHAxAH+aSIH7+IVkdqfVO3UzhNnT9jEFO/wAz/HxfvUSlklPDVZFeIuk7y
	 9KCTXjAIzvNlR950wv3ztd2rcoXRsXJAgXO4FeHC03/aGKlZAyO9DOkBgXgmbz79uuXyO
	 Y06jq5z4fd01Zr6zMqcyuF5lJc++cBNSBNHKbIJvD60pcV5UPPRZiBHZc5nxwd+WxzKfX
	 ggK0HC+EquIfeTCJ05QgNYtFn8/LkCMjcSl8j9CZioi97AuFuVTR5hEEJU+GR+2CENjVp
	 ZBTNMI2SOdWg1EmWHKtdaOhpN00bIoWBbUC5vfXau8B/0UpvcGiwsz/NCQWsrW6GlKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793905751;
	bh=LKhc0+DauJe76iFsf1eR3RUxRdiUTA55JAaatqu9DMM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4RF3UH8rot4LEOpSyNiOJd+chojSv7KsCFgZyML8M3Q8YSNmSeZ9zQ+eXxTKubYx
	 HvYgwCfXUTlwCGiCHAteGNM+w13psGciMTvsZXAtRFzvaOJaj4mPPFTgXY8hooCO8L
	 c2cqDqQVPWy97j8TO1m+y7IxckqazqWeX4JK1CfvxeZn8qBUgGcCXlTfg402/qDYhu
	 Linm4vb79/RULc/V6cJmpr32A3871fIs7mEqJbi+YbqnEAQ9bGJpfPHClhnEt8V8Qy
	 4ozVKEnu2qP2klWpxBWZJdCMQBD8bJvVh7Cg+jwG40c9rTPob7gemd7DiPa1n8F6Ew
	 Tlc+HGrnS2UOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022824080B;
	Thu,  5 Nov 2026 19:09:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8CE1B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAB3460884
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27yut72CppQp for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 053DC60808
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 053DC60808
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:09:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9B9BB60129;
 Thu,  5 Nov 2026 20:09:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 20:09:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 20:09:01 +0100
To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>
In-Reply-To: <20261105-ti-k3-r5-loader-bump-v1-1-ff5486ac1748@ti.com>
References: <20261105-ti-k3-r5-loader-bump-v1-1-ff5486ac1748@ti.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <e7c172bd239ec3be3dd9af94ffd7bdf3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: bump to version
 2026.10
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

On 05/11/2026 15:19, Bryan Brattlof via buildroot wrote:
> Release announcement:
>    
> https://lists.u-boot-project.org/pipermail/u-boot/2026-October/634075.html
> 
> Exactly like with commit 747aa911f6a4 ("boot/uboot: bump to version
> 2026.10") all release artifacts for U-Boot have been migrated to the 
> new
> gitlab instance at git.u-boot-project.org, so we also need to update 
> the
> TI_K3_R5_LOADER_SITE to point to the new location.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
