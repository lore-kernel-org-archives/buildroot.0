Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0EEC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9132A4033B;
	Tue,  4 Jun 2024 21:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AW7Y5go3F0j1; Tue,  4 Jun 2024 21:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5878A40282
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5878A40282;
	Tue,  4 Jun 2024 21:49:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3C801BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D04940282
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7di78ymSVNk for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 21:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D89024010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89024010C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D89024010C
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:49:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB9CE20002
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:49:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEc2P-007OdP-06
 for buildroot@buildroot.org; Tue, 04 Jun 2024 23:49:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 04 Jun 2024 23:49:48 +0200
Message-ID: <87plswcr9f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.05-rc2 released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgMjAyNC4wNS1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyNC4wNS1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0
LjA1LXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKQW5vdGhlciB3ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLgoK
UGxlYXNlIGdpdmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBtYWls
aW5nIGxpc3Qgb3IKYnVnIHRyYWNrZXIuIE1hbnkgdGhhbmtzIHRvIHRoZSBwZW9wbGUgY29udHJp
YnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyNC4wNS1yYzEuLgoK
ICAgIDI4ICBQZXRlciBLb3JzZ2FhcmQKICAgICA0ICBEYXJpbyBCaW5hY2NoaQogICAgIDQgIEZy
YW5jb2lzIFBlcnJhZAogICAgIDMgIEJyYW5kb24gTWFpZXIKICAgICAzICBKYW1lcyBIaWxsaWFy
ZAogICAgIDIgIEZpb25hIEtsdXRlCiAgICAgMiAgSnVsaWVuIE9saXZhaW4KICAgICAyICBSb21h
aW4gTmFvdXIKICAgICAyICBZYW5uIEUuIE1PUklOCiAgICAgMiAgWWVnb3IgWWVmcmVtb3YKICAg
ICAxICBCYXJ1Y2ggU2lhY2gKICAgICAxICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDEgIEdlcm8g
U2Nod8Okcmlja2UKICAgICAxICBHaXVsaW8gQmVuZXR0aQogICAgIDEgIEouIE5ldXNjaMOkZmVy
CiAgICAgMSAgTWFydGluIFdoaXRha2VyCiAgICAgMSAgUmFwaGHDq2wgTcOpbG90dGUKICAgICAx
ICBXYWxkZW1hciBCcm9ka29yYgoKRXhwZWN0IHRoZSBmaW5hbCAyMDI0LjA1IHJlbGVhc2UgYXQg
dGhlIGVuZCBvZiB0aGUgd2Vlay4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
