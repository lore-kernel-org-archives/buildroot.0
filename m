Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE397CD98E4
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC436F6CC;
	Wed, 17 Jun 2026 12:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbS9alKD21J6; Wed, 17 Jun 2026 12:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3DAC6F6EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781699288;
	bh=N60UqDBce9XyIWL9PYA2f76DcJU92UAzxFOnUAnWYBM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ikZPhGqa8KAaDYVFcPQpzQJ84YMC/piJEahxVxQuDY7P0whosUBM0bPRu9ecRfFgM
	 dz4S13yK0lNgaVO6W7nNze6xDu34S9JWQ35EqiuIzHEjG/k9vUBEV1RLSZnptarvXy
	 VvrVk7jfsP6CjK2S2qFjO7yFiONUDL9vvyNneMBy+0vbbCo1G01TyWrojwqjBxp4l0
	 wGQvQ++HrMVNDQKZhI7oc9YD+S6/fQqotp7V2OBWK1gQtX7i71ut4uVJmCWJbMizLe
	 2Uk2Fr5y+rjZzF93htGpG0SraRcHDd9orhmO4/r+F/in3LsvzNeOu3HhUA13RPxTW+
	 WAAHkeznh6qLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3DAC6F6EA;
	Wed, 17 Jun 2026 12:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF2DD8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB864ED64
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlLG_58YnfPM for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18A744ED63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18A744ED63
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18A744ED63
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:28:05 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7FD802C80C5F;
 Wed, 17 Jun 2026 14:28:03 +0200 (CEST)
Message-ID: <61a708aa-e992-4b77-9d50-adff450cb378@bubu1.eu>
Date: Wed, 17 Jun 2026 14:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 Andreas Ziegler <br025@umbiko.net>, Joachim Wiberg <troglobit@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260606182032.3803327-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781699283; bh=KFRHphcOnXy3V+EHqStWGhXY9SHss89zSyevdfZgiVQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=G4z5cXND7GHIIbl4aupHIwBLoI2wdL/4Tw1Zduu6nmceV24ElmX6K9rAT71pdNJfk
 BmAgt8oHKzV703x4K+lXVPecKj/P4xE9fEgmRY+sxnYC80VoKqSyievSc+QHNjeGcK
 gVL9jMdEksiE4s6ChdD1aYh+BovJzCSWVRbs0Mg3YG+uEa0PYZJ4t2VNVDoQDlzLn3
 eTSNETrnBb1CZ6rSQJ3HKWJMwovjH8g170fCaF4dtaQBNOg1di4l7ZRjwbxfBWK5aR
 QUoVKczm16UbHJCHiR8U26Zv0c+okWkOsoLf3NNYfKjfFUwCqlMUjmRnRcLi+sYcew
 8aVruOd5Woucg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=G4z5cXND
Subject: Re: [Buildroot] [PATCH 0/4] fix shellcheck 0.10 & 0.11 warnings
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona, Andreas, Joachim

On 6/6/26 20:20, Fiona Klute via buildroot wrote:
> Hi everyone,
> 
> this series fixes shellcheck warnings that appear with shellcheck 0.10
> (as present in Debian Trixie) and 0.11 (Sid) to prepare for updating
> the CI container image to Trixie. With the current image "make
> check-package" still passes with the patches applied, so they can be
> applied at any point before updating the container image.
> 
> Most changes are pretty trivial (the mdnsd init script a little less),
> but only OpenRC has runtime tests, so tests from people actually using
> the packages would be appreciated.

It would indeed be nice if we had more runtime tests, so we can make 
such changes more comfortably. Thanks Andreas for testing the mpd 
changes. Do you think you could submit a runtime test for it at some 
point? :)

Joachim, you submitted and are mentioned in the DEVELOPERS file for 
mdns, do you think you can submit a runtime test for it?

https://nightly.buildroot.org/manual.html#_using_the_runtime_tests_framework

> 
> Best regards,
> Fiona
> 
Series applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
