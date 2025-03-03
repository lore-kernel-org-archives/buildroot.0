Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A49C282C6
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 08:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2869782251;
	Mon,  3 Mar 2025 08:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYVth4xYB0Xp; Mon,  3 Mar 2025 08:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2392181FFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2392181FFD;
	Mon,  3 Mar 2025 08:45:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD90C1
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 08:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E74181FFD
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 08:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_wjdKnIe8BB for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 08:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.59;
 helo=send220.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE4E180D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4E180D56
Received: from send220.i.mail.ru (send220.i.mail.ru [95.163.59.59])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE4E180D56
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 08:45:40 +0000 (UTC)
Received: by exim-smtp-848fbd8fb5-p2bkw with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tp1Qf-000000008I3-3Jpx; Mon, 03 Mar 2025 11:45:38 +0300
Message-ID: <815fd442-fa19-40ae-b532-95c59dc3a938@inbox.ru>
Date: Mon, 3 Mar 2025 11:45:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250302143758.300057-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250302143758.300057-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9A2A28D6C22EE4403703944EF88FFFE79DC09D13211334956182A05F538085040DD8A9A3CC884A2143DE06ABAFEAF6705B642F69D59B9226F7131FA8B760EF6E5AF99FB5340185B15
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CE4525FFB91B9BBCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566AE3F01DD33DDBDC83232FA9E1EFECC0DDB8B2D05898CCCD1DE5E6A96FDFC86F28EEF46B7454FC60B9742502CCDD46D0D2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249D99FB7B2A39B4961CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0D8A2A801FEBEAF8D8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C315AF0D0D4FC4FA3D35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A58DB2B8013C0592FA5002B1117B3ED6967C62201FC6DEC5614A0A47EBA01A636A823CB91A9FED034534781492E4B8EEAD27E9584FBD6BDD31BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF002F47EB1E3677F4E10B3A1E9FDC5A17198966A886845FE9D48352C7C6195EC6EBD4E4314DA780652C10F42E4F22A8B68F93ADD4BA868C459FF4CB1D2593D3E337F144B8F1047F15111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVQQG/FugD0/Cno0AK821IXE=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2195EA61A56B2E3B720FACDBAC72E059C37855EEBB9C03294E190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=ayMBI3wgqo3G4VXVPOMXmFj9XOisB2y9NdnvYA8syfE=; t=1740991541; x=1741081541; 
 b=R+jnk+f1JatJ6lh3Cx9FHuBIAt18hEpne32jA3FR0c17vdmsaffSg4zvPeQNUjjxd0jcx1XarJI
 XEamwjaTFu8krS81sx04zkgP/IfMIHkuIhUY0qsJFYFDe9kjV3hfUdZjnn9KZdGmUZum0AuGla+pd
 X2kc+FCPYi0zGr2YEvVcXjUxpobjdDhYnZJYY1o+gDoR02ndwjFabHDhryr5mheC5dObFi4HFhTna
 W+dIjv12qIOYdliHGkh11izQsB3gvP1g/4Wm6WUYi6l9LKhzt/yV39bf2N6p0Qi2/OpWPrwdzBavA
 q6hkiLdEjCJmK57LgH/LLgmlvINbRyfxdc6g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=R+jnk+f1
X-Mailman-Original-Authentication-Results: exim-smtp-848fbd8fb5-p2bkw;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 2024.02.x] package/postgresql: bump version
 to 16.8
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MDIuMDMuMjAyNSAxNzozNywgU2NvdHQgRmFuINC/0LjRiNC10YI6Cj4gUmVsZWFzZSBub3RlczoK
PiBodHRwczovL3d3dy5wb3N0Z3Jlc3FsLm9yZy9kb2NzL3JlbGVhc2UvMTYuOC8KPiBodHRwczov
L3d3dy5wb3N0Z3Jlc3FsLm9yZy9hYm91dC9uZXdzL3Bvc3RncmVzcWwtMTc0LTE2OC0xNTEyLTE0
MTctYW5kLTEzMjAtcmVsZWFzZWQtMzAxOC8KPiAKPiBVcGRhdGVkIGxpY2Vuc2UgaGFzaCBkdWUg
dG8gY29weXJpZ2h0IHllYXIgYnVtcDoKPiBodHRwczovL2dpdC5wb3N0Z3Jlc3FsLm9yZy9naXR3
ZWIvP3A9cG9zdGdyZXNxbC5naXQ7YT1jb21taXRkaWZmO2g9NzU5NjIwNzE2YWRiMzQ3YzFkOGM4
YjJlNmY3ZDg4Yjk0N2E1NGM5OAo+IAo+IFNpZ25lZC1vZmYtYnk6IFNjb3R0IEZhbiA8ZmFuY3Ay
MDA3QGdtYWlsLmNvbT4KPiAtLS0KPiAgIHBhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhh
c2ggfCA2ICsrKy0tLQo+ICAgcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsgICB8IDIg
Ky0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoIGIvcGFj
a2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwuaGFzaAo+IGluZGV4IDExYzBlNzdiMDUuLjVjN2E0
NjZhOGYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwuaGFzaAo+
ICsrKyBiL3BhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhhc2gKPiBAQCAtMSw0ICsxLDQg
QEAKPiAtIyBGcm9tIGh0dHBzOi8vZnRwLnBvc3RncmVzcWwub3JnL3B1Yi9zb3VyY2UvdjE2Ljcv
cG9zdGdyZXNxbC0xNi43LnRhci5iejIuc2hhMjU2Cj4gLXNoYTI1NiAgNjJlMDJmNzdlYmZjNGEz
N2YxNzAwYzIwY2MzY2NkODVmZjc5N2I1NjEzNzY2ZWJmOTQ5YTc4OTliYjIxMTNmZSAgcG9zdGdy
ZXNxbC0xNi43LnRhci5iejIKPiArIyBGcm9tIGh0dHBzOi8vZnRwLnBvc3RncmVzcWwub3JnL3B1
Yi9zb3VyY2UvdjE2LjgvcG9zdGdyZXNxbC0xNi44LnRhci5iejIuc2hhMjU2Cj4gK3NoYTI1NiAg
OTQ2ODA4M2E1NmNlMGVlN2QyOTQ2MDFiNzRkYWQzZGQ5ZmM2OWQ4N2FmZjYxZjBhOWZiNjNjODEz
ZmY3ZWZkOCAgcG9zdGdyZXNxbC0xNi44LnRhci5iejIKPiAgICMgTGljZW5zZSBmaWxlLCBMb2Nh
bGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICA5YmYyMGVlNDkzOTI2YTdlMTdhNzRiYzdmMDUwODlm
YmMwMTQyNjk2NjdiMTU0MGJjMzVhNmIxOTRhNDBjOWRlICBDT1BZUklHSFQKPiArc2hhMjU2ICBl
MzgyMmM0Nzk3ZmFkY2FiMzFhM2ZjNzNmNzVjMjhhYzIwYzczZDcyYjU2NWRhOTFlOTk3NGNmOTM5
OGVmNGQyICBDT1BZUklHSFQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3Rn
cmVzcWwubWsgYi9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5tawo+IGluZGV4IGY0YjM4
NGVkODIuLjQ5ZjBjMGRlNzAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3Rn
cmVzcWwubWsKPiArKysgYi9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5tawo+IEBAIC00
LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1QT1NU
R1JFU1FMX1ZFUlNJT04gPSAxNi43Cj4gK1BPU1RHUkVTUUxfVkVSU0lPTiA9IDE2LjgKPiAgIFBP
U1RHUkVTUUxfU09VUkNFID0gcG9zdGdyZXNxbC0kKFBPU1RHUkVTUUxfVkVSU0lPTikudGFyLmJ6
Mgo+ICAgUE9TVEdSRVNRTF9TSVRFID0gaHR0cHM6Ly9mdHAucG9zdGdyZXNxbC5vcmcvcHViL3Nv
dXJjZS92JChQT1NUR1JFU1FMX1ZFUlNJT04pCj4gICBQT1NUR1JFU1FMX0xJQ0VOU0UgPSBQb3N0
Z3JlU1FMCgpSZXZpZXdlZC1ieTogTWF4aW0gS29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
