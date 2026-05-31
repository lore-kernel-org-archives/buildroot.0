Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1ACCD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F3D60EA7;
	Sun, 31 May 2026 17:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjQRPyGk1ITj; Sun, 31 May 2026 17:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1507760E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249175;
	bh=naLB40uq00DRl3yWmULX7Qh5yE6Kj6pXB8b8wveY2g4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B0o7W1MLRST0FGQQIKxsy6oJ4kBaueHIYehV7xfPgnW3+uKsnhC0F425b/D6qY9ee
	 38dIoGKjyxCTSPMZ/F9j/UzO2Ne71k/ChJs5w98wSAJ9S9BB8Z74DngVZoV1F+aeLq
	 Euk0CsfGmN3HIcDLqk2mi9yIWSl0PfITeXJKkysPy0+2AVArWZg71RptOSjmvBg6Jr
	 SO7nPkA540+OAd2H8smB1MDtxBAo/uGZtWWttTdHbhribmYuqqjSLHlMGWTSwjaQjW
	 j/m/15Ccb8Bc1ubWLGHiJvatsKVZlN06ZLXK8WJ+hkguXjpN58fdP9KFIiDUQWkSYy
	 pT5Zv2hfCVI8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1507760E98;
	Sun, 31 May 2026 17:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8006F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 996BC40232
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx3BFbjTvleT for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEFA1401E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEFA1401E9
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEFA1401E9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 012861A3774
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BBA5F60230;
 Sun, 31 May 2026 17:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C22910888CC7; 
 Sun, 31 May 2026 19:39:28 +0200 (CEST)
Date: Sun, 31 May 2026 19:39:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ahxyO-iz69-Qi7ym@windsurf>
References: <20260531171447.1675303-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531171447.1675303-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780249169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=zr4Wx1pZ6D+UBh+UAiuZEDlfDwAwc5n3+j6O+8S73vQ=;
 b=CR6jAZCaWxh6nm6CLUUA3HLiH+qDT4VJa6pdQNbqfdZDtjfKvnGEKIaPbRQcyZiwVFFd2g
 QgtoKfdDsnoeb0dRj0uqKgcH8EmgEQE2kqsDpVlIxrefufbxGe4c0GIui9jwM+XQlFQhwr
 RwmT62zUBBv8oaJ7lx1b2lfeP0E0x1C/GfeV0TW1h21nzVuAJjv0RxxV7G5rBiJTtedZ4H
 8jMmoR/DYRw9C2FpaQAbIt3MBAy4pWzu9wgXjIyVPoGAaQErBZHfEODzTZ0z/SnJ98gFs6
 wuxZTqIY0FIP+kln95gaY275XgjajiFN7UTGG/+cA+jjkmge2wKglxD9q4N17g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=CR6jAZCa
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: needs C++
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

On Sun, May 31, 2026 at 07:14:47PM +0200, Bernd Kuhls wrote:
> Buildroot commit 2e6b2b82d5301977cf2f59adfd633d8774830f69 bumped the
> package to version 15.0.0 but forgot to add a dependency to C++ which is
> needed due to upstream commit
> https://gitlab.freedesktop.org/wayland/weston/-/commit/bdfe7a3e588c26a5b3eca0636a2353de2af24ff6
> which was first included in this release.
> 
> Fixes:
> https://autobuild.buildroot.net/results/297/2971e8cd37224f08e5a9932cb62d2fdde0c397d1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
