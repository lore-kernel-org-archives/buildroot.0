Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AE6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 17:47:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24074604DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 17:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24074604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C21064032F;
	Sun, 25 Jul 2021 17:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vT1dJWQTpzJv; Sun, 25 Jul 2021 17:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5FB840357;
	Sun, 25 Jul 2021 17:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C36E1BF417
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 17:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78BE340229
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKFzd-Y742R5 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 17:47:29 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A6DD400C6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 17:47:28 +0000 (UTC)
Received: from smtpclient.apple ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPA
 id 7i6xmJiAOGRi47i6ymTR5J; Sun, 25 Jul 2021 19:40:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627234825; bh=WS4iiUto3lDS9LHqL3Xm+ScB9/t2VSQm41V6GjA2x4o=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=mJh+hBcMX/CQb6qelXRlMMH0mNC605UratZHKpLlfLZxy4Uj/vXwSrPXBGOGRD2bx
 2CBXPDDwqTDtQ31+2/4mwwp9lzui3X+gU3RJJmUzkR3vJqyNI3E/Q4Xqp5ews1FacL
 qu6UpKZqcaXFxw7wcwtiUGE7uutSXGRZ0w8+qIHvv8uebYybOxX+dUs+Hd+OqiGhXl
 E0HZRK0XUCyk3vCB65ogDRjSnB6F3iN9nES1Z+ygFFh9fIAPvB+qsd7Prd0NFA1CZv
 eBFFksEl41O8ZBUzZ4mubnvI+jg6ayWdLwF+it2W18iYQIkF4ALo2hzbgnnHBM79m3
 da9MjZbBXWsyA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 25 Jul 2021 19:40:23 +0200
Message-Id: <6228377B-52F6-4957-8373-7A87E1C712CD@benettiengineering.com>
References: <dd7ac7f1-924b-7e12-d55f-f217853cb041@benettiengineering.com>
In-Reply-To: <dd7ac7f1-924b-7e12-d55f-f217853cb041@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4xfDVU7p2twVo3gweTPvaIrWXI5b9A0dFS3HFo9srj62S+LA6tvad1t7GMp0Zf3azsipMlkS+kVb/6W5GlAGeC3u8lWsGHq2eGHX27pzsQICyrm0cZ+TQE
 ysSLWmwx2JkgfM/XRrcyP5kc2Y/KLxav6tFgfA6X6/uRqtBpwf+6ZEpcudoyZOc6EAKAYA79lS3MP+zuYy6rbYNl/0qZwnWy8Vr9mF1tB4TO3J0L1zFkxvRw
 fEPddVgrAcl8PaJ8N00/CQ==
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix time_t on 64-bits
 platforms build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

UGxlYXNlIGRyb3AgdGhpcyBwYXRjaCBzaW5jZSBJ4oCZbSBnb2luZyBhbm90aGVyIHVwc3RyZWFt
IHBhdGNoLgoKVGhhbmsgeW91CkdpdWxpbyBCZW5ldHRpCgo+IElsIGdpb3JubyAyMiBsdWcgMjAy
MSwgYWxsZSBvcmUgMTc6NDEsIEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v09uIDcvMjIvMjEgNTozMiBQTSwg
R2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEFkZCBwYXRjaCB0byBmaXggdGltZV90IGJ1aWxkIGZh
aWx1cmUgb24gNjQtYml0cyBwbGF0Zm9ybXMuCj4gCj4gRm9yZ290IHRvIGFkZDoKPiBgYGAKPiBQ
YXRjaCBpcyBwZW5kaW5nIHVwc3RyZWFtOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1uZnMvcGF0Y2gvMjAyMTA3MjIxNTI0MTEuMTE1NjI5NS0xLWdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCj4gYGBgCj4+IEZpeGVzOgo+PiBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85YmMxZDQzYTU4ODMzOGI3Mzk1YWY3YmM5
NzUzNWVlMTZhNmVhMmQ5Lwo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+ICAuLi5tZV90LWJ1aWxk
LWVycm9yLW9uLTY0LWJpdHMtcGxhdGZvcm0ucGF0Y2ggfCA1MiArKysrKysrKysrKysrKysrKysr
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvbmZzLXV0aWxzLzAwMDEtbmZzLXV0aWxzLWZpeC10aW1lX3QtYnVpbGQtZXJy
b3Itb24tNjQtYml0cy1wbGF0Zm9ybS5wYXRjaAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZnMt
dXRpbHMvMDAwMS1uZnMtdXRpbHMtZml4LXRpbWVfdC1idWlsZC1lcnJvci1vbi02NC1iaXRzLXBs
YXRmb3JtLnBhdGNoIGIvcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1uZnMtdXRpbHMtZml4LXRpbWVf
dC1idWlsZC1lcnJvci1vbi02NC1iaXRzLXBsYXRmb3JtLnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjFkZWM0OTRmMjYKPj4gLS0tIC9kZXYvbnVsbAo+
PiArKysgYi9wYWNrYWdlL25mcy11dGlscy8wMDAxLW5mcy11dGlscy1maXgtdGltZV90LWJ1aWxk
LWVycm9yLW9uLTY0LWJpdHMtcGxhdGZvcm0ucGF0Y2gKPj4gQEAgLTAsMCArMSw1MiBAQAo+PiAr
RnJvbSA5ZDI1ZmFhZTEyMTYyNThiNjE3ZGQyZGIxMzRiYzFkOWZhMGZkNzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQo+PiArRnJvbTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+Cj4+ICtEYXRlOiBUaHUsIDIyIEp1bCAyMDIxIDE2OjEzOjE0
ICswMjAwCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIG5mcy11dGlsczogZml4IHRpbWVfdCBidWlsZCBl
cnJvciBvbiA2NC1iaXRzIHBsYXRmb3Jtcwo+PiArTUlNRS1WZXJzaW9uOiAxLjAKPj4gK0NvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+PiArQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAo+PiArCj4+ICtXaGVuIHBhc3NpbmcgdGltZV90IHR5cGUgdG8gIiVsZCIg
b24gNjQtYml0cyBwbGF0Zm9ybXMgd2hlcmUgdGltZV90IGlzIGEKPj4gKydsb25nIGxvbmcnIHdl
IGVuY291dGVyIHRoaXMgYnVpbGQgZmFpbHVyZToKPj4gK2Vycm9yOiBmb3JtYXQg4oCYJWxk4oCZ
IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGludOKAmSwgYnV0IGFyZ3VtZW50IDQg
aGFzIHR5cGUg4oCYdGltZV904oCZIHtha2Eg4oCYbG9uZyBsb25nIGludOKAmX0gWy1XZXJyb3I9
Zm9ybWF0PV0KPj4gKwo+PiArU28gbGV0J3MgY2hhbmdlICIlbGQiIG1hcmtlcnMgdG8gIiVsbGQi
IGFzc3VtaW5nIGl0IHRvIGJlIGEgNjQtYml0cyBhbmQKPj4gK2Nhc3QgdmFyaWFibGVzIHRvICco
bG9uZyBsb25nKScgaWYgdGhlIHR5cGUgaXMgYSB0aW1lX3QuCj4+ICsKPj4gK1NpZ25lZC1vZmYt
Ynk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
Pgo+PiArLS0tCj4+ICsgdXRpbHMvbmZzZGNsdHJhY2svbmZzZGNsdHJhY2suYyB8IDIgKy0KPj4g
KyB1dGlscy9uZnNkY2x0cmFjay9zcWxpdGUuYyAgICAgIHwgNCArKy0tCj4+ICsgMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+ICsKPj4gK2RpZmYgLS1n
aXQgYS91dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0cmFjay5jIGIvdXRpbHMvbmZzZGNsdHJhY2sv
bmZzZGNsdHJhY2suYwo+PiAraW5kZXggZTkyNmYxYzAuLjQzNzQ3N2JiIDEwMDY0NAo+PiArLS0t
IGEvdXRpbHMvbmZzZGNsdHJhY2svbmZzZGNsdHJhY2suYwo+PiArKysrIGIvdXRpbHMvbmZzZGNs
dHJhY2svbmZzZGNsdHJhY2suYwo+PiArQEAgLTUyNSw3ICs1MjUsNyBAQCBjbHRyYWNrX2dyYWNl
ZG9uZShjb25zdCBjaGFyICp0aW1lc3RyKQo+PiArICAgIGlmICgqdGFpbCkKPj4gKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKy0gICAgeGxvZyhEX0dFTkVSQUwsICIlczogZ3JhY2Ug
ZG9uZS4gZ3JhY2V0aW1lPSVsZCIsIF9fZnVuY19fLCBncmFjZXRpbWUpOwo+PiArKyAgICB4bG9n
KERfR0VORVJBTCwgIiVzOiBncmFjZSBkb25lLiBncmFjZXRpbWU9JWxsZCIsIF9fZnVuY19fLCAo
bG9uZyBsb25nKWdyYWNldGltZSk7Cj4+ICsKPj4gKyAgICByZXQgPSBzcWxpdGVfcmVtb3ZlX3Vu
cmVjbGFpbWVkKGdyYWNldGltZSk7Cj4+ICsKPj4gK2RpZmYgLS1naXQgYS91dGlscy9uZnNkY2x0
cmFjay9zcWxpdGUuYyBiL3V0aWxzL25mc2RjbHRyYWNrL3NxbGl0ZS5jCj4+ICtpbmRleCBmNzlh
ZWJiMy4uNmU2MDMwODcgMTAwNjQ0Cj4+ICstLS0gYS91dGlscy9uZnNkY2x0cmFjay9zcWxpdGUu
Ywo+PiArKysrIGIvdXRpbHMvbmZzZGNsdHJhY2svc3FsaXRlLmMKPj4gK0BAIC01NDQsOCArNTQ0
LDggQEAgc3FsaXRlX3JlbW92ZV91bnJlY2xhaW1lZCh0aW1lX3QgZ3JhY2Vfc3RhcnQpCj4+ICsg
ICAgaW50IHJldDsKPj4gKyAgICBjaGFyICplcnIgPSBOVUxMOwo+PiArCj4+ICstICAgIHJldCA9
IHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJERUxFVEUgRlJPTSBjbGllbnRzIFdIRVJFIHRp
bWUgPCAlbGQiLAo+PiArLSAgICAgICAgICAgIGdyYWNlX3N0YXJ0KTsKPj4gKysgICAgcmV0ID0g
c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIkRFTEVURSBGUk9NIGNsaWVudHMgV0hFUkUgdGlt
ZSA8ICVsbGQiLAo+PiArKyAgICAgICAgICAgIChsb25nIGxvbmcpZ3JhY2Vfc3RhcnQpOwo+PiAr
ICAgIGlmIChyZXQgPCAwKSB7Cj4+ICsgICAgICAgIHJldHVybiByZXQ7Cj4+ICsgICAgfSBlbHNl
IGlmICgoc2l6ZV90KXJldCA+PSBzaXplb2YoYnVmKSkgewo+PiArLS0KPj4gKzIuMjUuMQo+PiAr
Cj4gCj4gLS0gCj4gR2l1bGlvIEJlbmV0dGkKPiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
