Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FED6C369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F22F61AD1;
	Wed, 16 Apr 2025 20:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zIShN8Wuywe; Wed, 16 Apr 2025 20:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4946F630
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4946F630;
	Wed, 16 Apr 2025 20:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB69920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EFE54097E
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfiOvkJsVMGJ for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F23E41410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F23E41410
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F23E41410
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:57:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DD3A1C0AEC; Wed, 16 Apr 2025 22:57:29 +0200 (CEST)
Message-ID: <7eca50c6-f525-458a-b1e0-287e1289a0bc@rnout.be>
Date: Wed, 16 Apr 2025 22:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250317210600.3003465-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250317210600.3003465-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837049; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JlRyoacfojB88qMKRPlyUEfdmIZB3Qbo4TVwgpf+7bY=;
 b=HcgmXOSrFU6qGWqLvfV/tXT7BHJkrGQMehb1ppP81EmuoqrB73IlbYGbcoUjy1arUzDVY3
 i/sbexHiXYQuFG3mcmW4xMdtI8UR+DJxREsxCveRBy5/GosIy8KDxXorCTjmu295rH9X7g
 ssxfG0BmAoyZoiZHS+xdRoreh+XcgRmyDD9+ficdQ0YUE3VM2E30yY4H00f4dEtnAskbWj
 P8RzxvjfdZMA+kdsoVoiipU9qxfMqyTynze8TU1QMdWvl30tyeIu3iOjHKc0iRUAL6r0L/
 s8N5OGsjUSIwTpJzZgQo/yL6VRCw9Gk5/gmSvt/pHIVn4QuC3kMQd7HkGetOjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version
 0.8.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE3LzAzLzIwMjUgMjI6MDYsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKIMKgQXBwbGll
ZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAg
IHBhY2thZ2UvcHl0aG9uLWFlcmljaC9weXRob24tYWVyaWNoLmhhc2ggfCA0ICsrLS0KPiAgIHBh
Y2thZ2UvcHl0aG9uLWFlcmljaC9weXRob24tYWVyaWNoLm1rICAgfCA0ICsrLS0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWFlcmljaC9weXRob24tYWVyaWNoLmhhc2ggYi9wYWNrYWdlL3B5
dGhvbi1hZXJpY2gvcHl0aG9uLWFlcmljaC5oYXNoCj4gaW5kZXggODdkZjczZDNjNy4uYTI1MDNm
ODk5ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1hZXJpY2gvcHl0aG9uLWFlcmljaC5o
YXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tYWVyaWNoL3B5dGhvbi1hZXJpY2guaGFzaAo+IEBA
IC0xLDUgKzEsNSBAQAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlw
aS9hZXJpY2gvanNvbgo+IC1tZDUgIGQ0MDYyYTkxMTE2MTQzNWEzZDIxNzM2YjUxMzQwYjBlICBh
ZXJpY2gtMC44LjEudGFyLmd6Cj4gLXNoYTI1NiAgMWU5NWIxYzA0ZGZjMGM2MzRkZDQzYjAxMjM5
MzMwMzhjODIwMTQwZTE3YTRiMjc4ODVhNjNiNzQ2MWViMDYzMiAgYWVyaWNoLTAuOC4xLnRhci5n
ego+ICttZDUgIDExY2MzMWUyNTEzMTE4ZTY2ZmMzN2M4MzNjZGVhYWM4ICBhZXJpY2gtMC44LjIu
dGFyLmd6Cj4gK3NoYTI1NiAgMGVkMmIxNWJiMDE3Nzg1ZDE3MzIzMzI5ZTU0NDhiNGIxMmZjZmVj
MDhhMjA5MzI2MjZjMTJhYTU5YTgzNzhkNiAgYWVyaWNoLTAuOC4yLnRhci5nego+ICAgIyBMb2Nh
bGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAgNGNjMDBmMGUzM2FjOGUw
ODliMzdkOGExNDc0YmU0NDFiMjYzMTFiZGMxNmZlMDM1Yzc1YjUxMjAxNTE1ZjYxNyAgTElDRU5T
RQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1hZXJpY2gvcHl0aG9uLWFlcmljaC5tayBi
L3BhY2thZ2UvcHl0aG9uLWFlcmljaC9weXRob24tYWVyaWNoLm1rCj4gaW5kZXggYmI1NjhkNjQy
Zi4uOGI1NGRlNzU1YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1hZXJpY2gvcHl0aG9u
LWFlcmljaC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWFlcmljaC9weXRob24tYWVyaWNoLm1r
Cj4gQEAgLTQsOSArNCw5IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAg
Cj4gLVBZVEhPTl9BRVJJQ0hfVkVSU0lPTiA9IDAuOC4xCj4gK1BZVEhPTl9BRVJJQ0hfVkVSU0lP
TiA9IDAuOC4yCj4gICBQWVRIT05fQUVSSUNIX1NPVVJDRSA9IGFlcmljaC0kKFBZVEhPTl9BRVJJ
Q0hfVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9BRVJJQ0hfU0lURSA9IGh0dHBzOi8vZmlsZXMu
cHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy80Zi80MS8zYzQ3OGI3YTM0NGFiZGE4NjZmMmM2NDRi
MDU2ZWJhZTYzODQ5OWJiZTBlZWMwMDEwZTczNjEyMTE3NzQKPiArUFlUSE9OX0FFUklDSF9TSVRF
ID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2RjL2QxLzcwMWE0NGQ4
ZjdmZGNjZjcwMDQwMGNlMTZhMjZjNjc5YjNmNGUzNmRlOWZiODZjM2Q5ZjU1ZjY0YjA3Zgo+ICAg
UFlUSE9OX0FFUklDSF9TRVRVUF9UWVBFID0gcG9ldHJ5Cj4gICBQWVRIT05fQUVSSUNIX0xJQ0VO
U0UgPSBBcGFjaGUtMi4wCj4gICBQWVRIT05fQUVSSUNIX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
