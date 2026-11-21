Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D8606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 21:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WSt0Kri+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7zXiRGX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32A860677;
	Sat, 21 Nov 2026 21:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQZ2O-raaEOb; Sat, 21 Nov 2026 21:52:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C36C6061A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795297928;
	b=fNjHx3d92wYIC6+Q21vPSfLtrCmqwj3RX4E3DgOtEzRrWEVTZYDPutT2f7yA4WnW4mLP
	 BhzqZiLacIVVSp0BBzVkr03HMe/WOojwBnlGzXHRQhZon+oGjes0qosQptsRyfAJppGBf
	 vqcjuLtwVQerH6ZFohZ38ev2qGbBckkNE/hFSGAflFKpsgiYWRSZmhu2X6SriXprZpIYN
	 fZQD7rXd/pyxbagJhW7tCyMQwUBZcz4BL/+XEOMTsMiUyb/26LCYwi2N2DaGHDbUHAhx8
	 PlcvZktLn6e8HZ/Thf04erq/2DdHN5QWoHRuVIawOZaNU5gvsUdJUdXm46wVDTIitag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795297928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bP0oi9dLzOZCs5Xhk+0cs8gia9pVcsfiYqhkiod/uYc=;
	b=Tkez7tWap9Y8BL3kLMukDt1i5kaZZ8uwbd3pMBWZVU/jcFjL3JcVXLxdn//QjjnNlzJG
	 IQzM02foo8y0zmddaWSRP0LV6WV04FjLD0Qpl0tlzHMFyunfBGjECu1cJjBmYI0B7b6CD
	 coFQ9Bv6+VIN5bvH/qESU/iEaSbBli0bY1ZWczk+1iVqqiSVOQ0CiB71JdTMGn8PUrums
	 MihGrpzGcZ61L8xLzfzKb8TkVjV5EiySigSOfKeO2liyGoCpEbEoCo20nC6nyZk4DOaRu
	 ryA5lqJwrs8W+QwDYqwOd7FKDbKdu18TriWB7UHBkt2kMA/EtqVyGjhz+TXmWeTkLpw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795297928;
	bh=bP0oi9dLzOZCs5Xhk+0cs8gia9pVcsfiYqhkiod/uYc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WSt0Kri+Gxj/ypvBKhwckXVM7XJ9tj4UnAJnjylFVxTL1SJBC31k7p+sWpFdI6AWO
	 wDw9HicSTje+9WE+8q9/E6ShuNa1A0HVfjJMqOeXJTSZCc+d2wT2bu0g6KR8d57FFz
	 cRL2AY3kordxfiTP2Hv2sGebBbjlOolcK3PCIPjOCE5SreUX3f4TCGANiTACOr2vgB
	 4ic1iwgz8LGyH1ZHa7to2mzTjwceeG0qqD59+Eo/slg4bPAtt7+D9Ajm3QOfMRKuTv
	 A92652AzFWXx6VXC7B4C1cXH/lfspC2qpI0MgPsrSqj7meceKTYPLhDSEX5pk4PNLb
	 qcqa4GvpExdvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C36C6061A;
	Sat, 21 Nov 2026 21:52:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DC92260
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9013980E4B
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nzthpb-_B6Eo for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 21:52:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AB8A80E49
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=I7zXiRGX
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB8A80E49
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:52:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1253759f8f.3
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795297923; x=1795902723; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BteSdSCrvp35PuJvW6g93uZRemiE4v36Uwqc8uim00Q=;
 b=I7zXiRGXB4B8F61jHBmSeawzjGlqjA5eLuRSJIOYCY4ed+B2Jo+jJEEdWozF87bUJQ
 sFwU7hDpkKJYPQKH58falgmwKgmd8OyrcKH7WTO5Fc0b2BZE6mD5Kg3axtRXP6HYY7SW
 F3PjWNwDS+0pK2AO/IDVo363/nf8MKWe1g7vPKxpfJuGgrhxAwv1w4j13AfYKxsiV0Zy
 JvKigDB16qsArm+h+4jR4SrlivsEJPpjqPP9BA536wgB8uu5Ej53q2i6+OfIijL8Qemy
 QkyVYDTcSWLfQOEI6RKhxTuQTuD42XEvYuCFM2YPN1R88BaOWnu54VAu/56di+NNHYjL
 5GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795297923; x=1795902723;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BteSdSCrvp35PuJvW6g93uZRemiE4v36Uwqc8uim00Q=;
 b=IMyLMOYBpwn0eeLMaJIptyP5zIeLwl8Xc9xg7AO5+m8veJsalUip/QDLJTPMfo5qAw
 FP6vok4vEPhzC1tWfEYF3EAROODURdB0rEaGhVgh8kVRps0Oce9Ud+FImltVviXPDyct
 q1pBy+F9zeclKWSkJjpVMV7Q7/KLO4uk2oipDCbmlvWx82+btWGxy0NRe3+JWMixI6hV
 AUKvC2fU9p+d63C0PK++Qklilfq9HMfz97HQjTdJ/L9K6m97HhN9LWfb2BhIHpKKBhCf
 yFaXPnsRvzar1Peud1UHx1kSqrPNnnhkCPOFh3row/fzstdviPVHWU2UC9ke7fX3/ivI
 15Gw==
X-Gm-Message-State: APuU4Z+W0QE58ccQDbJ5y9cEwGjbD5aeX05OGaqWbr0ytW8qp0LN1Hmo
 3NSCVU0kW6iq8XhpE5ae/iAl5TOBn9ZcnjKpn2wXq/+oX7W0db193748A7FY/CSB
X-Gm-Gg: AZFdTZczON6KOG1DgSFFP2slqVBn3TDt1CHpeZetpY/vu5s6fx1AMuCnlunaCLlB7GV
 puufMlxXuOlkIip8SVZfDMuew6atxh76bAdnOA8nQ/P2ldhcv86AT/goN04UDDjWF/yqSd2mEEB
 dg/ZQdBarYyUA1SHLRYpj7fTjROfASA8HBJpLQijrYZMppjT0BGYsRNsB5aUyYDedOUl2SrClL1
 XZQ+2vxc4Q/U+tU0hhu+NXDgkJjo/qHWsztO9HaaYRRl41ioiWrbMyfLLZkLKAmT+ylpSKsGvpA
 tm01GJy4L2mxuyvzDwgOIzBnwwq/ZAOityzkR/dgKXCkaz4O9sc44eo4N0pJd1gaSGp2yLUuGxq
 rkCSLrh3GhykNxpM1y7GsoKLbPN55226wUCz7ZzBouMSRr/xr1rE9l9yG4BjzkCycLyQGUpPk8B
 LgwKCOMRFYX6ab6Wc0Tr6ze7ICxEGYNglbyo5s5FBDglh/W4I0iAdhfz7CEnZZwbOM7PA0bO2/Z
 uZzDvQliuo6pqLd0W8aX/6R8zX6QxpJMbe6NF+BqPNnC8xwA/5DeuNnfnkSuHWKXlKHyeuO14Pu
 oQAZHe0jWMt+7ZM2zG6+31gdLbyLUaNZUgsqIJITYT1h5W13CYs=
X-Received: by 2002:a05:600c:5309:b0:4bb:62d5:4ab1 with SMTP id
 5b1f17b1804b1-4bb88924a5bmr163336415e9.33.1795297923196; 
 Sat, 21 Nov 2026 13:52:03 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf61b8sm12207522f8f.19.2026.11.21.13.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 13:52:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Cheng Yang <yangcheng.work@foxmail.com>,
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Dick Olsson <hi@senzilla.io>
Date: Sat, 21 Nov 2026 22:51:59 +0100
Message-ID: <20261121215159.4477-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_8FFB06F67FA524B2D90D051931B1F0082405@qq.com>
References: <tencent_8FFB06F67FA524B2D90D051931B1F0082405@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: add support for custom
 configuration.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2hlbmcsCgpPbiAyNC8wMS8yNCAxMjoxMCwgQ2hlbmcgWWFuZyB3cm90ZToKPiBUaGVyZWZv
cmUsIHRoaXMgY29tbWl0IGFkZHMgdGhlIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgY3VzdG9tCj4g
RURLMiB2ZXJzaW9uLCBjdXN0b20gdmVyc2lvbiBmcm9tIHVwc3RyZWFtLCBjdXN0b20gdGFyYmFs
bCBvcgo+IEN1c3RvbWl6YXRpb25zIGZyb20gR2l0LiBKdXN0IGxpa2UgT3BlblNCSSwgVWJvb3Qg
b3IgTGludXguCgpJIHRoaW5rIHRoaXMgcGF0Y2ggY2FuIGJlIGRyb3BwZWQgaW4gZmF2b3VyIG9m
IHRoZSBzZXJpZXMgYnkgVmluY2VudApTdGVobMOpLCB3aGljaCBhZGRzIHRoZSBzYW1lIGN1c3Rv
bSB2ZXJzaW9uIG9wdGlvbjoKCmh0dHBzOi8vcGF0Y2h3b3JrLmJ1aWxkcm9vdC5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA0MTExNzI5NDQuMTM3OTA0My0yLXZpbmNlbnQuc3RlaGxl
QGFybS5jb20vCgpJIGhhdmUgc2VudCBhIHYyIG9mIHRoYXQgc2VyaWVzLCByZWJhc2VkIG9uIG1h
c3Rlci4KClRoZSByZWFzb25zOgoKMS4gRURLMiBidWlsZHMgYWxzbyB1c2UgZWRrMi1wbGF0Zm9y
bXMsIGFuZCBlZGsyLW5vbi1vc2kgZm9yIHNvbWUKICAgcGxhdGZvcm1zLiBUaGVpciB2ZXJzaW9u
cyBtdXN0IG1hdGNoIHRoZSBFREsyIHZlcnNpb24uIFZpbmNlbnQncwogICBzZXJpZXMgYWRkcyBh
IGN1c3RvbSB2ZXJzaW9uIG9wdGlvbiB0byBhbGwgdGhyZWUgcGFja2FnZXMuIFRoaXMKICAgcGF0
Y2ggb25seSBjaGFuZ2VzIEVESzIuCgoyLiBBIGN1c3RvbSB2ZXJzaW9uIGZhaWxzIHRvIGRvd25s
b2FkIHdpdGggIk5vIGhhc2ggZm91bmQiOiBlZGsyLmhhc2gKICAgb25seSBsaXN0cyB0aGUgZGVm
YXVsdCB2ZXJzaW9uLiBUaGUgdjIgb2YgVmluY2VudCdzIHNlcmllcyBza2lwcwogICB0aGUgaGFz
aCBjaGVjayBmb3IgY3VzdG9tIHZlcnNpb25zLCBsaWtlIG9wdGVlLW9zIGFuZCB1Ym9vdCBkby4K
CjMuIEEgY3VzdG9tIHRhcmJhbGwgd291bGQgbWlzcyB0aGUgZ2l0IHN1Ym1vZHVsZXM6IEVESzIg
c2V0cwogICBFREsyX0dJVF9TVUJNT0RVTEVTID0gWUVTLCBhbmQgR2l0SHViIGFyY2hpdmVzIGRv
bid0IGluY2x1ZGUgdGhlbS4KCjQuIFRoZSBwYXRjaCBubyBsb25nZXIgYXBwbGllczogRURLMiBp
cyBub3cgYXQgZWRrMi1zdGFibGUyMDI2MDguCgpBIGN1c3RvbSBnaXQgcmVwb3NpdG9yeSBpcyBu
b3QgY292ZXJlZCBieSBWaW5jZW50J3Mgc2VyaWVzLiBJdCBjYW4gYmUKYWRkZWQgb24gdG9wIG9m
IGl0LCB3aXRoIHRoZSBoYXNoIGFuZCBzdWJtb2R1bGUgcG9pbnRzIGFib3ZlLgoKU3VwZXJzZWRl
ZDogaHR0cHM6Ly9wYXRjaHdvcmsuYnVpbGRyb290Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRj
aC90ZW5jZW50XzhGRkIwNkY2N0ZBNTI0QjJEOTBEMDUxOTMxQjFGMDA4MjQwNUBxcS5jb20vCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
