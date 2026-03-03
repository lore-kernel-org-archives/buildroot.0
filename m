Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CCEE67A62
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2637C41914;
	Tue,  3 Mar 2026 17:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiJ-CeQh-6wM; Tue,  3 Mar 2026 17:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63E394193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772559501;
	bh=zuyTFCCBOJvmY9FhoIyJ3sBpPkIkN6CXe2ts7apR4Rw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GP6ACXNjonPeH+FpgeQNI7kwjrvdSXSUr8XYkp21coXi0ji6E37fYd3FofC4FrwHd
	 oly5hEfZk4+drfk+V6wo/lVlNUN7YqQSHk9CxupuKaWhfz5rvCe0YDPMLYIu9hiI1L
	 a0KbCSaMphi5FHeIiwOPXFMC8oCXKhYj7lu1vaJyvANZ8qqCm67W6p7j7WSkjW9ysh
	 lygIR23q7eHtWxvDHDcEpuwKvZ9zz5qSOEGchtRcHC/LDr2/F2O0P3nB4FEUjeoluZ
	 skclmPFqYiRAg4BaK+ekgKuGDvRcjImwK7bt+Im1soGny8sYpYNMB3P0fKOMVfpnE4
	 YSK29YzWkwVMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E394193E;
	Tue,  3 Mar 2026 17:38:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F04525B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9074560623
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUCEd2es-Jsy for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B6206060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B6206060E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B6206060E
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:38:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 01D75780371;
 Tue,  3 Mar 2026 18:38:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Mar 2026 18:38:13 +0100
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 18:38:13 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20260303081323.53405-4-thomas.perale@mind.be>
References: <20260303081323.53405-1-thomas.perale@mind.be>
 <20260303081323.53405-4-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <912ab5b35885b989eeb0623fe4de1f1c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772559496;
 bh=EqjE5W2effJwGGTUC/gzkNlmg6Xn47FynyAWe51rLcI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OnkR1ocoLgLFnMf7835LXeHY34pUwcgDFe2mkLAtqDstg7kSI4nd9TiIvaRR+bg45
 3EuoYckcSDIRa9Y3rFLpy4KNlxgNXoKwIXt2osQ0hK04A1gphhV44AP7gZkz5Q+FlQ
 VQTkhd+wpqMkSWsgAxewoZToabu5J4RlOrZx+0wo/aZrGI1l6eMk6+nMGJp+oEO9Po
 MemmTc5rZOPxg2GVrfc9zbaJUMFCa9jZ0M/sbOKh3CpWpPguB4ZY/e777T24NOm9xN
 R+jOBb56tV470uC0vIa9tNK4dNdP+K0K5s0i23s9LGoQnrIPWdP7OlUAbM8b3n3CEF
 PkSzIA2NNKWDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OnkR1oco
Subject: Re: [Buildroot] [PATCH 4/4] package/graphicsmagick: bump to v1.3.46
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

On 03/03/2026 09:13, Thomas Perale via buildroot wrote:
> For more information, see the release note:
> 
> - http://www.graphicsmagick.org/NEWS.html#october-29-2025
> - 
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/compare/GraphicsMagick-1_3_45...GraphicsMagick-1_3_46
> 
> This release include now upstream fixes for CVE-2025-27795,
> CVE-2025-32460, CVE-2025-27796.
> 
> Copyright year updated in [1].
> 
> [1] 
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/13454c83b42327a29796b2bf418e4f90f5fc9292
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Since we are already in the 2026.02-rc3 release cycle, I would prefer to 
apply
this patch a bit later, after 2026.02 is release (hopefully, very soon).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
