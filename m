Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D61C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 18:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCD460BE4;
	Tue,  8 Mar 2022 18:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlUyJfc_rNgD; Tue,  8 Mar 2022 18:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8939460B2E;
	Tue,  8 Mar 2022 18:35:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF401BF290
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 584F582779
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgofD1bOOvj1 for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 18:35:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38B4782768
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 18:35:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id w27so33833536lfa.5
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SR+j2ZCgdQ/zN3vhgLiro2Xc3PRzgSPccq+XjNmNm4=;
 b=Gcj1bV6w+w87gcED5BEJMuZ3jlGGOy5QWMjdGLURKx+tl8qos40cQMpvzS71abVx+b
 0etzyaI12a7G+Zxl9NBn+rmMo5XP+c7asDebTLgrdQdZovEwbaXqJoqfliypqJz8hpF6
 SdGlwbqAkcYvIfYbzvSLzYGeSo+ePOo65qM391lfXkZ9PLOiQ6O8LjSSOIl6CORvL0yY
 j3Qs5xsB4LMZcATOd97RsuJqb8KmAlcW8MlopW0JUzcAYYRrXxCKVGFGiMohwOTfQT4e
 z2JwUQuUMrH1Q2YcBQV44yDtlj2KYDn91DWbNJ80n6/lKkK42/C907eEKZ0AD+J4YyuO
 r7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SR+j2ZCgdQ/zN3vhgLiro2Xc3PRzgSPccq+XjNmNm4=;
 b=VJjr2Ei7iXWLWlAOcziRCV0GUzb0duSHttVnLCbPRwCtTCvxgUtPV8E5MScskOjdi3
 TK9xUXwoPE4XkMDHfh1RmghG3djjWc7MMnI2MgFxclMBHfYKFLYiCXwWYrA8DjC8PfZA
 d7ekMFlgxdi0Yb+ZAsCGTMxVBbsMjey5sjOLixnwnZ59OtUKIoJZvdbjtX5zwtbJx7lm
 PSw81d5p2bJl99/QCscT7WSHwYusngiaxvX+s+e5n2d2TrmP7uTMJxtYixTg/3q+jfqL
 YDKcBmx3kjPNIWGHbmI7nojwYb1rlFWaN3yGxXm/gQSiccDjLWda9Pjj9Z8LIMUqA/UO
 n4Xg==
X-Gm-Message-State: AOAM531vO3UcNBpPpFsdqPxvj0+9kRy56HsOSZUtFLAvl4p0FB1GB8SE
 1afkOenWfQQ6KisZ+usfTuGP7iaWQD4=
X-Google-Smtp-Source: ABdhPJzhjJCqfIhTCRVZb+Vr8KtVq4qhcP2NLQrym6HNHwRuS+NLbArmOj+cDo8d//YGLxl8OgNcBg==
X-Received: by 2002:a19:710a:0:b0:443:ad21:dcc0 with SMTP id
 m10-20020a19710a000000b00443ad21dcc0mr11819367lfc.688.1646764535019; 
 Tue, 08 Mar 2022 10:35:35 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 b27-20020a19645b000000b004482e94a3b3sm1611484lfj.3.2022.03.08.10.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:35:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 19:35:27 +0100
Message-Id: <20220308183527.17639-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH V2] package/lzma-alone: new package
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBuZXcgcGFja2Fn
ZSBwcm92aWRlcyAibHptYV9hbG9uZSIgaG9zdCBiaW5hcnkgYmFzZWQgb24gdGhlIG9yaWdpbmFs
CkxaTUEgU0RLLiBJdCBwcm92aWRlcyBmZXcgZXh0cmEgb3B0aW9ucyB3aGVuIGNvbXBhcmVkIHRv
IHRoZSBMWk1BIFV0aWxzCi8gWFogVXRpbHMgcHJvamVjdCAibHptYSIgYmluYXJ5IChhbHJlYWR5
IHBhY2thZ2VkIGFzIHRoZSAibHptYSIpLgoKVGhpcyBwYWNrYWdpbmcgc2NoZW1hIChMWk1BIFNE
SyB3aXRoIGx6bWEgLT4gbHptYV9hbG9uZSByZW5hbWUpIGZvbGxvd3MKRGViaWFuJ3Mgc29sdXRp
b24uIFBsZWFzZSBub3RlIHRoYXQgRGViaWFuIGFsc28gdXNlcyBMWk1BIFNESyBmb3IgdGhlCmJh
c2UgImx6bWEiIHRvb2wgd2hpY2ggbWF5IGJlIGNvbnNpZGVyZWQgZm9yIEJ1aWxkcm9vdCB0b28g
LSBhcyBhbgppbmRlcGVuZGVudCBjaGFuZ2UuIFNpbWlsYXIgcGFja2FnaW5nIGlzIGFsc28gdXNl
ZCBieSBVYnVudHUgJiBBcmNoLgoKbHptYV9hbG9uZSBpcyBhIHJlcXVpcmVtZW50IGZvciBwcmVw
YXJpbmcgZmlybXdhcmUgaW1hZ2VzIGZvciBzb21lCkJyb2FkY29tIGJhc2VkIGhvbWUgcm91dGVy
cyB3aXRoIGEgcGlja3kgQ0ZFIGJvb3Rsb2FkZXIuIEl0IGhhcyBsaW1pdGVkCkxaTUEgc3VwcG9y
dCBhbmQgYnVpbGRpbmcgY29tcGF0aWJsZSBpbWFnZXMgcmVxdWlyZXMgc3BlY2lmeWluZwpkaWN0
aW9uYXJ5IHNpemUgYW5kIGxjL2xwL3BiIExaTUEgdmFsdWVzIG1hbnVhbGx5LgoKVmVyc2lvbiA5
LjIyIGlzIHVzZWQgYXMgaXQncyB0aGUgbGFzdCByZWxlYXNlIHVzaW5nIC50YXIuYnoyIGZvcm1h
dC4gVGhlCnNhbWUgdmVyc2lvbiBpcyB1c2VkIGJ5IERlYmlhbi4KClNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCkhpLCB0aGlzIGlzIFYyIG9mIG15
IGZvbGxvd2luZyBvbGQgYXR0ZW1wdDoKCltQQVRDSF0gcGFja2FnZS9sem1hLWFsb25lOiBuZXcg
cGFja2FnZQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjAxMDI2MjEzNDMzLjQzMDktMS16YWplYzVAZ21haWwuY29tLwoKSXQgZG9lc24ndCBz
ZWVtIGxpa2UgSSdtIGdvaW5nIHRvIGdldCBWMSBwcm9wZXJseSByZXZpZXdlZCAvIGNvbW1lbnRl
ZApzbyBsZXQgbWUgdHJ5IHdpdGggVjIgd2l0aCBjaGFuZ2VzIEkgdGhpbmsgd2VyZSBleHBlY3Rl
ZC4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS9sem1hLWFsb25lL0NvbmZpZy5pbi5ob3N0ICB8IDE4ICsrKysrKysrKysrKysrKysrKwogcGFj
a2FnZS9sem1hLWFsb25lL2x6bWEtYWxvbmUuaGFzaCB8ICAxICsKIHBhY2thZ2UvbHptYS1hbG9u
ZS9sem1hLWFsb25lLm1rICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x6bWEt
YWxvbmUvQ29uZmlnLmluLmhvc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x6bWEtYWxv
bmUvbHptYS1hbG9uZS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sem1hLWFsb25l
L2x6bWEtYWxvbmUubWsKCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0IGIvcGFj
a2FnZS9Db25maWcuaW4uaG9zdAppbmRleCBlNWZiYjA3ZmMyLi5jZDFjMzRiNWEzIDEwMDY0NAot
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0CisrKyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QK
QEAgLTUwLDYgKzUwLDcgQEAgbWVudSAiSG9zdCB1dGlsaXRpZXMiCiAJc291cmNlICJwYWNrYWdl
L2xsZC9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbHBjMzI1MGxvYWRlci9Db25m
aWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbHR0bmctYmFiZWx0cmFjZS9Db25maWcuaW4u
aG9zdCIKKwlzb3VyY2UgInBhY2thZ2UvbHptYS1hbG9uZS9Db25maWcuaW4uaG9zdCIKIAlzb3Vy
Y2UgInBhY2thZ2UvbWVuZGVyLWFydGlmYWN0L0NvbmZpZy5pbi5ob3N0IgogCXNvdXJjZSAicGFj
a2FnZS9tZXNvbi10b29scy9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbWZndG9v
bHMvQ29uZmlnLmluLmhvc3QiCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x6bWEtYWxvbmUvQ29uZmln
LmluLmhvc3QgYi9wYWNrYWdlL2x6bWEtYWxvbmUvQ29uZmlnLmluLmhvc3QKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDUzYjg2OTYzNQotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvbHptYS1hbG9uZS9Db25maWcuaW4uaG9zdApAQCAtMCwwICsxLDE4IEBACitjb25m
aWcgQlIyX1BBQ0tBR0VfSE9TVF9MWk1BX0FMT05FCisJYm9vbCAiaG9zdCBsem1hLWFsb25lIgor
CWhlbHAKKwkgIExaTUEgaGFzIHR3byB3ZWxsLWtub3duIGNvbW1hbmQtbGluZSB0b29sczoKKwkg
IDEuIGx6bWEgZnJvbSBMWk1BIFNESworCSAgMi4gbHptYSBmcm9tIFhaIFV0aWxzIChwcmV2aW91
c2x5IExaTUEgVXRpbHMpCisKKwkgIFRoaXMgcGFja2FnZSBwcm92aWRlcyB0aGUgZm9ybWVyIG9u
ZSB3aGljaDoKKwkgIDEuIEdpdmVzIG1vcmUgY29udHJvbCBvdmVyIGNvbXByZXNzaW9uIHBhcmFt
ZXRlcnMKKwkgIDIuIEdldHMgbmFtZWQgbHptYV9hbG9uZSB0byBhbGxvdyBjb2V4aXN0ZW5jZQor
CisJICBUaGlzIHRvb2wgbWF5IGJlIHVzZWQgdG8gcHJlcGFyZSBmaXJtd2FyZXMgZm9yIGJvb3Rs
b2FkZXJzCisJICB3aXRoIGxpbWl0ZWQgTFpNQSBzdXBwb3J0LgorCSAgRS5nLiBCcm9hZGNvbSdz
IENGRSBib290bG9hZGVyIGZvciBNSVBTIEJDTTQ3eHggZGV2aWNlcyBpcworCSAga25vd24gdG8g
ZmFpbCB0byBib290IGltYWdlcyB1c2luZyBMWk1BIGNvbXByZXNzaW9uIHdpdGgKKwkgIGRpY3Rp
b25hcnkuCisKKwkgIGh0dHBzOi8vd3d3LjctemlwLm9yZy9zZGsuaHRtbApkaWZmIC0tZ2l0IGEv
cGFja2FnZS9sem1hLWFsb25lL2x6bWEtYWxvbmUuaGFzaCBiL3BhY2thZ2UvbHptYS1hbG9uZS9s
em1hLWFsb25lLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzk3
NTljNGUzYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbHptYS1hbG9uZS9sem1hLWFsb25l
Lmhhc2gKQEAgLTAsMCArMSBAQAorc2hhMjU2CTlhYWRlODRmMjI5ZmIyNWY3YWVmMzlkODg2NmIz
NzVmZTZkMzVhOWUxODA5OGQ3Y2Q4NmE5OWUyOTQ5MDI5NDQJbHptYTkyMi50YXIuYnoyCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2x6bWEtYWxvbmUvbHptYS1hbG9uZS5tayBiL3BhY2thZ2UvbHptYS1h
bG9uZS9sem1hLWFsb25lLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjYyNThiYjRhOTUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2x6bWEtYWxvbmUvbHptYS1h
bG9uZS5tawpAQCAtMCwwICsxLDIyIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBs
em1hLWFsb25lCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitMWk1BX0FMT05FX1ZFUlNJ
T04gPSA5LjIyCitMWk1BX0FMT05FX1NJVEUgPSBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9q
ZWN0cy9zZXZlbnppcC9maWxlcy9MWk1BJTIwU0RLCitMWk1BX0FMT05FX1NPVVJDRSA9IGx6bWE5
MjIudGFyLmJ6MgorTFpNQV9BTE9ORV9TVFJJUF9DT01QT05FTlRTID0gMAorTFpNQV9BTE9ORV9M
SUNFTlNFID0gTEdQTC0yLjEtb3ItbGF0ZXIsIEJTRC0zLUNsYXVzZQorCitkZWZpbmUgSE9TVF9M
Wk1BX0FMT05FX0JVSUxEX0NNRFMKKwkkKEhPU1RfTUFLRV9FTlYpICQoSE9TVF9DT05GSUdVUkVf
T1BUUykgJChNQUtFKSAtQyAkKEBEKS9DL1V0aWwvTHptYSAtZiBtYWtlZmlsZS5nY2MKKwkkKEhP
U1RfTUFLRV9FTlYpICQoSE9TVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSAtQyAkKEBEKS9DUFAv
N3ppcC9CdW5kbGVzL0x6bWFDb24gLWYgbWFrZWZpbGUuZ2NjCitlbmRlZgorCitkZWZpbmUgSE9T
VF9MWk1BX0FMT05FX0lOU1RBTExfQ01EUworCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKEBEKS9D
UFAvN3ppcC9CdW5kbGVzL0x6bWFDb24vbHptYSAkKEhPU1RfRElSKS9iaW4vbHptYV9hbG9uZQor
ZW5kZWYKKworJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
