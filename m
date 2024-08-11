Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C7C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 10:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C6F740758;
	Sun, 11 Aug 2024 10:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbBv6tZW4Ixc; Sun, 11 Aug 2024 10:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F694075D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27F694075D;
	Sun, 11 Aug 2024 10:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DBD21BF3A4
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C1F4075D
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFov9LGRFUY8 for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 10:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AB9C40758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB9C40758
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AB9C40758
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:34:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK4f-1sLhTf3DuL-00tiN5; Sun, 11
 Aug 2024 12:34:26 +0200
Date: Sun, 11 Aug 2024 12:34:25 +0200
MIME-Version: 1.0
Message-Id: <20240811-aer-inject-v1-1-9cee7e3bd9b2@gmx.net>
X-B4-Tracking: v=1; b=H4sIALCTuGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0ND3cTUIt3MvKzU5BJd09QUc8s0A1NTk7RkJaCGgqLUtMwKsGHRsbW
 1AD3+ajdcAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723372466; l=2285;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=0GUg18pj5saqCbzSzRIvvmonHBMZuApeLxFQIyIn7gs=;
 b=eWTXgNjyba3lrgu+7c+1R3Lpl0N5BCYZhb0H9uIsDWZLlt+kSILDWenigS9mmd7G5CNziXAiA
 C0Ud117qmXgAUaQJGuR1sjtMOHksRlXLUCVm7cfYcRWrVsjz+Ru0Hyv
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:DKCO1PDzOrosUZtseVrcamI7UFM28rk1DS3Mye5405AlJd8MsES
 BIjG2gx+gBfNL9P4ykVwRz86Rvk+1AU7lvR5H1OhbXGoKFTjL1XCHuqgYTNA0pEX4PxRTUW
 j5jRBmF5fb2w6JItbTUaZxV8USv0kTn/n1oWywPhuuKiPklzpE05SCTWGMqO9ZN6mCt5ZFG
 69zcu4ocn/pfjFAiUxtmQ==
UI-OutboundReport: notjunk:1;M01:P0:mZMrXfokOxE=;D/MpxvzLGAiwguy+gSnKVIfJd7B
 gVbqMNta/m80aTtHJIn4QfydqXkCDRIkah53qFcG9SKH/OlQ+5Dupm+jqVdtZlFcfBSgQ2y1P
 dDpKbQN1NOhIruiJcPVwJjiMf7rCbTNgRakJbGFadMEN+A9RhmrmvW/1X3jo2Udj2TQRsNQJr
 31hNSQ7KmbXPSswcc5xRini4DrZ9955Qv5XRlyn69kKmLha8xY3mDHklyOpC7TgGG7pmAejWR
 1WSIXp5HS/PYlmNxNAg8XHrRPgR9CKsJ3p8oZssbg6Jd0Qe2HsNJSZHTRRoHd/0OE9Dxj+Gmb
 I134brK4Y9685zpFVSMGqOQQ2OF4+6PnQnQ4yQu0SeO8N9OJWyvKEpRZGIUGUdjl3Wr9jaTZD
 gbIlxasy8Dq0eDXLLq7tfmf4wIn2fxlV4O3kD6Uk5Oa4lc94+fcvwltSWHUvcPva6g1yS+Dvb
 t9ldZNucLs2idga8MuxvqqKq/SSwtb1GAA6ksQDUxXknswHgbAz0RNLJ4w8X+MkHWpY+a7Dkf
 aAP2qMfZrh8NIvOnwXjHqvjqzS/hI4jdriBe2+QaQFWkTmEwuDcOsHpT2NixB/XkISI1xi75J
 NXeshZgPCnTtsC+/dX/ZYdtag/tweCgRfKSQIMpVqt+NfdexyKhdIqfYpu10wzNjm4tyUFtqS
 jv112uBpAG5C+jjHYaySQliOP3zp67gYtIiveKW2ovVSfE8dxOLDR6Nv9DXtvvfhFj68btB0p
 nIi8chiO5+/eKcjb65mtZzPy5pA8H5Ii0kizQCaWbyLWDrQbDXPplkcRj9/CRgAFB03hziADv
 cNJ8p4Su3trZ49RCJpV+9Thw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723372467; x=1723977267; i=j.neuschaefer@gmx.net;
 bh=7767/QBILy6Wr4ba0evBuMvEBPbZUMKxrs3vPpVe80k=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NbrhAPxEIJcmm+1ZVM9IIoiPF9vhl7yKwCj8KNHcbDL6nsyhr1LiYcspeixAAkVD
 olKAaxAnWrjxZMvgtLp3et2pqZt3OBhhe3eU4MBoK6KlHGlNp5o365gOpS+rlge7o
 IexcjouJL+5tDgizn3IFtHrqbKeJfNtAGbcEriECmCLvvBGXb7lOIRX6y+y2szbqk
 rcJlXo5k4Xxbe5CRZUheDReI8peRBmsOcxV7dboXVW1i+twWMKRbwgDaYKrmSURCy
 c5/eRzwAcDCkwhbvS+ByFeTSJnGpCWoei8/kZ88+Ltbf9o55O095O4v8FPqWq7zzb
 lnylUAXKLqhCOtBemQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NbrhAPxE
Subject: [Buildroot] [PATCH] package/aer-inject: Fix build error due to
 missing basename() prototype
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgc2V2ZXJhbCBidWlsZCBmYWlsdXJlcyBzdWNoIGFzOgogIGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzL2U2MS9lNjEzZmM3NzcwNTFiZTYzMjVkN2UzYzA4OGQ1Zjcy
M2ZhYjUxOGZhL2J1aWxkLWVuZC5sb2cKClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxq
Lm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQpUaGlzIHBhdGNoIGlzIGZyb20gS3VwcHVzd2FteSBT
YXRoeWFuYXJheWFuYW4ncyBmb3JrIG9mIGFlci1pbmplY3QuIEFuCmFsdGVybmF0aXZlIHRvIGlu
Y2x1ZGluZyB0aGUgcGF0Y2ggd291bGQgYmUgdG8gc3dpdGNoIHRvIHRoaXMgZm9yayBhcwpCdWls
ZHJvb3QncyBpZGVhIG9mIHVwc3RyZWFtLiBDdXJyZW50bHksIGl0IGlzIHRoZSBvbmx5IGNoYW5n
ZSBpbiB0aGUKZm9yaywgdGhvdWdoLgotLS0KIHBhY2thZ2UvYWVyLWluamVjdC8wMDAxLWxpYmdl
bi1iYXNlbmFtZS5wYXRjaCB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Flci1pbmpl
Y3QvMDAwMS1saWJnZW4tYmFzZW5hbWUucGF0Y2ggYi9wYWNrYWdlL2Flci1pbmplY3QvMDAwMS1s
aWJnZW4tYmFzZW5hbWUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uNzNjMjFhZDhmNAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYWVyLWluamVjdC8wMDAx
LWxpYmdlbi1iYXNlbmFtZS5wYXRjaApAQCAtMCwwICsxLDM1IEBACitGcm9tIDE5N2Y1MWQyOWEw
MWY0Njc1MGZhNjkyODQwOTMwMWFhOGYxMTYzZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogTW9uLCAyNSBNYXIgMjAy
NCAwOTowNDo0MCAtMDcwMAorU3ViamVjdDogYWVyLWluamVjdDogSW5jbHVkZSBsaWJnZW4uaCBm
b3IgZXhwbGljaXQgYmFzZW5hbWUgcHJvdG90eXBlCisKK1RoZSBwcm90b3R5cGUgZm9yIGJhc2Vu
YW1lIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBzdHJpbmcuaCBpbiB0aGUgbGF0ZXN0Cit2ZXJzaW9u
cyBvZiBtdXNsIFsxXS4gVGhpcyBhYnNlbmNlIG9mIHByb3RvdHlwZSBpcyBmbGFnZ2VkIGFzIGFu
IGVycm9yCitieSBzb21lIGNvbXBpbGVycywgc3VjaCBhcyBjbGFuZy0xOC4gVG8gcmVzb2x2ZSB0
aGlzLCBpbmNsdWRlIGxpYmdlbi5oCitleHBsaWNpdGx5LCB3aGljaCBwcm92aWRlcyB0aGUgcHJv
dG90eXBlIGZvciBiYXNlbmFtZS4KKworWzFdIGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcvY2dp
dC9tdXNsL2NvbW1pdC8/aWQ9NzI1ZTE3ZWQ2ZGZmNGQwY2QyMjQ4N2JiNjQ0NzA4ODFlODZhOTJl
NworU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KK1tzYXRoeWE6
IFVwZGF0ZWQgdGhlIGNvbW1pdCBsb2ddCitTaWduZWQtb2ZmLWJ5OiBLdXBwdXN3YW15IFNhdGh5
YW5hcmF5YW5hbiA8c2F0aHlhbmFyYXlhbmFuLmt1cHB1c3dhbXlAbGludXguaW50ZWwuY29tPgor
VXBzdHJlYW06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2tuc2F0aHlhL2Flci1pbmplY3QuZ2l0L2NvbW1pdC8/aWQ9MTk3ZjUxZDI5YTAxZjQ2NzUwZmE2
OTI4NDA5MzAxYWE4ZjExNjNkNworU2lnbmVkLW9mZi1ieTogSi4gTmV1c2NoYWVmZXIgPGoubmV1
c2NoYWVmZXJAZ214Lm5ldD4KKy0tLQorIGFlci1pbmplY3QuYyB8IDEgKworIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvYWVyLWluamVjdC5jIGIvYWVyLWlu
amVjdC5jCitpbmRleCA3NGU3ZjcyLi5lZWQxMjExIDEwMDY0NAorLS0tIGEvYWVyLWluamVjdC5j
CisrKysgYi9hZXItaW5qZWN0LmMKK0BAIC0xMSw2ICsxMSw3IEBACisgICovCisKKyAjaW5jbHVk
ZSA8c3RkaW8uaD4KKysjaW5jbHVkZSA8bGliZ2VuLmg+CisgI2luY2x1ZGUgPHN0ZGxpYi5oPgor
ICNpbmNsdWRlIDxzdHJpbmcuaD4KKyAjaW5jbHVkZSA8ZmNudGwuaD4KKy0tCitjZ2l0IDEuMi4z
LWtvcmcKKwoKLS0tCmJhc2UtY29tbWl0OiA3NGI0NmQwOGRhN2FkYzQ5YjAxZjdhZjdlYmI5ZTE0
MjFiOGE5MzYyCmNoYW5nZS1pZDogMjAyNDA4MTEtYWVyLWluamVjdC01ZWQ3OWYwNTU0ZmMKCkJl
c3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
