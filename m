Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21FAC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 05:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D54F4329D;
	Thu,  2 Nov 2023 05:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D54F4329D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1LoYg-1hVP8; Thu,  2 Nov 2023 05:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E4A843338;
	Thu,  2 Nov 2023 05:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4A843338
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7752D1BF275
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 05:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E21184E88
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 05:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E21184E88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFF0FuIRh5S6 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 05:29:03 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4596184E87
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 05:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4596184E87
X-QQ-mid: bizesmtp64t1698902929tp933lyi
Received: from smtpclient.apple ( [115.193.46.136])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 02 Nov 2023 13:28:47 +0800 (CST)
X-QQ-SSF: 0020000000000060Z000000A0000000
X-QQ-FEAT: 8t2GqMDsNowR0GHteGl2WCOt3C8YYI0tZu7V8uGVnEm03XctglrkD5yGj8BzH
 QoajKPnZnc/CKl7ERS3yMFGNjGRvdxkzkEJXeDP+tXFZLsEyvsFi384GfIkpJwLn9k46x6C
 ZGCOzSbY2sTumauHt8l+Gl/XMA8BDK+PFmVaZNRhU7qvwjMR14tWqwF8pVdImdbLMLdWQlJ
 TaCa1N3S2KtcDd/6pe2PypmjMh2SZhKiR1k7CqIPimVrkyDuHY8L9qYj0Nj1Zc4z6b/zpdM
 apYiVm+4/T2eCM2TmyHJyHoIM0SojIBPkcOyq+NizAKtd8At+dzQsK0SNBxUxc02f3ts5hG
 gj5nUT6eYy6i0Rcjiag8h9EBC4vyg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5986618787863008268
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
From: =?utf-8?B?6Zm25rO95a6H?= <i@taozeyu.com>
In-Reply-To: <20231101090638.GE2568@scaer>
Date: Thu, 2 Nov 2023 13:28:37 +0800
Message-Id: <AF2FA5D8-8FAC-4294-A2AA-89D602C5785E@taozeyu.com>
References: <F5BEC5A5-8166-48FA-A7C7-45C4F1250585@taozeyu.com>
 <20231101090638.GE2568@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:taozeyu.com:qybglogicsvrsz:qybglogicsvrsz3a-1
Subject: Re: [Buildroot] Can buildroot support WSL config file
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

VGhhbmtzLiBJdCB3b3JrcyB0byBtZS4KCj4gMjAyM+W5tDEx5pyIMeaXpSAxNzowNu+8jFlhbm4g
RS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiDlhpnpgZPvvJoKPiAKPiDpmbbms73l
rocsIEFsbCwKPiAKPiBPbiAyMDIzLTExLTAxIDE2OjA0ICswODAwLCDpmbbms73lrocgc3Bha2Ug
dGh1c2x5Ogo+PiBNYW55IExpbnV4IGRpc3RyaWJ1dGlvbnMgcnVuICJzeXN0ZW1kIiBieSBkZWZh
dWx0LiBCdXQgIGlmIHlvdSB3YW50IFdTTCBydW5zIHN5c3RlbWQgYnkgZGVmYXVsdCwgeW91IG5l
ZWQgdG8gcHV0IHNvbWV0aGluZyBpbiB0aGUKPj4gZmlsZSAvZXRjL3dzbC5jb25mLgo+PiBbYm9v
dF0KPj4gc3lzdGVtZD10cnVlCj4+ICggVG8gc2VlICBbMV1odHRwczovL2xlYXJuLm1pY3Jvc29m
dC5jb20vZW4tdXMvd2luZG93cy93c2wvd3NsLWNvbmZpZyNjb25maWd1cmF0aW9uLXNldHRpbmdz
LWZvci13c2xjb25mICkKPj4gQ2FuIGJ1aWxkcm9vdCBzdXBwb3J0cyBpdCBpbiBjb25maWcgcGFu
ZWw/IE1heWJlIHN1cHBvcnQgc29tZSBvcHRpb25zIGluICBzeXN0ZW0vQ29uZmlnLmluIHRvIGdl
bmVyYXRlIC9ldGMvd3NsLmNvbmYuIG9ubHkgYSBzaW5nbGUKPj4gY2hlY2tib3ggb3IgIG1vcmUg
bGlzdCBvZiBvcHRpb25zIG1lbnRpb25lZCBpbiBNaWNyb3NvZnQgV1NMIGRvY3VtZW50cy4KPiAK
PiBUaGlzIGZpbGUgaXMgbm90IHBhcnQgb2Ygc3lzdGVtZDsgc3lzdGVtZCBkb2VzIG5vdCBldmVu
IGxvb2sgYXQgdGhpcwo+IGZpbGUgYXQgYWxsLgo+IAo+IEluc3RlYWQsIGFzIEkgdW5kZXJzdGFu
ZCBpdCwgaXQgaXMgbG9va2VkIHVwIGJ5IHRoZSBXU0wyIHZpcnR1YWwgbWFjaGluZQo+IHJ1bnRp
bWUuIEFzIHN1Y2gsIGl0IGlzIHBhcnQgb2YgdGhlIGludGVncmF0aW9uIHdpdGggeW91ciAibWFj
aGluZSIKPiAodmlydHVhbCBpbiB0aGlzIGNhc2UpLgo+IAo+IEJ1aWxkcm9vdCBhbHJlYWR5IG9m
ZmVycyBhIHdheSB0byBjdXN0b21pc2UgdGhlIGdlbmVyYXRlZCByb290Cj4gZmlsZXN5c3RlbSBp
biB2YXJpb3VzIHdheXMsIGxpa2UgYSByb290ZnMgb3ZlcmxheSwgb3IgYSBwb3N0LWJ1aWxkCj4g
c2NyaXB0OyBzZWUgdGhlIG1hbnVhbCBmb3IgZnVydGhlciBkZXRhaWxzOwo+ICAgIGh0dHBzOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI3Jvb3Rmcy1jdXN0b20K
PiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4+IAo+PiBMaW5rczoKPj4gMS4gaHR0
cHM6Ly9sZWFybi5taWNyb3NvZnQuY29tL2VuLXVzL3dpbmRvd3Mvd3NsL3dzbC1jb25maWcjY29u
ZmlndXJhdGlvbi1zZXR0aW5ncy1mb3Itd3NsY29uZgo+IAo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAo+IAo+IC0tIAo+IC4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAn
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
