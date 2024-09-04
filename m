Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D925CA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 05:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DDF6080F;
	Wed,  4 Sep 2024 05:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1j3cao1EAEDK; Wed,  4 Sep 2024 05:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA6160815
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA6160815;
	Wed,  4 Sep 2024 05:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF0C81BF3D5
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A70994048D
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-Z0yxetCi78 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 05:52:47 +0000 (UTC)
X-Greylist: delayed 86779 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Sep 2024 05:52:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E82A4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E82A4022B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.94;
 helo=smtp56.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E82A4022B
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 05:52:46 +0000 (UTC)
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1sliwc-00000009VM2-3RpA
 for buildroot@buildroot.org; Wed, 04 Sep 2024 08:52:43 +0300
Message-ID: <ad25f096-cb58-44d3-a312-d6e698f341e7@inbox.ru>
Date: Wed, 4 Sep 2024 08:52:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240903054622.14033-1-fido_max@inbox.ru>
 <20240903224542.0ecdef27@windsurf>
Content-Language: en-US
In-Reply-To: <20240903224542.0ecdef27@windsurf>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD90E1F90BB1B8DBC18753E8044B2460E95F46DB733A83A0C9C182A05F538085040F6904C013C2DBD495D1BE6A8D71B10A58F35CA81F0D92C011FD06A70994CB02BB939BEC6D9612482
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D950999244A4B2E6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370B00D9E95F138F938638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83B060B07E62E0249BBCF0D72BA18FAB6D573BE621A0D7C6E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C078FCF50C7EAF9C588941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDC0F6C5B2EEF3D0C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A54B50DA6C1195C9525002B1117B3ED69609990D61227A54DAB48B7A7F94616420823CB91A9FED034534781492E4B8EEAD37F46C620FF2CAEEBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3472E5ECC12A9739C118E9EE619CE6B88A89D3866AAD540C6F05ABE8E1C7C66A69129FD3E61A11720D1D7E09C32AA3244C05C3D777AB70F419E70D6F05539DA95A6653145A1A1DDC4BEA455F16B58544A2C99F59F2F009F09657ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpeIfmLQPsUKmmCKrbqZSVw==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B36D214ED2485168C9AB9D4A7108289376361AE20CE7BEE7690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=zX7xvhdcEiWPAWE7TRY7dpDgCQQDjepHBuVnBbaTARo=; t=1725429167; x=1725519167; 
 b=F4YSrZyOaiZ9ms6jCPyzQsvbdOvPpIgZNi8bulSBeiaJ+rwNHqOW8v77q1WbIjBPLHhslAt01QH
 7MjtuiQiOXTstPtJaL7OeS5gNQ48lpcXp0uYQ/sdFr2V17EPpEm0DMdfjmYazCzMTjZlvp15WZFBC
 4hwvI5PPKnIzYT5Bhtm1V/s7Z5vxqvl64cSwJ9FsnP0z2kTakAeK8oLMDAw1DaBBeXPBTEsk46j7r
 v8ckSranbhs6YbWDiQ3h61VT+fZTK8vbaFMnfadQA7XaGOOInkLVYl5qEzQZs7crsyLX0QoSSoJXy
 eqzrSeYji0pkxUTRVe5z+/p0CBoOFRQanggQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=F4YSrZyO
X-Mailman-Original-Authentication-Results: smtp56.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: needs threads
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MDMuMDkuMjAyNCAyMzo0NSwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290INC/0LjRiNC1
0YI6Cgo+IEFsc28sIGFub3RoZXIgdGhpbmcgaXMgdGhhdCBwb3N0Z3Jlc3FsLm1rIGhhczoKPiAK
PiBpZm5lcSAoJChCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwpLHkpCj4gUE9TVEdSRVNR
TF9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXRocmVhZC1zYWZldHkKPiBlbmRpZgo+IAo+IHNvIGRv
ZXMgaXQgbWVhbiB0aGF0IHRoaXMgb3B0aW9uIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQ/IE5vIGxv
bmdlcgo+IGV4aXN0cz8KCkl0IGlzIHRvdGFsbHkgZHJvcHBlZCBpbiBQRyAxNzoKaHR0cHM6Ly9n
aXRodWIuY29tL3Bvc3RncmVzL3Bvc3RncmVzL2NvbW1pdC82OGE0YjU4ZWNhMDMyOTE2ZTJhYWQ3
OGQ2M2Y3MTdkY2IxNDdlOTA2CkJ1dCBpdCBpcyBub3QgcmVsZWFzZWQgeWV0LCBhbmQgdGltZXNj
YWxlZGIgaGF2ZSBubyBQRyAxNyBzdXBwb3J0LgpJdCBpcyBsb29rcyBsaWtlIGNvbW1pdApodHRw
czovL2dpdGh1Yi5jb20vcG9zdGdyZXMvcG9zdGdyZXMvY29tbWl0LzUyYWZlNTYzMjA2ZTc1M2Y0
YzQ1YzAxNGZlZTI0NTlhZDA4NTU4MjYKaXMgd3JvbmcuIEl0IGhhcyBubyAjaWZkZWYgRU5BQkxF
X1RIUkVBRF9TQUZFVFkgZ3VhcmQuIEFsbCBvdGhlciBjb2RlIAp3aXRoIHB0aHJlYWRzIGhhcyB0
aGlzIGd1YXJkOgoKI2lmZGVmIEVOQUJMRV9USFJFQURfU0FGRVRZCgkvKiBJbnRlcmxvY2sgYWdh
aW5zdCBjb25jdXJyZW50IGV4ZWN1dGlvbnMgb2YgRUNQR2RlYnVnKCkgKi8KCXB0aHJlYWRfbXV0
ZXhfbG9jaygmZGVidWdfaW5pdF9tdXRleCk7CgoJLyogUHJldmVudCBlY3BnX2xvZygpIGZyb20g
cHJpbnRpbmcgd2hpbGUgd2UgY2hhbmdlIHNldHRpbmdzICovCglwdGhyZWFkX211dGV4X2xvY2so
JmRlYnVnX211dGV4KTsKI2VuZGlmCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
