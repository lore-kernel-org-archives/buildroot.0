Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE69C4828F
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 15:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C4161531;
	Thu,  1 Feb 2024 15:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C4161531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h750bamLVdjh; Thu,  1 Feb 2024 15:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65A760F6E;
	Thu,  1 Feb 2024 15:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E65A760F6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D26D1BF97E
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 15:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E546460F6E
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 15:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E546460F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9l1ZCZmhivM for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 15:26:10 +0000 (UTC)
Received: from cstnet.cn (smtp20.cstnet.cn [159.226.251.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1B3860B92
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 15:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1B3860B92
Received: from qiusihao23$mails.ucas.ac.cn ( [117.30.136.180] ) by
 ajax-webmail-APP-10 (Coremail) ; Thu, 1 Feb 2024 23:26:03 +0800 (GMT+08:00)
X-Originating-IP: [117.30.136.180]
Date: Thu, 1 Feb 2024 23:26:03 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6YKx5oCd6LGq?= <qiusihao23@mails.ucas.ac.cn>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230921(8ad33efc)
 Copyright (c) 2002-2024 www.mailtech.cn cnic.cn
MIME-Version: 1.0
Message-ID: <7b899b93.ae5f.18d6546ee9a.Coremail.qiusihao23@mails.ucas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowADHz+8MuLtlecQAAA--.4883W
X-CM-SenderInfo: 5tlx2xxkdrjjo6pdxz3voxutnvoduhdfq/1tbiDAcOB2W7suwEwwA
	CsH
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Subject: [Buildroot] Use Clang as toolchain for buildroot
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
Content-Type: multipart/mixed; boundary="===============0721121441900420809=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0721121441900420809==
Content-Type: multipart/alternative; 
	boundary="----=_Part_152663_1182919813.1706801163929"

------=_Part_152663_1182919813.1706801163929
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

IEhpLCBJJ20gbm90IHN1cmUgaWYgbXkgb3JpZ2luYWwgbGV0dGVyIHNlbnQgYnkgbXkgYW5vdGhl
ciBtYWlsIGFjY291bnQgcmVhY2hlZCBwcm9wZXJseSwgSSdtIHNvcnJ5IGlmIHRoaXMgaXMgYSBk
dXBsaWNhdGUgb25lLgoKIEknbSBuZXcgdG8gdGhlIGVtYmVkZGluZyB0aGluZ3MsIGFuZCBJJ20g
bG9va2luZyB0byB1c2UgYnVpbGRyb290IHRvIGdldCBjL2MrKyBwYWNrYWdlcyBjb21waWxlZCB3
aXRoIG11bHRpcGxlIHBhcmFtZXRlcnMgbGlrZSBjb21waWxlciwgYXJjaGl0ZWN0dXJlIGFuZCBv
cHRpbWl6YXRpb24gbGV2ZWwsIGZvciBhY2FkZW1pYyBwdXJwb3NlLiBFLmcsIGluIG15IGRhdGFz
ZXQsIEJpbnV0aWxzIDIuMzIgd2lsbCBiZSBjb21waWxlZCBpbiBbZ2NjMTEsIGFybTY0LCBPMF0s
IFtnY2MxMSwgYXJtNjQsIE8xXSwgLi4uIGFsb25nIHdpdGggb3RoZXIgdmFyaWFibGUgc2V0dGlu
Z3MuCgogSSBub3RpY2VkIHRoYXQgYnVpbGRyb290IGNhbiBzZXQgbW9zdCBvZiB2YXJpYWJsZXMg
aW4gLmNvbmZpZyBmaWxlLCBidXQgcmVnYXJkaW5nIGFkZGluZyBleHRlcm5hbCB0b29sY2hhaW5z
LCBpbmZvcm1hdGlvbiBhcmUgcmVsYXRpdmVseSBpbnN1ZmZpY2llbnQuIEkgd291bGQgbGlrZSB0
byBrbm93IGlmIHRoZXJlIGFyZSBzb21lIHdheXMgdG8gYWRkIGNvbXBpbGVycyBsaWtlIGNsYW5n
IGludG8gdGhlIHBoYXNlIG9mIGJ1aWxkaW5nIHRhcmdldCBwYWNrYWdlcy4KCgo=
------=_Part_152663_1182919813.1706801163929
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHA+Cgk8L3A+PHAgc3R5bGU9InRleHQtd3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6I0ZGRkZG
Rjtmb250LWZhbWlseTrlrovkvZMsIGFyaWFsLCBWZXJkYW5hLCBzYW5zLXNlcmlmO2ZvbnQtc2l6
ZToxNHB4OyI+CgkJJm5ic3A7SGksIEknbSBub3Qgc3VyZSBpZiBteSBvcmlnaW5hbCBsZXR0ZXIg
c2VudCBieSBteSBhbm90aGVyIG1haWwgYWNjb3VudCByZWFjaGVkIHByb3Blcmx5LCBJJ20gc29y
cnkgaWYgdGhpcyBpcyBhIGR1cGxpY2F0ZSBvbmUuCgk8L3A+Cgk8cCBzdHlsZT0idGV4dC13cmFw
OndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGO2ZvbnQtZmFtaWx5OuWui+S9kywgYXJpYWws
IFZlcmRhbmEsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHg7Ij4KCQkmbmJzcDtJJ20gbmV3IHRv
IHRoZSBlbWJlZGRpbmcmbmJzcDt0aGluZ3MsIGFuZCBJJ20gbG9va2luZyZuYnNwO3RvIHVzZSBi
dWlsZHJvb3QgdG8gZ2V0IGMvYysrIHBhY2thZ2VzIGNvbXBpbGVkJm5ic3A7d2l0aCBtdWx0aXBs
ZSZuYnNwO3BhcmFtZXRlcnMmbmJzcDtsaWtlIGNvbXBpbGVyLCZuYnNwO2FyY2hpdGVjdHVyZSBh
bmQgb3B0aW1pemF0aW9uIGxldmVsLCBmb3IgYWNhZGVtaWMgcHVycG9zZS4gRS5nLCBpbiBteSBk
YXRhc2V0LCBCaW51dGlscyAyLjMyIHdpbGwgYmUgY29tcGlsZWQgaW4gW2djYzExLCBhcm02NCwg
TzBdLCBbZ2NjMTEsIGFybTY0LCBPMV0sIC4uLiBhbG9uZyB3aXRoIG90aGVyIHZhcmlhYmxlIHNl
dHRpbmdzLgoJPC9wPgoJPHAgc3R5bGU9InRleHQtd3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6
I0ZGRkZGRjtmb250LWZhbWlseTrlrovkvZMsIGFyaWFsLCBWZXJkYW5hLCBzYW5zLXNlcmlmO2Zv
bnQtc2l6ZToxNHB4OyI+CgkJJm5ic3A7SSBub3RpY2VkIHRoYXQgYnVpbGRyb290IGNhbiBzZXQg
bW9zdCBvZiB2YXJpYWJsZXMgaW4gLmNvbmZpZyBmaWxlLCBidXQgcmVnYXJkaW5nIGFkZGluZyBl
eHRlcm5hbCB0b29sY2hhaW5zLCBpbmZvcm1hdGlvbiBhcmUgcmVsYXRpdmVseSBpbnN1ZmZpY2ll
bnQuIEkgd291bGQgbGlrZSB0byBrbm93IGlmIHRoZXJlIGFyZSBzb21lIHdheXMgdG8gYWRkIGNv
bXBpbGVycyBsaWtlIGNsYW5nIGludG8gdGhlIHBoYXNlIG9mIGJ1aWxkaW5nIHRhcmdldCBwYWNr
YWdlcy4KCTwvcD4KPHA+PC9wPgo8cD4KCTxicj4KPC9wPg==
------=_Part_152663_1182919813.1706801163929--


--===============0721121441900420809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0721121441900420809==--

