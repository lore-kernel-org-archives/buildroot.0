Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8DC5DF8C
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 16:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B73B26064D;
	Sat, 22 Aug 2026 16:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_k1ObqmPfM4; Sat, 22 Aug 2026 16:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787416809;
	bh=NEDOXk/krQoFEv4wyHqlyOhqHnOG6adMmqZ3JfB+Z4I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y6UXC/Ws4M65xMMoH7ZTDDFKYATyOZiQ/fQrpXCRUigJQLhIMjh46VZKKdGx0vRtl
	 lig2OmXDQ5xu8i2mGLQfN5eGm0zLQGmO4ibE1krplgVOMaM7vc/XIMF79xNa+rf5qO
	 s5bhUygefcF9Wfgs1LVi42q4cQaCjfQZ75Ct4+Qnbps/WZ0Flhdlx/aHhxDFxy0I/r
	 u1v5oNS9YqbXuj4iu0Z9wjgxS9vSh/iB4Gf3JXZ4aksHTC+QA5HH2LhuQRIJtjx2pm
	 bobuyLAST6efcVNKpqgCSShg952w2yLEc7W99X7RSiUdevUMUlBISaUgkhpBMcrYcj
	 /AQwzy+Xg9IVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4C9605F5;
	Sat, 22 Aug 2026 16:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C65A2118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3FBA605F5
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZL4KpU4vvYt for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 16:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2ED5605CB
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:40:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6B3B313F88F;
 Sat, 22 Aug 2026 18:40:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 18:40:03 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 18:40:03 +0200
To: Stefan Mueller <stemu86@gmx.ch>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260820094938.561913-1-stemu86@gmx.ch>
References: <20260820094938.561913-1-stemu86@gmx.ch>
User-Agent: Webmail Free/1.6.18
Message-ID: <4d992032c8b21aba0293ca54dfd32d30@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wget: fix CVE-2026-58471
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAvMDgvMjAyNiAxMTo0OSwgU3RlZmFuIE11ZWxsZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBTdGVmYW4gTcO8bGxlciA8c3RlbXU4NkBnbXguY2g+Cj4gCj4gQmFja3BvcnQgdGhl
IHVwc3RyZWFtIGZpeCBmb3IgYSBoZWFwIGJ1ZmZlciBvdmVyZmxvdyBpbiBjb252ZXJ0X2ZuYW1l
KCkgCj4gd2hlbiBncm93aW5nIHRoZSBpY29udiBvdXRwdXQgYnVmZmVyLgo+IAo+IEJhY2twb3J0
IHRvOiAyMDI1LjAyLngKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gTcO8bGxlciA8c3RlbXU4
NkBnbXguY2g+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
