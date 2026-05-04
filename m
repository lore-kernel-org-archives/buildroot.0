Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF45CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5FC8384B;
	Mon,  4 May 2026 19:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAgL0aHb7SfU; Mon,  4 May 2026 19:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43C683658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777922414;
	bh=IbdK4OdNc4Zfo/S7Q9l+rMu6b6lM3aXwk2cbKKsVfXQ=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DIzBUA9i0I5Ke9YQTh+9M9/TqHGr04SDAGKObLjnmXlPTB7vPUR9sItU5zCe9p+qf
	 cEyi5znQOYxigc5Qc2UriXw4Kl+CjDNtBUyHEscbBYKFjrKCCWSa+OMRfbqCAaR8rR
	 r19SGa6zcruT+VVY4REUdJ7IQKJ0pztXNGnMFV53zTWLlzPapuvEvWYV7cJPgQa/gd
	 kTpbZ96Hxsdfz8QqsDSnG/qSAFpTEBhYrX+HuL53QCIXBsm4KB+TRH0X+YsZ32yZUw
	 vYh1dtY+AGveT5P8ZJLmLFMhI+qDctejTbgEtLpFoUTJz1KPT5GqkGeQK2Y7S/4yxk
	 E0vP0+/rY6fAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C43C683658;
	Mon,  4 May 2026 19:20:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAF77204
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DDE61065
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZZ-BHOhDW8P for <buildroot@buildroot.org>;
 Mon,  4 May 2026 19:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AE9460E4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE9460E4F
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AE9460E4F
 for <buildroot@uclibc.org>; Mon,  4 May 2026 19:20:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wJypt-00060S-66
 for buildroot@uclibc.org; Mon, 04 May 2026 21:20:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 04 May 2026 21:19:43 +0200
Message-ID: <pan$4efa1$3193edca$35d0dc70$ed67a04c@ID-313208.user.individual.net>
References: <20260501152758.2610763-8-bernd@kuhls.net>
 <20260504145544.24754-1-thomas.perale__7627.68512811221$1777906569$gmane$org@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v4 07/21] package/cups-filters: add upstream
 patch to fix CVE-2025-64524
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

Am Mon,  4 May 2026 16:55:44 +0200 schrieb Thomas Perale via buildroot:

> This line needs to be changed to the following as documented in [1]
> 
> ```
> CVE: CVE-2025-64524 ```
> 
> To be correctly picked up as a patch. This is not checked yet by
> `check-package` unfortunately
> 
> [1]
> https://buildroot.org/downloads/manual/manual.html#additional-patch-
documentation

Hi Thomas,

thanks for the hint, seems I am following an outdated version of the 
manual:
http://buildroot.uclibc.org/downloads/manual/
manual.html#_additional_patch_documentation

which does not mention "CVE:"

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
