Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75BE606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VtmwOSCp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB5F60814;
	Tue, 24 Nov 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjR9FbQR2iEv; Tue, 24 Nov 2026 12:37:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6F357606F6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795523851;
	b=mGQPWehTJsgj1iH+xrSGJTXB8bA1PxQBU+9rySDkpQbhpuvaN/oYKvcJvrWbHBguOdB3
	 G+SMBbA5faz8eIYmNm0SnQ1de4qYJk0sfUwR+kZt1BhjonkHvObJDc21SH6cPJk9GNl3k
	 VWQfuXsQR0+iviRDcjKEvNXu3gkynJfp6MfkRJZB2/zsG5CpFaQ9nVQXtb0lQeu87UQH3
	 oNRXQJdyzdS9NgDsNLIBTcT0/8O0NPZPn+JVKkyrzbjfJ4CHtFd8MFSxZen6QWFAoSzNT
	 z4cv2WYxjcDJK1FU5dBmTrKP2zjpGSr/aeXEbGQZn2ktwBgHcTydacNEw9RCqm95x1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795523851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=k9tFZEVI8MHm4Q1PQOubl+/yq3S3A0f6oyF8tqXzfs0=;
	b=EKMlVyvJcZn2T+CGWTSMhvqwjA21Qf2lAuSaoGWokzA0iQ7EXxhhWWzQ2LFcLFzsF3U+
	 pNXVAklsL5UZVqw2Bt4kiByaXqOnq87wV0Ggzxlx2EcPvj3XTi+zDOyPDUXsmhjkxehw+
	 Np9zBC22hY6dbOsVS1KQ757dgvQ+c5V+H1+PRz9TF6b/Zando4sBlP1ZGgD+0nws8XYAr
	 hOIL85IlUor9mDkWpId5jhEOdq2tcYZBahexJAZEAc4xbHn2NMfNatAdbBVdT5iIEOXrD
	 WkBiwwqEodn5le+EDAccv+AdXq8RWcDyr0DQ992FI2ncryteguhBeF1cJdNF5Vc/h7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795523851;
	bh=k9tFZEVI8MHm4Q1PQOubl+/yq3S3A0f6oyF8tqXzfs0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VtmwOSCp6ebtB8jNW03KZpPDOU8gJVJVtT5E0fFYv0KHeYyDzGk5hObjNnoW0KaZv
	 IeLx7yl/yVkfssIpicS6986ZcF29oNz/+xi2Tnk5KJ526kTPwaigRDCGi8kziPMjVp
	 9E0bIv2Ad0gDpirp07D0hg8KIazXYrep7tpNXl3fRgxF0yN0QPz5Q3fnGF+Gbn6Ufm
	 FLJleUIvH8PTbjq6UmgC8CIu7CnxaSl4JTp2sayRTmWoaR4pRrDTt6DQ9Q8ofcAC0r
	 I2DnL/UcqCr0Zqof+NhXg3aZMmi77elBythDi29gXC8SrY5whneB2kbAKF/eM+7dnG
	 QKaPdsrQYy1FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F357606F6;
	Tue, 24 Nov 2026 12:37:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E6379D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BFD6402EC
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEq3Zr6j1kXy for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:37:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BE9DB400AC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE9DB400AC
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:37:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AE3E71A17B9;
 Tue, 24 Nov 2026 12:37:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7BC39601E1;
 Tue, 24 Nov 2026 12:37:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6379911E6901E; Tue, 24 Nov 2026 13:37:21 +0100 (CET)
Date: Tue, 24 Nov 2026 13:37:20 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <awWE1RgnB26pEf9I@windsurf>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/9] package/flutter-engine: never build the
 GLFW shell
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 01:04:35PM +0100, Adam Duskett wrote:
> When BR2_PACKAGE_LIBGLFW is enabled, --build-glfw-shell is passed to
> flutter/tools/gn. On Linux, the GLFW shell adds the
> //flutter/shell/platform/linux/config:x11 config, which is removed by
> 0002-remove-explicit-x11-dependency.patch. When the desktop embeddings
> are also enabled (i.e. with libgtk3), gn then fails:
> 
>   ERROR Unresolved dependencies.
>   //flutter/shell/platform/glfw:flutter_glfw(//build/toolchain/custom:custom)
>     needs //flutter/shell/platform/linux/config:x11(//build/toolchain/custom:custom)
> 
> The GLFW shell is just an example desktop embedder which isn't installed
> by the flutter package.
> 
> Always pass --no-build-glfw-shell and drop the optional libglfw dependency.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Should we assume this commit:

Fixes: 827da2242cf6ad34941ea911e224738bc8633b20 ("package/flutter-engine: new package")

 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
