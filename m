Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06EECCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 19:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A149540F87;
	Thu,  9 Oct 2025 19:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuBf0gswM4jW; Thu,  9 Oct 2025 19:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C71AE40F05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71AE40F05;
	Thu,  9 Oct 2025 19:49:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A776119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0704361371
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOOklEsmznQq for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 19:49:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E963D60A85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E963D60A85
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E963D60A85
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:49:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1947565259; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Oct 2025 19:49:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v6wdL-0087eQ-0r;
 Thu, 09 Oct 2025 21:49:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org
References: <20251009193204.1951332-1-flavio.tapajos@newtesc.com.br>
Date: Thu, 09 Oct 2025 21:49:03 +0200
In-Reply-To: <20251009193204.1951332-1-flavio.tapajos@newtesc.com.br>
 (=?utf-8?Q?=22Fl=C3=A1vio=09Tapaj=C3=B3s=22's?= message of "Thu, 9 Oct 2025
 16:32:04 -0300")
Message-ID: <87v7knx3dc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=asG3UQHWD75EFLKq8UCcXh/koz1rMhENlNYT1L8hOJf0LMdOCkn3Y50rzar7I80Oh+pxJBs1WOewAxMSmtePhpz+9WKP3DBfm7RoJGFPjozthxzPfgylcS2L0AaP2rYmO3tbFYa2kWpsv2boDtZTLHmA0xPDFZhvkt92ST0cYpyNSWr06H1JnAKubxGBhIgU4FFxDf49pxHJNV0sCT6SGzxFk3SydQVrEhi+40yIcWpyRTHN2ztqvBVpA1+n4B8JjOp1kj9ksFC27W2NT2X2Dmqs1y37rwkJjHfWhCG887305dS3KlfRgBbIMkhjOBlvGnRTfl4VGbPHPdIvKYfwHA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=lqiCkB/VEic4QzmlOjjg1U6DFst0YNL7UTH5i3T9U6U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=asG3UQHW
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to
 8.2506.0
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

Pj4+Pj4gIkZsw6F2aW8iID09IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rl
c2MuY29tLmJyPiB3cml0ZXM6CgogPiBSZWxlYXNlIGFubm91bmNlOgogPiBodHRwczovL3d3dy5y
c3lzbG9nLmNvbS9yc3lzbG9nLTgtMjUwOC0wLTIwMjUtMDgtcmVsZWFzZS1hbm5vdW5jZW1lbnQv
CgogPiBDaGFuZ2Vsb2c6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yc3lzbG9nL3JzeXNsb2cvYmxv
Yi92OC4yNTA4LjAvQ2hhbmdlTG9nCgogPiBTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7Nz
IDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
