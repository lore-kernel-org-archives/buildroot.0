Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F927C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 04:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68EDF60613;
	Mon, 18 Mar 2024 04:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wn6OJSWpTaur; Mon, 18 Mar 2024 04:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C656061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C656061B;
	Mon, 18 Mar 2024 04:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4EDC1BF403
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 04:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A25E26061B
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 04:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGCuyUG8UHfk for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 04:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.71;
 helo=smtp30.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFBD160613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFBD160613
Received: from smtp30.i.mail.ru (smtp30.i.mail.ru [95.163.41.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFBD160613
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 04:58:42 +0000 (UTC)
Received: by smtp30.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rm555-00000005zbN-0MNv; Mon, 18 Mar 2024 07:58:39 +0300
Message-ID: <0ef81727-9165-4f87-a04c-7e6e86dd639e@inbox.ru>
Date: Mon, 18 Mar 2024 07:58:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317220028.1497643-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20240317220028.1497643-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597D21AFE2E000C69B1FBAF020A234192257182A05F5380850406FCB106F933301F6D27678DDAA806314089047272B62403C26A771D7B8A9CD90C7D374717D2CC177
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE788A2BECDB72E1542EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC18FED211962C318638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BAAC4A958E2BEE86DB062FD1AA601D8A1A8813EE7B204CDC20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD181150BA43C84913FC3A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A578F58F6F63D862305002B1117B3ED696D174C152ECE688B9CA7E60A991436CA2823CB91A9FED034534781492E4B8EEADCF86CE9B81855096
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF516ADE3C4C5FF79F4FA22516F7CC8F90A6F72C9504E6D8D47208EC7BD7019BAC543A65BC901B9540E1E51F4E63A65834E7B0232FB8E1F9C62B57AC52F132B95878B2490F30C97214111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojKEbXFKsUiMlGGVaGVCESYw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE337D64B2E5A5DF4200DC1E508B5BB7D0E63768BACD2A68C20B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=bd0Cynm2R3m7uWNi9MZnvxBQQcdEIDRUxpWR1Pcfy4k=; t=1710737924; x=1710827924; 
 b=oa3jS9f3ibkZxcEC/ASYbKs2K4tEghBFREnG3hASmtTHUNxqy1LMhdauBu4ql0hH8vZC56afUSz
 ij3r8MBuJrxuE4kXu1Afzaa/Ny9ziuwNTiG8UkUtsOMiahkltz7ntyjXwQffDkqbsO6wreBj6GmWE
 Iv7fAuvYUz+rE1fYEpBlldw0BM1WdIDajl0ry8WRUEW1ypk7vwjzne6fJQIsPerWzK882HoUyAJWz
 TDodexApyaGXjyxUNywP2tBO4sK/oOh6lQJWtLt2odCZe9kO4i7B2MtFgQKD0fZjYOtDKDVwbqH50
 XOp776DbaWEHXqXibzYLl4widXba3N6+ytfg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=oa3jS9f3
X-Mailman-Original-Authentication-Results: smtp30.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/osm2pgsql: only supports 64 bits
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

MTguMDMuMjAyNCAwMTowMCwgRmFicmljZSBGb250YWluZSDQv9C40YjQtdGCOgo+IG9zbTJwZ3Nx
bCBvbmx5IHN1cHBvcnRzIDY0IGJpdHMgYXJjaGl0ZWN0dXJlcyBzaW5jZSBidW1wIHRvIHZlcnNp
b24KPiAxLjEwLjAgaW4gY29tbWl0IGUwNTZhZWVjYTljZjhjMDBjNmRhNjJjMzk5NzljZTZjNTVj
OTI3OTEgYW5kCj4gaHR0cHM6Ly9naXRodWIuY29tL29zbTJwZ3NxbC1kZXYvb3NtMnBnc3FsL2Nv
bW1pdC8zODk5MDQyNjlhMWIxZjI0NjY0MWQyMDNhYmFkZmNkNWNlYmI5N2NjCj4gcmVzdWx0aW5n
IGluIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGFybToKPiAKPiBDTWFrZSBFcnJv
ciBhdCBDTWFrZUxpc3RzLnR4dDoyMCAobWVzc2FnZSk6Cj4gICAgb3NtMnBnc3FsIG5lZWRzIGEg
NjQgYml0IGFyY2hpdGVjdHVyZQo+IAo+IEZpeGVzOiBlMDU2YWVlY2E5Y2Y4YzAwYzZkYTYyYzM5
OTc5Y2U2YzU1YzkyNzkxCj4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzLzMwYzI2NzVhNzMyZmQ4MTBjNjhkZmZiYjY0ODNmOWNmOGU0ZmNiZjMKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KClJl
dmlld2VkLWJ5OiBNYXhpbSBLb2NoZXRrb3YgPGZpZG9fbWF4QGluYm94LnJ1PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
