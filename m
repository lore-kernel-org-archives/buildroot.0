Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F465C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B84348146A;
	Wed, 31 Jul 2024 19:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNBWYbKmsXBE; Wed, 31 Jul 2024 19:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69A98146C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69A98146C;
	Wed, 31 Jul 2024 19:57:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83B081BF32B
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F9BA8146A
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LEHQmfSRbDh for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 19:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F37D81467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F37D81467
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F37D81467
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 19:57:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52efcbfacb9so631767e87.2
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 12:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722455856; x=1723060656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2/uC1LCHCcWpBABlJ0Ex8Vep9v3SUCSJmh35X2hiGo=;
 b=M8gdQAg4zzxIMIV52hrZkX3o5Sw0n9+mx410ZURSibEg+488PVZ1HlJVI91NKeLP6G
 2+AUf/pCGxG1KYkMwQ9ca8Cj/zZ9djjjR5Z+vBx//oC328BvUl6dqkrUlxfvPeUc7Xth
 vMtOZSInxBMOdUty0FqWiXaiyKsThp8WRMWHI4Hvt7hKFhOn53pyrjHVjnmPmzVFjitk
 sjwuszy7CIkVXcKohXQ9k1unCtUG4CYYUjIqKPrc5dbc8OYOqIzeP2wK2eBlRch47oDH
 0tdebI+wun0SXrc5Ls6nwwseI/IX1mYleFJxjo3JXqFPV0q6U7outFuTlLJILWXmMjCt
 sulw==
X-Gm-Message-State: AOJu0Yy8DN/ny4UGFxUcrVeXEAteS/j+gjACNaEpN17OCuHMVVT3V7PK
 ha87Jar1qdrbTXVvM6aEgKpjLrh2ipriACCzddxmt0eoz1PL7KH8jG51I3oU1Ts2DD+QtvlPuV7
 6zFD8IEX/0JWIP4L4rFDW+34Ri+tx/Q==
X-Google-Smtp-Source: AGHT+IERtq8ET9+1DeUapQGGHoQTHbQNUk+AjOsmfOeyEjkERK58TSmTHba5sNgmROD0P+GUi66vjWdG3HP/7rOY/+E=
X-Received: by 2002:a05:6512:690:b0:52c:ce28:82bf with SMTP id
 2adb3069b0e04-530b61ed4eemr29928e87.5.1722455855695; Wed, 31 Jul 2024
 12:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
 <20240731145504.365492-3-philip-dylan@gleonec.bzh>
 <CAOMZO5B4DLidx1KXvyNUd7mic-WB+WQTQHn-_A7hXTprcLWVjA@mail.gmail.com>
 <0a5c8a3c-36f7-4921-897d-2c01dacbd809@gleonec.bzh>
In-Reply-To: <0a5c8a3c-36f7-4921-897d-2c01dacbd809@gleonec.bzh>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2024 16:57:24 -0300
Message-ID: <CAOMZO5CA7Dx3hu2qCNJ_2pEa4e3YQGCq48fjriOR82pcXmuU6Q@mail.gmail.com>
To: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722455856; x=1723060656; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2/uC1LCHCcWpBABlJ0Ex8Vep9v3SUCSJmh35X2hiGo=;
 b=Fcwl5yf+QhnT8I3wAJ3oIo6aOLXzEKOFMnYPsdkzmsCEpC732HrAXudEnNUb024cSl
 pdQ0hupogZYELjTnmy1AW3hfEP0Kigi4qcK06jXn4mX3gNGtYl6/ZJS8cARBXkfwaEPC
 WC04PMrBe5CMp9LU/tQVi742fKtE+QUrFwfWVwsTXXRUbfe/wC0KtBZtT8Y/e4vhOlh5
 NVkM5nH9fIREDEZ1mluYLZmJqJIaIP5mzMz2dHTCOjTcvTNwpYIbVEKcr85gYTPvoSeb
 jPEtRVIS2ZY+A5nkcMoiowOCFnFYKMGFdBTJQEVAQJdyCyZCtqEeP+ucDsCiMcTKPo+2
 zk7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fcwl5yf+
Subject: Re: [Buildroot] [PATCH 2/2] configs/mx6sx_udoo_neo_defconfig: add
 hashes
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgNDo1MeKAr1BNIFBoaWxpcC1EeWxhbiBHbGVvbmVjCjxw
aGlsaXAtZHlsYW5AZ2xlb25lYy5iemg+IHdyb3RlOgoKPiBZb3UncmUgcmlnaHQuIEkgbWVzc2Vk
IHVwIGEgcmViYXNlIHdoZW4gYnVtcGluZyBmcm9tIDYuNi40MCB0byA2LjYuNDMuCj4gSSdsbCBz
ZW5kIGEgbmV3IHBhdGNoc2V0IHRvIGZpeCB0aGlzLCBpbmNsdWRpbmcgdGhlIHdpZmkgZml4IGlm
IG5lZWRlZC4KClllcywgcGxlYXNlIHN1Ym1pdCBhIHYyIG9mIHRoZSBzZXJpZXMgYnkgY2hhbmdp
bmcgdGhlIGhhc2ggZnJvbSA2LjYuNDAKdG8gNi42LjQzLgoKVGhhbmtzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
