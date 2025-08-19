Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA6FCA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E3540C1C;
	Tue, 19 Aug 2025 15:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ4BmmPyGfZX; Tue, 19 Aug 2025 15:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F37A40C12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F37A40C12;
	Tue, 19 Aug 2025 15:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC41DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E599160A3A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXsGcKVuhOuN for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60A92608C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60A92608C5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60A92608C5
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:14:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0E7C9780371;
 Tue, 19 Aug 2025 17:14:34 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 17:14:34 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 17:14:34 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250819035930.3666816-1-daniel.crowe@maxmine.com.au>
References: <20250819035930.3666816-1-daniel.crowe@maxmine.com.au>
User-Agent: Webmail Free/1.6.11
Message-ID: <14d7cbffd26545d38d2d4bd79a25bc68@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755616477;
 bh=d5JBvX4O/qyb9FdgmxMQd3GWaOPH90B41/Au3AX0jz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ov+c/BVgmhsYtaBWhBCOhIjEa6DlPMUpFOdc9scG4bdyEavkjbg+sRXBz63mIRTSA
 OPVFf/tbf73tHPn39BvCY3cGDjIEpC/hHUAsTrVZt1URmlFqlxqZxJ+KU7ki+fRbJV
 /da6kuysKbgkQPxSvqjQJ+pbi0IDneXqxaiZK9/RcHR8WhUEbS3bQRmKHxHS+ItvNj
 CnT6ratiFB9QawWIlhmmtddyACDOx+AI8rt2lAU3hrwtBJGoS9rWVS10hCmkhycS6h
 cryl8feH4vyKeDoeUZuSAbA7x0Ezb5nqCzpWMi4pJkeZmrhkRxhj3lDDhVInG7OGMP
 PL2mJpoTGibYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ov+c/BVg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyproj: bump package to
 3.7.2
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

On 19/08/2025 05:59, Daniel Crowe wrote:
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
