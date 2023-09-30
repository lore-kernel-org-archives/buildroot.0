Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD75FE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9644240AE7;
	Sat, 30 Sep 2023 13:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9644240AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsyYz6pME_me; Sat, 30 Sep 2023 13:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB8DA40C16;
	Sat, 30 Sep 2023 13:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB8DA40C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 086C81BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D205B82129
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D205B82129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAgz_Fv7LyH7 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:16:41 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 467FC82111
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467FC82111
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so14382528f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696079799; x=1696684599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zI1qjkhW6yzUQ92Ne4zoow8iQmV1VIl9VHZ4X5T0JgQ=;
 b=KxdqNoqRwsaoq1ZAsfN4N1eZKnWjKFHhHFW2Nfnd377+hBlU0G8mM6uWhyLdq6ar60
 Kh0jPOAFKg5GDu3KQygkHanAvv66mtvOpFpGcaHgmqJd6rnFARFZIRzsOIFKj5+KBskB
 Zx4VOjbfSzrGLXdxvRwLzTa/KbmAkQHfV1P8xu8TKzfdslsV3yJdBcmmanfBpU5h3IkC
 ZIa2iS2jMqGsxcjTUdvIcQDb0PJtY6dQTRcmCtg269f/sM+0vsdDJ4EHwZHibHkhVmV8
 ePuMTxJghPV4EZ1F2Z6RfwDifRvEQkiMxHs39qJ9XxwfUx2wNuX4KwqChfPnWHumz1wc
 Y3Ug==
X-Gm-Message-State: AOJu0YwsQC53AEZ5hfJ8h1q/cJJO9RHuqzwj7pDMlyzyvZaUPu6W68e9
 rl5ggE+Q/F/23aLSz36aJplLnA==
X-Google-Smtp-Source: AGHT+IHmFw661B926o/AoESaoBzYJL/8NVwnjchBnu7IG+BjEooUM6ddScMUQzd39F9WfFJZJWnT6Q==
X-Received: by 2002:a5d:6a50:0:b0:314:2fdd:28ef with SMTP id
 t16-20020a5d6a50000000b003142fdd28efmr5599105wrw.18.1696079799222; 
 Sat, 30 Sep 2023 06:16:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 d12-20020adf9c8c000000b00324887a13f7sm5439606wre.0.2023.09.30.06.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 06:16:25 -0700 (PDT)
Message-ID: <cbef3e65-a2f5-d360-909f-4bab0cfcf50f@smile.fr>
Date: Sat, 30 Sep 2023 15:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696079799; x=1696684599;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zI1qjkhW6yzUQ92Ne4zoow8iQmV1VIl9VHZ4X5T0JgQ=;
 b=XB3Ypo4rtfa8b5PDqT+m6mAqCObT/LHHqUTiBwbKvYgtbSCfcyDD11EtDZX7Y/wClG
 x6bMXVL+6ZHqoYahrTMYOadnnntchD1AJMXUe/2CgJSVkRHxqZsPMqyaUsOiZy53tFwm
 mTN4AJ2OdVYKB/RO5MesmQJ09IJ2Hlv3F62BnPY5b6CmQ8Qw46ELfhmKyZ6kJldk9eyM
 a/TcmHZtQfPgAZNL/qzNS8q31mgti3yD5KkZtF6RJ472sL8XPbGZrL2NmUvPnN9fR68d
 9q/XBkpM7gxOQ0wE/tvbGebdP+wmRaY09+Xm/5TStgt1baQxt6PAIkWN/Sdh/Pa1X6/r
 tMgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XB3Ypo4r
Subject: Re: [Buildroot] [PATCH v2 0/7] Move gcc target libs installation to
 target package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Henri Roosen <henri.roosen@ginzinger.com>,
 Stefan Mayrhofer <stefan.mayrhofer@ginzinger.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMzAvMDkvMjAyMyDDoCAwOTo1NCwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8sCj4gCj4gQ3VycmVudGx5LCB0aGUgZ2Nj
IHJ1bnRpbWUgbGlicmFyaWVzIGluc3RhbGxlZCBpbgo+IFNUQUdJTkdfRElSL1RBUkdFVF9ESVIg
YXJlIGluc3RhbGxlZCBieSBob3N0LWdjYy1maW5hbCwgYSBob3N0Cj4gcGFja2FnZS4gSXQgd29y
a3Mgb2YgY291cnNlLCBidXQgaXNuJ3QgdmVyeSBjbGVhbi4gQnV0IG1vcmUKPiBpbXBvcnRhbnRs
eSwgaXQgcHJldmVudHMgdXMgZnJvbSBoYXZpbmcgYSBzYW5lIGhhbmRsaW5nIG9mIGxpY2Vuc2lu
Zwo+IGZvciBnY2MuIEluZGVlZCwgdGhlIGhvc3QgZ2NjIGNvbXBvbmVudHMgYXJlIEdQTHYzLCBi
dXQgdGhlIHRhcmdldAo+IGNvbXBvbmVudHMgb2YgZ2NjIGFyZSBHUEx2MyB3aXRoIHRoZSBpbXBv
cnRhbnQgbGlua2luZyBleGNlcHRpb24uCj4gCj4gSW4gb3JkZXIgdG8gaGFuZGxlIHRoaXMsIHRo
aXMgc2VyaWVzIHByb3Bvc2VzIHRvIHNwbGl0IHRoZQo+IGhvc3QtZ2NjLWZpbmFsIHBhY2thZ2Ug
aW50byBhIGhvc3QgcGFja2FnZSAod2hpY2ggYWxyZWFkeSBleGlzdHMpIGFuZAo+IGEgdGFyZ2V0
IHBhY2thZ2UgKHdoaWNoIGlzIGFkZGVkIGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMpLiBUaGUgbG9n
aWMKPiBpbnN0YWxsaW5nIHRoZSBnY2MgcnVudGltZSBsaWJyYXJpZXMgaXMgbW92ZWQgdG8gdGhl
IHRhcmdldCBnY2MtZmluYWwKPiBwYWNrYWdlLiBPbmNlIHRoaXMgaXMgZG9uZSwgdGhlIHNlcmll
cyBhZGRzIHRoZSByZWxldmFudCBsaWNlbnNpbmcKPiBpbmZvcm1hdGlvbiB0byBob3N0LWdjYy1p
bml0aWFsLCBob3N0LWdjYy1maW5hbCBhbmQgZ2NjLWZpbmFsLgoKU2VyaWVzIGFwcGxpZWQgdG8g
bWFzdGVyLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IENoYW5nZXMgZnJvbSB2MToKPiAK
PiAtIEluc3RlYWQgb2YgaW50cm9kdWNpbmcgYSBzZXBhcmF0ZSBnY2MtcnVudGltZSBwYWNrYWdl
LCBrZWVwIHRoZQo+ICAgbG9naWMgaW4gZ2NjLWZpbmFsLCBidXQgd2l0aCBhIHRhcmdldCB2YXJp
YW50IHBhY2thZ2UuIFRoaXMgd2FzCj4gICBzdWdnZXN0ZWQgYnkgUm9tYWluIE5hb3VyIGFuZCBp
bmRlZWQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UuCj4gCj4gLSBTcGxpdCBpbnRvIGZpbmVyIGdyYWlu
ZWQgY29tbWl0cyBub3cgdGhhdCB3ZSdyZSBrZWVwaW5nIHRoaW5ncyBpbgo+ICAgZ2NjLWZpbmFs
Lm1rLgo+IAo+IFRob21hcyBQZXRhenpvbmkgKDcpOgo+ICAgcGFja2FnZS9nY2MvZ2NjLWZpbmFs
OiByZXdvcmsgaW5zdGFsbGF0aW9uIG9mIGxpYmdjY19zL2xpYmF0b21pYwo+ICAgcGFja2FnZS9n
Y2MvZ2NjLWZpbmFsOiByZW1vdmUgdXNlbGVzcyBjb21tZW50IGFuZCBlbXB0eSB2YXJpYWJsZQo+
ICAgcGFja2FnZS9nY2MvZ2NjLWZpbmFsOiBtb3ZlIHRvIG1ha2UgZm9yZWFjaCBsb29wcwo+ICAg
cGFja2FnZS9nY2MvZ2NjLWZpbmFsOiBzcGxpdCBsaWIgaW5zdGFsbCBieSB0YXJnZXQvc3RhZ2lu
Zwo+ICAgcGFja2FnZS9nY2MvZ2NjLWZpbmFsOiBtb3ZlIGhvb2sgZnVydGhlciBkb3duCj4gICBw
YWNrYWdlL2djYy9nY2MtZmluYWw6IGFkZCBhIHRhcmdldCB2YXJpYW50IGluIGNoYXJnZSBvZiB0
YXJnZXQKPiAgICAgaW5zdGFsbGF0aW9uCj4gICBwYWNrYWdlL2djYzogYWRkIGxpY2Vuc2UgaW5m
b3JtYXRpb24KPiAKPiAgcGFja2FnZS9nY2MvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDMgKwo+ICBwYWNrYWdlL2djYy9nY2MtZmluYWwvZ2NjLWZpbmFsLm1rICAgICAgICAg
ICAgfCA5NyArKysrKysrKy0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvZ2NjL2djYy1pbml0aWFsL2dj
Yy1pbml0aWFsLm1rICAgICAgICB8ICAyICsKPiAgcGFja2FnZS9nY2MvZ2NjLmhhc2ggICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDcgKysKPiAgcGFja2FnZS9nY2MvZ2NjLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDMgKwo+ICB0b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9v
dC9Db25maWcuaW4gICAgICAgfCAgMSArCj4gIC4uLi90b29sY2hhaW4tYnVpbGRyb290Lm1rICAg
ICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIDcgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9u
cygrKSwgNTcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2djYy9D
b25maWcuaW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
