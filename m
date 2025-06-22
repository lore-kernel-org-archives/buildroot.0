Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2AC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 08:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B9E8150C;
	Sun, 22 Jun 2025 08:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7J7Y5AbbYs2J; Sun, 22 Jun 2025 08:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDC4814C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFDC4814C1;
	Sun, 22 Jun 2025 08:21:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3181C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 08:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5282814C1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 08:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f67jGQv-f8GP for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 08:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C04AD8071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04AD8071A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C04AD8071A
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 08:21:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C423E5FFC0;
 Sun, 22 Jun 2025 10:21:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 10:21:44 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 10:21:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>,
 James Hilliard <james.hilliard1@gmail.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250618-virglrenderer-upstream-v1-1-57525ac8406e@gmail.com>
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
 <20250618-virglrenderer-upstream-v1-1-57525ac8406e@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e1e2018bf9ed6c9d061d94fa7965f254@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750580511;
 bh=zY7OaDtX+U+BciS2xYrbNfErJzXjbVz3ayg6eG5oFHU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fysXKWfVe3AcTkw6zMoj+vSLby+XNOCguSO4frIqh5NZBIDg9B2ksjpE54PXq9v9d
 QXIf1ypYw+zRcQsLWSJLainWtP6E3uXxzVtX4ECfuGTYsuDhaIfOkxUFBK/FDiSkgM
 m6Y+XRIcqEtDM3GyJ1PcCebBHxKZEfRpHgSq6IK2ftqAwWbjVirydw87lZ2UyKweJv
 exqQ66ZNmwWjNkP163e8wSb5SAPO8dds3xAA5DNcAU3ieXVmBhgJlrN6vTV2O9KLcV
 0PwVI8KGfu4bMUbcHUiCROlrSgUZWLJ213+vuR/dx7H9kSEOLs+zj17u2r5QpqygWL
 r9auWnVBZIbbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fysXKWfV
Subject: Re: [Buildroot] [PATCH 1/3] package/python-glslang: bump to version
 15.3.0
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

SGkgSm9zZXBoLAoKT24gMTkvMDYvMjAyNSAwMjo1OSwgSm9zZXBoIEtvZ3V0IHdyb3RlOgo+IFNl
ZSBjaGFuZ2Vsb2cgCj4gaHR0cHM6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9nbHNsYW5nL2Js
b2IvbWFpbi9DSEFOR0VTLm1kCj4gCj4gRml4ZXMgYnVpbGQgaXNzdWU6IGVycm9yOiDigJh1aW50
MzJfdOKAmSBoYXMgbm90IGJlZW4gZGVjbGFyZWQsIGVuY291bnRlcmVkCj4gb24gR0NDIHYxNSwg
Y2F1c2VkIGJ5IGNzdGRpbnQgbm90IGJlaW5nIGltcGxpY2l0bHkgaW5jbHVkZWQuCj4gCj4gaHR0
cHM6Ly9idWdzLmdlbnRvby5vcmcvOTM3MjYxCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtv
Z3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgoKSSBhcHBsaWVkIHRoaXMgcGF0Y2ggb25seSBm
cm9tIHRoaXMgc2VyaWVzLCBhcyBpdCBmaXhlcwphIGdjYzE1IGlzc3VlIChhbmQgdXBkYXRlcyB0
aGUgcGFja2FnZSkuIEknbGwgZ2l2ZSBzb21lCm1vcmUgdGltZSBmb3IgcmV2aWV3cyBmb3IgdGhl
IHFlbXUgdmlyZ2xyZW5kZXJlciBwYXRjaGVzLgoKSSBhbHNvIGRpZCBmZXcgbWlub3IgY2hhbmdl
cyBmcm9tIHlvdSBvcmlnaW5hbCBzdWJtaXNzaW9uLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC81MzA3NmYwZWJhODVjNTNiY2JlZTQzY2Rk
ODFhMGQ1ODRiYTViZTIyCgpJIGhhZCB0byBkaXNhYmxlIGdsc2xhbmcgdGVzdHMgYmVjYXVzZSB0
aGUgY21ha2Ugc2NyaXB0IHdhcwpmYWlsaW5nIHdpdGggY21ha2UgPCAzLjI2LiBPdXIgQnVpbGRy
b290IGRvY2tlciByZWZlcmVuY2UKaW1hZ2UgaXMgdXNpbmcgMy4yNS4KClBsZWFzZSwgY29tbWVu
dCBvciBzZW5kIGZvbGxvd3VwIHBhdGNoZXMgaWYgSSBtaXNzZWQgc29tZXRoaW5nLgoKQmVzdCBy
ZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
