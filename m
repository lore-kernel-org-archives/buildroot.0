Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCD0E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 08:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A269F612D6;
	Thu, 19 Dec 2024 08:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6n-eeWJ_tmYm; Thu, 19 Dec 2024 08:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E99E612DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E99E612DA;
	Thu, 19 Dec 2024 08:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07728CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA43840F62
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWt9tVdWBFXm for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 08:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A158240F55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A158240F55
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A158240F55
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:27:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4687E4000A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:27:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tOBsW-003xyC-2B
 for buildroot@buildroot.org; Thu, 19 Dec 2024 09:27:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20241214114808.2934481-1-peter@korsgaard.com>
Date: Thu, 19 Dec 2024 09:27:28 +0100
In-Reply-To: <20241214114808.2934481-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 14 Dec 2024 12:48:07 +0100")
Message-ID: <874j30jcwf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to version
 4.2.9
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgogPiA0LjIuOToK
CiA+IENWRS0yMDI0LTExNTk1OiB3bnBhLXNlYy0yMDI0LTE0IMK3IEZpdmVDbyBSQVAgZGlzc2Vj
dG9yIGluZmluaXRlIGxvb3AKID4gaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93
bnBhLXNlYy0yMDI0LTE0CgogPiBDVkUtMjAyNC0xMTU5Njogd25wYS1zZWMtMjAyNC0xNSDCtyBF
Q01QIGRpc3NlY3RvciBjcmFzaAogPiBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5
L3ducGEtc2VjLTIwMjQtMTUKCiA+IDQuMi44OgoKID4gQ1ZFLTIwMjQtOTc4MTogd25wYS1zZWMt
MjAyNC0xMyDCtyBBcHBsZVRhbGsgYW5kIFJFTE9BRCBGcmFtaW5nIGRpc3NlY3RvcgogPiBjcmFz
aGVzCiA+IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNC0x
MwoKID4gNC4yLjc6CgogPiBDVkUtMjAyNC04MjUwOiB3bnBhLXNlYy0yMDI0LTExIMK3IE5UTE1T
U1AgZGlzc2VjdG9yIGNyYXNoCiA+IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkv
d25wYS1zZWMtMjAyNC0xMQoKID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRl
ckBrb3JzZ2FhcmQuY29tPgoKQ29tbWl0dGVkIHRvIDIwMjQuMTEueCwgdGhhbmtzLgoKLS0gCkJ5
ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
