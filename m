Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1048CCD1BF
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A788455C;
	Fri, 24 Oct 2025 18:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdoBekiVDia0; Fri, 24 Oct 2025 18:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6766B84558
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6766B84558;
	Fri, 24 Oct 2025 18:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81D5419D
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 18:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C1160D84
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 18:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPJx0FIll9Dg for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 18:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.205.69.214;
 helo=mail.w14.tutanota.de; envelope-from=hudson@trmm.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E329460D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E329460D71
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E329460D71
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 18:10:48 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
 by mail.w14.tutanota.de (Postfix) with ESMTP id E5871D558AA0
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 20:10:12 +0200 (CEST)
Date: Fri, 24 Oct 2025 20:10:12 +0200 (CEST)
To: Buildroot <buildroot@buildroot.org>
Message-ID: <OcMPUIl--F-9@trmm.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1761329412; 
 s=s1; d=trmm.net;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=b7KBZxDSALGglGRMmzHHEbhvpcLpdYNOGU3xgRkjhWo=;
 b=beJz6QXuoWlsbmqN49wHWDIzZHEniBNJ67IZdalV61bPp4liEZxxhv6lpURaNt26
 M1D0z/I+RQpnrZG+bAmwFCp0/GHN4P2lW8Gk+kfr7Uyw3+x5kmJR3D82VQDPFXgEn68
 UU8LUPlXsFhmAxHXuVymh0qSQdoKA+PzmPmtyrtOXYIi1nwb0uIGzw7Px11lFTvIHR8
 0ViKozjn3qM1IQx9xJELRbO5bQuDt2xC2eMf7u1cB26McGfxPXWE/XavzFpmt9HvmV8
 0lk+lKkOFz5irIrjK4w8OeCBKU1ypWpzYBedIUs+1me1DAhM05PaeBUWBgoVSqN3Iwd
 YnAvMeXwlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=trmm.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=trmm.net header.i=@trmm.net header.a=rsa-sha256
 header.s=s1 header.b=beJz6QXu
Subject: [Buildroot] package/mosquitto patch problem with gmake < 4.3
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
From: Trammell Hudson via buildroot <buildroot@buildroot.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlwqAwMDAyLUFkZC1jb25maWd1cmUtdGltZS1jaGVjay1mb3ItbGFubC5wYXRjaCBmb3IgcGFj
a2FnZS9tb3NxdWl0dG8gc2VlbXMKdG8gaGF2ZSBhIGNvbXBpbGF0aW9uIHByb2JsZW0gd2l0aCBv
bGRlciBtYWtlLCBzdWNoIGFzIDQuMi4xLsKgIFRoZSBoYW5kbGluZwpvZiAjIGNoYXJhY3RlcnMg
aW4gZnVuY3Rpb24gY2FsbHMgb3Igc3RyaW5ncyBjaGFuZ2VkIGluIDQuMyB0byBubyBsb25nZXIK
YmUgdHJlYXRlZCBhcyBtYWtlIGVuZCBvZiBsaW5lIGNvbW1lbnRzLgoKaHR0cHM6Ly9saXN0cy5n
bnUub3JnL2FyY2hpdmUvaHRtbC9pbmZvLWdudS8yMDIwLTAxL21zZzAwMDA0Lmh0bWwKCiogV0FS
TklORzogQmFja3dhcmQtaW5jb21wYXRpYmlsaXR5ISAgTnVtYmVyIHNpZ25zICgjKSBhcHBlYXJp
bmcgaW5zaWRlIGEgbWFjcm8gcmVmZXJlbmNlIG9yIGZ1bmN0aW9uIGludm9jYXRpb24gIG5vIGxv
bmdlciBpbnRyb2R1Y2UgY29tbWVudHMgYW5kIHNob3VsZCBub3QgYmUgZXNjYXBlZCB3aXRoIGJh
Y2tzbGFzaGVzOiAgdGh1cyBhIGNhbGwgc3VjaCBhczogICAgZm9vIDo9ICQoc2hlbGwgZWNobyAn
IycpICBpcyBsZWdhbC4gIFByZXZpb3VzbHkgdGhlIG51bWJlciBzaWduIG5lZWRlZCB0byBiZSBl
c2NhcGVkLCBmb3IgZXhhbXBsZTogICAgZm9vIDo9ICQoc2hlbGwgZWNobyAnXCMnKSAgTm93IHRo
aXMgbGF0dGVyIHdpbGwgcmVzb2x2ZSB0byAiXCMiLiAgSWYgeW91IHdhbnQgdG8gd3JpdGUgbWFr
ZWZpbGVzICBwb3J0YWJsZSB0byBib3RoIHZlcnNpb25zLCBhc3NpZ24gdGhlIG51bWJlciBzaWdu
IHRvIGEgdmFyaWFibGU6ICAgIEggOj0gXCMgICAgZm9vIDo9ICQoc2hlbGwgZWNobyAnJEgnKSAg
VGhpcyB3YXMgY2xhaW1lZCB0byBiZSBmaXhlZCBpbiAzLjgxLCBidXQgd2Fzbid0LCBmb3Igc29t
ZSByZWFzb24uICBUbyBkZXRlY3QgdGhpcyBjaGFuZ2Ugc2VhcmNoIGZvciAnbm9jb21tZW50JyBp
biB0aGUgLkZFQVRVUkVTIHZhcmlhYmxlLgoKVGhlIGVycm9yIG9jY3VycyB3aGVuIGJ1aWxkaW5n
IG1vc3F1aXR0byB3aXRoIGFuIG9sZGVyIG1ha2UuCj4+PiBtb3NxdWl0dG8gMi4wLjIyIEJ1aWxk
aW5nClsuLi5dY29uZmlnLm1rOjMyMjogKioqIHVudGVybWluYXRlZCBjYWxsIHRvIGZ1bmN0aW9u
ICdzaGVsbCc6IG1pc3NpbmcgJyknLsKgIFN0b3AuCm1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ct
Z2VuZXJpYy5tazoyNzM6IC9kYXRhL3NjcmF0Y2gvYnVpbGQvc2hhaXJwb3J0LXBpL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvbW9zcXVpdHRvLTIuMC4yMi8uc3RhbXBfYnVpbHRdIEVycm9yIDIKClRo
ZSB0ZXN0IGlzOgoKTkVFRF9MSUJBTkwgOj0gJChzaGVsbCBwcmludGYgJyNpbmNsdWRlIDxzdGRs
aWIuaD5cbiNpbmNsdWRlIDxuZXRkYi5oPlxuaW50IG1haW4oKXtyZXR1cm4gZ2V0YWRkcmluZm9f
YSgwLCBOVUxMLCAwLCBOVUxMKTt9J3wgJChDQykgLURfR05VX1NPVVJDRSAtbyAvZGV2L251bGwg
LXggYyAtIDI+L2Rldi9udWxsIHx8IGVjaG8gWUVTKQoKSXMgdGhlcmUgYSBtaW5pbXVtIG1ha2Ug
dmVyc2lvbiByZXF1aXJlZD/CoCBBbmQgaWYgc28gc2hvdWxkIHRoZSB0b3AgbGV2ZWwKYnVpbGQg
Y2hlY2sgZm9yIGl0PwoKCi0tClRyYW1tZWxsIEh1ZHNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
