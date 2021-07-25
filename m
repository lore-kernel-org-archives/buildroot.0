Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7038C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:24:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3326560F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3326560F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E039C40201;
	Sun, 25 Jul 2021 19:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WTOUeTlj2OY; Sun, 25 Jul 2021 19:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EC4640147;
	Sun, 25 Jul 2021 19:24:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 676F61BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B2A82BBC
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEKW39nxZX7c for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:23:59 +0000 (UTC)
X-Greylist: delayed 00:10:08 by SQLgrey-1.8.0
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAD8982B81
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 19:23:58 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4GXt5M32Hmz4xZhD
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 19:13:58 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch; dkim=none
Date: Sun, 25 Jul 2021 19:13:37 +0000
Authentication-Results: mail-4317.protonmail.ch; dkim=none
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?utf-8?Q?Llu=C3=ADs_Batlle_i_Rossell?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <c5996a18-9dd9-142d-4440-7be94c4929e1@sigma-star.at>
MIME-Version: 1.0
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.1.3 is released
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGksCgptdGQtdXRpbHMtMi4xLjMgaXMgcmVsZWFzZWQuCgpUYXJiYWxsOiAgICAgICAgICAgICAg
IGZ0cDovL2Z0cC5pbmZyYWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMS4zLnRh
ci5iejIKVGFyYmFsbCBncGcgc2lnbmF0dXJlOiBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIv
bXRkLXV0aWxzL210ZC11dGlscy0yLjEuMy50YXIuYnoyLmFzYwpTaWduZWQgZ2l0IHRhZzogICAg
ICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGlscy5naXQgdjIuMS4zCgoKQWx0ZXJu
YXRpdmVseSBhbHNvIG1pcnJvcmVkIGhlcmU6CgpUYXJiYWxsOiAgICAgICAgICAgICAgIGh0dHBz
Oi8vaW5mcmFyb290LmF0L3B1Yi9tdGQvbXRkLXV0aWxzLTIuMS4zLnRhci5iejIKVGFyYmFsbCBn
cGcgc2lnbmF0dXJlOiBodHRwczovL2luZnJhcm9vdC5hdC9wdWIvbXRkL210ZC11dGlscy0yLjEu
My50YXIuYnoyLmFzYwpTaWduZWQgZ2l0IHRhZzogICAgICAgIGh0dHBzOi8vZ2l0LmluZnJhcm9v
dC5hdC9tdGQtdXRpbHMuZ2l0IHYyLjEuMwoKClRoZSBsaXN0IG9mIGNoYW5nZXMgKHByaW1hcmls
eSBmaXhlcykgaXMgbm90IGFzIGxvbmcgYXMgZm9yIHRoZSBsYXN0IHJlbGVhc2UsCmJ1dCB0aGV5
IGhhdmUgYmVlbiBiYWNrbG9nZ2VkIGZvciBhIHllYXIgbm93LCBmaW5hbGx5IHByb21wdGluZyBh
IG5ldyBwYXRjaApsZXZlbCByZWxlYXNlLgoKCkNoYW5nZXMgZnJvbSAyLjEuMiB0byAyLjEuMzoK
CkZlYXR1cmVzOgogICAgICAgZmxhc2hjcDogQWRkIG5ldyBmdW5jdGlvbiB0aGF0IGNvcHkgb25s
eSBkaWZmZXJlbnQgYmxvY2tzCiAgICAgICBmbGFzaF9lcmFzZTogQWRkIGZsYXNoIGVyYXNlIGNo
aXAKICAgICAgIEFkZCBmbGFzaF9vdHBfZXJhc2UKICAgICAgIEFkZCBhbiB1YmlmcyBtb3VudCBo
ZWxwZXIKICAgICAgIEFkZCBuYW5kZmxpcGJpdHMgdG9vbAoKRml4ZXM6CiAgICAgICBta2ZzLnVi
aWZzOiBGaXggcnVudGltZSBhc3NlcnRpb25zIHdoZW4gcnVubmluZyB3aXRob3V0IGNyeXB0bwog
ICAgICAgbXRkLXV0aWxzOiBVc2UgQUNfU1lTX0xBUkdFRklMRQogICAgICAgRml4IHRlc3QgYmlu
YXJ5IGluc3RhbGxhdGlvbgogICAgICAgbGlibXRkOiBhdm9pZCBkaXZpZGUgYnkgemVybwogICAg
ICAgdWJpaGVhbHRoZDogZml4IFVCSUZTIGJ1aWxkIGRlcGVuZGVuY3kKICAgICAgIG1rZnMudWJp
ZnM6IHJlbW92ZSBPUEVOU1NMX25vX2NvbmZpZygpCiAgICAgICBtaXNjLXV0aWxzOiBBZGQgZmVj
dGVzdCB0byBidWlsZCBzeXN0ZW0KICAgICAgIG1rZnMudWJpZnM6IEZpeCBidWlsZCB3aXRoIFNF
TGludXgKICAgICAgIEZpeCB0eXBvcyBmb3VuZCBieSBEZWJpYW4ncyBsaW50aWFuIHRvb2wKICAg
ICAgIEZpeCBqZmZzMiBidWlsZCBpZiB6bGliIG9yIGx6byBoZWFkZXJzIGFyZSBub3QgaW4gZGVm
YXVsdCBwYXRocwoKClJhdyBzaG9ydCBsb2cgc2luY2UgdGhlIDIuMS4yIHJlbGVhc2U6CgpCYXN0
aWFuIEdlcm1hbm4gKDMpOgogICAgICAgRml4IHR5cG9zIGZvdW5kIGJ5IERlYmlhbidzIGxpbnRp
YW4gdG9vbAogICAgICAgbWtmcy51YmlmczogRml4IGJ1aWxkIHdpdGggU0VMaW51eAogICAgICAg
bWlzYy11dGlsczogQWRkIGZlY3Rlc3QgdG8gYnVpbGQgc3lzdGVtCgpCb3JpcyBCcmV6aWxsb24g
KDEpOgogICAgICAgbXRkLXV0aWxzOiBBZGQgbmFuZGZsaXBiaXRzIHRvb2wKCkNocmlzIFBhY2to
YW0gKDEpOgogICAgICAgbGlibXRkOiBhdm9pZCBkaXZpZGUgYnkgemVybwoKRGF2aWQgT2Jlcmhv
bGxlbnplciAoNSk6CiAgICAgICBSZW1vdmUgaGVhZGVycyBmcm9tIEVYVFJBX0RJU1QKICAgICAg
IENsZWFudXA6IEF1dG9tYWtlOiByZW1vdmUgc2luZ2xlIHVzZSB2YXJpYWJsZXMKICAgICAgIEZp
eCB0ZXN0IGJpbmFyeSBpbnN0YWxsYXRpb24KICAgICAgIEFkZCBtaXNzaW5nIGZpbGxqZmZzMi5z
aCB0byBFWFRSQV9ESVNUCiAgICAgICBSZWxlYXNlIG10ZC11dGlscy0yLjEuMwoKSGFydmV5IFd1
ICgxKToKICAgICAgIG1pc2MtdXRpbHM6IGZsYXNoY3A6IEFkZCBuZXcgZnVuY3Rpb24gdGhhdCBj
b3B5IG9ubHkgZGlmZmVyZW50IGJsb2NrcwoKSGVucmkgUm9vc2VuICgxKToKICAgICAgIG1rZnMu
dWJpZnM6IEZpeCBydW50aW1lIGFzc2VydGlvbnMgd2hlbiBydW5uaW5nIHdpdGhvdXQgY3J5cHRv
CgpKdWVyZ2VuIEJvcmxlaXMgKDEpOgogICAgICAgbXRkLXV0aWxzOiB1YmloZWFsdGhkOiB0aGlz
IHRvb2wgZG9lcyBub3QgZGVwZW5kIG9uIFVCSUZTCgpMYXJpc2EgSWxlYW5hIEdyaWdvcmUgKDEp
OgogICAgICAgbXRkLXV0aWxzOiBmbGFzaF9lcmFzZTogQWRkIGZsYXNoIGVyYXNlIGNoaXAKCk1p
Y2hhZWwgV2FsbGUgKDEpOgogICAgICAgbXRkLXV0aWxzOiBBZGQgZmxhc2hfb3RwX2VyYXNlCgpS
b2xmIEVpa2UgQmVlciAoMSk6CiAgICAgICBmaXggYnVpbGQgb2YgamZmczJyZWFkZXIgYW5kIGpm
ZnMyZHVtcCBpZiB6bGliIG9yIGx6byBoZWFkZXJzIGFyZSBub3QgaW4gZGVmYXVsdCBwYXRocwoK
U2FzY2hhIEhhdWVyICgxKToKICAgICAgIG10ZC11dGlsczogVXNlIEFDX1NZU19MQVJHRUZJTEUK
ClRvcmJlbiBIb2huICgxKToKICAgICAgIG1rZnMudWJpZnM6IHJlbW92ZSBPUEVOU1NMX25vX2Nv
bmZpZygpCgpVd2UgS2xlaW5lLUvDtm5pZyAoMSk6CiAgICAgICBBZGQgYW4gdWJpZnMgbW91bnQg
aGVscGVyCgoKUmVnYXJkcywKCkRhdmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94
Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
