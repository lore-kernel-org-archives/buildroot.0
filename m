Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88535C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E07403BE;
	Sun, 21 Nov 2021 21:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlqPPCBlZtu7; Sun, 21 Nov 2021 21:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0082940283;
	Sun, 21 Nov 2021 21:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18A6A1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 102F040286
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueg6wu57wvjj for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A8CE40283
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637530325;
 bh=in4AS2uyIPmddKEIzw8JWYqFZZSR/q44vl8HPubffLk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=N9Mr21HJm2NdUo6v0L9dpLyhfL/MkkoLz/pVe1Cn6o3NYtY0DNEjDT9tgrLEi0Fn/
 nBYZu8Te5CGW9TnI27V02wx0Gb/g4OowyZnj0XWi6pG2YxxE1SaPmU0pLLY+VzGuur
 ibuQqiCLJXU/oDEBhOh6m0OlmcHrylfA/ujSM4wE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.34]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO24-1mHiI92S9g-00ooln; Sun, 21
 Nov 2021 22:32:05 +0100
Date: Sun, 21 Nov 2021 22:32:04 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211121223204.148a6871@gmx.net>
In-Reply-To: <CAPi7W83w2yHWYnNGWv6KVmcC4752vqGfN+OqO34yLd8jga+V1A@mail.gmail.com>
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <20211120003256.61693b53@gmx.net>
 <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
 <20211120205359.0213edde@gmx.net>
 <CAPi7W82DcY+8QW+c83hR=veNGqGz64geziZFymw4S7Lnz9jUog@mail.gmail.com>
 <20211120212317.12cfaaef@gmx.net>
 <CAPi7W83w2yHWYnNGWv6KVmcC4752vqGfN+OqO34yLd8jga+V1A@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:+i+KMbULPxqmNyM11dmpvicFPpFIPRZlb7y9K8akozolcFN1wvb
 zzukmFWkEPyyA+5xxvpbbZAeszpbLn4y6PacgEoGJoD3e3mR8WrSbvLwmw17UJ9vx4mYzsW
 ntLguK3PFWFzpZsl5i4Et5s8pdm3WdL6/VjoZSbta25Xtm22eYfjsD5kStlGLUTB7gaO5OX
 63tcm8q37WPbA9gVIrUKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8igcWmkbiqE=:81sCe1O618yD/A94QbFNw3
 pXoQnBxSuVh2EBIUT1jA9OB844M7BuD6Ott8YjpHwt+VyL7RfRi85733Iftgpuz2rNSLDm6bu
 BkOOZ3xCtmRpSCwgC9CJ01lI6UO//fAB/bLDIU3RdE6zKxSYgEnmNXcFXj7fHAfhVJpoTizqd
 7+SOb8xOuhMxBXP2vKj23rllcBwNFCgDB5HGV30MvYKKq59GdgEE+caxcWecUoM0cOe6yxYYR
 VACgbMcTDeOkHfD6vvWlo50XlqHqQ8QW1jNS7ja5jZyybQJUsrWJZQb8eEbHNWMQma2+wWbvq
 ya9kHHYjM9CKalx9A+fDjFbNb+/KxqK3U0xT4oqAgWU4A0KAxku8VC3QzmMR1ee1hL+01Il+M
 RsJHnedgiCtzQK4nFbMVrYytW1SQ188sWbSbUYYSrOrP0MexixMgb6WfRp8CzjEsoJaHMk/4g
 Pcp6nhXsETOTuggFzJ3/VGp+PPY5Y5qVwjF05l+EjxfZlV3DL9GPCWq13G9ddEv1ALDl0baG3
 4JCU4VPZFBMFwKGNlJOna6W64M/FeB85wWKdp+3DEr8rphpyNHfWLARnt2KgdTvRmdsGOn7f4
 6c3WXm85LMBHecnV67V0RgsXBSIT1M21gFWr9SEvl1iYhhC1qGIq0/Zy628LEQ38GfP5+1Kr/
 WSRgoipmfjNO1g1wVyLTWuEXdIDM06HZ43XD4MesTlQUI0P+E2vbLNblxIBsZhEhem8/v+7HK
 VHtVsT4F2rdrQtKJK6PjS1CuGS9+j61my4rubx0JuBKfA1bHasA+VDjaevdLKYppARuyY+ORU
 IEjngBDCCj0brVS5Jc2ADzRCAvXGdryBrvcXO8hW8SuLAt2Ax2MvdQYXImNqDX8HKHuzAUMFr
 nWKJxxa9WWfo7DCm+xCy+E/CGacdQZsMqRZ70VLWUPUtsZS6blagYqrUk/8uTu6OeyA2cVawI
 Ql1UHy/VLFnWz9BTP85A2BAVZzFlRsO7y9RNZYJImtOiYuxKruQTQLjMSRlFQCNHBX4lZEluV
 LHZIki402j6pmEtpx5h3z+ACM6N59RLVJd2l4JGEIyuM67DoxjOYHFe+ypIr1johuUcfqQlvs
 Q7cxap/h6wV1h0=
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCk9uIFNhdCwgMjAgTm92IDIwMjEgMjE6Mzk6MTMgKzAxMDAsIEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKCj4gTGUgc2Ft
LiAyMCBub3YuIDIwMjEgw6AgMjE6MjMsIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4gYSDDqWNyaXQgOgo+ID4KPiA+IEhlbGxvIEZhcmJyaWNlLAo+ID4KPiA+IE9uIFNhdCwgMjAg
Tm92IDIwMjEgMjE6MTU6NDAgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPiB3cm90ZToKPiA+ICAKPiA+ID4gTGUgc2FtLiAyMCBub3YuIDIwMjEgw6Ag
MjA6NTQsIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gYSDDqWNyaXQgOiAgCj4g
PiA+ID4KPiA+ID4gPiBIZWxsbyBGYWJyaWNlLAo+ID4gPiA+Cj4gPiA+ID4gT24gU2F0LCAyMCBO
b3YgMjAyMSAxMDoyMzoxMSArMDEwMCwgRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ICAKPiA+ID4gPiA+IEhlbGxvIFBldGVyLAo+ID4g
PiA+ID4KPiA+ID4gPiA+IExlIHNhbS4gMjAgbm92LiAyMDIxIMOgIDAwOjMzLCBQZXRlciBTZWlk
ZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IGEgw6ljcml0IDogIAo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBIZWxsbyBGYWJyaWNlLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBUaHUsIDE4IE5v
diAyMDIxIDIyOjA2OjIzICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gPiBGb3IgYW4gdW5r
bm93biByZWFzb24sIHRoZSBidWlsZCBmYWlscyBzaW5jZSBidW1wIHRvIHZlcnNpb24gMS40LjYw
IGluCj4gPiA+ID4gPiA+ID4gY29tbWl0IGQ2MmI3ZjU0ZjAwMjkxYTUwMjc0NDA5ZmI1NTEwNTI3
ZmQ3MjVmZmUgb246Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBhcnJheS5jOjE0MDoyOiBl
cnJvcjogJ2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxvd2VkIGlu
IEM5OSBtb2RlCj4gPiA+ID4gPiA+ID4gICBmb3IgKHVpbnQzMl90IGkgPSAwOyBpIDwgc3o7ICsr
aSkgewo+ID4gPiA+ID4gPiA+ICAgXgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gUnVubmlu
ZyBhdXRvcmVjb25mIGZpeGVzIHRoZSBidWlsZC4gIAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBU
aGUgZGlmZmVyZW5jZSBpcyBkdXJpbmcgdGhlIGNvbmZpZ3VyZSBzdGVwOgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiAtIGNoZWNraW5nIGZvciAuLi4vaG9zdC9iaW4vYXJtLW5vbmUtbGludXgtZ251
ZWFiaS1nY2Mgb3B0aW9uIHRvIGFjY2VwdCBJU08gQzg5Li4uIG5vbmUgbmVlZGVkCj4gPiA+ID4g
PiA+ICsgY2hlY2tpbmcgZm9yIC4uLi9ob3N0L2Jpbi9hcm0tbm9uZS1saW51eC1nbnVlYWJpLWdj
YyBvcHRpb24gdG8gZW5hYmxlIEMxMSBmZWF0dXJlcy4uLiAtc3RkPWdudTExCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEFuZCB0aGUgdXNlIG9mIHRoZSAnLXN0ZD1nbnUxMScgZmxhZyBmb3IgdGhl
IGNvbXBpbGUgc3RlcHMuLi4sIGFueSBtb3JlCj4gPiA+ID4gPiA+IGxpZ2h0d2VpZ2h0IG9wdGlv
biB0byBlbmFibGUgQzExPyAgCj4gPiA+ID4gPiBUaGVuLCBJIGFzc3VtZSB0aGF0IHVwc3RyZWFt
IGZvcmdvdCB0byByZWdlbmVyYXRlIHRoZSBjb25maWd1cmUgc2NyaXB0IGFmdGVyCj4gPiA+ID4g
PiBodHRwczovL2dpdGh1Yi5jb20vbGlnaHR0cGQvbGlnaHR0cGQxLjQvY29tbWl0LzczODY1MDI1
NzI5ODk3ZDExNDk0ZGU1NmEyOWM3N2M0ZmM4ZTU3MDIKPiA+ID4gPiA+IEkgb3BlbmVkIGFuIGlz
c3VlIGhlcmU6IGh0dHBzOi8vcmVkbWluZS5saWdodHRwZC5uZXQvaXNzdWVzLzMxMTYgIAo+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgZm9yIGVmZm9ydCwgYnV0IHVwc3RyZWFtIHNlZW1z
IHZlcnkgY29udmluY2VkIG9mIGRvaW5nIG5vdGhpbmcgd3JvbmcgKGFuZAo+ID4gPiA+IG5vdCBy
ZWFkeSB0byBpbnZlc3RpZ2F0ZSBmdXJ0aGVyKS4uLi4sIGRlc3BpdGUgdXNpbmcgYXV0b2NvbmYt
Mi42OSAoZnJvbSAyMDEyLAo+ID4gPiA+IHNlZSBsaWdodHRwZC0xLjQuNjEvY29uZmlndXJlKSBh
bmQ6Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgICQgZGlmZiAtdSBsaWdodHRwZC0xLjQuNTkvY29u
ZmlndXJlIGxpZ2h0dHBkLTEuNC42MS9jb25maWd1cmUKPiA+ID4gPiBbLi4uXQo+ID4gPiA+IEBA
IC00NDQwLDI5OCArNDQ2MCw2IEBACj4gPiA+ID4gIGZpCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+
IC0gICBjYXNlICRhY19jdl9wcm9nX2NjX3N0ZGMgaW4gIygKPiA+ID4gPiAtICBubykgOgo+ID4g
PiA+IC0gICAgYWNfY3ZfcHJvZ19jY19jOTk9bm87IGFjX2N2X3Byb2dfY2NfYzg5PW5vIDs7ICMo
Cj4gPiA+ID4gLSAgKikgOgo+ID4gPiA+IC0gICAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGlu
ZW5vLSRMSU5FTk99OiBjaGVja2luZyBmb3IgJENDIG9wdGlvbiB0byBhY2NlcHQgSVNPIEM5OSIg
PiY1Cj4gPiA+ID4gLSRhc19lY2hvX24gImNoZWNraW5nIGZvciAkQ0Mgb3B0aW9uIHRvIGFjY2Vw
dCBJU08gQzk5Li4uICIgPiY2OyB9Cj4gPiA+ID4gLWlmICR7YWNfY3ZfcHJvZ19jY19jOTkrOn0g
ZmFsc2U7IHRoZW4gOgo+ID4gPiA+IC0gICRhc19lY2hvX24gIihjYWNoZWQpICIgPiY2Cj4gPiA+
ID4gLWVsc2UKPiA+ID4gPiAtICBhY19jdl9wcm9nX2NjX2M5OT1ubwo+ID4gPiA+IC1hY19zYXZl
X0NDPSRDQwo+ID4gPiA+IFsuLi5dCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRoZSB3aG9sZSBj
OTkgY2hlY2sgdmFuaXNoZWQuLi4uLCBhbmQ6Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgICQgZGlm
ZiAtdSBsaWdodHRwZC0xLjQuNTkvY29uZmlndXJlLmFjIGxpZ2h0dHBkLTEuNC42MS9jb25maWd1
cmUuYWMKPiA+ID4gPiBbLi4uXQo+ID4gPiA+IEBAIC02MSw3ICs2MSw2IEBACj4gPiA+ID4KPiA+
ID4gPiAgZG5sIENoZWNrcyBmb3IgcHJvZ3JhbXMuCj4gPiA+ID4gIEFDX1BST0dfQ0MKPiA+ID4g
PiAtQUNfUFJPR19DQ19TVERDCj4gPiA+ID4gIEFYX1BST0dfQ0NfRk9SX0JVSUxECj4gPiA+ID4g
IExUX1BBVEhfTEQKPiA+ID4gPiAgQUNfUFJPR19JTlNUQUxMCj4gPiA+ID4KPiA+ID4gPgo+ID4g
PiA+IEJ1dCB0aGVyZSBpcyBhbHRob3VnaCBzdXBwb3J0IGZvciB0aGUgbWVzb24gYnVpbGQgc3lz
dGVtIGluIHRoZSBzb3VyY2VzLi4uLAo+ID4gPiA+IG1heWJlIHRpbWUgdG8gY2hhbmdlIHRvIGl0
PyAgCj4gPiA+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGEgZ29vZCBpZGVhIHRvIGNoYW5nZSBp
dCBiZWZvcmUgdGhlIDIwMjEuMTEKPiA+ID4gcmVsZWFzZSBhcyBtZXNvbiB3aWxsIHByb2JhYmx5
IHJhaXNlIGl0cyBvd24gYnVpbGQgZmFpbHVyZXMuICAKPiA+Cj4gPiBHb29kIHBvaW50IGZvciB0
aGUgYXV0b3JlY29uZiBzb2x1dGlvbiAoYW5kIG1lc29uIGZvciBuZXh0IDstKSkuLi4gIAo+IFN1
cmUsICBpZiB5b3UgYWdyZWUsIEknbGwgbGV0IHlvdSBoYW5kbGUgdGhlIG1lc29uIHBhcnQgOy0p
CgpEb25lLCBzZWUgWzFdLi4uCgpSZWdhcmRzLApQZXRlcgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTExMjEyMTI5MzcuMTM5ODMt
MS1wcy5yZXBvcnRAZ214Lm5ldC8KCj4gPgo+ID4gUmVnYXJkcywKPiA+IFBldGVyCj4gPiAgCj4g
PiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IFBldGVyCj4gPiA+ID4gIAo+ID4gPiA+ID4g
IAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+ID4gPiBQZXRlcgo+ID4g
PiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBGaXhlczoKPiA+ID4gPiA+ID4g
PiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wMzQ5ZDhmZWQzNWIw
NzY2Nzk2ZGQ5YmEzYjhkZTZmZjhiZDY4ZmU3Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiAgcGFja2FnZS9saWdodHRwZC9saWdo
dHRwZC5tayB8IDIgKysKPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGln
aHR0cGQvbGlnaHR0cGQubWsgYi9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1rCj4gPiA+ID4g
PiA+ID4gaW5kZXggOWMxOGE2MDM4ZS4uYzM5YTVkYjIwZiAxMDA2NDQKPiA+ID4gPiA+ID4gPiAt
LS0gYS9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1rCj4gPiA+ID4gPiA+ID4gKysrIGIvcGFj
a2FnZS9saWdodHRwZC9saWdodHRwZC5tawo+ID4gPiA+ID4gPiA+IEBAIC0xMiw2ICsxMiw4IEBA
IExJR0hUVFBEX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiA+ID4gPiA+ID4gPiAgTElHSFRUUERf
TElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiA+ID4gPiA+ID4gPiAgTElHSFRUUERfQ1BFX0lEX1ZF
TkRPUiA9IGxpZ2h0dHBkCj4gPiA+ID4gPiA+ID4gIExJR0hUVFBEX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcGtnY29uZgo+ID4gPiA+ID4gPiA+ICsjIElzc3VlIGluIGNvbmZpZ3VyZSBzY3JpcHQgcHJv
dmlkZWQgaW4gdGFyYmFsbAo+ID4gPiA+ID4gPiA+ICtMSUdIVFRQRF9BVVRPUkVDT05GID0gWUVT
Cj4gPiA+ID4gPiA+ID4gIExJR0hUVFBEX0NPTkZfT1BUUyA9IFwKPiA+ID4gPiA+ID4gPiAgICAg
ICAtLXdpdGhvdXQtd29sZnNzbCBcCj4gPiA+ID4gPiA+ID4gICAgICAgLS1saWJkaXI9L3Vzci9s
aWIvbGlnaHR0cGQgXCAgCj4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+IEJlc3QgUmVnYXJkcywKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBGYWJyaWNlICAKPiA+ID4gPiAgCj4gPiA+IEJlc3QgUmVnYXJkcywK
PiA+ID4KPiA+ID4gRmFicmljZSAgCj4gPiAgCj4gQmVzdCBSZWdhcmRzLAo+IAo+IEZhYnJpY2UK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
