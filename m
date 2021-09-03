Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF4EC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:49:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248EC60F42
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 248EC60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED76D6158D;
	Fri,  3 Sep 2021 16:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uciToPCiaSJD; Fri,  3 Sep 2021 16:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 408CA61542;
	Fri,  3 Sep 2021 16:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169801BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066CE82951
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tQY0-HpsToj8 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:49:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11126.aruba.it (smtpcmd11126.aruba.it [62.149.156.126])
 by smtp1.osuosl.org (Postfix) with ESMTP id 946C4826D5
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 16:49:33 +0000 (UTC)
Received: from [192.168.47.128] ([141.136.145.143])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MCNameg0gIR3HMCNamj2FN; Fri, 03 Sep 2021 18:49:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630687771; bh=537A23ZXhBKst/uOL6dJ655ExyK9BNYDAWpSmii28ho=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=jDnkuPSr9KHD4lS/8Y6D0VOW+fsueTfaVCbvxq80gzMyO1CksYGscqWrJTKyi3OIH
 WXkujF8gEB2dQMzUR7rLgUATSq1p23XkPjbatmfTff0/gCvh1sJTTUlizJzbuK+psw
 7gewzsyejdwH5vB0qs6ghhemikNhDcO7loRcrGUNXKfkujjHIdQBL7tkGEHaGSfVt6
 ypJ5gs+Kij0NwiEbikA52Kgqje2rkzvEzgMled2SzwF39oGFRFvnyw0CleIXg3xOCd
 yfJoyByYFc9dSnFZRwrxxlngdXs25XbvSkASOF4mfr0Y9a1iRYaOntgGEilYUc69b0
 xXHYVt9FrOvPw==
To: Peter Korsgaard <peter@korsgaard.com>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <095867d2-b750-f9fb-0089-43ca736a891c@benettiengineering.com>
Date: Fri, 3 Sep 2021 18:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8735qlswc0.fsf@dell.be.48ers.dk>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBpAk/FQmoJx27IViPsYwdM8/ZXPbSRQP1x8PPZcBnCBiRas1S8qe8H8p44wDztGktO4hORqqsgrA/sofneWJ0miXU0ajYv+dghxcODsInhjbjXrUnaH
 VL1aYMqMX/u/dY9cBlux2RLMr3fMYVKzpHBe+76j+JC6SXn7VIhJxQhwoiq36tUp2Nq7NTM+xI2bskhwEJylOV0a9y7EuRQgAtunYuwe0ty8JfDYrGb31XM/
 f5/h33sgt3yW0HHryJAKZXg2CV3NumF86c2hR/g+ZPAT7yPt4gs8o5wFj+OixnKvTG+8tDdO/EDLmSCQPEyIhg==
Subject: Re: [Buildroot] What's wrong with patchwork
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

T24gOS8zLzIxIDI6MDAgUE0sIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPj4+Pj4+ICJHaXVsaW8i
ID09IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
PiB3cml0ZXM6Cj4gCj4gSGksCj4gCj4gICA+IFRoaXMgcGF0Y2hbMV0gc3RpbGwgZG9lc27igJl0
IHNob3cgdXAuCj4gICA+IERvIEkgcmVzZW5kIGl0Pwo+IAo+IFllcywgcGxlYXNlLgo+IAo+ICAg
PiBNYXliZSBvdGhlciBwYXRjaGVzIGhhdmUgYmVlbiBsb3N0IG9uIHBhdGNod29yay4gSSBkb27i
gJl0IGtub3cgaWYKPiAgID4gcGF0Y2h3b3JrIHdvcmtzIGluIHBvbGxpbmcgb3IgdHJpZ2dlcmlu
Zy4KPiAKPiBUaGUgd2F5IGl0IHdvcmtzIGlzIHRoYXQgcGF0Y2h3b3JrIGlzIHN1YnNjcmliZWQg
dG8gdGhlIGxpc3QgYW5kIGxvb2tzCj4gZm9yIHBhdGNoZXMgaW4gdGhlIG1haWxzLiBJZiBpdCBk
aWRuJ3QgcmVjZWl2ZSB0aGUgbWFpbCB3aXRoIHRoZSBwYXRjaAo+IHRoZW4gaXQgd2lsbCBub3Qg
c2hvdyB1cC4KPiAKPiBTb3JyeSBmb3IgdGhlIHRyb3VibGUuCj4gCgpPaywgbm8gcHJvYmxlbSBh
dCBhbGwhCgpLaW5kIHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJp
bmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
