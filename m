Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8C7C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:27:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B756101A
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9B756101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D8A2402C8;
	Wed, 18 Aug 2021 22:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UuI4WW9g-XD; Wed, 18 Aug 2021 22:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0900402D1;
	Wed, 18 Aug 2021 22:27:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92D471BF869
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81CC4605E3
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xs3iru98LaIe for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 22:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E8460628
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 22:26:57 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GU1Lm3lZEZx06GU1Mmhl7x; Thu, 19 Aug 2021 00:26:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629325617; bh=0FOagLlnd62vIrI/0Sjt+FUexe0V3m/nJU1V3ZENg/M=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=LsUwnoLqw++LVe5UDs+LxPcosvbRN1BaxJ6x+6lh01kB1HMtMfDeQKUgiCui14v0e
 q5ftW5am1a789i1zWa1XeYOAcf+vUoxzk8CbzGqP8+7t1vu/ILYxFBVJRHNKlE1H2k
 3LUMTSehzucLncBbpCy+nrO4MlSlGg+5bGjn115zPnNkkMzlthWAsk9t6WQZ7uK8Fu
 A1XUBhcS4nA+vzbKGSi34GdKvK6cBZ/wMZm1tD2NRJ7G0EltqcU+UljOdhhIItxU3I
 LmlPmmemQI3Mgnm1y/0urKA0yvo3UI8aOHK3jKQGOJPX34RcFzP/WVHwZW2F7LXk6g
 lh3Ln4ASByBHw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
 <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
Message-ID: <b27a11ec-4ea6-b7ac-77c7-e931a849849a@benettiengineering.com>
Date: Thu, 19 Aug 2021 00:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNqMPdAI2BSF5xJsStAzapbYgsjK5GkvXoY3zHvllLMYRwcwcxwfRmCqKVqxlOqEVKchQSuzSl53jGW+kF99jloSVWEXk5Z4D6OOjthB5q3y0iAJg6F/
 47D9OzAdoehJp3nSEmyLMnNbd9eM/G5Zuryf1mqz8eGZX8YaD+eIsDz+xJ60dRYRkHKWXgPUaytCE9P9gIfnM4AjTrDK1wq6IJfLpjC0W/jpXVagIuEOPSRi
 45q7EKukREgV2gJA6SkOV1A7WgpEgIPOKkzzJ8HBa4DET8zDdZkDTDw4jc1t99hdjSOEMoe+bsrbSTkepitFp/kzGDqV3p1sGfoWkqjSVLwi1BalPKzDcYmO
 ywtWPdRWUMAlwbS5F8TDCmnHV3HwIl1UI6tnPb2PZO2xyYdF3xrsq2KVPe75CiCrhmi5GsrFGPhAxZXKU1N5xwLbEIWkM3nHM/9eXTYqkpPki5ool5MtXLTT
 T9sP7wkmvwS0Et+Jq5I7776TNnistihf7FPrsJeY+fnLDN18YYGTb8wrH9pwbOTDTq6JrkMARKpIj+Na4AHI0jFrRkD7UC4YKP8ahJv+arFp/m7WPUp3Z9V4
 oKM=
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

UGFyZG9uLAoKT24gOC8xOS8yMSAxMjoyNCBBTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gSGVs
bG8gVGhvbWFzLAo+IAo+IE9uIDgvMTgvMjEgMTE6NDQgUE0sIFRob21hcyBQZXRhenpvbmkgd3Jv
dGU6Cj4+IEhlbGxvLAo+Pgo+PiBNYXR0LCBGYWJyaWNlLCBBZGFtLCBIZXJ2w6ksIEdpdWxpbywg
QmVybmQsIEd3ZW5oYWVsLCBBcm5vdXQsIEVyaWMsIHNlZQo+PiBiZWxvdyEgOi0pCj4+Cj4+IE9u
IFdlZCwgMTggQXVnIDIwMjEgMDY6NTc6MjIgLTAwMDAKPj4gVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+PiAgICAgICAgIGJyYW5jaCB8
ICBPSyB8IE5PSyB8IFRJTSB8IFRPVCB8Cj4+PiAgICAgMjAyMS4wMi54ICB8IDM0ICB8ICA3ICB8
ICAwICB8IDQxICB8Cj4+PiAgICAgMjAyMS4wNS54ICB8IDM1ICB8ICA3ICB8ICAwICB8IDQyICB8
Cj4+PiAgICAgICBtYXN0ZXIgICB8IDE4NiB8IDMwICB8ICA1ICB8IDIyMSB8Cj4+Cj4+IFdlJ3Jl
IGRvaW5nIHJlYWxseSBnb29kIG9uIHRoZSBtYXN0ZXIgYnJhbmNoIG5vdy4gTGV0J3Mgc2VlIHdo
YXQgd2UKPj4gaGF2ZSBsZWZ0IQo+Pgo+IAo+IFtTTklQXQo+IAo+Pj4gICAgICAgbTY4ayAgICAg
fCAgICAgIGxpYm1vZHNlY3VyaXR5LTMuMC41ICAgICAgfCBOT0sgfCBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9iOTI5ODBhNTYzZmU3ZWUzMzFlNzBmMjg4Y2UwNDFiZTBi
ZjI5ZDQwIHwKPj4KPj4gL3RtcC9jY2l4OThnOS5zOiBBc3NlbWJsZXIgbWVzc2FnZXM6Cj4+IC90
bXAvY2NpeDk4ZzkuczogRmF0YWwgZXJyb3I6IFRyaWVkIHRvIGNvbnZlcnQgUEMgcmVsYXRpdmUg
YnJhbmNoIHRvIGFic29sdXRlIGp1bXAKPj4KPj4gQW5vdGhlciB0b29sY2hhaW4gaXNzdWUuLi4g
QWRkaW5nIEdpdWxpbyBpbiB0aGUgbG9vcC4KPj4KPiAKPiBJJ20gcmVwcm9kdWNpbmcgaXQgbm93
Lgo+IAo+Pj4gICAgICAgb3IxayAgICAgfCAgICAgICAgIG9wZW5hbC0xLjIxLjEgICAgICAgICAg
fCBOT0sgfCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82YTI4MDlmOGVl
ZmRlZWFjYThhNGM2MTEzMGE4ZDg1NTExNjg1Y2ZjIHwKPj4KPj4gL2RhdGEvYnVpbGRyb290LWF1
dG9idWlsZGVyL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2Uvb3BlbmFsL2hvc3Qvb3B0
L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mvb3Ixay1idWlsZHJvb3QtbGludXgtdWNsaWJj
LzkuMy4wLy4uLy4uLy4uLy4uL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6IENN
YWtlRmlsZXMvT3BlbkFMLmRpci9hbC9maWx0ZXIuY3BwLm86IHBjLXJlbGF0aXZlIHJlbG9jYXRp
b24gYWdhaW5zdCBkeW5hbWljIHN5bWJvbCBhbEZpbHRlcmkKPj4gL2RhdGEvYnVpbGRyb290LWF1
dG9idWlsZGVyL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2Uvb3BlbmFsL2hvc3Qvb3B0
L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mvb3Ixay1idWlsZHJvb3QtbGludXgtdWNsaWJj
LzkuMy4wLy4uLy4uLy4uLy4uL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6IENN
YWtlRmlsZXMvT3BlbkFMLmRpci9hbC9maWx0ZXIuY3BwLm86IHBjLXJlbGF0aXZlIHJlbG9jYXRp
b24gYWdhaW5zdCBkeW5hbWljIHN5bWJvbCBhbEdldEZpbHRlcmkKPj4gL2RhdGEvYnVpbGRyb290
LWF1dG9idWlsZGVyL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2Uvb3BlbmFsL2hvc3Qv
b3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mvb3Ixay1idWlsZHJvb3QtbGludXgtdWNs
aWJjLzkuMy4wLy4uLy4uLy4uLy4uL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6
IGZpbmFsIGxpbmsgZmFpbGVkOiBiYWQgdmFsdWUKPj4gY29sbGVjdDI6IGVycm9yOiBsZCByZXR1
cm5lZCAxIGV4aXQgc3RhdHVzCj4+Cj4+IFRvb2xjaGFpbiBpc3N1ZS4gR2l1bGlvLCBhbiBpZGVh
ID8KPiAKPiBUaGlzIHdhaXRzIGZvciB5b3UgdG8gcmVsZWFzZSBuZXcgT3BlblJpc2MgQm9vdGxp
biB0b29sY2hhaW4uIEF0Cj4gQnVpbGRyb290IGxldmVsIGFsbCBPcGVuUmlzYyBwYXRjaGVzIHdl
J3JlIGNvdmVyZWQob24gZ2NjIDExLjEuMCB0b28KPiBmcm9tIHllc3RlcmRheSkuIFNvIHdpdGgg
dGhhdCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gY3JlYXRlIHRoZSBuZXcKPiBCb290bGluIE9wZW5S
aXNjIFRvb2xjaGFpbiB0aGF0IHdpbGwgYWxzbyBlbmFibGUgLW1jbW9kZWw9bGFyZ2UgZm9yCj4g
bGliZ2VvcyBhbmQgcHJvdG9idWYsIGJhc2ljYWxseSB0aGV5IHdpbGwgYmUgYm90aCByZS1lbmFi
bGVkIGZvcgo+IE9wZW5SaXNjIDotKQo+IAo+Pj4gICAgICAgaTU4NiAgICAgfCAgb3BlbnZtdG9v
bHMtMTAuMy41LTEwNDMwMTQ3ICAgfCBOT0sgfCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5u
ZXQvcmVzdWx0cy9lYjNkZmU2Nzk1MzZiNTc4YTBmMTY3NjIzMTJhOTZhZGE3MTYyMDk1IHwKPj4K
Pj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxkL29w
ZW52bXRvb2xzLTEwLjMuNS0xMDQzMDE0Ny9saWIvaW5jbHVkZS92bV9hc3NlcnQuaDozMzE6Nzog
ZXJyb3I6IHN0YXRpYyBhc3NlcnRpb24gZmFpbGVkOiAic2l6ZW9mICh1bml4VGltZS0+dHZfc2Vj
KSA9PSA0Igo+PiAgICAgMzMxIHwgICAgICAgX1N0YXRpY19hc3NlcnQoZSwgI2UpOyBcCj4+Cj4+
IEFub3RoZXIgcGFja2FnZSBub3QgcmVhZHkgd2l0aCA2NC1iaXQgdGltZV90IGl0IHNlZW1zLgo+
IAo+IFllcAo+IAo+PiBXZSBjbGVhcmx5IGRvbid0IGhhdmUgdGhlIGxhdGVzdCB2ZXJzaW9uIG9m
IG9wZW4tdm0tdG9vbHMsIGJ1dCBpdAo+PiBoYXNuJ3QgYmVlbiBmaXhlZCB1cHN0cmVhbToKPj4g
aHR0cHM6Ly9naXRodWIuY29tL3Ztd2FyZS9vcGVuLXZtLXRvb2xzL2Jsb2IvbWFzdGVyL29wZW4t
dm0tdG9vbHMvbGliL2hnZnMvaGdmc1V0aWwuYyNMMTE3Cj4+Cj4+IFRoaXMgaXNzdWUgaXMgZGlz
Y3Vzc2VkIGF0Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS92bXdhcmUvb3Blbi12bS10b29scy9pc3N1
ZXMvNDMwLiBUaGUKPj4gbWV0YS1vcGVuZW1iZWRkZWQgbGF5ZXIgaGFzIHRoZSBwYXRjaAo+PiAu
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvb3Blbi12bS10b29scy9vcGVuLXZtLXRv
b2xzLzAwMDEtTWFrZS1IZ2ZzQ29udmVydEZyb21OdFRpbWVOc2VjLWF3YXJlLW9mLTY0LWJpdC10
aW1lXy5wYXRjaAo+PiB0byBmaXggdGhpcy4KPj4KPj4gQW55b25lIHZvbHVudGVlcmluZyB0byBm
aXggdGhpcz8KPj4KPiAKPiBJIGNhbiBkbyB0aGF0LiBPbmx5IHRoYXQgcGF0Y2ggVVJMIGlzIGJy
b2tlbiBidXQgdGhlcmUgaXMgYSBQUiBmb3IgdGhhdAo+IHRvIHRha2UgdGhlIHBhdGNoOgo+IGh0
dHBzOi8vZ2l0aHViLmNvbS92bXdhcmUvb3Blbi12bS10b29scy9wdWxsLzM4Ny9jb21taXRzLzNm
MDU4MGYyNTQ2ZGU4YmU3YWNmMWJjNzhhNTVhMjU3YmM2MzhlYmUKPiBJIGNhbiBkZWFsIHdpdGgg
aXQuIEFsc28gd2UgZG9uJ3QgaGF2ZSBhIG1haW50YWluZXIgZm9yIGl0LCBtYXliZSBJIGNhbgo+
IGJlIHRoZSBvbmUuCgpXZSBhbHJlYWR5IGhhdmUgMSBtYWludGFpbmVyIGZvciB0aGlzIEthcm9s
eSBLYXN6YShkb24ndCBrbm93IGlmIAphY3RpdmUpLCBidXQgSSBjYW4gYWRkIG15c2VsZiBhbnl3
YXkuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcg
c2FzCgo+Pj4gICAgICAgb3IxayAgICAgfCAgICAgICAgICAgIHVua25vd24gICAgICAgICAgICAg
fCBOT0sgfCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85MmMwODZiMGM1
YzJhMjk4YTgyYTZlYjljMjg5ZGM1M2M1OGE1ZTVlIHwKPj4KPj4gVG9wLWxldmVsIHBhcmFsbGVs
IGJ1aWxkLCBubyBpZGVhIHdoYXQgdGhlIGlzc3VlIGlzLgo+IAo+IENhbiBzb21lYm9keSBwb2lu
dCBtZSBzb21lIGlkZWEgb24gaG93IHRvIGFwcHJvYWNoIFRvcC1sZXZlbCBwYXJhbGxlbAo+IGJ1
aWxkIGRlYnVnZ2luZz8gSSBhbHNvIGhhdmUgc29tZSB1ZGlza3MgcGFja2FnZSBmYWlsdXJlIGR1
ZSB0byB0aGF0Lgo+IEkgbWVhbiwgbm93IHdoYXQgSSBkbyBpcyAuL2JyX3JlcHJvZHVjZV9idWls
ZCBTSEExLCB0aGVuIEkgQ1RSTC1DIGFuZDoKPiAjIGNkIFNIQTEKPiAjIGNkIG91dHB1dAo+ICMg
bWFrZSBwYWNrYWdlLXRoYXQtZmFpbHMKPiAKPiBCdXQgd2l0aCBUb3AtbGV2ZWwgSSBoYXZlIG1v
cmUgb3V0cHV0LXgsIGhvdyBjYW4gSSByZWlzc3VlIHRoZSBjb21tYW5kCj4gYW5kIGFyZSB0aGVy
ZSBhbnkgdHJpY2sgdG8gZGVidWcgaXQ/Cj4gCj4+PiAgICAgICBvcjFrICAgICB8ICAgICAgICAg
IHplcm9tcS00LjMuNCAgICAgICAgICB8IE5PSyB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzL2Y2ZDljM2IxZTdiZTBlM2M3MjJmNzliYWQ3Yjg5YzdmMWJkMGYyZjAgfAo+
Pj4gICAgICAgb3IxayAgICAgfCAgICAgICAgICB6ZXJvbXEtNC4zLjQgICAgICAgICAgfCBOT0sg
fCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jNmI0ZjM3ZTMwYjdjNmY4
MDNkMzJlNmQ5ZDBkZWM4ZTE1ZTdlYzMwIHwKPj4KPj4gR2l1bGlvID8KPiAKPiBIZXJlIGlzIHRo
ZSBzYW1lIHRoYXQgZ29lcyBmb3Igb3BlbmFsLCBleHRlcm5hbCBCb290bGluIE9wZW5SaXNjCj4g
VG9vbGNoYWluIHVwZGF0ZWQgbXVzdCBzb2x2ZSBpdC4KPiAKPiBCZXN0IHJlZ2FyZHMKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
