Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DA3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEBB74024A;
	Fri, 13 May 2022 07:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1kV8bnEbW9M; Fri, 13 May 2022 07:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7204140241;
	Fri, 13 May 2022 07:17:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D745A1BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4E4E60B25
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4DsjI7qPfcK for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:17:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD6C460AEE
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:17:16 +0000 (UTC)
Received: from lmontsouris-655-1-15-199.w80-11.abo.wanadoo.fr
 ([80.11.122.199]:54260 helo=[192.168.1.105])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1npPY1-000E20-Fo; Fri, 13 May 2022 09:17:13 +0200
Message-ID: <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
Date: Fri, 13 May 2022 09:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCk9uIDEzLzA1LzIyIDA2OjIxLCBOZWFsIEZyYWdlciB3cm90ZToKPiBIaSBQZXRl
ciwgTHVjYSwKPiAKPiAKPiAKPj4gTGUgMTIgbWFpIDIwMjIgw6AgMjE6MzMsIFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Pgo+PiDvu79DQVVUSU9OOiBU
aGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBsZWFz
ZSB1c2UgcHJvcGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50
cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbC4KPj4KPj4KPj4+
Pj4+PiAiTmVhbCIgPT0gTmVhbCBGcmFnZXIgPG5lYWxmQHhpbGlueC5jb20+IHdyaXRlczoKPj4K
Pj4gSGksCj4+Cj4+Pj4+IEkgaGFkIHRvIGFsc28gcGFzcyB0aGUgLW0qIGZsYWdzIGluIEVYVFJB
X0NPTVBJTEVSX0ZMQUdTIHRvIGdldCBpdCB0bwo+Pj4+PiBsaW5rLCBwcmVzdW1hYmx5IHRoZSBw
ZXRhbGludXggdG9vbGNoYWluIGhhcyBpbmNvbXBhdGlibGUKPj4+Pj4gZGVmYXVsdHMuIEx1Y2Es
IGFueSBzcGVjaWZpYyByZWFzb25zIHRvIG5vdCBwYXNzIENGTEFHUyB0aGVyZT8KPj4+Pgo+Pj4+
IEknbSBhZnJhaWQgSSBoYXZlIG5vIHJlYWwgYW5zd2VyLiA6KCBXaGVuIEkgaW5pdGlhbGx5IHdy
b3RlIHRoZSBzY3JpcHQgSQo+Pj4+IGRpZCBpdCB0byBoYXZlIHRoZSBzYW1lIGxvZ2ljIGFzIHBl
dGFsaW51eC4gTGF0ZXIgSSBkaWRuJ3Qgd2F0Y2ggZm9yIGl0cwo+Pj4+IGNoYW5nZXMuIEkgd291
bGQgbG92ZSB0byBiZSBoZWxwZnVsIGJ1dCBJIGhhdmUgbm8gYWNjZXNzIHRvIGEgenlucW1wCj4+
Pj4gYm9hcmQgbm93Lgo+Pgo+Pj4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHlvdSB0byBqdXN0
IGltcGxlbWVudCB0aGUgY2hhbmdlcyB0aGF0IFBldGVyCj4+PiBoYXMgcHJvcG9zZWQ/ICBQZXRl
ciBhcHBlYXJzIHRvIGhhdmUgYWxyZWFkeSBpZGVudGlmaWVkIGEgc29sdXRpb24uCj4+Cj4+PiBC
b3RoIFBldGVyIGFuZCBJIGhhdmUgemN1MTA2IGJvYXJkcywgc28gd2UgY2FuIGJvdGggdGVzdCBh
bmQgdmVyaWZ5Cj4+PiB0aGUgdXBkYXRlIHdvcmtzLgo+Pgo+PiBTb3JyeSwgdGhhdCBpcyBub3Qg
dHJ1ZS4gSSBoYXZlbid0IGZvdW5kIHRoZSBtYWdpYyBpbmNhcm5hdGlvbiB0byBnZXQgYQo+PiB3
b3JraW5nIHBtdWZ3IGJ1aWxkIHdpdGggdGhlIHRvb2xjaGFpbiBidWlsdCBieSBjcm9zc3Rvb2wt
bmcuIE15IGRpZmYKPj4gd2FzIGp1c3QgdG8gc2hvdyB3aGF0IEkgaGFkIHRvIGNoYW5nZSB0byBh
ZGp1c3QgenlucW1wLXBtdWZ3LWJ1aWxkZXIgdG8KPj4gdXNlIGEgcGV0YWxpbnV4IHRvb2xjaGFp
bi4KPj4KPiAKPiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGUgenlu
cW1wLXBtdWZ3LWJ1aWxkZXIgdG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNoYWluIHRoYXQgcGV0
YWxpbnV4IHVzZXMgYXMgdGhlIGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/CgpDYW4geW91IHBvaW50
IHRvIHdoZXJlIHRoZSBwZXRhbGludXggdG9vbGNoYWluIGNvbWVzIGZyb20/CgpJZiBwZXRhbGlu
dXggdXNlcyBhIHB1YmxpY2x5IGF2YWlsYWJsZSBwcmVidWlsdCB0b29sY2hhaW4sIHBvc3NpYmx5
IHdpdGgKc291cmNlcyBhdmFpbGFibGUsIHRoZW4gdGhpcyBjb3VsZCBiZSBjb25zaWRlcmVkLgoK
SG93ZXZlciBJIHN1c3BlY3QgaXQgZG9lcyB1c2UgYSB0b29sY2hhaW4gdGhhdCBpcyBzaGlwcGVk
IGJ5IFZpdGlzLiBJZgppdCBpcyB0aGUgY2FzZSwgdGhlbiBpdCdzIG5vdCBhbiBvcHRpb24gaGVy
ZS4KClRoZSBlc3Qgb3B0aW9uIHdvdWxkIGJlIHRvIGZpeCB0aGUgY3QtbmcgdG9vbGNoYWluIG9m
IGNvdXJzZSwgYnV0IEknbQphZnJhaWQgSSBjYW5ub3QgYmUgdmVyeSBoZWxwZnVsIG9uIHRoaXMs
IGVzcGVjaWFsbHkgd2l0aG91dCBhbiBoYXJkd2FyZQp0byB0ZXN0LiA6KAoKLS0gCkx1Y2EKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
