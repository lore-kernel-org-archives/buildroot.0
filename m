Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0318FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68CDF608D8;
	Sat,  8 Jan 2022 16:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl5Iaoh8LL53; Sat,  8 Jan 2022 16:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD52607FF;
	Sat,  8 Jan 2022 16:15:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2483D1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20D7E607FF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJ6IuRovzop0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:15:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2664360692
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:15:05 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u21so12147509edd.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=df9QUyQD8tTp/zgy+knlca43hzdSJUDnNZ1lW3zow1s=;
 b=BOpKloBqdjptlaI736SROaoyVcfaOo01uXCGjKAibDlptkMt/KMhl5739o/P6qBw4w
 CIhzXZQMG/8omuDW17igip0P1lxjFQZh08fhMvOXJB9QB9pi2/y0C8S+w1bBwhlfWRHt
 6Yl+1koZi+CaEonS/9ajHW0wwpr26xuTCNoZcg6obFChGM4yV0/LxIMgQGEjgtQHnDFG
 Ta6s0D4VR0/rdF/jnPZHwMNdCjJUqsZhBpmG57pX5BtGcc8bEFLNxEwfgMS61Uie4eNI
 jX/zMN5wSCGrn1kEm/spXZmMQAuN4/HCPMewZEBrRt0ay7473MLlf5Nad+5P84WDK4Up
 hXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=df9QUyQD8tTp/zgy+knlca43hzdSJUDnNZ1lW3zow1s=;
 b=N3w7T5iSLvXv+5G9Fa6jucOqsPkvEqZpIJ4Bd5+YF7C+d6TucJ7XfP7w9Pie9vILK2
 ZQT+NTrEJ8o2KOMtIvEAtPSIVv1+8t6vorMoRuD09Re2dRqGzeU4mFk8+qwoc0gRSjAo
 zUsboRTc7lFKt7J7pjzp1Y3F5HMT1KoouAgpifTElb+V/QvnOiT33Oa1uA5TEEwf+eRz
 OfKvvLDqjGrqkKDCwkIFERwhTyQeY9otc46yui+cL7gntNdvslEPLj69paSfHn6UY5Ga
 Yn1S/yUDQ4iWS9Cuz3HfXE+MupJpA6rYKZXejjypNBuL/f+LAzXpgx8HgMQN7j3wHfIH
 SkIw==
X-Gm-Message-State: AOAM532ZngQSCIxS+r2EVyFN4mCzEQF1EmPO+ti5dTD0L/4NWz24fhtY
 BvSGfMxeiBB0TZJ1oGMQ+ByHb1jrjMy2E0T2yTQ=
X-Google-Smtp-Source: ABdhPJwPQ3gSGdvkUdemKV8GIYRrBzvwPyM/+znRwYzK0HH2ufUvOQ8I9wrrN+y2Vvzk8q5LkYV8rPBiKpJE4SrpJro=
X-Received: by 2002:a17:906:6a23:: with SMTP id
 qw35mr1681644ejc.117.1641658503412; 
 Sat, 08 Jan 2022 08:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
 <20220108115140.760e195f@windsurf>
In-Reply-To: <20220108115140.760e195f@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 8 Jan 2022 17:13:47 +0100
Message-ID: <CAPi7W82_k_toe+-1DdZv8wr2ArKjeZfb9qdarm5oewv52vsh4g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBzYW0uIDggamFudi4gMjAyMiDDoCAxMTo1MSwgVGhvbWFzIFBldGF6em9uaQo8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gVHVlLCAgNCBKYW4g
MjAyMiAyMTo1NDo1NSArMDEwMAo+IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tPiB3cm90ZToKPgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBy
YWlzZWQgc2luY2UgYnVtcCB0byB2ZXJzaW9uIDUuNDEgaW4KPiA+IGNvbW1pdCBkMzhiNzJiY2Q3
NTM5MmE4OGI1MTAwODM5YWM0MTA4NTlkMGE2YTc5Ogo+ID4KPiA+IHJlYWRlbGYuYzogSW4gZnVu
Y3Rpb24gJ2RvX2F1eHZfbm90ZSc6Cj4gPiByZWFkZWxmLmM6MTA0NjoyOiBlcnJvcjogJ2Zvcicg
bG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxvd2VkIGluIEM5OSBtb2RlCj4g
PiAgIGZvciAoc2l6ZV90IG9mZiA9IDA7IG9mZiArIGVsc2l6ZSA8PSBkZXNjc3o7IG9mZiArPSBl
bHNpemUpIHsKPiA+ICAgXgo+ID4KPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzFjYmMzMTNmY2ViODRjMGNiYjE5NjlmY2E1YWM0NDI0NDg3
MWRiYwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tPgo+Cj4gSSBhbSBhZnJhaWQgaXQgc2VlbXMgbGlrZSB0aGlzIGRpZG4n
dCBmaXggdGhlIHByb2JsZW0sIHNlZToKPgo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvOTU3Lzk1NzNlOGIwMWQ4ZjIxY2Q4OWE2NzQ3NWRhYWJkZWVmNTMzZDMxZDcv
YnVpbGQtZW5kLmxvZwo+Cj4gYWNfY3ZfcHJvZ19jY19jOTk9Jy1zdGQ9Z251OTknIGlzIHByb3Bl
cmx5IHBhc3NlZCB0byB0aGUgY29uZmlndXJlCj4gc2NyaXB0LCBidXQgaXQgc3RpbGwgZmFpbHMu
CkluZGVlZCwgSSBzdWdnZXN0IHRvIHJldmVydCB0aGlzIGNvbW1pdCBhbmQgYXBwbHkgdGhlIHZl
cnNpb24gMSBvZgp0aGlzIHBhdGNoIGluc3RlYWQgb2YgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hh
dCBpcyAiYnJva2VuIiBpbiB0aGUKY29uZmlndXJlIHNjcmlwdC4KPgo+IFRob21hcwo+IC0tCj4g
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
