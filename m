Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39611C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 14:14:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230DA611C8
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 14:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 230DA611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B40A4415FB;
	Fri, 17 Sep 2021 14:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vSRUpIuxWJD; Fri, 17 Sep 2021 14:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F7FE40669;
	Fri, 17 Sep 2021 14:14:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4713E1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 14:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34C1240119
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 14:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebJ45jOr-YVJ for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 14:14:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA2B740104
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 14:14:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 81BE1FF811;
 Fri, 17 Sep 2021 14:14:44 +0000 (UTC)
Date: Fri, 17 Sep 2021 16:14:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "D. Olsson" <hi@senzilla.io>
Message-ID: <20210917161443.6962f080@windsurf>
In-Reply-To: <KzkhQpdQv77nQ-S-fjvQle8wMkZhXcU-JWX5SFM4jE6BmEvO24yL_RlALbjiJ5JuOokHs3-WHnc1R32suKq42HrQnqI2Sds16WhnVUGyoEg=@senzilla.io>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-8-kory.maincent@bootlin.com>
 <KzkhQpdQv77nQ-S-fjvQle8wMkZhXcU-JWX5SFM4jE6BmEvO24yL_RlALbjiJ5JuOokHs3-WHnc1R32suKq42HrQnqI2Sds16WhnVUGyoEg=@senzilla.io>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 7/8] package/edk2-images: new package
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8sCgpPbiBGcmksIDE3IFNlcCAyMDIxIDEzOjQzOjM4ICswMDAwCiJELiBPbHNzb24iIDxo
aUBzZW56aWxsYS5pbz4gd3JvdGU6Cgo+IE9uIFR1ZSwgU2VwIDE0LCAyMDIxIGF0IDExOjM0LCBL
b3J5IE1haW5jZW50Cj4gPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+ID4g
SW4gb3JkZXIgdG8gYWRkIHN1cHBvcnQgZm9yIEVGSSBib290IGZyb20gdGhlIGVtdWxhdG9yLCB0
aGlzIHBhdGNoCj4gPiBhZGQgYSBwYWNrYWdlIHRvIGRvd25sb2FkIHRoZSBFRkkgQklPUyBwcmVi
dWlsdCBiaW5hcnkgZnJvbToKPiA+IGh0dHBzOi8vd3d3LmtyYXhlbC5vcmcvcmVwb3MvamVua2lu
cy9lZGsyLyAgCj4gCj4gU2luY2UgYSBmZXcgbW9udGhzWzFdIGl0J3MgYmVlbiBwb3NzaWJsZSB0
byBidWlsZCBFREsyIGZyb20gc291cmNlIGluCj4gQnVpbGRyb290LiBXb3VsZCBpdCBiZSBwb3Nz
aWJsZSB0byBleHRlbmQgdGhlIGV4aXN0aW5nIHBhY2thZ2UKPiBpbnN0ZWFkIG9mIGR1cGxpY2F0
aW5nIHRoZSBlZmZvcnQgYnkgbWFpbnRhaW5pbmcgdHdvIHBhY2thZ2VzPwo+IAo+IFsxXToKPiBo
dHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9sb2cvYm9vdC9lZGsyL2VkazIuaGFz
aD9zaG93bXNnPTEKCldoZW4gS8O2cnkgcGFja2FnZWQgZWRrMi1pbWFnZXMsIEkgaW5kZWVkIHRo
b3VnaHQgb2YgdGhlIGZhY3QgdGhhdCB3ZQpjYW4gbm93IGJ1aWxkIEVESzIgZnJvbSBzb3VyY2Uu
IFRoYXQgYmVpbmcgc2FpZCwgdG8gcXVpY2tseSBnZXQgYW4gRUZJCkJJT1MgaW1hZ2UgdG8gZG8g
dGVzdHMgdW5kZXIgUWVtdSwgYSBwcmUtYnVpbHQgRURLMiBpbWFnZSBpcyBxdWl0ZSBuaWNlLgoK
SSdsbCBsZXQgb3RoZXJzIGNvbW1lbnQgb24gdGhpcy4KCkJlc3QgcmVnYXJkcywKClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
