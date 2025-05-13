Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90371C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 10:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E8B40E53;
	Tue, 13 May 2025 10:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4XeBba_N9L3; Tue, 13 May 2025 10:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6ECF40E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6ECF40E46;
	Tue, 13 May 2025 10:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01552153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E667E40E43
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfOfs04rdR_I for <buildroot@buildroot.org>;
 Tue, 13 May 2025 10:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E799540E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E799540E0D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E799540E0D
 for <buildroot@buildroot.org>; Tue, 13 May 2025 10:57:29 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.76])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 20E7EB00585;
 Tue, 13 May 2025 12:57:23 +0200 (CEST)
Date: Tue, 13 May 2025 12:57:23 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Message-ID: <fyjysuf3adzxzq4aqrpzopplr27blwfyygr2mxrim35kjqpjf7@qv5j7uslizf4>
References: <20250513085628.38864-1-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513085628.38864-1-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747133846;
 bh=CNeZfHvmv2bkFAt8iNKlCJHdtaWbOrnueLwTqzt0Vec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lnfOxwTgwFhVePBPge9GEFWvoeHc3UcRJKKsUxfwHACEXDPsYS/Ppn0NUZMKFmtrW
 Hv/snqwgPR1vKqRr49QxQyC+9VI83Rzl+8CLl4yFq1E5aiRL+YfNM5R0fW94cj1t5e
 zQMnzDEaoVsyEvIkooDHTOV3Z2QFDMyFHme2wW+NX5ADQ7SFCxUax1L/aenKbWpAl+
 rGy91l9Prex3NBc3F7V9kiSMRA8CBnZu0yNTM+ayBXe+Y6Hz6O4+gTm3V1j1IUx8I4
 VSyL4I2kOWpAgdevMhFZUpYmfZOpg/7qLnE14zrpX96rQNgcd3uuL2khOLWl+/TrPg
 3h8+m7997dqZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lnfOxwTg
Subject: Re: [Buildroot] [PATCH 1/2] package/grout: bump to 0.10.0 version
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

Hi Maxime,

> See the release note of the new version:
> https://github.com/DPDK/grout/releases/tag/v0.10.0
> 
> Libcap is not needed anymore for this new version, thus dependencies has
> been updated in consequence.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Reviewed-by: Vincent Jardin <vjardin@free.fr>

I'll need more time to review your grout runtime tests.

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
