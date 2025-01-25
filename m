Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AACC0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836F44295B;
	Sat, 25 Jan 2025 14:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WCDvXy4mw0C; Sat, 25 Jan 2025 14:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784BC4296F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784BC4296F;
	Sat, 25 Jan 2025 14:36:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3BB941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E5D4296F
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTkLLBbHxhqA for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A72C04295C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72C04295C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A72C04295C
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B05BFB0053E;
 Sat, 25 Jan 2025 15:36:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47700])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:36:39 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:36:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124193614.3816599-1-james.hilliard1@gmail.com>
References: <20250124193614.3816599-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <18a6a69fa22c79d6034df3c9cb6be63d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815800;
 bh=Zv9nwm6bTsOMp0+v/qrxlMquiya75oBLlmm/RTr4wXo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BQIsDc93VfbFKeJT7u0OqyYLHtxbXgWzwz7SFbkNlz6rGGSs7rPfw//s0q+9gDeK0
 pjShamoZFmSYDmbiCWTcJika/EYGNEJOTHqczUI+Z8VL8onYxhURfUzLjaGln39vWa
 9We9xZq9WBzEAY6AmiIZTOi0WczVNZKk8sgihRNNxFuRFtyTBYMt2/Zc4zbNRdlrhL
 yp6h42mUYOawP/fNSk4QzND0D5+S94oJsVdqPQgRBQogS9zYRkrZM2G63/IKuPM1rd
 jJN1YsxeMJO/WVaxHnKqeENJP1rIKXz88cRpF3SPcSgoayHHYE+mcFv+qDi0RfIood
 PLQVMGjhqcs3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BQIsDc93
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hyperframe: bump to
 version 6.1.0
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

On 24/01/2025 20:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
