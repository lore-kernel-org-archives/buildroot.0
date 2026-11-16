Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA53606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GwGDIVjw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 779B06081D;
	Mon, 16 Nov 2026 15:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RSkh7hwZGEE; Mon, 16 Nov 2026 15:39:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 62DB5607F5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843561;
	b=bkFZV76kNBo59v9CALwpvaLfwa5tWfWwLVYEWQJhj1FuOGMvxQsMs/H3yRjfdCkvGSoP
	 kjPal+/tzrq5/28+4ZiyDzyHBwd5c3foxhmrpQn/mHufdQILjMn1fdvev46yqegYz7x3D
	 Q+k9K4+uBQD4YsheeaChpnAVx8WaJtsqegDQgr3IazJCKD+YlFUQB8Q4xsN8jutMvi8dt
	 Dx7VjK8GdpKJn9oTz1prDf2mQLrFyXa6+wgkJIMiQN9qBV/XV0dFYctrTe/vhNdd6Pscu
	 pT8pD12+zGe7rMbyAmHQwomFva8IN821JtBI6XohRA/1FndyjN6A2ojnvbRJM3eOroQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WDfzwf0RIIj7lPx7NkWamwadD16TCu5Qyodx4x+N9xc=;
	b=B/++tpeWMoDana0HcXRHJ4w8osxoDhBMmRH+i2gJeLm+BfCuw+bG4pJOPZCYsjzV5X4j
	 a96LcDClpYZ2QKTMyC0RpkCEmqS7otzFmka6vA5tunIuDdWfhvbrSl/hDv0uhbOnUFf+a
	 n2Q8S6Bm6EvLCGu0mjKJ0RtZDClzOzivhR0v+DW8VB+5Uuw5j8l4q6vTYVhst/xFt4xMU
	 WZLNScv8hK3+7i/vAeDnfBERk55lcQ/xgVLr9FXYyuF3ZkhjAwafSMOVd0y6SaB+jXNb7
	 wNCWl56HE/2GxYypXAGsqLgh4dzQizg5DovXdKv91IT2iBb8dSqz4MxmGrApVIfO+nQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843561;
	bh=WDfzwf0RIIj7lPx7NkWamwadD16TCu5Qyodx4x+N9xc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GwGDIVjwYW3GLvt61tuD860kfTmO9jwNHYYPg4PfMdxTDW/c8fBaz9JJZf7OT/ImY
	 1t6RjZuLM6H/A46Mq/D8eXEQgYxLcrglQfHsmiNniYZEYu2zoH1fml2RCDbAoLJwvQ
	 RwQK48NMRkyMsKXhLwsXKdfKp3x1I7RLtPmVlNSCO3C4NhbUjMAGktyYqpBwi+Uhh+
	 a0rn4vJTxGYCbDkFleoOsfRwJTOvnuwOsv9gRotX/A57U6JJDR6Sn4JCsmK2virhN1
	 ezoEnQD9rioC13X/Bz1EClov6X9rij8dmy3KsamniftWon2m4jXPKG6Y7XU3vc3QK6
	 BYw7a/78heYYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DB5607F5;
	Mon, 16 Nov 2026 15:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68E142FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5231940531
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EWBTFrdCFBl for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E70C40753
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E70C40753
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1720621f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843556; x=1795448356;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qcdtM2I2lKFqz+glOfLaad02k25xp/79+XEjbhPMfe8=;
 b=zeCG1h6UIt2oJthhYWebQhjIC95Y7gj7aSRWJBQ9AmpEU3NIK08BEG6G1CSgjcz/Tk
 qmahFsgywMftxfwzrxHIcMpRWdRld0QO28G/8o4wrvvvWzq5gOZvHhFF5VP949WYvJGm
 xDVDyNyR44kYJJKbd+juUrAYhjCOQCzIw4xYKNgamni/J2qNxp+TaBJaOf4Dtvo5u7r8
 dGX+K4Exdzw4ZdYJCIow1VyxIJY41FNdi8hT5qPkP2lOVplrdJ85F3yS+sy0EFPM/pXf
 efGHXX3ftVD6Pp7pjPEtxaPeNOC4AuZzifQjCEQ1C6IUdqD5eD3RgJwxiu8QQzspqiTV
 61VA==
X-Gm-Message-State: APuU4Z/IZ8mNdTt/DHuResTNKVXW1PfTLqHoNbFMFE/nGMu/CVI1/fIz
 2XJCFiCc5Jvueop9PzsZKZ6+kSzrVD+V5fOWny3RnEpm2EX2ojUdfLbmcWvl5dw1h/kYXzxJOxc
 XZBYFYHY=
X-Gm-Gg: AZFdTZeGyjYk61f2GUvdCNIFQ0dNGzY7wUWVb4yivFGo8pQWkdhDMbmk8RDq0tkhmZz
 eOsKhcYgIJJWOJOYMbN+R04dGNHwi7oyCDXyPpZ9EH8dDCFjDHVbVObc6Hgz6yN6LGBJ8p5U2T6
 Sa9IcCHNiC7iS+/61bGYxXJ1uaIzQGNWgRMbSOKfn3Z537UFHKc13WqLvn1Rv0FST5+1UXHxhkc
 R4MfgzIc0lRja5REKXA5gd88O2080VT7yznNC6Hwnn3fEjdc8u/6WzKSz9ZPY+/aGmL+/IggbC4
 srwrDvEny6AgZWL7Q3YwYMf47raVSeJPkWFeekZUdfU+3QRihnW6LP5JblLvp7O9Utsyt+j/6rz
 iRAQ/uX4C0XfVDfIezLeN236czWIlaL0ZHOLBDl13CHRnxPhJPcv5UVLTIhZwyD6GI7TWChv0pi
 Jk4AfhsVYfXOM6NoFeWlzjJaqjGJYnTiwwq6tDyxzxyfFwKrS8fnbStlWBBxXBJRHn2yFV02zb0
 3Int1vgZhUkb3YDX/vPUUnaNLvK4mJpUddtxjrqYLypgkkOtI8O8ZVh+uWbS4/V1Pia+wCCNNpk
 gfmMZjkL9RA1xpEKzU3qPeQBSK4Akko=
X-Received: by 2002:a5d:5c03:0:b0:492:9630:6a71 with SMTP id
 ffacd0b85a97d-49c6fc9dbe9mr27215952f8f.1.1794843556215; 
 Mon, 16 Nov 2026 07:39:16 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7da37b19sm23429110f8f.5.2026.11.16.07.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:15 -0800 (PST)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:13 +0100
Message-ID: <20261116153915.725263-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029215007.1788801-4-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 4/4] package/mupdf: ignore CVE-2026-7233
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gQ1ZFLTIwMjYtNzIzMyBpcyBhbiBvdXQtb2YtYm91bmRzIHJlYWQgaW4g
Znpfc3Vic2V0X2NmZl9mb3JfZ2lkcygpLCBpbgo+IHNvdXJjZS9maXR6L3N1YnNldC1jZmYuYy4g
VXBzdHJlYW0gYWRkZWQgdGhpcyBmaWxlIGluIGNvbW1pdAo+IDdjYWQzNTQ1OWQ5MSAoIlN1YnNl
dCBDRkYgZm9udHMiKSwgd2hpY2ggaXMgZmlyc3QgaW4gcmVsZWFzZSAxLjI0LjAuCj4gTmVpdGhl
ciB0aGUgZmlsZSBub3IgZnpfc3Vic2V0X2NmZl9mb3JfZ2lkcygpIGFyZSBpbiB0aGUgMS4yMy54
IGJyYW5jaAo+IGFuZCB0aHVzIG11cGRmIDEuMjMuOSBpcyBub3QgYWZmZWN0ZWQgYnkgQ1ZFLTIw
MjYtNzIzMy4KPiAKPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlCj4gICAtIGh0dHBzOi8vd3d3
LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI2LTcyMzMKPiAgIC0gaHR0cHM6Ly9naXRodWIu
Y29tL0FydGlmZXhTb2Z0d2FyZS9tdXBkZi9jb21taXQvN2NhZDM1NDU5ZDkxCj4gICAtIGh0dHBz
Oi8vZ2l0aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvbXVwZGYvY29tbWl0LzYxMWY3NWYwYzg2NTdi
OTI0NjA1NTQwMDkxOTZjNWFjNGI2OGQ5MDkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIDIwMjUuMDIueC4g
VGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL211cGRmL211cGRmLm1rIHwgMyArKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRm
L211cGRmLm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawo+IGluZGV4IGFjOTA5NWEyZmIuLjE4
YWZmNzczMDQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tawo+ICsrKyBiL3Bh
Y2thZ2UvbXVwZGYvbXVwZGYubWsKPiBAQCAtMzksNiArMzksOSBAQCBNVVBERl9JR05PUkVfQ1ZF
UyArPSBDVkUtMjAyNS03MTM4Mgo+ICAjIDAwMDQtYnVnLTcwOTEwOC1kb24tdC1wcmludC1yYXct
Zm9udC1uYW1lLXRvLXRlcm1pbmFsLnBhdGNoCj4gIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0y
MDI2LTQwNTA1Cj4gIAo+ICsjIFRoZSB2dWxuZXJhYmxlIGNvZGUgKHNvdXJjZS9maXR6L3N1YnNl
dC1jZmYuYykgd2FzIGFkZGVkIGluIDEuMjQuMC4KPiArTVVQREZfSUdOT1JFX0NWRVMgKz0gQ1ZF
LTIwMjYtNzIzMwo+ICsKPiAgIyBtdXBkZiBkb2Vzbid0IHVzZSBDRkxBR1MgYW5kIExJQlMgYnV0
IFhDRkxBR1MgYW5kIFhMSUJTIGluc3RlYWQuCj4gICMgd2l0aCBVU0VfU1lTVEVNX0xJQlMgaXQg
d2lsbCB0cnkgdG8gdXNlIHN5c3RlbSBsaWJyYXJpZXMgaW5zdGVhZCBvZiB0aGUgYnVuZGxlZCBv
bmVzLgo+ICBNVVBERl9NQUtFX0VOViA9ICQoVEFSR0VUX01BS0VfRU5WKSAkKFRBUkdFVF9DT05G
SUdVUkVfT1BUUykgXApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
