Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9EAC27C76
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 09:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C81F582095;
	Sat, 28 Jan 2023 09:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C81F582095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3FFVxIYogCw; Sat, 28 Jan 2023 09:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DFE682082;
	Sat, 28 Jan 2023 09:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DFE682082
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F63B1BF859
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 09:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 588AB82082
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 09:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 588AB82082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDd30AddhCTJ for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 09:58:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B2A282081
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B2A282081
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 09:58:23 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:351d:8a14:e78c:dbf4] (unknown
 [IPv6:2a01:e0a:947:6e20:351d:8a14:e78c:dbf4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 48F21BFBF6
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 10:57:51 +0100 (CET)
Message-ID: <9cbfa4ff-8bac-0c93-623d-095ce9c5b30e@grenoble.cnrs.fr>
Date: Sat, 28 Jan 2023 10:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: buildroot@buildroot.org
References: <20230128064807.6F449404C8@smtp2.osuosl.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20230128064807.6F449404C8@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1674899871;
 bh=m6FhN2XfwbUmhKwQGah10iDI+R4m9+VDkaSImBFeh0g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VEr+8bhA3eXmWrNIhlq4qkvoohrWkUvOzGxDQo60jxHxpgrZ9v47pLSHX3MqX/BG1
 CnHAPZ9WwDOCrsfg1gDwRJgrCIqyUTIy30eMwTJjR7qzmciiyPaRjdk+njI3y8IQgF
 32qgEZSgocUUbxGjE1DP+mFHXkZpw9qgMprj+Wkx+12iv3unA6dSkuwg1wbzugGp1b
 pNqLvpFfcyIJ6jzSMp1mzGSjRlJNotDFw2+u6y6pG/ye/IV2Eed277v6nB4EkDC+fv
 WMxKSA8m6EjPujYHi3//BaZgnPyPQipOIyrIR03/PPx3xJ5JlrgmAkSYy0xhRcP/Lk
 hz6dTJtIIjexA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=VEr+8bhA
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2023-01-27
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpHaXRsYWIgQ0kgd3JvdGU6Cj4gRGV0YWlsIG9mIGRlZmNvbmZpZyBmYWlsdXJlcyBm
b3IgbWFzdGVyCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkZWZjb25maWcgfCAgICAgICAgICAgICAgICAgICAgICAg
IGxpbmsgdG8gdGhlIGpvYiAgICAgICAgICAgICAgICAgICAgICAgIHwgb3JwaD8KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0KPiAgICAgICAgICAgICAg
ICAgICAgICAgYWFyY2g2NF9lZmkgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9qb2JzLzM2NjMzNjMxMDQgIHwgICAgICAKPiAgICAgICAgYWNtZXN5c3RlbXNf
YWNxdWFfYTVfNTEybWIgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9qb2JzLzM2NjMzNjMxMDYgIHwgICAgICAKPiAgICAgICAgYWNtZXN5c3RlbXNfYXJpYV9n
MjVfMTI4bWIgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzM2NjMzNjMxMDggIHwgICAgICAKPiAgICAgICAgYWNtZXN5c3RlbXNfYXJpYV9nMjVfMjU2
bWIgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzM2
NjMzNjMxMTEgIHwgICAgICAKPiAgICAgYWNtZXN5c3RlbXNfYXJpZXR0YV9nMjVfMTI4bWIgfCBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzM2NjMzNjMx
MTUgIHwgICAgICAKPiBbc25pcF0KCk1hbnkgKG1vc3Q/KSBvZiB0aG9zZSBkZWZjb25maWdzIGZh
aWxlZCB3aXRoIHRoZSBlcnJvciDigJxObyBzcGFjZSBsZWZ0IG9uCmRldmljZeKAnSwgd2hpY2gg
c2VlbXMgbGlrZSBhbiBhdXRvYnVpbGRlciBpc3N1ZS4KClJlZ2FyZHMsCgpFZGdhci4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
