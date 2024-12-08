Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622E3E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07878404A3;
	Sun,  8 Dec 2024 16:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YGyW1nb6mWT; Sun,  8 Dec 2024 16:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9C6E403B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C6E403B4;
	Sun,  8 Dec 2024 16:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C07F76F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEB9480C8A
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwN9gPNYimvk for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 16:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 548CA80C81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 548CA80C81
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 548CA80C81
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:11:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FE29C0005
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:11:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tKJsp-00BkTB-1S
 for buildroot@buildroot.org; Sun, 08 Dec 2024 17:11:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 08 Dec 2024 17:11:47 +0100
Message-ID: <874j3e17ek.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.08.3 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI0LjA4LjMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDguMy50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjA4LjMudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjA4LjMgdGFnKQoKQnVpbGRyb290IDIwMjQuMDguMyBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4wOC4yIHJlbGVhc2UuCgpOb3RpY2UgdGhh
dCB0aGlzIHdpbGwgYmUgdGhlIGxhc3QgdXBkYXRlIG9mIHRoZSAyMDI0LjA4LnggYnJhbmNoLiBQ
bGVhc2UKbWlncmF0ZSB0byAyMDI0LjExLnggaW5zdGVhZC4gQ2hhbmdlczoKCi0gRGVmY29uZmln
czogZml4IG1lbmRlcl94ODZfNjRfZWZpX2RlZmNvbmZpZyBidWlsZCBvbiBzZXR1cHMgd2hlcmUK
ICAvYmluL3NoIGlzIG5vdCBiYXNoLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgZXhwYXQsIGZyciwg
aW50ZWwtbWljcm9jb2RlLCBsaWJjdXJsLCBsaWJrcmI1LAogIG1iZWR0bHMsIHBocCwgcG9zdGdy
ZXNxbCwgdGlmZiwKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGlj
ZW5zZSBpc3N1ZXMgaW4gYWxzYS1saWIsCiAgYW5kcm9pZC10b29scywgYmF0cy1jb3JlLCBibHVl
ei1hbHNhLCBibWFwLXRvb2xzLCBib29zdCwgY2hlY2tzZWMsCiAgZWJ0YWJsZXMsIGZidiwgZmZt
cGVnLCBmb290LCBnbnVwbG90LCBnbnV0bHMsIGlyc3NpLCBsaWJnaXQyLAogIGxpYm1vZGJ1cywg
bGlicG5nLCBsaWJ2cGwsIGxpbnV4LXBhbSwgbGludXgtdG9vbHMsIGxtYmVuY2gsIG1vc3F1aXR0
bywKICBtdXNsLCBtdXNsLWNvbXBhdC1oZWFkZXJzLCBuZnMtdXRpbHMsIG50cCwgcGljb3Rvb2ws
IHByb2Nwcy1uZywKICBweXRob24tcHN5Y29wZzIsIHB5dGhvbi1zaXAsIHF0NmJhc2UsIHF1YWdn
YSwgcnQtdGVzdHMsIHNleHBlY3QsCiAgc3NoZ3VhcmQsIHN5c3RlbWQsIHgxMXZuYwoKRm9yIG1v
cmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjQuMDguMy9DSEFOR0VTCgpVc2VycyBvZiB0
aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4K
Ck1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVh
c2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNC4wOC4yLi4KCiAgICAxMiAgQmVybmQgS3VobHMK
ICAgIDEwICBKdWxpZW4gT2xpdmFpbgogICAgIDYgIFBldGVyIEtvcnNnYWFyZAogICAgIDYgIFRo
b21hcyBQZXRhenpvbmkKICAgICAzICBDaGVybmlhZXYgQW5kcmVpCiAgICAgMyAgUm9tYWluIE5h
b3VyCiAgICAgMyAgU2NvdHQgRmFuCiAgICAgMyAgVElBTiBZdWFuaGFvCiAgICAgMiAgQmFydWNo
IFNpYWNoCiAgICAgMiAgRnJhbmNvaXMgUGVycmFkCiAgICAgMiAgTWF4aW0gS29jaGV0a292CiAg
ICAgMiAgTWljaGFlbCBOb3N0aG9mZgogICAgIDIgIE5pY29sYXMgQ2F2YWxsYXJpCiAgICAgMiAg
WWFubiBFLiBNT1JJTgogICAgIDEgIEFkYW0gRHVza2V0dAogICAgIDEgIEFuc3NpIEhhbm51bGEK
ICAgICAxICBCcmFuZG9uIE1haWVyCiAgICAgMSAgRWRnYXIgQm9uZXQKICAgICAxICBGaW9uYSBL
bHV0ZSAoV0lXQSkKICAgICAxICBGbG9yaWFuIEZhaW5lbGxpCiAgICAgMSAgSGFubmFoIEtpZWtl
bnMKICAgICAxICBKLiBOZXVzY2jDpGZlcgogICAgIDEgIExQIEMKICAgICAxICBNYXJjdXMgSG9m
Zm1hbm4KICAgICAxICBOZWFsIEZyYWdlcgogICAgIDEgIFRob21hcyBEZXZvb2dkdAogICAgIDEg
IFZsYWRpbWlyIE9sdGVhbgogICAgIDEgIFl1IENoaWVuIFBldGVyIExpbgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
