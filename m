Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CE4C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6383E402AB;
	Wed, 28 May 2025 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XICoNrRuGdhP; Wed, 28 May 2025 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A688840C44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A688840C44;
	Wed, 28 May 2025 19:55:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F455B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E6480963
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9noGanice-y for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4173680960
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4173680960
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4173680960
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:55:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 486C5B0056A;
 Wed, 28 May 2025 21:55:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 21:55:48 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 21:55:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 simon.holesch@bshg.com, Sven.Dembianny@bshg.com
In-Reply-To: <20250523131823.1219155-1-dario.binacchi@amarulasolutions.com>
References: <20250523131823.1219155-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <56620af14f0b86e76902de5703f289ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748462153;
 bh=g9zTcJKNrAsg9Oag+VW6q2SioJNZuOlgyoJnnpTOp0Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vV4pWFhzTSjSb/drcQabtwMO5cv4YEIJ2ik4uwQosjh7fn5IDDaNQaxm4Ul4CDA7T
 Dac/TovNCOLp70naT/EG494tKGElzLWXnHM+bDl2Sqt2keVEAgzz7AMsNAyLXHPyT7
 bTTLZBkKd1K3CLpiZBEG6ACNlvQ11tYwRME+qqCpC3dmjX/FfJ62iJMUQHTCs+oPBd
 nPXXFYs1crIMZ6Hw2r+MdYeuheEdHJJ2npka6rQ6N8n9lmmRGQd71ZMKzH6bYE6usG
 DWFqx1HINqPUJ9EzlxjFi8Oy7jD7hLtQSWeGu6vkb/reCFtZS3eEIZvNApkHm4tEts
 MCYJoAfcyLT0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vV4pWFhz
Subject: Re: [Buildroot] [PATCH 1/1] board: bsh: imx8mn-bsh-smm-s2: fix
 U-Boot startup
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjMvMDUvMjAyNSAxNToxOCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQ29tbWl0IGUzMzI5
YTFlODIwMyAoImNvbmZpZ3MvaW14OG1uX2JzaF9zbW1fczJbX3Byb106IGJ1bXAgTGludXggdG8K
PiA2LjEyLjIzIGFuZCBVLUJvb3QgdG8gMjAyNS4wNCIpIGJyb2tlIHRoZSBVLUJvb3QgYm9vdCBw
cm9jZXNzIG9uIHRoZQo+IEJTSCBTTU0gUzIgYm9hcmQuIEkgZGlkbuKAmXQgbm90aWNlIGl0IGJl
Y2F1c2UgSSBtaXN0YWtlbmx5IHRlc3RlZCB0aGUKPiBwYXRjaCBvbiB0aGUgU01NIFMyUFJPIGJv
YXJkLCB3aGljaCBib290cyBmcm9tIGVNTUMgaW5zdGVhZCBvZiBOQU5ELgo+IE5leHQgdGltZSwg
SSB3b27igJl0IGZvcmdldCB0byB0ZXN0IG9uIGJvdGggYm9hcmRzIDopLgo+IAo+IEZpeGVzOiBl
MzMyOWExZTgyMDMgKCJjb25maWdzL2lteDhtbl9ic2hfc21tX3MyW19wcm9dOiBidW1wIExpbnV4
IHRvIAo+IDYuMTIuMjMgYW5kIFUtQm9vdCB0byAyMDI1LjA0IikKPiBTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
