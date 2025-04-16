Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DB5C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0CB6F687;
	Wed, 16 Apr 2025 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lky3HmtjLMiJ; Wed, 16 Apr 2025 21:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 432576F59A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 432576F59A;
	Wed, 16 Apr 2025 21:00:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4974920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B5B81E08
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3D9PCCHhVzE for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7371782F96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7371782F96
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7371782F96
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C0091C1026; Wed, 16 Apr 2025 23:00:32 +0200 (CEST)
Message-ID: <fd971d0f-570f-4599-ab6a-f21f08391f93@rnout.be>
Date: Wed, 16 Apr 2025 23:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250321162108.1852085-1-flavio.tapajos@newtesc.com.br>
Content-Language: en-GB
In-Reply-To: <20250321162108.1852085-1-flavio.tapajos@newtesc.com.br>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zgyvJJX0mZCCtzooZPueNDnd/y927c7B8K/lAwJF6Qo=;
 b=eQlfjTDO/wdCFcOvVZixuZSms4I2cHQTerIRFiQm5PW+6Li8KY0jLc4OZDHcfk9UO4a7oB
 3Oxnx4GBFMBTviZrsZNFNFZzvwbBgxxDjirQ6PW8hiozNOqfOn77YlflQHdxwsuw9VN/ob
 EHArjkid4tZ3X/OwHjpP0BRPCeyQ9B9DSCG0ReR48iCxsGmmcATRqkx6aHn80l6w+iyn/K
 hr5ic38KJMrMQd/HbHnnNXXa/HlkcGNqSQ49R8QS8K2CL8RQUp5Wf0095Bm+dsTCKuK7b+
 41X4U06GqP8dyv0StdS96D/Q3sxZJmcoIqO+lUcCY8Q7dMdHyL51Rjnzw4GEkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.0.39
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

Ck9uIDIxLzAzLzIwMjUgMTc6MjEsIEZsw6F2aW8gVGFwYWrDs3Mgd3JvdGU6Cj4gRm9yIGNoYW5n
ZSBsb2csIHNlZToKPiBodHRwczovL2RvY3Muc3FsYWxjaGVteS5vcmcvZW4vMjAvY2hhbmdlbG9n
L2NoYW5nZWxvZ18yMC5odG1sI2NoYW5nZS0yLjAuMzkKPgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgoKIMKgQXBwbGllZCB0
byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaCB8IDQgKystLQo+
ICAgcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayAgIHwgNCAr
Ky0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNo
ZW15Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhh
c2gKPiBpbmRleCBhYTk4ODhiNThkLi5jNjZlZTQ0ZTkxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaAo+ICsrKyBiL3BhY2thZ2Uv
cHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaAo+IEBAIC0xLDUgKzEsNSBA
QAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15
L2pzb24KPiAtbWQ1ICAzY2JmMjE4YzU0YjI1ZmE0ZTE4ZDc4ODQyOTU2NjAxZCAgc3FsYWxjaGVt
eS0yLjAuMzgudGFyLmd6Cj4gLXNoYTI1NiAgZTVhNGQ4MmJkYjRiZjFhYzEyODVhNjhlYWIwMmQy
NTNhYjczMzU1ZDlmMGZlNzI1YTk3ZTFlMGZhNjg5ZGVjYiAgc3FsYWxjaGVteS0yLjAuMzgudGFy
Lmd6Cj4gK21kNSAgNGFlY2I4ZDNiMWQwNzdkNjA5OWMxZjhlZDE4MzY3YTQgIHNxbGFsY2hlbXkt
Mi4wLjM5LnRhci5nego+ICtzaGEyNTYgIDVkMmQxZmU1NDhkZWYzMjY3YjRjNzBhODU2OGYxMDhk
MWZlZDdjYmJlY2NiOWNjMTY2ZTA1YWYyYWJjMjVjMjIgIHNxbGFsY2hlbXktMi4wLjM5LnRhci5n
ego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAgOTgy
MTcyMGI1OGQ0YTU2NWI2MTMyMTAwN2E4YWQ0M2FiNjk5MWEzOTU5ZTY2Y2Q1ZGI0ZGQ5ZWFlNjlj
N2RmYyAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5
dGhvbi1zcWxhbGNoZW15Lm1rIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3Fs
YWxjaGVteS5tawo+IGluZGV4IDNhOWQ5ZTA2YjYuLjI2ZDdkMzA4YjkgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tawo+ICsrKyBiL3Bh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKPiBAQCAtNCw5ICs0
LDkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtUFlUSE9OX1NR
TEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4zOAo+ICtQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OID0g
Mi4wLjM5Cj4gICBQWVRIT05fU1FMQUxDSEVNWV9TT1VSQ0UgPSBzcWxhbGNoZW15LSQoUFlUSE9O
X1NRTEFMQ0hFTVlfVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9TUUxBTENIRU1ZX1NJVEUgPSBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZTQvMDgvOWE5MDk2MmVhNzJh
Y2Q1MzJiZGE3MTI0OWE2MjYzNDRkODU1YzQwMzI2MDM5MjRiMWI1NDc2OTRiODM3Cj4gK1BZVEhP
Tl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMDAvOGUvZTc3ZmNhYTY3ZjhiOWY1MDRiNDc2NDU3MDE5MWUyOTE1MjQ1NzVkZGJmZTc4YTkw
ZmM2NTZkNjcxZmRjCj4gICBQWVRIT05fU1FMQUxDSEVNWV9TRVRVUF9UWVBFID0gc2V0dXB0b29s
cwo+ICAgUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRSA9IE1JVAo+ICAgUFlUSE9OX1NRTEFMQ0hF
TVlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
