Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7264FC77B78
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 21:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E5F60773;
	Tue,  2 May 2023 21:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E5F60773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mI_XgFy2gQG; Tue,  2 May 2023 21:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27EB960B22;
	Tue,  2 May 2023 21:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EB960B22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA6FA1BF35D
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A22EE60AF1
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 21:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22EE60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRLDZAWSXCO7 for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 21:33:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3421B60773
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3421B60773
 for <buildroot@buildroot.org>; Tue,  2 May 2023 21:33:50 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso408725b3a.0
 for <buildroot@buildroot.org>; Tue, 02 May 2023 14:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683063229; x=1685655229;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=olpVulxXG1h94taUP64+OCiKs8ut3V6q50wYE17ahkU=;
 b=eDh8sWbSO9cofgdPSuYMAwWmR6qf68XsNUqastyqn1kXw70TYQnQiMlyve6h0bRQbI
 j3c8XB6kuP/js33jgbdu34sJz1JhZ53nnrirv1asvagVb5Fh+yIR/6njCaYuSrH/iOnQ
 Goi2A0N38rHzxjcCy7nFigjDmexR2g/mi32FgxLfEDSC48B5EVdcqqdYqoKZOHvLo3Tz
 pnYGT0GUBmkhyY7nmuZMQ7u8sTXocL2ihr0oIS59V3Hjk4V9oekTfghrRai8VyJnGDk0
 UG8VxWWVXrCrbzM8fP1+CL+JhhacsCNHkUVieQeLAMqlejeTP6Bzj+Lb7IJKjp/RxPXv
 6SrA==
X-Gm-Message-State: AC+VfDw2wHl3bXLnp+Uc/ZS+SLBv8v+zkwD2UyyFMkUel9skzJECjZo6
 XC6K+5zvGrkiifbXA/3JXIp1fkGUaKzYSMQpR7BpUg==
X-Google-Smtp-Source: ACHHUZ6PTIVuybwVlzMw6HlrStPAIroNo1/qVlLxsOaIfLpfmM0sWPyxttYBHCvCspB/twA7T/7Zbg==
X-Received: by 2002:a17:903:234e:b0:1ab:fce:7b4d with SMTP id
 c14-20020a170903234e00b001ab0fce7b4dmr3416111plh.27.1683063229347; 
 Tue, 02 May 2023 14:33:49 -0700 (PDT)
Received: from [192.168.0.164] (d205-250-120-28.bchsia.telus.net.
 [205.250.120.28]) by smtp.gmail.com with ESMTPSA id
 y2-20020a17090322c200b001aad714400asm6416197plg.229.2023.05.02.14.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:33:48 -0700 (PDT)
Message-ID: <ed1bff77-5934-f09a-ab39-ca4eea6b4b12@threespeedlogic.com>
Date: Tue, 2 May 2023 14:33:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: buildroot <buildroot@buildroot.org>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20221208.gappssmtp.com; s=20221208; t=1683063229;
 x=1685655229; 
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olpVulxXG1h94taUP64+OCiKs8ut3V6q50wYE17ahkU=;
 b=EbiYkgtXToSJ2hsZHuqvs+wObAmlk5r19rCWwdiwoTFF6bKBz8YGsx3BOd1YD8inbI
 kn3tKxp6YoOx2scW3lQRmpW+wyaaLBiMtjK15u5MBn9TP9x2crAFBxE7lekdm8eWitwd
 /Rdihkjsh253nWSpybWTFqAUD8S6HKH9xW8AMcULsKsOgB7HVcn1R3Owkkpyun751bJw
 sJMAAM9rjlM6QNpphoa5Iyld2BpzmgevoWYOWoOGdChya9aCIF0i8rG3jlIfGgSKgYYX
 zsWg6oP4fRdVyWK5xV2b9OnAy0FBYCOpkmB+nwRlLcuzE3IDvn7/m/o5eVpUkrXmH4HJ
 IV+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20221208.gappssmtp.com
 header.i=@threespeedlogic-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=EbiYkgtX
Subject: [Buildroot] Suitability for upstreaming - JupyterLab 4.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMgYW5kIFlhbm4sCgpZb3UgdHdvIGFyZSB0aGUgc2lnbi1vZmYgcG9pbnRzIGZvciB0
aGUgcHl0aG9uLWhhdGNobGluZyBwYWNrYWdlLCB3aGljaCBpcyB3aHkgeW91J3JlIENDJ2QgaGVy
ZS4KCkp1cHl0ZXJMYWIgaXMgYWJvdXQgdG8gcmVsZWFzZSB2ZXJzaW9uIDQuMC4wIFsxXS4gQmVj
YXVzZSB0aGV5J3ZlIHN3aXRjaGVkIHRvIGhhdGNobGluZyBbMl0sIGl0IHNlZW1zIHRvIGJlIG11
Y2ggZWFzaWVyIHRvIHBhY2thZ2UgdGhhbiBpdCB1c2VkIHRvIGJlLiAoTXkgcHJldmlvdXMgZXhw
ZXJpbWVudHMgcGFja2FnaW5nIGp1cHl0ZXJsYWIgb3IgaXB5dGhvbi1ub3RlYm9vayB3ZXJlIGJh
ZmZsaW5nIGZhaWx1cmVzLikKCkhhdmluZyBhc3NlbWJsZWQgYSBtb3N0bHktd29ya2luZyBzZXQg
b2YgYnVpbGRyb290IHBhY2thZ2VzIGZvciBKdXB5dGVyTGFiIDQuMC4wcmMxLCBJIHRoaW5rIGl0
J2QgYmUgdXNlZnVsIHRvIGFzayBob3cgYSByZXF1ZXN0IHRvIGluY2x1ZGUgaXQgaW4gdXBzdHJl
YW0gYnVpbGRyb290IHdvdWxkIGJlIHJlY2VpdmVkLiBXZSBjYW4gbWFpbnRhaW4gaXQgb3V0LW9m
LXRyZWUsIGJ1dCBpZiBKdXB5dGVyTGFiIGlzIHVzZWZ1bCB1cHN0cmVhbSBJJ20gaGFwcHkgdG8g
Z3Jvb20gaXQgZm9yIGluY2x1c2lvbi4KClVuZm9ydHVuYXRlbHksIHRoZXJlIGFyZSBhIGxhcmdl
IG51bWJlciBvZiBuZXcgUHl0aG9uICJzY2FmZm9sZGluZyIgcGFja2FnZXMgdGhhdCBhcmUgcmVx
dWlyZWQuIEF0IGxlYXN0IHRoZSBmb2xsb3dpbmc6CgogICAgIGp1cHl0ZXItY2xpZW50CiAgICAg
anVweXRlci1jb3JlCiAgICAganVweXRlci1ldmVudHMKICAgICBqdXB5dGVyLWlweXRob24ta2Vy
bmVsCiAgICAganVweXRlci1uYmNsaWVudAogICAgIGp1cHl0ZXItbmJjb252ZXJ0CiAgICAganVw
eXRlci1uYmZvcm1hdAogICAgIGp1cHl0ZXItbm90ZWJvb2stc2hpbQogICAgIGp1cHl0ZXItc2Vy
dmVyCiAgICAganVweXRlcmxhYi1weWdtZW50cwogICAgIGp1cHl0ZXJsYWItc2VydmVyCiAgICAg
anVweXRlcmxhYgogICAgIHB5dGhvbi1hbnlpbwogICAgIHB5dGhvbi1hc3R0b2tlbnMKICAgICBw
eXRob24tYmxlYWNoCiAgICAgcHl0aG9uLWNhbHZlcgogICAgIHB5dGhvbi1jb21tCiAgICAgcHl0
aG9uLWV4ZWN1dGluZwogICAgIHB5dGhvbi1mYXN0anNvbnNjaGVtYQogICAgIHB5dGhvbi1oYXRj
aC1qdXB5dGVyLWJ1aWxkZXIKICAgICBweXRob24taGF0Y2gtbm9kZWpzLXZlcnNpb24KICAgICBw
eXRob24tanNvbi1sb2dnZXIKICAgICBweXRob24tanNvbjUKICAgICBweXRob24tcGxhdGZvcm1k
aXJzCiAgICAgcHl0aG9uLXByb21ldGhldXMtY2xpZW50CiAgICAgcHl0aG9uLXB1cmUtZXZhbAog
ICAgIHB5dGhvbi1zZW5kMnRyYXNoCiAgICAgcHl0aG9uLXNuaWZmaW8KICAgICBweXRob24tc3Rh
Y2stZGF0YQogICAgIHB5dGhvbi10cm92ZS1jbGFzc2lmaWVycwogICAgIHB5dGhvbi13aGVlbAoK
SSBhbnRpY2lwYXRlIHNvbWUgY2hhbGxlbmdlczoKCi0gVGhlIG51bWJlciBvZiBwYWNrYWdlcyBw
cmVzZW50cyBhIG1haW50ZW5hbmNlIGxvYWQsCi0gU29tZSBwYWNrYWdlcyBoYXZlIGR1YmlvdXMg
dmFsdWUgb3V0c2lkZSBKdXB5dGVyIChzZW5kMnRyYXNoKQotIFNvbWUgKGp1cHl0ZXJsYWItcHln
bWVudHMpIGFyZSBzdGlsbCBtYXR1cmluZywKLSBTb21lIHJlcXVpcmUgcGF0Y2hlcyBvciBieXBh
c3NlcyB0byBidWlsZCBpbiBhIGJ1aWxkcm9vdCBlbnZpcm9ubWVudCB0aGF0IHdpbGwgbmVlZCB0
byBldm9sdmUgYXMgdGhlIHVwc3RyZWFtIHRyZWUgZG9lcy4KCkZpbmFsbHksIEkgZG9uJ3QgaGF2
ZSBhIGdvb2Qgc2Vuc2UgaG93IGFwcHJvcHJpYXRlIHRoZSBweXRob24td2hlZWwgcGFja2FnaW5n
IGlzLCBvciBob3cgaXQgd29ya3MgKHRoaXMgaXMgYSBob3N0IHBhY2thZ2Ugb25seSBhbmQgSSd2
ZSBwYWNrYWdlZCBpdCBuYcOvdmVseS4pCgpJbiBzaG9ydDogZG9lcyBKdXB5dGVyTGFiIGJlbG9u
ZyB1cHN0cmVhbWVkIGluIGJ1aWxkcm9vdCwgb3IgaXMgaXQgdG9vIHNwZWNpYWxpemVkIHRvIGJl
IGJyb2FkbHkgdXNlZnVsPwoKdGhhbmtzLApHcmFlbWUgU21lY2hlcgoKWzFdOiBodHRwczovL2dp
dGh1Yi5jb20vanVweXRlcmxhYi9qdXB5dGVybGFiL3JlbGVhc2VzL3RhZy92NC4wLjByYzAKWzJd
OiBodHRwczovL2Jsb2cuanVweXRlci5vcmcvcGFja2FnaW5nLWZvci1qdXB5dGVyLWluLTIwMjIt
YzdiZTY0YzM4OTI2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
