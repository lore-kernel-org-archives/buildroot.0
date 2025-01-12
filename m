Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7880E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BA660725;
	Sun, 12 Jan 2025 11:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_JdsNg5QAlE; Sun, 12 Jan 2025 11:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20E1607EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20E1607EA;
	Sun, 12 Jan 2025 11:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBFD0942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD2A981115
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQx6CIXOl64b for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE20F8112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE20F8112E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE20F8112E
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:35:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EBED2B0053D;
 Sun, 12 Jan 2025 12:35:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:35:53 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:35:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111183842.2940443-1-james.hilliard1@gmail.com>
References: <20250111183842.2940443-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <57307adafd5c17401c895a65a8ba0783@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681755;
 bh=FZc9Tc82Golv+R0ZtO9C6iPrKZZi+XZ8jRNkkAFRJJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ExHuX9hXyFZ3IKMSZmxQVFIxOQzw2S8/cHnEmjS/rAmxd6kchuGtbBGWnFXYtWNO1
 AeSQ+z0+2/VuxQiF11W8qnukFL3al3ydq3RKKmdcrNoi9EYH/NYz4Vs1UDINL+F6aR
 0C0y/qQXJ6xTHv185aG0mJqFBQYJ1l6aYIyq9clpa67dT4YxqYKfko1uRbHgQZ3bmd
 5Xxfg9KWuyRPdQ2eM2z6r91T8xm4cmZXUl/ZhdhAFKwKyVlvQhRXpL7PYJA8+ulINN
 cnCa1Ud/N2rWkwlFz06eDIzyzkZeaBpZsSxw35ePEF1TYPLnztYwHH+o+4DXnsURXU
 TRGtpJBbr+PTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ExHuX9hX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump
 to version 2025.1.10.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 19:38, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
