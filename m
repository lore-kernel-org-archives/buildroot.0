Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD3606A31E
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rowtkd44
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525BA607BB;
	Thu, 22 Oct 2026 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YonfG4-FTdl; Thu, 22 Oct 2026 18:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 977F5606A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792693515;
	b=O2yMBuOZgGInhPqXLKLPCoVECIOCQwa0EzrEwij7SGObtyxUB1Ujfr7bHMXhGignub7q
	 QnqwAy15fLUoLZ/eq4/RPL8idZ8fYo0fjNIDSyesU/M5MCCwpFEpq+6kOaEV1aCXYeAUA
	 MujGyKDZlOe57wBMBeKulwPYgIRVEZPfUwTpRaUO8MqzPMUQSWoJ2bFE0FKzT2hoIK5aw
	 394eD8sEf79A69UzPaNYU0+cGTbJOXZ2TaS22eh8J2pHO5RP+Zw0oBoBtfQ3vmh6cGgdB
	 BWiZAJjpcKJJ0OwxZG9xLjURynSGMETi/9zFXu/iIu62ypfuJBpi6ZOC/AZZma586FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792693515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=th2OqMMbg5sgwszE68JqxmFjoNy8WGcu/W+EpFlddFM=;
	b=sqakeEOPuhck6CjlDJisWcBX9H0F1BbIe5emn72Yf3Eb31Yx9H+qsSzancJdOYiWKS+I
	 icHQVFOj6R0BTeSb67JubCC15IEf9yVce7ktNxza8hbOuIGBE/5+kEfY/ew05+oCPm5f0
	 KwUswtjdRaGNXQToqI3WGA/oc2BCcYb44DNbL2kmNrQqVzx19/LbWFoDYzY/mhhXY8Ty+
	 303KYNrV4V2iW2p6jTgIOd8zIn1X/OnJMdf1Zr5FSYQyXD9yuZyNSeNzTh1rOv4a77T5q
	 1EPv3fhCQ6HIVPQlYpA6qKSBUvBDf7HiqA2RQ7d5G4RlpuhEk4wuXAI+0e+n604HoHA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=fail header.from=kuhls.net;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792693515;
	bh=th2OqMMbg5sgwszE68JqxmFjoNy8WGcu/W+EpFlddFM=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rowtkd44d6mcG93P8mPXV6Qkvw0Q8BfjZAQ4OTSuulVviay1qgLeodBBoe0hfD3sC
	 UQ6HMIRybIwZ9Kra1hCFoRoCFQ6oWqdMs0gFsbImAYuZ9gLqpczzcTmUIUIqgdqLCw
	 kUB3uMaqrQMurWxiyL+QMSUa7Yg8S8Fl8yax1Oitu0VLPcy5jRymSU6MR3eATwnUio
	 1EGW6hqsDPBqC8EkfreoJuGIfrPrcYRiyy/MoWUV06G34pFH4G9zir4GKns0o/F/0y
	 ME4nGDlbp+i9eLip58cqAWmN0UQ30ExBLKFF4m4vNo4zUHcu6jXHiDNLGVsDUxBF5p
	 +2E6fHPBGljYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977F5606A5;
	Thu, 22 Oct 2026 18:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5793A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50DF0606A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73mZN5HOGuqu for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:25:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0055C6066C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792693512;
 b=hyK1JmOfGPR+2rWfwiWgP89/FgWIDmyka/Ac09vpamQ5UD+L5xPgeAqSFoelMMIOehGm
 49V/rAIndzsp4lBgibJ4/upYS3zQG865E1tVv0D4AL3Vq92jPdrMxqUc/8Txmp9Vzwyic
 HpSVlTJHTM94DNf56kDUvwav3AQNYqB1DMF1U6si2xGwYSfIcZEBaSHBdQYvuWknnQHw7
 Fy6EiJVKKOtsQzixB3aQGJb4UgEwGQDG3CE7pQKA42sdiPHgWdUxKqjQRLTmkbpdaagLR
 78j4p1veKfG4VgS7N6z74pAkK97O0GyP4lD1O/A7t5UI1wsnolpJCBX38cQBuwzWqew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792693512;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=BoJgwEBF0eOaWLj6qCo/5SnoneXlnOaLENluLqvM+jI=;
 b=ILA5NiDr/C1BbC7JV3zhij25EcSBQYf9cJdDnoVVQFxUwqZqob3s6GdiRwUWWirezi0A
 e0X5T5e7qeBfnoiA50mSZWBdIUMRIWBN327UZs1kvvDVB3ccjq8ToaYKF4GV3SH2TaXrJ
 fhXwCrOX4Bt1EDDix4+Z2qwGFC5RB1fSB48MiLMpEHa7r99bIo/u4j22wflJBtpzUKRRv
 K/fEv5GMq8lE7FmpG8cNbOBhJ/0tCSy5VEli1uWCChMCrWlJer1QR7VdnFk8LUNM6MSo8
 VmbNk8vdF0Zb8u3Qz6+IC3A595c8DWOaIpScTePEwlRsTKIQaNYqR/dw/p3xCyPNG6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0055C6066C
 for <buildroot@uclibc.org>; Thu, 22 Oct 2026 18:25:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1xJxTQ-0000mh-Me
 for buildroot@uclibc.org; Thu, 22 Oct 2026 20:25:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 22 Oct 2026 20:24:51 +0200
Message-ID: <pan$81eee$f9c76c37$aa369c86$e125e2c3@ID-313208.user.individual.net>
References: <20261022181803.1291476-1-florian.fainelli__18987.6594625943$1792693116$gmane$org@broadcom.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: fix PCI endpoint
 tests build with recent kernels
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Thu, 22 Oct 2026 11:18:03 -0700 schrieb Florian Fainelli via buildroot:

> Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
> tools/testing/selftests/pci_endpoint. The existing build commands still
> use the old location, causing the build to fail with newer kernels.

Hi,

this looks similar to https://patchwork.buildroot.org/project/buildroot/
patch/20260602190501.2038962-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
