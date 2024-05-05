Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FC9C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 07:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 752BF40B3F;
	Sun,  5 May 2024 07:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwT8nHa-Eyxg; Sun,  5 May 2024 07:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B51F40B2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B51F40B2B;
	Sun,  5 May 2024 07:21:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B92AC1BF3D9
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 07:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B18E540B3E
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 07:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glw-KcpXCWA5 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 07:21:44 +0000 (UTC)
X-Greylist: delayed 568 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 05 May 2024 07:21:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E757840B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E757840B27
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.71;
 helo=fallback16.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E757840B27
 for <buildroot@buildroot.org>; Sun,  5 May 2024 07:21:42 +0000 (UTC)
Received: from [10.12.4.27] (port=53702 helo=smtp53.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1s3W2d-007amJ-Mv; Sun, 05 May 2024 10:12:12 +0300
Received: by smtp53.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1s3W0E-0000000AxIL-0N13; Sun, 05 May 2024 10:09:42 +0300
Message-ID: <5bb1d51e-1022-412a-9905-c4718f008ad5@inbox.ru>
Date: Sun, 5 May 2024 10:09:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240504093446.376426-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20240504093446.376426-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD949E5EAB5516A8929DE075C24D8BAFAB57312B5E9C7B6EDB7182A05F5380850404C228DA9ACA6FE27240D2EC2FAC12C8BC591814E25D11F9FC80EC517F88CC0C8069E0A1952811F620134F15712FB01B7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE766DBE83FD69AB645EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D8F1FE4E764DFCDEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F369BA07AB32890B2F6D3C98B702585DDE4897B5BC0CFFFA2E41DF9E95F17B0083B26EA987F6312C9EC9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6F459A8243F1D1D44CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7D699F3A2029486C7731C566533BA786AA5CC5B56E945C8DA
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A58A12EA1E5A9D90C35002B1117B3ED69639F6ACAFE4EAB52003803A57F48E4E5A823CB91A9FED034534781492E4B8EEAD3C056C6FCE5AFF8EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6C4E657C8961062B10A371086A0B589FA6CC981F0464D455C9CA54D9CBEB39DA136DDA45E01CE4BE643425263F8C9A4EA5B0E090852B21E773DFE4C242CEDE1BC682AEA468C70F3E9F49EEF1215E7BEC913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojruI+vc517qBovp3QrlpPeQ==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BEA449DF379E905B64FE996F258EFA8994B976EE4A3756D9B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B476D451B6D5EC61443FB7C766EB7E199298030C10CF604F9468F3CF0E9FE49B6907DBB6C656FEAD1DE82B2828711F56BB27B15E08CDB53B5F07CA5CEC29B6E659
X-7FA49CB5: 0D63561A33F958A5AED0CC92716876FCAB6B6B2B9A9260D6F83924441EDA71C6CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006378214201309F6546C389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8706E30CA52318619F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE76515C59FC18CEA6D731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojruI+vc517qClzci25wMojA==
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=d1v1BYV0iIpteoHMngviToWAf4rRiUPSaz336svzoIA=; 
 t=1714893704;x=1714983704; 
 b=P5ripTS9WKKGgf9EpFFrngTHoYl7eSyJlLZneztqo7/KYYv1Bu8X9hsZOhqVwtDiDuLdqdPoT2Y6KWHRgfkmJJfqFHv9hIn6ZVFUroSFdluab0oUX7nAUwsBrFraDOLQbIzw6+d3uTVe0xZp38CeSfK8eyEY2yo+jmoidn1gXBlS9IJ2ZhIK5jyRK+4HH2lkGder413h2K8foeP8zOhAqQarnsXRRY7uk8j78eJZ9f+mgM7HEASMket7VsR+NVUi1mUP3MAm8zSHIAIC3Va0NFLpLc4L4r9b5LngV0pKkTBRCqZu4W/Z+BVOupKS7YWf5/RRkYXBYyMc/W0ro8/QJw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=d1v1BYV0iIpteoHMngviToWAf4rRiUPSaz336svzoIA=; t=1714893131; x=1714983131; 
 b=oCzHMZVa9IkuX+HC11kcWojYDZJBvO0xpabrgOAAUxYM2BrCccMwJrlj3u/iv6QDPbIWrCAnfZ0
 AuRB/kmSLMJJhhdSldbPlucEQCGd8Akj9E8Tlhl+6i1OOnJoitd6rWUVt2zHmceIPu23kRvlR3pso
 5CoIxEx0Ec4B1GCEpv44QmPEA1ElRmJUtdwEiVLnuOpYUGU1uJT1JhxaaqV1qszhR2B8aW0DLVS/n
 40FGuIzTHWbmmGbKQTf3W/03WrSamqPjpWwClMkOH7ENjtlA7LrAZf4InWsG7kEtu35SxsZA4tAz3
 XPu9KdjSLmhvoff/lInIrsR4T+nlPLn+ml+A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=P5ripTS9; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=oCzHMZVa
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: needs NPTL
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Dominik Michael Rauh <dmrauh@posteo.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MDQuMDUuMjAyNCAxMjozNCwgRmFicmljZSBGb250YWluZSDQv9C40YjQtdGCOgo+IE5QVEwgaXMg
bWFuZGF0b3J5IHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiA5LjMuMCBpbiBjb21taXQKPiA1N2FiYTAz
M2U2Y2M4MWI5NWQwMDYyMjdjNDVhMTVlYjNmYzc3ZDA3IGFuZAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9PU0dlby9QUk9KL2NvbW1pdC9jZTA4MDI1MTIyNWQxNmUxMWUxMzlhNWViZTA3Y2Y2MDhmZTAy
MmIyOgo+IAo+IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL3Byb2ot
OS4zLjAvc3JjL2lzbzE5MTExL2ZhY3RvcnkuY3BwOiBJbiBtZW1iZXIgZnVuY3Rpb24gJ3N0ZDo6
c2hhcmVkX3B0cjxvc2dlbzo6cHJvajo6aW86OlNRTGl0ZUhhbmRsZT4gb3NnZW86OnByb2o6Omlv
OjpTUUxpdGVIYW5kbGVDYWNoZTo6Z2V0SGFuZGxlKGNvbnN0IHN0ZDo6c3RyaW5nJiwgUEpfQ09O
VEVYVCopJzoKPiAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC9wcm9q
LTkuMy4wL3NyYy9pc28xOTExMS9mYWN0b3J5LmNwcDo2MjI6OTogZXJyb3I6ICdwdGhyZWFkX2F0
Zm9yaycgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1lYW4gJ3B0aHJl
YWRfYXR0cl90Jz8KPiAgICA2MjIgfCAgICAgICAgIHB0aHJlYWRfYXRmb3JrKG51bGxwdHIsIG51
bGxwdHIsCj4gICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ICAgICAgICB8ICAgICAg
ICAgcHRocmVhZF9hdHRyX3QKPiAKPiBGaXhlczogNTdhYmEwMzNlNmNjODFiOTVkMDA2MjI3YzQ1
YTE1ZWIzZmM3N2QwNwo+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy8zOTI2NjQzNzVjNWJjNWYwNDdkMzliZmYzMTUzNGEyMjZlOGVhNTI2Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpSZXZp
ZXdlZC1ieTogTWF4aW0gS29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
