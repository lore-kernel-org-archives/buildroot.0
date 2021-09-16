Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6795FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D076058D
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82D076058D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EE183F24;
	Thu, 16 Sep 2021 18:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pc0zv0uqmdwO; Thu, 16 Sep 2021 18:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94CD583F22;
	Thu, 16 Sep 2021 18:51:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79C921BF8B4
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 695B460898
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AI9a7T2y_LHS for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 18:51:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0694A606C0
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 18:51:37 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AB7E4240007
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 18:51:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQwTt-0001sR-Im
 for buildroot@buildroot.org; Thu, 16 Sep 2021 20:51:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 20:51:33 +0200
Message-ID: <87y27ws6a2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.5 released
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjEuMDIuNSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjUudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjUudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wMi41IGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJt
CnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVk
IGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIxLjAyLjQgcmVsZWFzZS4KCi0gVG9vbGNo
YWluOiBEaXNhYmxlIGZvcnRpZnkgc3VwcG9ydCBmb3IgTWljcm9ibGF6ZSBhcyBpdCBpcyBub3QK
ICBjdXJyZW50bHkgd29ya2luZy4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGMtYXJlcywgY3Bpbywg
ZmV0Y2htYWlsLCBmbHVpZHN5bnRoLCBnZCwgZ28sCiAgaGFwcm94eSwganN6aXAsIGxpYmFyY2hp
dmUsIGxpYmV4aWYsIGxpYm9wZW5zc2wsIGxpYnNzaCwgbWMsCiAgbW9zcXVpdHRvLCBub2RlanMs
IHBocCwgcG9zdGdyZXNxbCwgcHJvc29keSwgcHl0aG9uLXBpbGxvdywgcHl0aG9uMywKICBzeWxw
aGVlZCwgdG9yLCB2aW0KCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUv
bGljZW5zZSBpc3N1ZXMgaW4gYWxzYS11dGlscywKICBhcm0tdHJ1c3RlZC1maXJtd2FyZSwgYmF5
ZXIycmdiLW5lb24sIGJlbGxlLXNpcCwgYnVzeWJveCwgY2pzb24sCiAgY29yZXV0aWxzLCBlaWdl
biwgZW52aXJvbm1lbnQtc2V0dXAsIGZvbnRjb25maWcsIGdkYiwgZ251cmFkaW8sCiAgZ251dGxz
LCBpcG1pdXRpbCwgaXB1dGlscywga3ZtLXVuaXQtdGVzdHMsIGxpYmdjcnlwdCwgbGlibW9kc2Vj
dXJpdHksCiAgbGlicnN2ZywgbGlic2hvdXQsIGxvY2FsZWRlZiwgbWVzYTNkLCBuZXRzbmlmZi1u
ZywgbmdpbngsIG9ncmUsCiAgb3Blbm1waSwgb3BlbnZtdG9vbHMsIHByZWxpbmstY3Jvc3MsIHBy
b3RvYnVmLCBweXRob24tcHl1ZGV2LCBxdDViYXNlLAogIHNhbWJhNCwgc2RsMiwgc294LCBzd3Vw
ZGF0ZSwgdWJvb3QtdG9vbHMsIHVoZCwgdW5ib3VuZCwgd2xyb290cywKICB4YXBwX3hyZGIsIHhh
cHBfeHdkLCB4ZW4sIHhlbm9tYWksIHhsaWJfbGliWGZvbnQyLCB4bGliX2xpYlhmdCwgemlwCgpG
b3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxk
cm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMS4wMi41CgpVc2VycyBvZiB0
aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4K
Ck1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVh
c2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjEuMDIuNC4uCgogICAgNDQgIEZhYnJpY2UgRm9udGFp
bmUKICAgIDEyICBQZXRlciBLb3JzZ2FhcmQKICAgICA4ICBCZXJuZCBLdWhscwogICAgIDcgIEZy
YW5jb2lzIFBlcnJhZAogICAgIDcgIEphbWVzIEhpbGxpYXJkCiAgICAgNiAgQ2hyaXN0aWFuIFN0
ZXdhcnQKICAgICA1ICBHaXVsaW8gQmVuZXR0aQogICAgIDQgIFJvbWFpbiBOYW91cgogICAgIDMg
IEFuZ2VsbyBDb21wYWdudWNjaQogICAgIDMgIFRob21hcyBQZXRhenpvbmkKICAgICAyICBBc2Fm
IEthaGxvbgogICAgIDIgIEJhcnVjaCBTaWFjaAogICAgIDIgIEphbWVzIEtuaWdodAogICAgIDIg
IE1hdHRoZXcgV2ViZXIKICAgICAyICBNaWNoYWVsIEZpc2NoZXIKICAgICAxICBBZHJpYW4gQW1h
Z2xpbwogICAgIDEgIEFsZXhhbmRlciBFZ29yZW5rb3YKICAgICAxICBDb25yYWQgUmF0c2NoYW4K
ICAgICAxICBHbGViIE1hem92ZXRza2l5CiAgICAgMSAgSnVsaWVuIE9saXZhaW4KICAgICAxICBL
cnp5c3p0b2YgS2FuYXMKICAgICAxICBLeWxlIEhhcmRpbmcKICAgICAxICBNaWNoYWVsIE5vc3Ro
b2ZmCiAgICAgMSAgTmV2byBIZWQKICAgICAxICBQZXRlciBTZWlkZXJlcgogICAgIDEgIFF1ZW50
aW4gU2NodWx6CiAgICAgMSAgU8OpYmFzdGllbiBTenltYW5za2kKICAgICAxICBUaXRvdWFuIENo
cmlzdG9waGUKICAgICAxICBZYW5uIEUuIE1PUklOCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
