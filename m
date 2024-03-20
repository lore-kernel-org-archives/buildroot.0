Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A21FC54E71
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 00:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FC2A414D5;
	Wed, 20 Mar 2024 00:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaU1poQwaOd2; Wed, 20 Mar 2024 00:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4AAE414CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4AAE414CE;
	Wed, 20 Mar 2024 00:34:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 133691BF976
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 00:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D29A414D4
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 00:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uh2rPEFkN4Ds for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 00:34:09 +0000 (UTC)
X-Greylist: delayed 966 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Mar 2024 00:34:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD176414CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD176414CC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=27.54.81.209;
 helo=ip1b3651d1.ipv4.syd02.ds.network;
 envelope-from=phil.williams@advisoft.co.nz; receiver=<UNKNOWN> 
Received: from ip1b3651d1.ipv4.syd02.ds.network
 (ip1b3651d1.ipv4.syd02.ds.network [27.54.81.209])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD176414CC
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 00:34:07 +0000 (UTC)
Received: from server-72-r70.ipv4.per01.ds.network
 (ip7ac97cc8.ipv4.syd02.ds.network [122.201.124.200])
 by halon-out01.au.ds.network (Halon) with ESMTPS
 id 6cc48447-e64f-11ee-9fb9-f8bc12f6d67f;
 Wed, 20 Mar 2024 08:18:49 +0800 (AWST)
Received: from [139.180.125.36] (port=64802 helo=[192.168.1.46])
 by cp-fp09.syd02.ds.network with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.1)
 (envelope-from <phil.williams@advisoft.co.nz>) id 1rmjeX-00D8wt-2U
 for buildroot@buildroot.org; Wed, 20 Mar 2024 13:17:57 +1300
Message-ID: <ebb78d96-4372-4df8-b891-a46ff8703724@advisoft.co.nz>
Date: Wed, 20 Mar 2024 13:17:57 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-GB
From: Phil Williams <phil.williams@advisoft.co.nz>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp09.syd02.ds.network
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - advisoft.co.nz
X-Get-Message-Sender-Via: cp-fp09.syd02.ds.network: authenticated_id:
 phil.williams@advisoft.co.nz
X-Authenticated-Sender: cp-fp09.syd02.ds.network: phil.williams@advisoft.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=advisoft.co.nz; s=default; h=Content-Transfer-Encoding:Content-Type:Subject
 :From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XbTyzrwF3kWfxRc57CIj2IC+GuxJQCh1e1rY3l28eKI=; b=B/ez0LVDFTK70BiVy+Ys7N54+/
 wcjNCDjX8JJwbdDgmREi9oxb/fEBfRClPSHhjjW9M0B9Wla9sY+glVcWn5TPoJWfKUjV/JXy1xqD3
 3C+Uj00s37WbsTEZov/tXCkcrZudJGLmwISH9eMpEEN1n8egFvIe3G30/nPUmxHJL/yWDffXqaYMs
 y3IRmPUjwQ+wjEb5/G+UF0ybZwjd043SO0ILmYqhKAh1oCwN3X889GPaycXi8P9g64kCVTU3mXEcN
 5vwTI8jDzviExlSjFbHvozKeQLmt7FQlFVTG1+ogorsK2gmXEBNEspDROGOYfKDH3iwRCOQRYvVJv
 ICYALmxw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=advisoft.co.nz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=advisoft.co.nz header.i=@advisoft.co.nz
 header.a=rsa-sha256 header.s=default header.b=B/ez0LVD
Subject: [Buildroot] go receipe not installing go.env
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSByYW4gaW50byB0aGlzIGlzc3VlIHdoZW4gdXNpbmcgdGhlIHRvb2xjaGFpbiBjb21waWxlZCB3
aXRoIGJ1aWxkcm9vdDogCmh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzYxOTI4
CgpBcGFyZW50bHkgdGhlIGRlZmF1bHQgR09QUk9YWSBjb25maWd1cmF0aW9uIGlzIG5vdyByZWFk
IGZyb20gR09ST09UL2dvLmVudi4KCkkgbWFkZSB0aGUgZm9sbG93aW5nIGNoYW5nZSB3aGljaCBm
aXhlZCBteSBpc3N1ZToKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dvL2dvLm1rIGIvcGFja2FnZS9n
by9nby5tawppbmRleCA5ZWZkNGEzMS4uZDAzMWZkMjUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ28v
Z28ubWsKKysrIGIvcGFja2FnZS9nby9nby5tawpAQCAtMTUzLDYgKzE1Myw4IEBAIGRlZmluZSBI
T1NUX0dPX0lOU1RBTExfQ01EUwoKIMKgwqDCoMKgwqDCoMKgIGNwIC1hICQoQEQpL2xpYiAkKEhP
U1RfR09fUk9PVCkvCgorwqDCoMKgwqDCoMKgIGNwIC1hICQoQEQpL2dvLmVudiAkKEhPU1RfR09f
Uk9PVCkvCisKIMKgwqDCoMKgwqDCoMKgIG1rZGlyIC1wICQoSE9TVF9HT19ST09UKS9wa2cKIMKg
wqDCoMKgwqDCoMKgIGNwIC1hICQoQEQpL3BrZy9pbmNsdWRlICQoSE9TVF9HT19ST09UKS9wa2cv
CiDCoMKgwqDCoMKgwqDCoCBjcCAtYSAkKEBEKS9wa2cvdG9vbCAkKEhPU1RfR09fUk9PVCkvcGtn
LwoKSSBkb24ndCBrbm93IGVub3VnaCBhYm91dCBidWlsZHJvb3Qgb3IgZ28gYXMgdG8gd2hldGhl
ciB0aGlzIHdvdWxkIGJlIAp1c2VmdWwgZm9yIG90aGVycy4KCklmIHNvbWVvbmUgY2FuIGNvbmZp
cm0gaXQgaXMsIEkgd2lsbCBmb2xsb3dpbmcgdGhlIHByb2NlZHVyZSBhbmQgCnByb3Blcmx5IHN1
Ym1pdCBhIHBhdGNoLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
