Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED757CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FA940A72;
	Fri, 17 Oct 2025 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czuiu8cxm0st; Fri, 17 Oct 2025 16:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC11A40B41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC11A40B41;
	Fri, 17 Oct 2025 16:36:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 964D9972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87A9E610A1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkH2dPPG1Dtv for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 860916109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860916109E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 860916109E
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:36:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BA6652003ED;
 Fri, 17 Oct 2025 18:36:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Oct 2025 18:36:37 +0200
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 18:36:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251015170837.1887771-1-bernd@kuhls.net>
References: <20251015170837.1887771-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f5c86bea5e09c6e83fb68c22d94712c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760718999;
 bh=Aj/516o7T5p5XIuhN52Dyf8FnayghWLBPaK6FEBFm4g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FXtH0+atecmDex+9bG/T4iiOkh7+0N9UzrFC7QLBvyzmeHXKWP1HEdEJGTMsMNv4w
 gNWAMPh28DB7l6NFVGpM0xPgWIJKRKYo2V6XvQishN73HsGydJDI1vCWnjWevT7Vu8
 YM7MRK7OZWQVYaLfdmDvzxyoSuTndc6FkXwUbNkbMUZ9X+PK8f4eVu6fpc6Lopf6/A
 LsIrU2tY7aCznRJGOhDzTtLHuH7O5v48rmXLx5OER2H+uqTbO7+C7Cz3e2lig+10rW
 KyUobpB+HH1TMISJHVkyTWnfCuqWyT7J/Yn8ivUsvRT+xDSiBFPGUdEy8gQJUCRTFJ
 ZQdz63zHHw3QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FXtH0+at
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-automat: bump version
 to 25.4.16
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

On 15/10/2025 19:08, Bernd Kuhls wrote:
> Release notes: https://github.com/glyph/automat/releases/tag/25.4.16
> 
> Switched setup type to hatch following upstream commit:
> https://github.com/glyph/automat/commit/643f7ce4ff0dfbe0269d57e0611b24fd5a149d93
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
