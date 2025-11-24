Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F3CFD356
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 22:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3045683C71;
	Mon, 24 Nov 2025 22:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nje8oX8-6JJu; Mon, 24 Nov 2025 22:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F01183C77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F01183C77;
	Mon, 24 Nov 2025 22:11:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC53835C
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE9F140750
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_dlY_4BnLQ0 for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 22:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8737406F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8737406F1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8737406F1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:10:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 856408119; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Nov 2025 22:10:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vNelq-00000009F5c-1WmO;
 Mon, 24 Nov 2025 23:10:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251121180848.2106965-1-neal.frager@amd.com> (Neal Frager's
 message of "Fri, 21 Nov 2025 18:08:48 +0000")
References: <20251121180848.2106965-1-neal.frager@amd.com>
Date: Mon, 24 Nov 2025 23:10:54 +0100
Message-ID: <87a50bhyj5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aEHepZJ/P3VbGfBAsfHUzlXDiGvXGrrRfNP4NJ0J/g0U09gJihfUo55BefIH4MEtuHojaCwB63RmOtEzJM2rCb8LEl+Fpdz7uqhqyytAi1CqRIiO1tZsAkxPuPq7HUSW1djWnW6IhHc0YypAwzOb8M9aRe995Azc8NHo3+ItXPhNG8mC4lEUoiVvpNSCKiqOEr7qH7Rmari5BFSzBm0OnkRLVLPvNon/2bz4Uibf9TyJ4GJ0xmTwUcW+9saKmoi9D/8BXU49enGfkDulMOQ/H9/3+7vFxX0tZaQXk7xJYPM13QpEr+7DPtgElGlDzlBXF2Xc0jePiFrAwwOzlBqbPg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=kdU3o4kzRpsscITxOk0FoC/RN/IkD4I4soolsoNLMZs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aEHepZJ/
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2025.2
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cml0ZXM6
CgogPiBCdW1wIGJvb3RnZW4gdG8geGlsaW54X3YyMDI1LjIgdmVyc2lvbi4KID4gVGhlIDAwMDEt
Ymlzb25mbGV4LUZpeC1idWlsZC1vbi1tYWNoaW5lcy13aXRoLW1vZGVybi1mbGV4LnBhdGNoIGlz
IG5vIGxvbmdlcgogPiBuZWVkZWQgYmVjYXVzZSBpdCBoYXMgYmVlbiBjb21taXR0ZWQgdXBzdHJl
YW0gYW5kIGluY2x1ZGVkIHdpdGggdGhlCiA+IHhpbGlueF92MjAyNS4yIHZlcnNpb24uCgogPiBo
dHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2Jvb3RnZW4vY29tbWl0LzA0NzFmMDg0YjA1NzY5MTQz
ZWE5ZTczZjljNDRiMDc1ZmU0MGM4MDEKCiA+IFNpZ25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxu
ZWFsLmZyYWdlckBhbWQuY29tPgoKSG1tLCBkb2VzIG5vdCBidWlsZCBoZXJlIChtaXNzaW5nIGlu
Y2x1ZGUpOgoKQnVpbGRpbmcgZXhlY3V0YWJsZSBmaWxlOiBidWlsZC9iaW4vYm9vdGdlbi4uLgpj
ZCBsbXMtaGFzaC1zaWdzICYmIC91c3IvYmluL21ha2UgaHNzX2xpYl90aHJlYWQuYQovdXNyL2Jp
bi9nY2MgLU8yIC1JL2hvbWUvcGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1
ZGUgLUkvaG9tZS9wZWtvL3NvdXJjZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvaW5jbHVkZSAgLWMg
LW8gbG1zX3NpZ24ubyBsbXNfc2lnbi5jCi91c3IvYmluL2djYyAtTzIgLUkvaG9tZS9wZWtvL3Nv
dXJjZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvaW5jbHVkZSAtSS9ob21lL3Bla28vc291cmNlL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9pbmNsdWRlICAtYyAtbyBsbXNfa2V5cy5vIGxtc19rZXlzLmMK
L3Vzci9iaW4vZ2NjIC1PMiAtSS9ob21lL3Bla28vc291cmNlL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9pbmNsdWRlIC1jIGhzcy5jIC1vIGhzcy5vCi91c3IvYmluL2djYyAtTzIgLUkvaG9tZS9wZWtv
L3NvdXJjZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvaW5jbHVkZSAtYyBoc3NfYWxsb2MuYyAtbyBo
c3NfYWxsb2MubwovdXNyL2Jpbi9nY2MgLU8yIC1JL2hvbWUvcGVrby9zb3VyY2UvYnVpbGRyb290
L291dHB1dC9ob3N0L2luY2x1ZGUgLWMgaHNzX2F1eC5jIC1vIGhzc19hdXgubwovdXNyL2Jpbi9n
Y2MgLU8yIC1JL2hvbWUvcGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1ZGUg
LWMgaHNzX2NvbW1vbi5jIC1vIGhzc19jb21tb24ubwovdXNyL2Jpbi9nY2MgLU8yIC1JL2hvbWUv
cGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1ZGUgLWMgaHNzX2NvbXB1dGUu
YyAtbyBoc3NfY29tcHV0ZS5vCi91c3IvYmluL2djYyAtTzIgLUkvaG9tZS9wZWtvL3NvdXJjZS9i
dWlsZHJvb3Qvb3V0cHV0L2hvc3QvaW5jbHVkZSAtYyBoc3NfZ2VuZXJhdGUuYyAtbyBoc3NfZ2Vu
ZXJhdGUubwovdXNyL2Jpbi9nY2MgLU8yIC1JL2hvbWUvcGVrby9zb3VyY2UvYnVpbGRyb290L291
dHB1dC9ob3N0L2luY2x1ZGUgLWMgaHNzX2tleWdlbi5jIC1vIGhzc19rZXlnZW4ubwovdXNyL2Jp
bi9nY2MgLU8yIC1JL2hvbWUvcGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1
ZGUgLWMgaHNzX3BhcmFtLmMgLW8gaHNzX3BhcmFtLm8KL3Vzci9iaW4vZ2NjIC1PMiAtSS9ob21l
L3Bla28vc291cmNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9pbmNsdWRlIC1jIGhzc19yZXNlcnZl
LmMgLW8gaHNzX3Jlc2VydmUubwovdXNyL2Jpbi9nY2MgLU8yIC1JL2hvbWUvcGVrby9zb3VyY2Uv
YnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1ZGUgLWMgaHNzX3NpZ24uYyAtbyBoc3Nfc2lnbi5v
Ci91c3IvYmluL2djYyAtTzIgLUkvaG9tZS9wZWtvL3NvdXJjZS9idWlsZHJvb3Qvb3V0cHV0L2hv
c3QvaW5jbHVkZSAtYyBoc3Nfc2lnbl9pbmMuYyAtbyBoc3Nfc2lnbl9pbmMubwpoc3NfcGFyYW0u
YzogSW4gZnVuY3Rpb24g4oCYaHNzX2dldF9wYXJhbWV0ZXJfc2V04oCZOgpoc3NfcGFyYW0uYzox
NTc6MTM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwcmludGbi
gJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgMTU3IHwgICAgICAgICAgICAg
cHJpbnRmKCJQcml2YXRlIGtleSBleHBpcmVkXG4iKTsKICAgICAgfCAgICAgICAgICAgICBefn5+
fn4KaHNzX3BhcmFtLmM6NzoxOiBub3RlOiBpbmNsdWRlIOKAmDxzdGRpby5oPuKAmSBvciBwcm92
aWRlIGEgZGVjbGFyYXRpb24gb2Yg4oCYcHJpbnRm4oCZCiAgICA2IHwgI2luY2x1ZGUgImxtX2Nv
bW1vbi5oIgogICsrKyB8KyNpbmNsdWRlIDxzdGRpby5oPgogICAgNyB8Cmhzc19wYXJhbS5jOjE1
NzoxMzogd2FybmluZzogaW5jb21wYXRpYmxlIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGJ1aWx0
LWluIGZ1bmN0aW9uIOKAmHByaW50ZuKAmSBbLVdidWlsdGluLWRlY2xhcmF0aW9uLW1pc21hdGNo
XQogIDE1NyB8ICAgICAgICAgICAgIHByaW50ZigiUHJpdmF0ZSBrZXkgZXhwaXJlZFxuIik7CiAg
ICAgIHwgICAgICAgICAgICAgXn5+fn5+Cmhzc19wYXJhbS5jOjE1NzoxMzogbm90ZTogaW5jbHVk
ZSDigJg8c3RkaW8uaD7igJkgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mIOKAmHByaW50ZuKA
mQptYWtlWzNdOiAqKiogW01ha2VmaWxlOjM4OiBoc3NfcGFyYW0ub10gRXJyb3IgMQptYWtlWzNd
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlWzJdOiAqKiogW01ha2Vm
aWxlOjg0OiBidWlsZC9iaW4vYm9vdGdlbl0gRXJyb3IgMgoKClRoaXMgaXMgb24gRGViaWFuIDEz
IC8gZ2NjIDE0OgoKZ2NjIC12ClVzaW5nIGJ1aWx0LWluIHNwZWNzLgpDT0xMRUNUX0dDQz1nY2MK
Q09MTEVDVF9MVE9fV1JBUFBFUj0vdXNyL2xpYmV4ZWMvZ2NjL3g4Nl82NC1saW51eC1nbnUvMTQv
bHRvLXdyYXBwZXIKT0ZGTE9BRF9UQVJHRVRfTkFNRVM9bnZwdHgtbm9uZTphbWRnY24tYW1kaHNh
Ck9GRkxPQURfVEFSR0VUX0RFRkFVTFQ9MQpUYXJnZXQ6IHg4Nl82NC1saW51eC1nbnUKQ29uZmln
dXJlZCB3aXRoOiAuLi9zcmMvY29uZmlndXJlIC12IC0td2l0aC1wa2d2ZXJzaW9uPSdEZWJpYW4g
MTQuMi4wLTE5JyAtLXdpdGgtYnVndXJsPWZpbGU6Ly8vdXNyL3NoYXJlL2RvYy9nY2MtMTQvUkVB
RE1FLkJ1Z3MgLS1lbmFibGUtbGFuZ3VhZ2VzPWMsYWRhLGMrKyxnbyxkLGZvcnRyYW4sb2JqYyxv
YmotYysrLG0yLHJ1c3QgLS1wcmVmaXg9L3VzciAtLXdpdGgtZ2NjLW1ham9yLXZlcnNpb24tb25s
eSAtLXByb2dyYW0tc3VmZml4PS0xNCAtLXByb2dyYW0tcHJlZml4PXg4Nl82NC1saW51eC1nbnUt
IC0tZW5hYmxlLXNoYXJlZCAtLWVuYWJsZS1saW5rZXItYnVpbGQtaWQgLS1saWJleGVjZGlyPS91
c3IvbGliZXhlYyAtLXdpdGhvdXQtaW5jbHVkZWQtZ2V0dGV4dCAtLWVuYWJsZS10aHJlYWRzPXBv
c2l4IC0tbGliZGlyPS91c3IvbGliIC0tZW5hYmxlLW5scyAtLWVuYWJsZS1ib290c3RyYXAgLS1l
bmFibGUtY2xvY2FsZT1nbnUgLS1lbmFibGUtbGlic3RkY3h4LWRlYnVnIC0tZW5hYmxlLWxpYnN0
ZGN4eC10aW1lPXllcyAtLXdpdGgtZGVmYXVsdC1saWJzdGRjeHgtYWJpPW5ldyAtLWVuYWJsZS1s
aWJzdGRjeHgtYmFja3RyYWNlIC0tZW5hYmxlLWdudS11bmlxdWUtb2JqZWN0IC0tZGlzYWJsZS12
dGFibGUtdmVyaWZ5IC0tZW5hYmxlLXBsdWdpbiAtLWVuYWJsZS1kZWZhdWx0LXBpZSAtLXdpdGgt
c3lzdGVtLXpsaWIgLS1lbmFibGUtbGlicGhvYm9zLWNoZWNraW5nPXJlbGVhc2UgLS13aXRoLXRh
cmdldC1zeXN0ZW0temxpYj1hdXRvIC0tZW5hYmxlLW9iamMtZ2M9YXV0byAtLWVuYWJsZS1tdWx0
aWFyY2ggLS1kaXNhYmxlLXdlcnJvciAtLWVuYWJsZS1jZXQgLS13aXRoLWFyY2gtMzI9aTY4NiAt
LXdpdGgtYWJpPW02NCAtLXdpdGgtbXVsdGlsaWItbGlzdD1tMzIsbTY0LG14MzIgLS1lbmFibGUt
bXVsdGlsaWIgLS13aXRoLXR1bmU9Z2VuZXJpYyAtLWVuYWJsZS1vZmZsb2FkLXRhcmdldHM9bnZw
dHgtbm9uZT0vYnVpbGQvcmVwcm9kdWNpYmxlLXBhdGgvZ2NjLTE0LTE0LjIuMC9kZWJpYW4vdG1w
LW52cHR4L3VzcixhbWRnY24tYW1kaHNhPS9idWlsZC9yZXByb2R1Y2libGUtcGF0aC9nY2MtMTQt
MTQuMi4wL2RlYmlhbi90bXAtZ2NuL3VzciAtLWVuYWJsZS1vZmZsb2FkLWRlZmF1bHRlZCAtLXdp
dGhvdXQtY3VkYS1kcml2ZXIgLS1lbmFibGUtY2hlY2tpbmc9cmVsZWFzZSAtLWJ1aWxkPXg4Nl82
NC1saW51eC1nbnUgLS1ob3N0PXg4Nl82NC1saW51eC1nbnUgLS10YXJnZXQ9eDg2XzY0LWxpbnV4
LWdudSAtLXdpdGgtYnVpbGQtY29uZmlnPWJvb3RzdHJhcC1sdG8tbGVhbiAtLWVuYWJsZS1saW5r
LXNlcmlhbGl6YXRpb249MwpUaHJlYWQgbW9kZWw6IHBvc2l4ClN1cHBvcnRlZCBMVE8gY29tcHJl
c3Npb24gYWxnb3JpdGhtczogemxpYiB6c3RkCmdjYyB2ZXJzaW9uIDE0LjIuMCAoRGViaWFuIDE0
LjIuMC0xOSkKCgpDYXJlIHRvIHRha2UgYSBsb29rPwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
