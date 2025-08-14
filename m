Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1029CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 07:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A7840963;
	Thu, 14 Aug 2025 07:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bf-MGFiCeW7; Thu, 14 Aug 2025 07:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB2A40945
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB2A40945;
	Thu, 14 Aug 2025 07:41:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74C9A1B5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 07:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B6D5846E6
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 07:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXTW-FhTydGl for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 07:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F268846EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F268846EE
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F268846EE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 07:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 9C50B3D80F3F;
 Thu, 14 Aug 2025 03:41:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id wXiTS54UDZpB; Thu, 14 Aug 2025 03:41:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id AED663D82FD9;
 Thu, 14 Aug 2025 03:41:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AED663D82FD9
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ANkB8dnV8nfU; Thu, 14 Aug 2025 03:41:41 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 8FDBC3D80F3F;
 Thu, 14 Aug 2025 03:41:41 -0400 (EDT)
Date: Thu, 14 Aug 2025 03:41:41 -0400 (EDT)
From: Luc Beaufils <luc.beaufils@savoirfairelinux.com>
To: Yunus Bas <Y.Bas@phytec.de>
Cc: buildroot <buildroot@buildroot.org>, 
 Thomas Perrot <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <1129278814.79180.1755157301522.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <657a4a78e8df2a586faebb61d46ff3e8cfc7032d.camel@phytec.de>
References: <657a4a78e8df2a586faebb61d46ff3e8cfc7032d.camel@phytec.de>
MIME-Version: 1.0
X-Mailer: Zimbra 10.1.6_GA_0225 (ZimbraWebClient - FF141
 (Linux)/10.1.6_GA_0225)
Thread-Topic: Support for i.MX Code Signing Tools
Thread-Index: AQHcDGsLIXZD8AoUSkGtEISf3QvVwHRMveCK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1755157301; bh=c6ej3yiUv2D0TwnYHdj5L7wKiQcFkXqUxul68TLifWE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=yxA7MfnIFwLebdQmMfFyf5PzjAXwOUTn16tYiTYRarJ+xEeCINjgWfMWR/Bp2soZX
 zXE2bdkZvY8KwliGkJ/WM6eEGU2nYy1ViWga4juYUgXlZ2beAq/1YTrSN2NoV6RYwS
 YYVhPInyd7k2NsHP6YHvW1lEFV9Pi6Hr/feFJwig5oc2VjsSfymSSSN6TxiVLpuO8J
 IQWeVKKq0hOLs3jug2u1WCkD0Jc1RlT2inYOKOzwX/1AHPONk2FpkqzNjE4LeTH0tF
 s7BQs4+oqehqZiYgtW5dpDMBHREKO2xAlIYAfEMjvd00y4oNX4MaYtIKlIIQynsN3Z
 jPSkxmGW0cALw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=savoirfairelinux.com
 header.i=@savoirfairelinux.com header.a=rsa-sha256
 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=yxA7MfnI
Subject: Re: [Buildroot] [PATCH v2 0/2] Support for i.MX Code Signing Tools
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIAoKVGhlIDMuNC4wK2Rmc2cgdmVyc2lvbiBoYXMgYmVlbiByZW1vdmVkIGZyb20gdGhlIGRl
YmlhbiByZXBvc2l0b3J5LiAKVGhlIHNlcmllcyBzaG91bGQgYnVtcCB0byB0aGUgMy40LjErZGZz
ZyB2ZXJzaW9uLgoKQlIsIApMdWMgQkVBVUZJTFMKCi0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0t
LS0KRnJvbTogIll1bnVzIEJhcyIgPFkuQmFzQHBoeXRlYy5kZT4KVG86ICJsdWMgYmVhdWZpbHMi
IDxsdWMuYmVhdWZpbHNAc2F2b2lyZmFpcmVsaW51eC5jb20+CkNjOiAiYnVpbGRyb290IiA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+LCAiVGhvbWFzIFBlcnJvdCIgPHRob21hcy5wZXJyb3RAYm9v
dGxpbi5jb20+LCAiVGhvbWFzIFBldGF6em9uaSIgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+ClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDEzLCAyMDI1IDU6NTg6MDEgUE0KU3ViamVjdDog
UmU6IFtCdWlsZHJvb3RdIFtQQVRDSCB2MiAwLzJdIFN1cHBvcnQgZm9yIGkuTVggQ29kZSBTaWdu
aW5nIFRvb2xzCgpIaSBAYWxsLCAKCkNhbiBhbnlib2RlIGdpdmUgbWUgYSBzdGF0dXMgdXBkYXRl
IHJlZ2FyZGluZyB0aGlzIHBhdGNoIHNlcmllcz8gV2lsbCBpdCBiZSBhcHByb3ZlZCBvciBub3Q/
IFRoYW5rcyBpbiBhZHZhbmNlLiAKClJlZ2FyZHMgCi0tIApZdW51cyBCYXMgCgotU29mdHdhcmUg
RW50d2lja2x1bmctIApQSFlURUMgTWVzc3RlY2huaWsgR21iSCAKQmFyY2Vsb25hLUFsbGVlIDEg
CjU1MTI5IE1haW56IApHZXJtYW55IApUZWwuOiArNDkgKDApNjEzMSA5MjIxLTQ2NiAKV2ViOiBb
IGh0dHA6Ly93d3cucGh5dGVjLmRlLyB8IHd3dy5waHl0ZWMuZGUgXSAKClNpZSBmaW5kZW4gdW5z
IGF1Y2ggYXVmOiBbIGh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9QSFlURUMuTWFpbnogfCBGYWNl
Ym9vayBdICwgWyBodHRwOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L3BoeXRlYy1tZXNzdGVj
aG5pay1nbWJoIHwgTGlua2VkSW4sIF0gWyBodHRwczovL3d3dy54aW5nLmNvbS9jb21wYW5pZXMv
cGh5dGVjbWVzc3RlY2huaWtnbWJoIHwgWGluZyBdICwgWyBodHRwOi8vd3d3LnlvdXR1YmUuY29t
L3VzZXIvUGh5dGVjTWFpbnogfCBZb3VUdWJlIF0gCgpQSFlURUMgTWVzc3RlY2huaWsgR21iSCB8
IEJhcmNlbG9uYS1BbGxlZSAxIHwgNTUxMjkgTWFpbnosIEdlcm1hbnkgCkdlc2Now6RmdHNmw7xo
cmVyOiBEaXBsLi1JbmcuIE1pY2hhZWwgTWl0ZXpraSwgRGlwbC4tSW5nLiBCb2RvIEh1YmVyLCBE
aXBsLi1JbmcuIChGSCkgTWFyY3VzIExpY2tlcyB8IEhhbmRlbHNyZWdpc3RlciBNYWlueiBIUkIg
NDY1NiB8IEZpbmFuemFtdCBNYWlueiB8IFN0Lk5yLjogMjYvNjY1LzAwNjA4LCBVU3QtSUQ6IERF
IDE0OTA1OTg1NSAKVGhpcyBFLU1haWwgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZp
bGVnZWQgaW5mb3JtYXRpb24uIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQg
KG9yIGhhdmUgcmVjZWl2ZWQgdGhpcyBFLU1haWwgaW4gZXJyb3IpIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZGVzdHJveSB0aGlzIEUtTWFpbC4gQW55IHVuYXV0aG9y
aXplZCBjb3B5aW5nLCBkaXNjbG9zdXJlIG9yIGRpc3RyaWJ1dGlvbiBvZiB0aGUgbWF0ZXJpYWwg
aW4gdGhpcyBFLU1haWwgaXMgc3RyaWN0bHkgZm9yYmlkZGVuLiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
