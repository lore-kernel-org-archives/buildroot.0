Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CADC4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F1060868;
	Tue, 21 Jul 2026 17:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cx042uyeteFj; Tue, 21 Jul 2026 17:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F24460646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784655496;
	bh=OISJl3qX+vV3Mu0ClRRzMWR9zmOhkGJ948Yu4EPR+MU=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=E4zvCPLsAvHCaWNVSJRozg29A5Xilb3zDo7ja2Bx3Ms4MjWRxxOGBwaUCYVpiYZhv
	 TUtiNWDWymKNs1JsW0RU65PWVxSdJriDMbnfudBd5VbCGyBFsjcls0M6/5iwy5ExBD
	 tsyJaFdoLmWXA+7nycdEDBtaxDrHKWfoV5cSCYkWODGzEwPnHl0LftaC67dZLT/S63
	 o7tYEdgZzBNeLPhEzgER11+FdEfoYykQMyRSXw3bpkLz4LQKauReMeAF4yXE11f4jV
	 LYHWE+axCwPMv6vd3q+jLusQdRGfsepcktPLzJ8+LjLC4CWtVoiIqAIX/FWMjkcpYJ
	 ygolPdz0eRlnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F24460646;
	Tue, 21 Jul 2026 17:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DCD4313
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66341408BA
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-LKuJOt2rVa for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 17:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF59D408B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF59D408B0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF59D408B0
 for <buildroot@uclibc.org>; Tue, 21 Jul 2026 17:38:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wmEPy-0009Zs-7i
 for buildroot@uclibc.org; Tue, 21 Jul 2026 19:38:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 21 Jul 2026 19:37:09 +0200
Message-ID: <pan$da98$8eb3104b$84ba0add$ddc39b25@ID-313208.user.individual.net>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
 <20260721125337.2537436-2-dario.binacchi__40496.0327012063$1784638450$gmane$org@amarulasolutions.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v4 2/3] package/util-linux: libuuid needs MMU
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpBbSBUdWUsIDIxIEp1bCAyMDI2IDE0OjUzOjI5ICswMjAwIHNjaHJpZWIgRGFy
aW8gQmluYWNjaGk6Cgo+IFdoZW4gYnVpbGRpbmcgdXRpbC1saW51eCB3aXRoIGxpYnV1aWQgZW5h
YmxlZCBvbiBub01NVSB0YXJnZXRzIChlLmcuLAo+IGJvb3RsaW4tYXJtdjdtLXVjbGliYyBvciBi
b290bGluLW02OGstNTIwOC11Y2xpYmMpLCB0aGUgYnVpbGQgZmFpbHMgd2l0aAo+IHRoZSBmb2xs
b3dpbmcgZXJyb3I6Cj4gCj4gbGlidXVpZC9zcmMvZ2VuX3V1aWQuYzogSW4gZnVuY3Rpb24g4oCY
dXVpZF9nZW5lcmF0ZV90aW1lX2dlbmVyaWPigJk6Cj4gbGlidXVpZC9zcmMvZ2VuX3V1aWQuYzo2
Mjk6MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbgo+IOKAmHB0aHJl
YWRfYXRmb3Jr4oCZOyBkaWQgeW91IG1lYW4g4oCYcHRocmVhZF9qb2lu4oCZPwo+IFstV2ltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgNjI5IHwgICAgICAgICAgICAgICAgIHB0aHJl
YWRfYXRmb3JrKE5VTEwsIE5VTEwsIHJlc2V0X3V1aWRkX2NhY2hlKTsKPiAgICAgICB8ICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgIHB0aHJl
YWRfam9pbgoKYSBkaWZmZXJlbnQgZml4IGZvciB0aGUgcHJvYmxlbSBpcyBjdXJyZW50bHkgdW5k
ZXIgcmV2aWV3OgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8KMjAyNjA0MjYxMDIyMTUuMzEwMDA0My0xLWJlcm5kQGt1aGxzLm5ldC8KClJlZ2Fy
ZHMsIEJlcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
