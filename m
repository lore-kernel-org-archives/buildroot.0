Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2890EC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 14:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60EC60E2E;
	Sat, 13 Aug 2022 14:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A60EC60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 926vLk8qAsNJ; Sat, 13 Aug 2022 14:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D708760E1A;
	Sat, 13 Aug 2022 14:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D708760E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA51F1BF57F
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 14:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EC38414C2
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 14:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EC38414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id geW7rdpg6t3r for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 14:22:15 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BA5414C0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65BA5414C0
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 14:22:14 +0000 (UTC)
Received: from [172.20.10.5] ([151.43.52.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Mruso0k3GAaN9MrutodGms; Sat, 13 Aug 2022 16:15:08 +0200
Message-ID: <338aa94e-11ae-ae5b-dab0-ec90bfe956c9@benettiengineering.com>
Date: Sat, 13 Aug 2022 16:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
References: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
 <CAPn86JAWEZNtkMjdD-fMAyiiW1-vfmzM=79qV7wgmiy7XHbJ-A@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPn86JAWEZNtkMjdD-fMAyiiW1-vfmzM=79qV7wgmiy7XHbJ-A@mail.gmail.com>
X-CMAE-Envelope: MS4xfG7sfC4UE2h9Eiz2Cip8k1PWu/J0zXXn1pdF8tpBzGSc7FRjqUjO5L8DDMttUQstSyprCNqggQB+BDJhWsMXlbthwtsWRPQhjLEAOu704apJezMUg81l
 bZQ4+IejfgEkRKOMWYbGQD5W/HRdLNYGbxka42w7zRP29O+6G02mOxCm+g5GVceHBvstLrD+KW+oAAEM11tDwjk3Eq1iuecKLhKC0rGCoZ+zIdd5QUbnHSCt
 G44wCc3k39/lYDua2qJWMw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660400108; bh=enZIARwfnqt1xMw8ngkCnhOB6g7gU2KW6cHe2+s85Gc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HrWtAyvqDtsLBkJDwhZL7jOUktHoemKxTfjn7IYt4+Vw7fXjIfk+jDt4RV3eDJxVZ
 O4Xys9fKxk23Ht2OPKYKPY4e24RS0YI72xukXMWlch8F1fK2/Ev83oBquy6SIqVpJF
 H76yi5gVVyOC7qo++d2Fq5rZkq1HZX5Wjf4yKG4aufCFrJKTv59Kwz/VnwjjRxG1ll
 eZuUQ7bUeasz8KPxtb0Ueb2Dde89GCH2IiQA5SHbqlSoo2Iv0oksnY48gRb/ZjxG9W
 YgZW2aHaSkJiSFg+hL6vv1j44dbW1TM2iav9Nj9pL7PKu4WmHU+U0UDsxEfGNeUDEs
 bpQQqZRHhXWtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HrWtAyvq
Subject: Re: [Buildroot] [PATCH 0/2] Fix Opencv4 bug found by a user in
 Mailing list
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFubywKCkkgYWRkIE1MIGluIENjLAoKT24gMTMvMDgvMjIgMTY6MDYsIFN0ZWZhbm8g
Q290dGFmYXZpIHdyb3RlOgo+IEhpIEdpdWxpbywKPiBzb3JyeSBmb3IgdGhlwqBsYXRlIHJlcGx5
IGJ1dCBoYXZlIGJlZW4gZGlzdHJhY3RlZCBieSBtb3JlIHByZXNzaW5nIGlzc3Vlcy4KCk5vIHBy
b2JsZW0KCj4gVG9kYXkgSSBtYW51YWxseSBhcHBsaWVkIHRoZSBwYXRjaGVzIGFuZCB0aGV5IHdv
cmtlZCBsaWtlIGEgY2hhcm0uCj4gSW4gdGhlIG1lbnVjb25maWcgZGVwZW5kZW5jaWVzIGFyZSBz
ZWxlY3RlZCBhdXRvbWF0aWNhbGx5IGFzIGV4cGVjdGVkCj4gYW5kIHRoZSBtb2R1bGVzIGFyZSBi
dWlsdCBmaW5lIGFuZCBleHBvcnRlZCB0byB0aGUgc2RrLgoKVGhhbmsgeW91IGZvciB0ZXN0aW5n
LgoKPiBUaGFua3MgYSBsb3QgZm9yIHRoZSBzdXBwb3J0LgoKWW91J3JlIHdlbGNvbWUgOi0pCgo+
IGNpYW8KCkNpYW8KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdp
bmVlcmluZyBzYXMKCj4gU3RlZmFubwo+IAo+IAo+IE9uIE1vbiwgQXVnIDgsIDIwMjIgYXQgMTI6
MjUgQU0gR2l1bGlvIEJlbmV0dGkgCj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20gCj4gPG1haWx0bzpnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPj4g
d3JvdGU6Cj4gCj4gICAgIFRoZXNlIHBhdGNoZXMgZml4ZXMgYSBidWcgU3RlZmFubyBDb3R0YWZh
dmkgZm91bmQgYW5kIGFza2VkIGhlbHAgZm9yIGluCj4gICAgIE1haWxpbmcgTGlzdDoKPiAgICAg
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1BdWd1
c3QvNjQ4NjE2Lmh0bWwgPGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVp
bGRyb290LzIwMjItQXVndXN0LzY0ODYxNi5odG1sPgo+IAo+ICAgICBJdCB0dXJucyBvdXQgdGhh
dCBvcGVuY3Y0IGxpYnJhcnkgb2JqZGV0ZWN0IHJlcXVpcmVzIGxpYnJhcnkgZG5uIGFuZAo+ICAg
ICB0aGF0Cj4gICAgIGFsc28gZG5uIGxpYnJhcnkgcmVxdWlyZXMgcHJvdG9idWYuIFNvIHRoaXMg
cGF0Y2hzZXQgc2VsZWN0IGJvdGggb3B0aW9ucwo+ICAgICBhY2NvcmRpbmdseS4KPiAKPiAgICAg
QFN0ZWZhbm8sIGlmIHlvdSBjYW4sIHBsZWFzZSBnaXZlIGEgdHJ5IHRvIHRoZXNlIDIgcGF0Y2hl
cyB3aXRob3V0Cj4gICAgIGVuYWJsaW5nIHRoZSAyIG9wdGlvbnMgSSd2ZSBwb2ludGVkIHlvdSBp
biBNYWlsaW5nIExpc3QgYnkgaGFuZCBhbmQKPiAgICAgcmVwb3J0Cj4gICAgIHRoZSByZXN1bHQu
Cj4gCj4gICAgIFRoYW5rIHlvdSEKPiAKPiAgICAgR2l1bGlvIEJlbmV0dGkgKDIpOgo+ICAgICAg
wqAgcGFja2FnZS9vcGVuY3Y0OiBCUjJfUEFDS0FHRV9PUEVOQ1Y0X0xJQl9ETk4gcmVxdWlyZXMg
cHJvdG9idWYKPiAgICAgIMKgIHBhY2thZ2Uvb3BlbmN2NDogQlIyX1BBQ0tBR0VfT1BFTkNWNF9M
SUJfT0JKREVURUNUIHJlcXVpcmVzCj4gICAgICDCoCDCoCBCUjJfUEFDS0FHRV9PUEVOQ1Y0X0xJ
Ql9ETk4KPiAKPiAgICAgIMKgcGFja2FnZS9vcGVuY3Y0L0NvbmZpZy5pbiB8IDIgKysKPiAgICAg
IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+ICAgICAtLSAKPiAgICAgMi4z
NC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
