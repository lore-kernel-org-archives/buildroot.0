Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A23CC87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5968D61379;
	Mon,  4 Aug 2025 20:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kugXpqNyp1ve; Mon,  4 Aug 2025 20:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D8260AD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D8260AD4;
	Mon,  4 Aug 2025 20:11:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC7F1A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0AD640D5E
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gh0UNtwGiJoc for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07F394087E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F394087E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07F394087E
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:11:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 23690617;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 20:11:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj1Wp-00BLLd-2L;
 Mon, 04 Aug 2025 22:11:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20250804185335.3345211-1-bernd@kuhls.net>
Date: Mon, 04 Aug 2025 22:11:27 +0200
In-Reply-To: <20250804185335.3345211-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 4 Aug 2025 20:53:35 +0200")
Message-ID: <87qzxqkftc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RjmAlzDDZZ6ZHai+niU+18siDW2X4/QperDPZbHjSMHmmAWhpaVtmIGfhbopVWqSwmJC1XdLwpt04c0EVDeWyVI+JRAvws6kpo1+DNTd9LcqGlu4sWa8GAh1t9GpSr3YbOoCA9wAQwz+PrbtOeyinMqsM9e8XGY91FG1RJGilpGfgEh4+nTmp11z/I3W94IoKE9uj7r8BtrO69qa3sKaraDg3xqKbmXWSteyMXtItwEvhnbPaDHLeLP20wj3bYNaJ/QSQ0W9mtw+Dh9039bfjl/31XWRH76ZMJQruaAEUzzEKCCOIR4/A/sEdE/P/vz1imAS832jWau9Pd0Zpx94ig==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=9RWmtoYqvU31hbVTHa3mizZEZw3xjLuS4WWRSaO8bBo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=RjmAlzDD
Subject: Re: [Buildroot] [PATCH 1/1] package/glm: bump version to 1.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes: https://github.com/g-truc/glm/releases/tag/1.0.1
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
