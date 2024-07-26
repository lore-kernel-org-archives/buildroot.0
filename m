Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EDBC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D93260B79;
	Fri, 26 Jul 2024 16:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyAzn8exxdUJ; Fri, 26 Jul 2024 16:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5DD060C31
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DD060C31;
	Fri, 26 Jul 2024 16:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4879D1BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4176360B4C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yUp8-Gsk1iv for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8287860B50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8287860B50
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8287860B50
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1spSUr0QK6-00OVGE; Fri, 26
 Jul 2024 18:20:39 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:09 +0200
Message-ID: <20240726162013.2183792-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:eDJh/+YeBghlAQwuNnFfNTQrkxZPL+I8JM5Cl/0nRediq3CXgE+
 4FStmVPglmQm7lNusU6AMRJIWTKkdZKm25gGZ346/b5bXG10AbrwBGCumYbiigbMmZSxxrR
 JSg3FbSP1g+MqEgVm9a31ISKFTlpyJqn8ANzkXwK2XZ4sgKMkH+s3AgsRbbosZu3LrlppfC
 xQAQCu+tTA7oQc9RfhWpA==
UI-OutboundReport: notjunk:1;M01:P0:MVa7O2iiw/Q=;shACQVNGsCAUcxqws1KxsGiaFaN
 h68GncSzLRn3LGrPvtDCisF+X85cS063Z0mpj+2O1PcvEvXseKp3u58N6pJ/8PbwtdCFgCd3u
 mPJflWsviX+MalFz52uyj7suzNLXp80gVq2i7mRm0lsGLfWllOSFxdbvQFN+2SeXP5ESV+Z16
 LoSX5R2Roym7kgPgsHR0YPZDFoYsPLPU5EhND6gk/0fU8EtGbhFqvlqHXQwMuOr9u3LZe8OvD
 i4uPyEj7FvrxTspeFrLuo48Y6m4eqbQ5ublW+fQ26y+fxbr+NUMIw1kfQW8SnipYMDcN8XJR4
 tPrT+nS0RBxW9u4zmYLsvGBhZNkhw+cKhXtlEns9Qpml9zfPXKPKksfI2+yx6u4zFza7hMG1c
 +eJC2RAShY2So6yf3LQOZmv+h8OsrhNMsy79vtfCst7x/YOfKB268ILjB5XCsumbhXld2SGyP
 YsBCOOEMsjxbApJ+UfruRcHUFi49G+2ujg/FS0NmyNxY5DIjdCEuMukKI+x/ow7HPwI0ITMDE
 149znaoKzqp1JXUB94B4jAzGjpwbU+Asj3ZjZkHf85BqrIlzQ0qUNGhzmgoBZK/Vc4k8N3up7
 67UcLQPgTDd3/BfFRLU1ek9dw4PAdjTs7giVDNc7k5TnVFsmILLi5Od8QNUnd2lS8XYODvWoQ
 YZ4t61qezSIkm8UFPLOQHKMAvfY6WGTktEUaK2R6q5kEbTEafMYg5sRKbHKv3p3JGNfnOXBS0
 8JXGt+XfOrOGO8uq/+ze0LXmvEPPmMZSU/wsPF64F9disvcsy4aDbsI5U8gp5PPPGyBJDuUOV
 oHchJ6oeB59GV65hL/sOaonw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010839; x=1722615639; i=fiona.klute@gmx.de;
 bh=/zrwxYcuaZu/XaMlx2LixGPWoC1We4m23DG6+VT60mY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sTkQ8ncZHq9vEgOKPZ1B/UzPvkHqYeGf/qVUySpz0GODCK+cDmFDqtn3ZpEpxoVF
 EYbhYyWWn3n3lKytDFDqG1lqjXuyL9X8aqOXFjcRRmqRpTSdRwcX4qGSLqm4GYDOW
 HOXgFY42lOn2Kt1MXgTsuK3Ct2vAkwnDUmYirTX2EOZTKcmJUTAiaWM9jO/bAAUxZ
 Qjxf5CKP64FmsnVQE+mYBLxJ0zvLJSLS5S5gcSCxWsjPExJGnxy5T9UsvC6ExPC4G
 ZeHVhgkgUpBKZsDfOdqQRww51CYFg38lu/OlwV+yRPgewG5xRTqiXjfzS7Zslrai+
 dz3wSi0YUwd3MV+mZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=sTkQ8ncZ
Subject: [Buildroot] [PATCH v4 4/6] support/testing: test for nftables init
 script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KClRoZSBuZXcg
dGVzdCBjaGVja3MgdGhhdCBhIHByZS1kZWZpbmVkIHJ1bGVzIGZpbGUgY2FuIGJlIGxvYWRlZCBh
bmQKd29ya3MgYXMgZXhwZWN0ZWQsIGFuZCB0aGF0IGFmdGVyIGZsdXNoaW5nIHRoZSBibG9ja2Vk
IElQIHJlc3BvbmRzIHRvCnBpbmcgYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAo
V0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfbmZ0YWJsZXMucHkgICAgfCAzNyArKysrKysrKysrKysrKysrKystCiAuLi4vcm9vdGZzLW92
ZXJsYXkvZXRjL25mdGFibGVzLmNvbmYgICAgICAgICAgfCAgOCArKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5
L2V0Yy9uZnRhYmxlcy5jb25mCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
aW5kZXggOWE4YzkyZjEyMi4uYzM1ODk1NDY0NSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysg
Yi9ERVZFTE9QRVJTCkBAIC0xMTA4LDYgKzExMDgsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1weW1v
ZGJ1cy8KIE46CUZpb25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+CiBGOglwYWNrYWdlL3B5
dGhvbi1weWFzeW5jaGF0LwogRjoJcGFja2FnZS9weXRob24tcHlhc3luY29yZS8KK0Y6CXN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMucHkKCiBOOglGbMOhdmlvIFRh
cGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KIEY6CWNvbmZpZ3MvYXN1c190
aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9uZnRhYmxlcy5weQppbmRleCAxNDJlN2QwMzUyLi4yNjIyYzdlODIyIDEwMDY0NAot
LS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5CisrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMucHkKQEAgLTg1LDcg
Kzg1LDcgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAg
ICAgICMgc3VwcG9zZWQgdG8gZmFpbCBlYXJsaWVyIGlzIG5vdyBzdXBwb3NlZCB0byBzdWNjZWVk
LgogICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfdGVzdF9jbWQpCgotICAgIGRlZiB0ZXN0
X3J1bihzZWxmKToKKyAgICBkZWYgYm9vdF92bShzZWxmKToKICAgICAgICAgaW1nID0gb3MucGF0
aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8uZ3oiKQogICAgICAg
ICBrZXJuID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiSW1hZ2UiKQog
ICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYWFyY2g2NCIsCkBAIC05Nyw2ICs5Nyw5
IEBAIGNsYXNzIFRlc3ROZnRhYmxlcyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1pbml0cmQiLCBpbWddKQogICAgICAgICBzZWxm
LmVtdWxhdG9yLmxvZ2luKCkKCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBzZWxm
LmJvb3Rfdm0oKQorCiAgICAgICAgICMgV2UgY2hlY2sgdGhlIHByb2dyYW0gY2FuIGV4ZWN1dGUu
CiAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIm5mdCAtLXZlcnNpb24iKQoKQEAgLTEwNywzICsx
MTAsMzUgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAg
ICAgICMgV2UgcnVuIGFnYWluIHRoZSBzYW1lIHRlc3Qgc2VxdWVuY2UgdXNpbmcgb3VyIHNpbXBs
ZSBuZnQKICAgICAgICAgIyBweXRob24gaW1wbGVtZW50YXRpb24sIHRvIGNoZWNrIHRoZSBsYW5n
dWFnZSBiaW5kaW5ncy4KICAgICAgICAgc2VsZi5uZnRhYmxlc190ZXN0KHByb2c9Ii9yb290L25m
dC5weSIpCisKKworY2xhc3MgVGVzdE5mdGFibGVzSW5pdChUZXN0TmZ0YWJsZXMpOgorICAgIGNv
bmZpZyA9IFRlc3ROZnRhYmxlcy5jb25maWcgKyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJf
SU5JVF9CVVNZQk9YPXkKKyAgICAgICAgIiIiCisKKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cisg
ICAgICAgIHNlbGYuYm9vdF92bSgpCisKKyAgICAgICAgIyBzdGFydCB3aXRoIGtub3duIHN0YXRl
IChydWxlcyBmcm9tIC9ldGMvbmZ0YWJsZXMuY29uZikKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5P
aygiL2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgcmVsb2FkIikKKworICAgICAgICAjIFNhbWUgY29u
Y2VwdCBhcyBpbiBUZXN0TmZ0YWJsZXMubmZ0YWJsZXNfdGVzdDogVGhlIHJ1bGVzCisgICAgICAg
ICMgc2hvdWxkIGFsbG93IHBpbmcgdG8gMTI3LjAuMC4xLCBidXQgbm90IDEyNy4wLjAuMi4KKyAg
ICAgICAgcGluZ19jbWRfcHJlZml4ID0gInBpbmcgLWMgMyAtaSAwLjUgLVcgMiAiCisgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2socGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMSIpCisgICAgICAg
IF8sIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKHBpbmdfY21kX3ByZWZpeCArICIxMjcu
MC4wLjIiKQorICAgICAgICBzZWxmLmFzc2VydE5vdEVxdWFsKGV4aXRfY29kZSwgMCkKKworICAg
ICAgICAjIFN0b3Agc2hvdWxkIGZsdXNoIHRoZSBydWxlcywgcGluZyB0byBib3RoIGFkZHJlc3Nl
cyBzaG91bGQKKyAgICAgICAgIyB3b3JrIG5vdy4KKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygi
L2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgc3RvcCIpCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
cGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMSIpCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
cGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMiIpCisKKyAgICAgICAgIyBTdGFydCBpcyBlc3Nl
bnRpYWxseSB0aGUgc2FtZSBhcyByZWxvYWQsIGNoZWNrIHRoYXQKKyAgICAgICAgIyAxMjcuMC4w
LjIgZ2V0cyBibG9ja2VkIGFnYWluLgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCIvZXRjL2lu
aXQuZC9TMzVuZnRhYmxlcyBzdGFydCIpCisgICAgICAgIF8sIGV4aXRfY29kZSA9IHNlbGYuZW11
bGF0b3IucnVuKHBpbmdfY21kX3ByZWZpeCArICIxMjcuMC4wLjIiKQorICAgICAgICBzZWxmLmFz
c2VydE5vdEVxdWFsKGV4aXRfY29kZSwgMCkKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMvcm9vdGZzLW92ZXJsYXkvZXRjL25mdGFibGVzLmNv
bmYgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1v
dmVybGF5L2V0Yy9uZnRhYmxlcy5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLmEwNGFmMWQ2MzQKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5L2V0Yy9uZnRhYmxlcy5jb25m
CkBAIC0wLDAgKzEsOCBAQAorZmx1c2ggcnVsZXNldAorCit0YWJsZSBpbmV0IGZpbHRlciB7CisJ
Y2hhaW4gaW5wdXQgeworCQl0eXBlIGZpbHRlciBob29rIGlucHV0IHByaW9yaXR5IGZpbHRlcjsg
cG9saWN5IGFjY2VwdDsKKwkJaXAgZGFkZHIgMTI3LjAuMC4yIGljbXAgdHlwZSBlY2hvLXJlcXVl
c3QgZHJvcAorCX0KK30KLS0KMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
