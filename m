Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C85C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B85B140156;
	Tue, 26 Jul 2022 18:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85B140156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUb43W5g2TH1; Tue, 26 Jul 2022 18:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF20400CE;
	Tue, 26 Jul 2022 18:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BF20400CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 753831BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F525400CE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F525400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNNIcEctImvz for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:56:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81FCC40025
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81FCC40025
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:56:28 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 26QIuQR5017344
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 20:56:26 +0200
Date: Tue, 26 Jul 2022 20:56:17 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220726205617.1da3836b@x230_1.trabucayre.com>
In-Reply-To: <d37f0028-7f29-8e6e-54c5-c9e7de548b2c@smile.fr>
References: <20220208162409.496110-1-gwenj@trabucayre.com>
 <20220208162409.496110-2-gwenj@trabucayre.com>
 <d37f0028-7f29-8e6e-54c5-c9e7de548b2c@smile.fr>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: move to package/volk
 instead of using the internal one
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gVHVlLCAyNiBKdWwgMjAyMiAxOTo0MToxNyArMDIwMApSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cgo+IEhlbGxvIEd3ZW5oYWVsLAo+
IAo+IExlIDA4LzAyLzIwMjIgw6AgMTc6MjQsIEd3ZW5oYWVsIEdvYXZlYy1NZXJvdSBhIMOpY3Jp
dMKgOgo+ID4gRnJvbTogR3dlbmhhZWwgR29hdmVjLU1lcm91IDxnd2VuaGFlbC5nb2F2ZWMtbWVy
b3VAdHJhYnVjYXlyZS5jb20+Cj4gPiAKPiA+IFVudGlsIHJlY2VudCByZWxlYXNlcyBHTlVSYWRp
byB3YXMgc2hpcHBlZCB3aXRoIHZvbGsgYXMgYSBzdWJtb2R1bGUuIFdpdGgKPiA+IDMuOSBhbmQg
My4xMCB0aGlzIGlzIG5vIG1vcmUgdHJ1ZSBhbmQgcmVxdWlyZXMgYnVpbGRpbmcgdm9sayBiZWZv
cmUKPiA+IEdOVVJhZGlvLiAgCj4gCj4gQ3VycmVudGx5IEJ1aWxkcm9vdCBzdGlsbCBwcm92aWRl
IGdudXJhZGlvIDMuOCwgYWRkaW5nIHZvbGsgZGVwZW5kZW5jeSBoZXJlCj4gaXMgYSBwcmVsaW1p
bmFyeSB3b3JrIGJlZm9yZSBidW1waW5nIGdudXJhZGlvIHRvIGEgbmV3ZXIgdmVyc2lvbi4KPiAK
WWVzLiBJIGhhdmUgcG9zdHBvbmVkIGdudXJhZGlvIHVwZGF0ZSBiZWNhdXNlIGF0IHRoaXMgdGlt
ZSBtYW55IE9PVCBibG9ja3MKd2Fzbid0IGNvbXBhdGlibGVzLCBhbmQgbW9yZSByZWNlbnRseSBh
IHByb2JsZW0gd2l0aCBweXRob24tcHliaW5kIChjYW4ndCBidWlsdAp3aXRoIGEgNjRiaXRzIGhv
c3QgZm9yIDMyYml0cyB0YXJnZXQgYW5kIHJlY2lwcm9jYWwpLiBOb3cgSXQncyBmaXhlZCBhbmQg
SSBoYXZlCnRvIHVwZGF0ZSB0aGlzIHBhdGNoIGFuZCBjb21wbGV0ZSBzZXJpZSB3aXRoIGEgYnVt
cCBmb3IgZ251cmFkaW8gYW5kIHVoZC4KCkd3ZW5oYWVsCgo+ID4gCj4gPiBUaGlzIHBhdGNoIGRp
c2FibGUgaW50ZXJuYWwncyB2b2xrLCBhbmQgYWRkIGEgZGVwZW5kZW5jeSB0byB0aGUKPiA+IGNv
cnJlc3BvbmRpbmcgcGFja2FnZSwgdG8gdXNlIGluY29uZGl0aW9ubmFseSB0aGUgb25lIGJ1aWxk
IGJ5IGJ1aWxkcm9vdCAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogR3dlbmhhZWwgR29hdmVjLU1l
cm91IDxnd2VuaGFlbC5nb2F2ZWMtbWVyb3VAdHJhYnVjYXlyZS5jb20+Cj4gPiAtLS0KPiA+ICBw
YWNrYWdlL2dudXJhZGlvL0NvbmZpZy5pbiAgIHwgMSArCj4gPiAgcGFja2FnZS9nbnVyYWRpby9n
bnVyYWRpby5tayB8IDQgKysrLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dudXJhZGlvL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvZ251cmFkaW8vQ29uZmlnLmluCj4gPiBpbmRleCAxODk2ZDEzMjZh
Li4xMDMxNzU5NDZjIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9nbnVyYWRpby9Db25maWcuaW4K
PiA+ICsrKyBiL3BhY2thZ2UvZ251cmFkaW8vQ29uZmlnLmluCj4gPiBAQCAtMjgsNiArMjgsNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfR05VUkFESU8KPiA+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0JP
T1NUX1RIUkVBRAo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTE9HNENQUAo+ID4gIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfR01QCj4gPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9WT0xLICAKPiAKPiBNYXli
ZSB5b3UgY291bGQgdXBkYXRlIHRoZSBjb21tZW50IG9uIHdjaGFyIGRlcGVuZGVuY3k6Cj4gCj4g
ZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgYm9vc3QsIHZvbGsKPiAKVGhhbmtzIQo+IFJldmll
d2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gUm9tYWluCj4gCj4gCj4gPiAgCWhlbHAKPiA+ICAJICBHTlUgUmFkaW8gaXMgYSBm
cmVlICYgb3Blbi1zb3VyY2Ugc29mdHdhcmUgZGV2ZWxvcG1lbnQKPiA+ICAJICB0b29sa2l0IHRo
YXQgcHJvdmlkZXMgc2lnbmFsIHByb2Nlc3NpbmcgYmxvY2tzIHRvIGltcGxlbWVudAo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ251cmFkaW8vZ251cmFkaW8ubWsgYi9wYWNrYWdlL2dudXJhZGlv
L2dudXJhZGlvLm1rCj4gPiBpbmRleCA0MTdhNTFlMDY3Li5lZDcwNjBiODVjIDEwMDY0NAo+ID4g
LS0tIGEvcGFja2FnZS9nbnVyYWRpby9nbnVyYWRpby5tawo+ID4gKysrIGIvcGFja2FnZS9nbnVy
YWRpby9nbnVyYWRpby5tawo+ID4gQEAgLTE5LDEzICsxOSwxNSBAQCBHTlVSQURJT19ERVBFTkRF
TkNJRVMgPSBcCj4gPiAgCWhvc3Qtc3dpZyBcCj4gPiAgCWJvb3N0IFwKPiA+ICAJbG9nNGNwcCBc
Cj4gPiAtCWdtcAo+ID4gKwlnbXAgXAo+ID4gKwl2b2xrCj4gPiAgCj4gPiAgR05VUkFESU9fQ09O
Rl9PUFRTID0gXAo+ID4gIAktRFBZVEhPTl9FWEVDVVRBQkxFPSQoSE9TVF9ESVIpL2Jpbi9weXRo
b24zIFwKPiA+ICAJLURFTkFCTEVfREVGQVVMVD1PRkYgXAo+ID4gIAktREVOQUJMRV9WT0xLPU9O
IFwKPiA+ICAJLURFTkFCTEVfR05VUkFESU9fUlVOVElNRT1PTiBcCj4gPiArCS1ERU5BQkxFX0lO
VEVSTkFMX1ZPTEs9T0ZGIFwKPiA+ICAJLURFTkFCTEVfVEVTVElORz1PRkYgXAo+ID4gIAktRFhN
TFRPX0VYRUNVVEFCTEU9Tk9URk9VTkQKPiA+ICAgIAo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
