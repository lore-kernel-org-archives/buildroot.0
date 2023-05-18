Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576AFC77B7D
	for <buildroot@archiver.kernel.org>; Thu, 18 May 2023 10:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C23FF4282A;
	Thu, 18 May 2023 10:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23FF4282A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uT1nkkUYdyr4; Thu, 18 May 2023 10:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F8F4282E;
	Thu, 18 May 2023 10:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F8F4282E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8F351BF574
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 10:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DDD4011F
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 10:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2DDD4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VjWFQXix8Gf for <buildroot@lists.busybox.net>;
 Thu, 18 May 2023 10:22:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4707400F8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4707400F8
 for <buildroot@buildroot.org>; Thu, 18 May 2023 10:22:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.166]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N2Dx8-1q9n4T00ze-013gmV; Thu, 18 May 2023 12:22:23 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 18 May 2023 12:22:22 +0200
Message-Id: <20230518102222.11946-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:mYGQkfwuCyoMiOr4rpuM7/HZJMC56Fv3YtavB316LgIGL1O+bic
 ELZn8g/XbZbgqUrgT9ueYIXFchflwI1cW1n4CLTiiJAa12uwc1opMtC9e+70elrhPcvoknW
 gmMA7ZL3WIk2nxGVGBBHgC5SvrS9OU1p1Z3jIFkzaW5HWgGKUEkjwZYLREMwpjI3A5lNpqR
 datGe1nI5O+4QURJl/X9g==
UI-OutboundReport: notjunk:1;M01:P0:9l8+tAXcriM=;zcY6X2v3Hgbnh3rMwLGowZdwz+l
 BgHR3rHC1L+vPNdvHDYF7OT1p1elilOFa8HeaBktGDYADgwDORZoZQN20Xlts5MNGZEMKkX91
 DPM/IJP9XmFflArF/z5yBFwNrXIfCgBPcQ1OwcAQAoEsnJicHJZnPZ9vvwObcv5GBqQmqIMov
 tPq7aDK+SpQUTPfpT/jIIUUJjiyfi5BiRgLJ+NYybrz6V9RVSbNm0jOUMTU1d+pqYEKMW/7Wk
 m4MTbLlJ2poEiHhLaWBJbYYYm3A4nFxXw4L0px7jkNVhXVjvF59PVj6w3GnxzuCuurCR1BsMH
 udDGEPU3oTIo6MPEv0AKXodbdssgzFRzp154VFoXlzStWp0YWv45QKM5EcvhVixQU3PQXk2bx
 xcUW4wfa76BkwU161Xql323yk6825K5UAZCq+05PQhQersmVMV62XFzuZGuKgX1vZgLVtsqIz
 UhUNEOTNLPHklGf+J16WaPnW3PFNnLMOC3bH3kUZTooO8AylclM6fCM921LSNEG2muKw2VnBN
 w0VHwqvccrbnw1jIH4Vr3BPb7X9dbCx20zMy2ZHcY8iuKrxVK2taSuCSlie5EYpmq0F/Mdt+/
 0Zk0pC0I1DUsCmmOyrTsTXl6GSPXJjunTWICqhcfE1UtNyO1OB38CmEdcqjApxNya1Agx7lmN
 rMef51MvceU4h/+PKU+PvjX3X7bPmXfGv1q+a/mYobqWK8gffrT0RqA2SAhhPxLYbCABBskFL
 eDg80t5KbIeQAb7231h7O1bWrki9/H7/tL2hJFxlysmIPtTv5UAXKZO1zY1dtfu58FHco7Xod
 VoklYZOXhtWSG//vUk03ceUEgPd1sA6zb3OTOcipJ/T+a9pzLvG+1o73hr5niE3XydVPWUxC4
 T6yDqz0bWWOIs4DMmhJySWytdfqcCGH1So0cEuwmuvoyUiQsDAG2e9M9RiwDB+K8A82hi/Rrf
 UGLZ3SyEJcM7zd+VzJhmXfVdI18=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1684405343; i=ps.report@gmx.net;
 bh=VNcKf1XlAUfDYfzZSpGaaM2vcodUWecrzVZxGT3OUU4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=qHDN7LbWbq2Rnbt0plVixhHmJhHoSq9c6jfBL8SNj075cgURk3XSceUZhtlWOOWU7
 DSM1UAJtGopTf78M0H6fcDekwwqJ+5j/8tsXMlRyZ++G1GUTJRSyT9eayAqcnGHFaF
 yc//clam03gQwJlaQHLgLKQgTj4mZBGKlUpAqkCmTLOAT2YNG6LBsOeHbRIvIMT9g/
 dngXybbt7ca00jqP/ayQBnyF22TWwFXzud0twXNvv9JW3+q2MgDWxSmlY/HWIvL99u
 2bXGp4Tns3XtK4HHVi1qf/P3ZTq/CH++26CJdtmBqY3blpDHOehk9DaINF0cjd0Ii2
 NrUxtgjkVuDdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=qHDN7LbW
Subject: [Buildroot] [PATCH v1] package/llvm: add upstream patch to fix host
 compile (missing include in Signals.h)
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHVwc3RyZWFtIHBhdGNoIHRvIGZpeCBob3N0IGNvbXBpbGUgZXJyb3Igb24gb3BlblNVU0Ug
VHVtYmxld2VlZAooZ2NjLTEzLjAuMSkuCgpGaXhlczoKCiAgLi4uL2J1aWxkL2hvc3QtbGx2bS0x
MS4xLjAvaW5jbHVkZS9sbHZtL1N1cHBvcnQvU2lnbmFscy5oOjExNzo4OiBlcnJvcjogdmFyaWFi
bGUgb3IgZmllbGQg4oCYQ2xlYW51cE9uU2lnbmFs4oCZIGRlY2xhcmVkIHZvaWQKICAgIDExNyB8
ICAgdm9pZCBDbGVhbnVwT25TaWduYWwodWludHB0cl90IENvbnRleHQpOwogICAgICAgIHwgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fgogIC4uLi9idWlsZC9ob3N0LWxsdm0tMTEuMS4wL2luY2x1ZGUv
bGx2bS9TdXBwb3J0L1NpZ25hbHMuaDoxMTc6MjQ6IGVycm9yOiDigJh1aW50cHRyX3TigJkgd2Fz
IG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCiAgICAxMTcgfCAgIHZvaWQgQ2xlYW51cE9uU2ln
bmFsKHVpbnRwdHJfdCBDb250ZXh0KTsKICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+CiAgLi4uL2J1aWxkL2hvc3QtbGx2bS0xMS4xLjAvaW5jbHVkZS9sbHZtL1N1cHBv
cnQvU2lnbmFscy5oOjE4OjE6IG5vdGU6IOKAmHVpbnRwdHJfdOKAmSBpcyBkZWZpbmVkIGluIGhl
YWRlciDigJg8Y3N0ZGludD7igJk7IGRpZCB5b3UgZm9yZ2V0IHRvIOKAmCNpbmNsdWRlIDxjc3Rk
aW50PuKAmT8KICAgICAxNyB8ICNpbmNsdWRlIDxzdHJpbmc+CiAgICArKysgfCsjaW5jbHVkZSA8
Y3N0ZGludD4KICAgICAxOCB8CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+Ci0tLQogLi4uLW1pc3NpbmctY3N0ZGludC1oZWFkZXItdG8tU2lnbmFscy5o
LnBhdGNoIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xsdm0vMDAwMi1BZGQtbWlzc2lu
Zy1jc3RkaW50LWhlYWRlci10by1TaWduYWxzLmgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2xsdm0vMDAwMi1BZGQtbWlzc2luZy1jc3RkaW50LWhlYWRlci10by1TaWduYWxzLmgucGF0Y2gg
Yi9wYWNrYWdlL2xsdm0vMDAwMi1BZGQtbWlzc2luZy1jc3RkaW50LWhlYWRlci10by1TaWduYWxz
LmgucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzc5OGY1ODVk
NgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGx2bS8wMDAyLUFkZC1taXNzaW5nLWNzdGRp
bnQtaGVhZGVyLXRvLVNpZ25hbHMuaC5wYXRjaApAQCAtMCwwICsxLDM0IEBACitGcm9tIGM2Yzcx
YWI0N2Q2NThhYjhmODRlNmE2MDY2ZDQ3NmZkOTYzMmJiY2EgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBTZXJnZWkgVHJvZmltb3ZpY2ggPHNseWljaEBnbWFpbC5jb20+CitEYXRlOiBN
b24sIDIzIE1heSAyMDIyIDA4OjAzOjIzICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNz
aW5nIDxjc3RkaW50PiBoZWFkZXIgdG8gU2lnbmFscy5oCisKK1dpdGhvdXQgdGhlIGNoYW5nZSBs
bHZtIGJ1aWxkIGZhaWxzIG9uIHRoaXMgd2VlaydzIGdjYy0xMyBzbmFwc2hvdCBhczoKKworICAg
IFsgIDAlXSBCdWlsZGluZyBDWFggb2JqZWN0IGxpYi9TdXBwb3J0L0NNYWtlRmlsZXMvTExWTVN1
cHBvcnQuZGlyL1NpZ25hbHMuY3BwLm8KKyAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGx2bS9s
aWIvU3VwcG9ydC9TaWduYWxzLmNwcDoxNDoKKyAgICBsbHZtL2luY2x1ZGUvbGx2bS9TdXBwb3J0
L1NpZ25hbHMuaDoxMTk6ODogZXJyb3I6IHZhcmlhYmxlIG9yIGZpZWxkICdDbGVhbnVwT25TaWdu
YWwnIGRlY2xhcmVkIHZvaWQKKyAgICAgIDExOSB8ICAgdm9pZCBDbGVhbnVwT25TaWduYWwodWlu
dHB0cl90IENvbnRleHQpOworICAgICAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fgorCitV
cHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC9mZjE2
ODFkZGIzMDMyMjM5NzM2NTNmN2Y1ZjNmMzQzNWI0OGExOTgzLnBhdGNoCitTaWduZWQtb2ZmLWJ5
OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBpbmNsdWRlL2xsdm0v
U3VwcG9ydC9TaWduYWxzLmggfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
KworZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGx2bS9TdXBwb3J0L1NpZ25hbHMuaCBiL2luY2x1ZGUv
bGx2bS9TdXBwb3J0L1NpZ25hbHMuaAoraW5kZXggZTBhMThlNzIuLjE0ODIxNmI4IDEwMDY0NAor
LS0tIGEvaW5jbHVkZS9sbHZtL1N1cHBvcnQvU2lnbmFscy5oCisrKysgYi9pbmNsdWRlL2xsdm0v
U3VwcG9ydC9TaWduYWxzLmgKK0BAIC0xNCw2ICsxNCw3IEBACisgI2lmbmRlZiBMTFZNX1NVUFBP
UlRfU0lHTkFMU19ICisgI2RlZmluZSBMTFZNX1NVUFBPUlRfU0lHTkFMU19ICisgCisrI2luY2x1
ZGUgPGNzdGRpbnQ+CisgI2luY2x1ZGUgPHN0cmluZz4KKyAKKyBuYW1lc3BhY2UgbGx2bSB7Cist
LSAKKzIuNDAuMQorCi0tIAoyLjQwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
