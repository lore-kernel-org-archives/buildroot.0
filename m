Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CF7E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 13:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769E4402B3;
	Thu,  2 Jan 2025 13:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys1nwm76v7RE; Thu,  2 Jan 2025 13:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173B2402D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173B2402D8;
	Thu,  2 Jan 2025 13:12:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BE65E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22EF7403FC
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZxiIm_3drfW for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 13:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABE28401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE28401CC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABE28401CC
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:12:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 965424558; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jan 2025 13:12:30 +0000 (UTC)
Message-ID: <d03557de-0e07-40c3-8b79-d64f7e742d49@korsgaard.com>
Date: Thu, 2 Jan 2025 14:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20241222162615.1872897-1-thomas.petazzoni@bootlin.com>
 <9e230093e58ed8947245818dfa9e27f4@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <9e230093e58ed8947245818dfa9e27f4@free.fr>
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eTdQHtwdbktstrCIe17PDwZl6SAwcIyoUj11OG3+gg5PwKJptAX7k4PMLh6dzrPgB/AFLXN+wE3GCB5itenwe2aBAi7fAkTmDzABDhlGXVsPdfSgiy79WYFIvln9Y9bIWf8B5M3SH1xq+9MzvI6rmclZgOZeWY3J9HLoKt0k+soQ97JqNgZfr9HfZ5C5UjD6Bwhb5SDSmq+BhzThiOE1C28m3yGtMSPQTfXd5G7E9BX27NKMYs0y6e17RdymWTVP7dgsF6IFsO4SVAitsu3XylLpzQH+9jmP/UCD+ritVizE4EcJV10giLzG5XdMcYtJ/glwQvoQDoWbeICbaK2Y/g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=FKrWpOPqNN1zZFzQBL5Rkd+0xGMJzVr/AigIgH9imSQ=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=eTdQHtwd
Subject: Re: [Buildroot] [PATCH] package/python-autocommand: add patch to
 fix build issue
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMjIvMjQgMTg6MTAsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IE9uIDIyLzEyLzIwMjQg
MTc6MjYsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4+IFNpbmNlIHRoZSBweXRob24tYXV0b2Nv
bW1hbmQgcGFja2FnZSBoYXMgYmVlbiBpbnRyb2R1Y2VkIGluIGNvbW1pdAo+PiBiNmYzMjc4NTM5
MjE2ZjU1ZmIxOGZmN2U2M2NlMmRhMzllZDBjM2UxICgicGFja2FnZS9weXRob24tYXV0b2NvbW1h
bmQ6Cj4+IG5ldyBwYWNrYWdlIiksIGl0IGhhcyBjb25zaXN0ZW50bHkgYmVlbiBmYWlsaW5nIHRv
IGJ1aWxkIHdpdGg6Cj4+Cj4+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPj4g
wqAgRmlsZSAiL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMi9vdXRwdXQtMS9o
b3N0L2xpYi8gCj4+IHB5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9weXByb2plY3RfaG9va3MvX2lu
X3Byb2Nlc3MvX2luX3Byb2Nlc3MucHkiLCAKPj4gbGluZSAzNTMsIGluIDxtb2R1bGU+Cj4+IMKg
wqDCoCBtYWluKCkKPj4gwqAgRmlsZSAiL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5j
ZS0xMi9vdXRwdXQtMS9ob3N0L2xpYi8gCj4+IHB5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9weXBy
b2plY3RfaG9va3MvX2luX3Byb2Nlc3MvX2luX3Byb2Nlc3MucHkiLCAKPj4gbGluZSAzMzUsIGlu
IG1haW4KPj4gwqDCoMKgIGpzb25fb3V0WydyZXR1cm5fdmFsJ10gPSBob29rKCoqaG9va19pbnB1
dFsna3dhcmdzJ10pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KPj4gwqAgRmlsZSAi
L2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMi9vdXRwdXQtMS9ob3N0L2xpYi8g
Cj4+IHB5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9weXByb2plY3RfaG9va3MvX2luX3Byb2Nlc3Mv
X2luX3Byb2Nlc3MucHkiLCAKPj4gbGluZSAxMTgsIGluIGdldF9yZXF1aXJlc19mb3JfYnVpbGRf
d2hlZWwKPj4gwqDCoMKgIHJldHVybiBob29rKGNvbmZpZ19zZXR0aW5ncykKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4+IMKgIEZpbGUgIi9ob21lL2F1dG9i
dWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9zdC9saWIvIAo+PiBweXRob24z
LjEyL3NpdGUtcGFja2FnZXMvc2V0dXB0b29scy9idWlsZF9tZXRhLnB5IiwgbGluZSAzMjcsIGlu
IAo+PiBnZXRfcmVxdWlyZXNfZm9yX2J1aWxkX3doZWVsCj4+IMKgwqDCoCByZXR1cm4gc2VsZi5f
Z2V0X2J1aWxkX3JlcXVpcmVzKGNvbmZpZ19zZXR0aW5ncywgcmVxdWlyZW1lbnRzPVtdKQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4+IMKgIEZpbGUgIi9ob21lL2F1dG9idWlsZC9hdXRvYnVp
bGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9zdC9saWIvIAo+PiBweXRob24zLjEyL3NpdGUtcGFj
a2FnZXMvc2V0dXB0b29scy9idWlsZF9tZXRhLnB5IiwgbGluZSAyOTcsIGluIAo+PiBfZ2V0X2J1
aWxkX3JlcXVpcmVzCj4+IMKgwqDCoCBzZWxmLnJ1bl9zZXR1cCgpCj4+IMKgIEZpbGUgIi9ob21l
L2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9zdC9saWIvIAo+PiBw
eXRob24zLjEyL3NpdGUtcGFja2FnZXMvc2V0dXB0b29scy9idWlsZF9tZXRhLnB5IiwgbGluZSA0
OTcsIGluIAo+PiBydW5fc2V0dXAKPj4gwqDCoMKgIHN1cGVyKCkucnVuX3NldHVwKHNldHVwX3Nj
cmlwdD1zZXR1cF9zY3JpcHQpCj4+IMKgIEZpbGUgIi9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQv
aW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9zdC9saWIvIAo+PiBweXRob24zLjEyL3NpdGUtcGFja2Fn
ZXMvc2V0dXB0b29scy9idWlsZF9tZXRhLnB5IiwgbGluZSAzMTMsIGluIAo+PiBydW5fc2V0dXAK
Pj4gwqDCoMKgIGV4ZWMoY29kZSwgbG9jYWxzKCkpCj4+IMKgIEZpbGUgIjxzdHJpbmc+IiwgbGlu
ZSA4LCBpbiA8bW9kdWxlPgo+PiDCoCBGaWxlICIvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2lu
c3RhbmNlLTEyL291dHB1dC0xL2hvc3QvbGliLyAKPj4gcHl0aG9uMy4xMi9zaXRlLXBhY2thZ2Vz
L3NldHVwdG9vbHMvX19pbml0X18ucHkiLCBsaW5lIDEwOCwgaW4gc2V0dXAKPj4gwqDCoMKgIHJl
dHVybiBkaXN0dXRpbHMuY29yZS5zZXR1cCgqKmF0dHJzKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+PiDCoCBGaWxlICIvaG9tZS9hdXRvYnVp
bGQvYXV0b2J1aWxkL2luc3RhbmNlLTEyL291dHB1dC0xL2hvc3QvbGliLyAKPj4gcHl0aG9uMy4x
Mi9zaXRlLXBhY2thZ2VzL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9jb3JlLnB5IiwgbGluZSAxNTgs
IGluIAo+PiBzZXR1cAo+PiDCoMKgwqAgZGlzdC5wYXJzZV9jb25maWdfZmlsZXMoKQo+PiDCoCBG
aWxlICIvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTEyL291dHB1dC0xL2hvc3Qv
bGliLyAKPj4gcHl0aG9uMy4xMi9zaXRlLXBhY2thZ2VzL3NldHVwdG9vbHMvZGlzdC5weSIsIGxp
bmUgNjMyLCBpbiAKPj4gcGFyc2VfY29uZmlnX2ZpbGVzCj4+IMKgwqDCoCBweXByb2plY3R0b21s
LmFwcGx5X2NvbmZpZ3VyYXRpb24oc2VsZiwgZmlsZW5hbWUsIAo+PiBpZ25vcmVfb3B0aW9uX2Vy
cm9ycykKPj4gwqAgRmlsZSAiL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMi9v
dXRwdXQtMS9ob3N0L2xpYi8gCj4+IHB5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9zZXR1cHRvb2xz
L2NvbmZpZy9weXByb2plY3R0b21sLnB5IiwgbGluZSA3MSwgCj4+IGluIGFwcGx5X2NvbmZpZ3Vy
YXRpb24KPj4gwqDCoMKgIHJldHVybiBfYXBwbHkoZGlzdCwgY29uZmlnLCBmaWxlcGF0aCkKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4+IMKg
IEZpbGUgIi9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9z
dC9saWIvIAo+PiBweXRob24zLjEyL3NpdGUtcGFja2FnZXMvc2V0dXB0b29scy9jb25maWcvX2Fw
cGx5X3B5cHJvamVjdHRvbWwucHkiLCAKPj4gbGluZSA1MywgaW4gYXBwbHkKPj4gwqDCoMKgIF9h
cHBseV9wcm9qZWN0X3RhYmxlKGRpc3QsIGNvbmZpZywgcm9vdF9kaXIpCj4+IMKgIEZpbGUgIi9o
b21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9zdC9saWIvIAo+
PiBweXRob24zLjEyL3NpdGUtcGFja2FnZXMvc2V0dXB0b29scy9jb25maWcvX2FwcGx5X3B5cHJv
amVjdHRvbWwucHkiLCAKPj4gbGluZSA3OSwgaW4gX2FwcGx5X3Byb2plY3RfdGFibGUKPj4gwqDC
oMKgIGNvcnJlc3AoZGlzdCwgdmFsdWUsIHJvb3RfZGlyKQo+PiDCoCBGaWxlICIvaG9tZS9hdXRv
YnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTEyL291dHB1dC0xL2hvc3QvbGliLyAKPj4gcHl0aG9u
My4xMi9zaXRlLXBhY2thZ2VzL3NldHVwdG9vbHMvY29uZmlnL19hcHBseV9weXByb2plY3R0b21s
LnB5IiwgCj4+IGxpbmUgMTgxLCBpbiBfbGljZW5zZQo+PiDCoMKgwqAgX3NldF9jb25maWcoZGlz
dCwgImxpY2Vuc2UiLCB2YWxbInRleHQiXSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+fn5eXl5eXl5eXgo+PiBLZXlF
cnJvcjogJ3RleHQnCj4+Cj4+IFRoaXMgaXMgZHVlIHRvIGluY29ycmVjdCBsaWNlbnNlIGluZm9y
bWF0aW9uIGluIHB5cHJvamVjdC50b21sLiBUaGlzCj4+IHdhcyBwcm9iYWJseSBtaXNzZWQgYXMg
dGhlIHBhY2thZ2Ugd2FzIG1lcmdlZCB+NiBtb250aHMgYWZ0ZXIgaXQgd2FzCj4+IHN1Ym1pdHRl
ZCwgc28gcHJvYmFibHkgYXQgdGhlIHRpbWUgaXQgd2FzIHN1Ym1pdHRlZCwgaXQgd29ya2VkIGZp
bmUsCj4+IGJ1dCBnb3QgYnJva2VuIHdpdGggbW9yZSByZWNlbnQgdmVyc2lvbnMgb2Ygc2V0dXB0
b29scy4KPj4KPj4gRml4ZXM6Cj4+Cj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzLyAKPj4gYzkxMTQ4MzRlYjAwNTY5Y2RiOGVjMzI1MWNjZDVlY2ZkOTA2YzljOS8KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4KPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQ29tbWl0dGVkIHRvIDIw
MjQuMTEueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
