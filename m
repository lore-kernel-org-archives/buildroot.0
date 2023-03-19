Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653FCC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E0F81A6D;
	Sun, 19 Mar 2023 17:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E0F81A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeuVwRDEVi10; Sun, 19 Mar 2023 17:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0234E819D2;
	Sun, 19 Mar 2023 17:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0234E819D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9F331BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 17:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C303F60A70
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 17:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C303F60A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yy7rBRPXvcP2 for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 17:21:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 754F560A68
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 754F560A68
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 17:21:20 +0000 (UTC)
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pdwia-000KQq-UM; Sun, 19 Mar 2023 18:21:16 +0100
Received: from [85.184.138.13] (helo=[192.168.8.21])
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pdwia-000T30-OV; Sun, 19 Mar 2023 18:21:16 +0100
Message-ID: <2238b0c90df95d926bd17f22ef918a1fb3c8b37e.camel@geanix.com>
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Mar 2023 18:21:16 +0100
In-Reply-To: <20230319174304.52895f9b@windsurf>
References: <20230316094515.598356-1-martin@geanix.com>
 <20230319174304.52895f9b@windsurf>
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26848/Sun Mar 19 08:23:18 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=iYIG2GcsWsvQncMcq+BiDT4kOw9NoPghvNw3GxJOlkI=; b=j0NWEfV2/JbqlYKzWq6Xt2WTvd
 W4QkTceopt7yihqMTHWWXaoanMQ9V/86O1+DVIY59fin6CsTAYVPrOKXs+MBjXsEUWXfGWU6RvWeh
 12PmXfD260dz3qZXcPzue4Nld8nF/BTLDFOVoFdzBq2dhd12KqmMFIZEto/OGjgT4qOh4/ajX/Ofp
 vdBVb7smy/XUPvIsRCqPEhkj+wvGF5JQYqZHN8ahvUXo9tqjsKTMci8XB00dBgo3N/lp90dH5kD5Q
 bkt3NWjyp/2AA1GWqGmLvN6Wr9jquWWNSmZBdsqQxdzY3Fh7TvMfrqnZLH0BRxSM6A6lv7firZ5DA
 WpYQyUeg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=j0NWEfV2
Subject: Re: [Buildroot] [PATCHv2] ifupdown: bump to 0.8.41
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMDIzLTAzLTE5IGF0IDE3OjQzICswMTAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Ogo+ID4gK1NpZ25lZC1vZmYtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5AZ2Vhbml4LmNv
bT4KPiA+ICtVcHN0cmVhbS1zdGF0dXM6IERlbmllZAo+ID4gW2h0dHBzOi8vc2Fsc2EuZGViaWFu
Lm9yZy9kZWJpYW4vaWZ1cGRvd24vLS9tZXJnZV9yZXF1ZXN0cy81XQo+IAo+IElzbid0IHRoZSBm
ZWVkYmFjayBmcm9tIHVwc3RyZWFtIGNvbXBsZXRlbHkgYm9ndXMgaGVyZT8gVGhleSBzYXkKPiAi
Tm90ZQo+IHRoYXQgdGhpcyB3b3VsZCBvbmx5IGhpZGUgdGhlIHByb2JsZW0gYnkgdHVybmluZyBh
IGJ1aWxkIGZhaWx1cmUgaW50bwo+IGEKPiBtaXNiZWhhdmluZyBwcm9ncmFtLiIsIHdoaWNoIEkg
ZG9uJ3QgdGhpbmsgaXMgY29ycmVjdC4gRGlkIHlvdSB0cnkgdG8KPiBhcmd1ZSB3aXRoIHRoZW0/
CgpObywgSSBkaWQgbm90LgoKSSdsbCBnaXZlIGl0IGEgc2hvdCBuZXh0IHdlZWshCgovLyBNYXJ0
aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
