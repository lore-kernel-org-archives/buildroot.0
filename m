Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CED3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D458B41B93;
	Sat, 11 Jun 2022 20:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lShfJ6VgGjux; Sat, 11 Jun 2022 20:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 961DF41748;
	Sat, 11 Jun 2022 20:58:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD9941BF5DF
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C0D741748
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zl2ESBPjrHPz for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 20:58:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B14841717
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 20:58:57 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se21.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o08C1-0001PD-TZ; Sat, 11 Jun 2022 15:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nasCQFaBuFxBBkAqrK/J266e3tqas4k8OfrwkIxNb4Q=; b=sxcK0ICi2v+3GgYL6nLFCj8tXd
 9raCiZFzb6/MRPlbV8xeivskhTh630YK3fOqN3jkV4PXYQBisJHgCyjgDavhiWlJZkySmgAYeCIHE
 y0X8rDUKdkVZJGAdkJ7OlmaPLV/zE0u+JIAMS7beRuCe9yv0yUFkq4gP1RksbE6oIivTXz2DcOODl
 43D3AfwU7pYFLay4pM7ioxW6ohfqIS0FJTn1S2Ay2xJaFFq+AYL6MCn1bWnHMk0RFSQQdwmjrEtm9
 P+GcvzDgqYO7mOEb0fPYLcMU6wY9+0Xz2TRv2QkXW2XqmNjA2Y5Bm/2C3oUYPiwGyEFHB6fWhpyeY
 FI1eNRWw==;
Received: from [127.0.0.1] (port=64444 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o08C0-0000Bt-9S; Sat, 11 Jun 2022 20:58:48 +0000
MIME-Version: 1.0
Date: Sat, 11 Jun 2022 23:58:48 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAPi7W81ydL4GF9YT4fndgthxFnhQ17yXCAugF=gqQDJ-UxYnNA@mail.gmail.com>
References: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
 <20220611143544.844613-2-fontaine.fabrice@gmail.com>
 <df8cd05af52ef475efc5f6ad26b4e340@tpm.dev>
 <CAPi7W81ydL4GF9YT4fndgthxFnhQ17yXCAugF=gqQDJ-UxYnNA@mail.gmail.com>
Message-ID: <c9962256fbb1953ca91d02a16bf2cfe7@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00797380726184)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+3N4jq6qYfDuvRXgXEWwBTPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zXBqNSapTpPkqU8rtpw71NFyJHgrHSwCtEjluuUWcpJ8/K
 tIis73NVkbbJSPKOuEHDDdBmuyPGUTC5X8gbTECmAXDkcXwqI3EzqRI7b1h6dpUX09M5GS4DfSh/
 KAFirJU4PWJM2zMugzmIRtzFHL4a07fHnUrGVT90d4mboms6Q4jR72V1X0CGSmjU0lJsvds8oXLp
 TS+Cr9Qe6X5KmaYlfalrtdr1VI+cQUFK8LdWxdX5jslbUZuYzq0zddjP6xUe7VM2alTUNsoANW4O
 NNcximXkW6PpQinXl75IfbrY9zYhNt8TdxUfIrY2WjbSnBa6s1GGshFqBNow+kcrcUfw20+d9nkp
 +JHKcNBPs4VL7FghFiuDCY0EdD8+W8Mu0TYWMMRtIEQQxlrKshc4xAK4g+WnxXPxePRFPW6dC7hC
 Kx5IM07QBMRb2m7RenwUT16Mz313pILeCEKtSSBbIR7t5WHypSrhqI26Bkd8dH9XuNkaacPZpCod
 EHEsAzKOEJ7nsXEBAaJKYpjfiKWbEgl3OWm4U3XjESBiBRhu3kMp0tezYqxGMqsKjARq8PBC4qgw
 H39OHA0Vxmj/wsurIM5rBP18vW6odrfO8cAzSdWUJ/WdZFKOwDxMp7Mh2FD97rID7fKzXHKOS7ep
 Lutw5JLMllEIbIkVe06B7dx0jjZzY3McN6qoXPjenLhIOF1oeRZnZYKRFs4icELVHnvrERoGi85s
 zxxe+XLS2t2Yn01EH1Fg+eD4FgIIOUjqJXaqvt0b/760i7wlBzE/3S4/ulVlnh/piH+GQME9V426
 kEP7lNJgk6UYHKED8gZsxuhyY72eRArt8zAuv1CL1PnX7j1uBautA9CKwhEY5wz7BxpR+tj/0OT9
 mr7F8CBwikaZ/Jq4FKlrTJMH9zJ5Fjpml8WgwL6vAQKDvSpmDhbyzr6L7PQ29g/U/RV9hOntSaQA
 KSseujkNDaI1BZL4xlheqFLW5/+Dcv5uDybXbCpUIXA4quuO5TcDeKjrEmYPn2IVWRvmjbC9iUaz
 qXo4BdH7iqdkgy19bcoVDrEdxRAVX/XquUP0bmxEdvRrJe7vKRMt1E1li19mW0G91CSooRJqA7sI
 4A+L0/kMImNg9WAZruoGXL/tY9qKK8+GFhA/zikO8HSt9MzTUEHi7o1gOq+O4Jie
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH 2/2] package/wolftpm: drop
 WOLFTPM_CPE_ID_VENDOR
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCk5vdyBJIHVuZGVyc3RhbmQgdGhlIG1vdGl2YXRpb24gYmVoaW5kIHlv
dXIgc2Vjb25kIHBhdGNoLiBJIGFsc28gYmVsaWV2ZSAKdGhhdCB0aGVyZSBoYXMgYmVlbiBubyBD
VkUgKHlldCkgaW4gd29sZlRQTS4gVGhpcyBwYXRjaCBtYWtlcyBzZW5zZS4KClRoYW5rIHlvdSBm
b3IgdGhlIGNvbnRyaWJ1dGlvbi4KCkRpbWkKLS0gCkZvdW5kZXIgb2YgVFBNLmRldgoKCk9uIDIw
MjItMDYtMTEgMTE6MzggUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gTGUgc2FtLiAxMSBq
dWluIDIwMjIgw6AgMjI6MjQsIERpbWkgVG9tb3YgPGRpbWlAdHBtLmRldj4gYSDDqWNyaXQgOgo+
PiAKPj4gd29sZnNzbFsxXSBhbmQgd29sZlRQTVsyXSBhcmUgb3Blbi1zb3VyY2UgcHJvZHVjdHMg
b2YgdGhlIHNhbWUgCj4+IGNvbXBhbnksCj4+IHdvbGZTU0wgSW5jLiBbM10KPj4gCj4+IFRoZXJl
Zm9yZSwgdGhlIHdvbGZzc2wgYW5kIHdvbGZ0cG0gcGFja2FnZSBzaGFyZSB0aGUgc2FtZQo+PiBX
T0xGVFBNX0NQRV9JRF9WRU5ET1IuCj4+IAo+PiBJbiBjYXNlIHRoYXQgdGhlIENQRV9JRF9WRU5E
T1IgaXMgaW5jb3JyZWN0IHRoZW4gdGhpcyBpcyB0cnVlIGFsc28gZm9yCj4+IHRoZSB3b2xmc3Ns
IHBhY2thZ2Ugd2hlcmUgdGhlIHZhbHVlIG9yaWdpbmF0ZWQuCj4gCj4gd29sZnNzbCdzIENQRSBJ
RCBpcyBjb3JyZWN0IGFzIGl0IGlzIHJlZ2lzdGVyZWQgaW4gdGhlIE5WRCBOSVNUIAo+IGRhdGFi
YXNlIFsxXS4KPiAKPiBIb3dldmVyLCB3b2xmdHBtIHByb2R1Y3QgaGFzIG5vdCBiZWVuIHJlZ2lz
dGVyZWQgdG8gdGhlIE5WRCBOSVNUCj4gZGF0YWJhc2UgKHByZXN1bWFibHkgYmVjYXVzZSBubyBD
VkVzIHdlcmUgZm91bmQgeWV0IGluIHdvbGZ0cG0pLgo+IFNvLCB0aGlzIHBhdGNoIGlzIGNvcnJl
Y3QuCj4gSWYgeW91IHdhbnQgdG8gcHV0IGJhY2sgV09MRlRQTV9DUEVfSURfVkVORE9SLCBJIHdv
dWxkIGFkdmlzZSB0byBmaXJzdAo+IHNlbmQgYW4gZW1haWwgdG8gY3BlX2RpY3Rpb25hcnlAbmlz
dC5nb3YgWzJdIHRvIHJlZ2lzdGVyIHdvbGZ0cG0KPiBwcm9kdWN0Lgo+IAo+IFsxXSAKPiBodHRw
czovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/bmFtaW5nRm9ybWF0
PTIuMyZrZXl3b3JkPWNwZSUzQTIuMyUzQWElM0F3b2xmc3NsJTNBd29sZnNzbAo+IFsyXSBodHRw
czovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUKPj4gCj4+IFRoYW5rIHlvdSBmb3IgYnJpbmdp
bmcgdGhpcyB0b3BpYyB1cCBmb3IgZGlzY3Vzc2lvbi4KPj4gCj4+IFsxXSBodHRwczovL3d3dy53
b2xmc3NsLmNvbS9wcm9kdWN0cy93b2xmc3NsLwo+PiBbMl0gaHR0cHM6Ly93d3cud29sZnNzbC5j
b20vcHJvZHVjdHMvd29sZnRwbS8KPj4gWzNdIGh0dHBzOi8vd3d3LndvbGZzc2wuY29tLwo+PiAK
Pj4gUmVnYXJkcywKPj4gRGltaQo+PiAtLQo+PiBGb3VuZGVyIG9mIFRQTS5kZXYKPj4gCj4+IE9u
IDIwMjItMDYtMTEgMDU6MzUgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4+ID4gY3BlOjIu
MzphOndvbGZzc2w6d29sZnRwbSBoYXMgbmV2ZXIgYmVlbiBhIHZhbGlkIENQRSBpZGVudGlmaWVy
IGZvcgo+PiA+IHRoaXMKPj4gPiBwYWNrYWdlOgo+PiA+Cj4+ID4KPj4gPiBodHRwczovL252ZC5u
aXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/bmFtaW5nRm9ybWF0PTIuMyZrZXl3
b3JkPWNwZSUzQTIuMyUzQWElM0F3b2xmc3NsJTNBd29sZnRwbQo+PiA+Cj4+ID4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+ID4g
LS0tCj4+ID4gIHBhY2thZ2Uvd29sZnRwbS93b2xmdHBtLm1rIHwgMSAtCj4+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93b2xm
dHBtL3dvbGZ0cG0ubWsgYi9wYWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tawo+PiA+IGluZGV4IGYw
Y2YwZGYwZDMuLjA0MmNjZDIyZTEgMTAwNjQ0Cj4+ID4gLS0tIGEvcGFja2FnZS93b2xmdHBtL3dv
bGZ0cG0ubWsKPj4gPiArKysgYi9wYWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tawo+PiA+IEBAIC05
LDcgKzksNiBAQCBXT0xGVFBNX1NJVEUgPSAkKGNhbGwKPj4gPiBnaXRodWIsd29sZlNTTCx3b2xm
VFBNLHYkKFdPTEZUUE1fVkVSU0lPTikpCj4+ID4gIFdPTEZUUE1fSU5TVEFMTF9TVEFHSU5HID0g
WUVTCj4+ID4gIFdPTEZUUE1fTElDRU5TRSA9IEdQTC0yLjArCj4+ID4gIFdPTEZUUE1fTElDRU5T
RV9GSUxFUyA9IExJQ0VOU0UKPj4gPiAtV09MRlRQTV9DUEVfSURfVkVORE9SID0gd29sZnNzbAo+
PiA+ICBXT0xGVFBNX0NPTkZJR19TQ1JJUFRTID0gd29sZnRwbS1jb25maWcKPj4gPgo+PiA+ICAj
IHdvbGZUUE0ncyBzb3VyY2UgY29kZSBpcyByZWxlYXNlZCB3aXRob3V0IGEgY29uZmlndXJlIHNj
cmlwdCwKPiBCZXN0IFJlZ2FyZHMsCj4gCj4gRmFicmljZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
