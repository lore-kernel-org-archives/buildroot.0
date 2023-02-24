Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71BDC61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 07:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D49760E8B;
	Fri, 24 Feb 2023 07:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D49760E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvBWe5lZwJLa; Fri, 24 Feb 2023 07:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F5760E86;
	Fri, 24 Feb 2023 07:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F5760E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1CB11BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 07:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95A7160E7A
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 07:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95A7160E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5rx7_dS6yEd for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 07:36:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5323F60E5E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5323F60E5E
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 07:36:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6BDCC40007;
 Fri, 24 Feb 2023 07:36:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pVScZ-008hBw-H9; Fri, 24 Feb 2023 08:35:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221012164831.10476-1-sebastien.szymanski@armadeus.com>
 <20230207165109.GJ4124@scaer>
Date: Fri, 24 Feb 2023 08:35:59 +0100
In-Reply-To: <20230207165109.GJ4124@scaer> (Yann E. MORIN's message of "Tue, 7
 Feb 2023 17:51:09 +0100")
Message-ID: <87edqfplb4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/test-pkg: proper output on host
 without jq installed
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IFPDqWJhc3RpZW4sIEFsbCwKID4gT24gMjAyMi0xMC0xMiAxODo0OCArMDIwMCwg
U8OpYmFzdGllbiBTenltYW5za2kgc3Bha2UgdGh1c2x5OgogPj4gT24gaG9zdCB3aXRob3V0IGpx
IGluc3RhbGxlZCwgdGVzdC1wa2cncyBvdXRwdXQgaXMgYXMgZm9sbG93aW5nOgogPj4gCiA+PiAk
IC4vdXRpbHMvdGVzdC1wa2cgLXAgbW1jLXV0aWxzCiA+PiBib290bGluLWFybXY1LXVjbGliYyBb
MS82XTogd2hpY2g6IG5vIGpxIGluICgvdXNyL2xvY2FsL3NiaW46L3Vzci9sb2NhbC9iaW46L3Vz
ci9zYmluOi91c3IvYmluOi9zYmluOi9iaW46L29wdC9iaW46L3Vzci9saWIvbGx2bS8xNC9iaW46
L3Vzci9saWIvbGx2bS8xMy9iaW46L3Vzci9saWI2NC9vcGVuY2FzY2FkZS9iaW4pCiA+PiBKUSBJ
UwogPj4gT0sKID4+IGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IHdoaWNoOiBubyBqcSBpbiAo
L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2Jpbjov
YmluOi9vcHQvYmluOi91c3IvbGliL2xsdm0vMTQvYmluOi91c3IvbGliL2xsdm0vMTMvYmluOi91
c3IvbGliNjQvb3BlbmNhc2NhZGUvYmluKQogPj4gSlEgSVMKID4+IE9LCiA+PiBib290bGluLWFy
bXY3bS11Y2xpYmMgWzMvNl06IHdoaWNoOiBubyBqcSBpbiAoL3Vzci9sb2NhbC9zYmluOi91c3Iv
bG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi9vcHQvYmluOi91c3IvbGli
L2xsdm0vMTQvYmluOi91c3IvbGliL2xsdm0vMTMvYmluOi91c3IvbGliNjQvb3BlbmNhc2NhZGUv
YmluKQogPj4gLi4uCiA+PiAKID4+IFNpbmNlIHRlc3QtcGtnIGhhbmRsZXMgdGhpcyBjYXNlIHdl
IGNhbiBoaWRlIHRoaXMgZXJyb3IgbWVzc2FnZSBhbmQgaGF2ZQogPj4gcHJvcGVyIG91dHB1dDoK
ID4+IAogPj4gJCAuL3V0aWxzL3Rlc3QtcGtnIC1wIG1tYy11dGlscwogPj4gYm9vdGxpbi1hcm12
NS11Y2xpYmMgWzEvNl06IE9LCiA+PiBib290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwogPj4g
Ym9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiBPSwogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBT
w6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cgog
PiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQ29tbWl0dGVkIHRvIDIwMjIuMTEueCBhbmQg
MjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
