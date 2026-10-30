Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E65606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ORRiLl90
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE6F60B0C;
	Fri, 30 Oct 2026 15:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnhUtzD30RY8; Fri, 30 Oct 2026 15:27:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CB20B60B1F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374075;
	b=VZEhhh7HNdVL99eJ5IztYY0oEhOx4W3yKZRXLoc/X3J7K/8pm0p71t3GjNy9kqziskGs
	 dnp/NBNYWfU3oGNsFyFdYiKMZ/F8j8X1qAb2i+edaKvFQ4AKONzBVG/0BQe4nzW/PYoTG
	 LTl7ui4Ls1L9F8+thbBFCwmbqFPfbbIkJHdJJf34XyAJ3iblVRQbxBCo6V1UFb5kMLKId
	 pE7rPxskAUQ815k6C4ePkYqwUVNmFguZ4u4r5CAzSQapWdhp0UzlQMxSBlhMAXkzjmCvn
	 dsWqrVLMPjfMidH+5BmamuRUwTNmmMdK9/XYaW26xFxGKvTiWt+gp+qGipAscdE/wqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dpLWmt+smBXrOze8DMUl7GD5RY5NPRRiX+hBdXflPhA=;
	b=BJjXwlHbhHlcEWmmaClhPyhvDjfy2r1kSvRL0drwkn7uXNRFZ7oSk9SwAGBLGxO67Sv4
	 bkFFjudsNbytkcFuL9gMyTfHUC7NgodISvnXEL4CLDNx714odNLn+adnevr/9VipzabZu
	 /fSBZKgMUtkfT7JL6OvFo72r6sknd20JGiQaJIM0pz+EH42s3HSagWZupJcEDhc0oLCqT
	 0AphtukvMuy1HTRHHzFQBRj2wpTKKVcSZpm5CB/22HUJQBGvdVbIC48o4s8T7NSCgFgtD
	 qPnATGiHMr1Fkfbkr3GSiZqTbpIGWkWRiFkkzZvJ+y4Tf/1008EWl/UhVlYB8eK5HUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374075;
	bh=dpLWmt+smBXrOze8DMUl7GD5RY5NPRRiX+hBdXflPhA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ORRiLl90dXCExpeADMUe21wIgYsDYIYCpUHmIlNsxg71ZCh6h0KDsHNOAdW9YL8JU
	 eBn1jDm1OKk6gmUgOfb+6AhADqtfFxP50FTH74b0xR0mgfyS2tRyF/CxSCGpjAUvlk
	 6FFaeMSUFYR4cU0ya3bf8LyVvvWDRpK8VHR+Im0YYWGMbQD4dWlfZp7oy5fnoCDE4h
	 Y67ix3t5mDXSrL83Oliw3dE2sPpwh0R51YzipvayUlLelidiNNhPNcCUXBWnVM50Ww
	 xV/JYjpel0/4sJhU82h8AE9Fd5ZvaPU7L2Ei8ih6RSU6tWa6XANlrHHW3QRlgx41oE
	 eouMVqM73vERQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB20B60B1F;
	Fri, 30 Oct 2026 15:27:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39217D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366964053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YB4OYSHUd58e for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E54BE40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374047;
 b=taHAukXxwGCnQw6ces6Q0fCTMjqtvjn5/SyzusYqD2+Zo7zwQe+1/QC0XTv0ux5ZnwYs
 7lOfy6K7fGH5sc/YFZsOT3ox9I4gHhWAFqWo6pbO+eYtlpqF3XtkYZKiTrhH+X7T2tXjb
 L6ku6QUScyMguhmlHRlv1WMqT2mEjuzHJscqzxLVGYx8hhXRDYgorQD/h6kHflamBMM7M
 ZMN+MOCRsdrMMOgUCxfi5J3CdTALEc7WaabQuKCJwb/TiuFjU5IEd407sx8b2O3ApyUs1
 v0I9oF5wrUVj/pK5XuFet6LWIqN+1Q+ZtMEJSxyWsszIYgPTd4HXIJ+Xq8vq+FusHdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374047;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=TNjAJlwcpr80fHpF2xzCnV0mRBreEqvzSERbN+wuRVw=;
 b=oiACpY24rUsEfPrwIJZnCUkKqcfGvuuNCd+QKDH9zS9bIBDtZgK0B3uz2sZpOnf02Dtx
 cXbqjvZIb2/XPR9HRzMbLASMd+sTYYSe0kUnJH9rmjgum8pWOrMnWlr6H4Ou7u+NqSJyL
 0/jZzRDlWn6oWNOOCKgS9EQp6/B740zgOM34TRI0EAjhR3JJJOrcjU9SAAPrysIwTqH/b
 AXeAxtUxNUgFoEdWhXETlHP7rq2HcCn89RJWA4Y88xoEOy0ObtVSGGoFxN0+5BHowfads
 omDzq5rPxbVjTAeYLHi11n6O2EMPSVTLBO5rtIB3aKkCSjaY9kaU8Nb1hfWtydJCj7A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XCJq3oSm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E54BE40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so6510945e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374044; x=1793978844;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TNjAJlwcpr80fHpF2xzCnV0mRBreEqvzSERbN+wuRVw=;
 b=PkjoyjMZje/wHG47n5bff0BpM1mz6QqiC4W0fyCkOV1WrqF4sEunQd+OjzY46ACEn1
 VqIYCj2dIfDs2gNnqol5pGSwj4lqC3Ko7MnIp3w1NFx36Ibb+JX4+4COynTREV3WFI7A
 73QqoCA1xZ/OyDlXHMh18XbHO7ux2NQQWgWGuoBHAhbxpk6qEeJm3aIDAJ3/0tqYkejg
 h7qnBfZh0umTYGEU/SMSNLfFGqT45bWwETl0pMozXpbPcXnyVQAjiHUvqfEJjwaVev1m
 2raV1duw+AUZxfA3atSDVqTUfSA0ytfW4C4Ida1c2Ugsm0EzSfyCl9qHJAvmGnjs0iQV
 n4EA==
X-Gm-Message-State: AFq9FYIpn+qnGNOdHI4SaT47/tBZtcTq/im7ZJGgOL7xF2gpXvU+O9fy
 N8Ru/ZKXezazmCSkKIKKA3G0ciQ/gHJSkbfcfuMJrf7WHnUFWxVLAeYShZlapvDbrwvivSIIMRm
 VcDlGVoE=
X-Gm-Gg: AYBFou26nK9iUtRN97pZFojLdTioTlW0hlbCEYbJdGif8tGtuo1i8w089nnhiOk3Em3
 nKme0wU+TtISMvkG2TA+r0lKaXVHV7puL+S/YqFYNY/rFRtLsnYkNjTSbkJwZ2vhhtm8TASpso0
 I21UhkTt5ANnns91fKei3UasuA5ORBD7qox6jLfZU6LZeiJAE34mBtAmEYrBrit5QgIsbfwZx18
 uvNc4Ua/FNdJazqhT4yOX68H3dc3wDZKM+3UizxwkKFVl7h3mrRVgYbi8nUFIMZqcY63ek2e6PL
 +IEcC8cofDGl5qYjtxDKowh/lq1hotsvhQmXsDSGrf/edSXEumvgYlr7hgTHqwiiVdSX8pECW1F
 4Vw3pWFfTYuXYIobkj7w1snvmgHLBM0PbkBkoYhk9y0taE8A4+dk0wLzVjDQtMgp8PhKVPYJmH6
 9XQeveJ9lzsfRt5lUbftia050kPk0sjml5sCejki+LxiNIYujgoxENBF77dqAMhimu9laqZ69wn
 zEMS5Kq2QFTmz9PobX2fwx4XH5nIZZcsSoU0DCYZuzZoiNgbfUAY5zbkFM+ZS1PDHWKoRVT9x/b
 l4fIkNkqaZDLlgNzO9h5bfSpGrNVhpeEIqyXPXKnj+3uzOylLcs2Fw2YGH5EbAwjx6bnEOX0
X-Received: by 2002:a05:600c:34cf:b0:4a7:c366:d791 with SMTP id
 5b1f17b1804b1-4ac150b38ebmr61274185e9.1.1793374043624; 
 Fri, 30 Oct 2026 08:27:23 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abe885d91esm49179785e9.0.2026.10.30.08.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:23 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:21 +0100
Message-ID: <20261030152722.1906716-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020192623.1982867-2-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/pcmanfm: fix build with gcc >=
 14
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gT25jZSB0aGUgbGliZm0gYnVpbGQgaXNzdWVzIHdpdGggZ2NjID49IDE0
IGFyZSBmaXhlZCwgcGNtYW5mbSB0aGVuCj4gZmFpbHMgdG8gYnVpbGQgd2l0aDoKPiAKPiAvaG9t
ZS90aG9tYXMvYnVpbGRyb290L3ZhbGEvb3V0cHV0LWdjYzE0L2hvc3QvYmluLy4uL2FhcmNoNjQt
YnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2dsaWItMi4wL2dvYmplY3Qv
Z29iamVjdC5oOjUzMzoyODogZXJyb3I6IHJldHVybmluZyDigJhGbURlc2t0b3BJdGVtQWNjZXNz
aWJsZSAq4oCZIHtha2Eg4oCYc3RydWN0IF9GbURlc2t0b3BJdGVtQWNjZXNzaWJsZSAq4oCZfSBm
cm9tIGEgZnVuY3Rpb24gd2l0aCBpbmNvbXBhdGlibGUgcmV0dXJuIHR5cGUg4oCYQXRrT2JqZWN0
ICrigJkge2FrYSDigJhzdHJ1Y3QgX0F0a09iamVjdCAq4oCZfSBbLVdpbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc10KPiBkZXNrdG9wLmM6MTQ1NzoxMjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmGdfb2JqZWN0X3JlZuKAmQo+ICAxNDU3IHwgICAgIHJldHVybiBnX29iamVjdF9yZWYo
aXRlbSk7Cj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+IAo+IFRoaXMgaXMgZml4
ZWQgYnkgYmFja3BvcnRpbmcgb25lIHVwc3RyZWFtIGNvbW1pdC4gVGhlIHNlY29uZCBpcyBqdXN0
IGEKPiBjbGVhbnVwIG9uIHRvcCBvZiB0aGUgZml4LCBhbHNvIHVwc3RyZWFtLgo+IAo+IFRoZXJl
IGFyZSBubyBhdXRvYnVpbGRlciBmYWlsdXJlcywgYnV0IHRoZSBidWlsZCBmYWlsdXJlIGNhbiBi
ZQo+IHJlcHJvZHVjZWQgdXNpbmc6Cj4gCj4gIEJSMl9hYXJjaDY0PXkKPiAgQlIyX1RPT0xDSEFJ
Tl9FWFRFUk5BTD15Cj4gIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQ1VTVE9NPXkKPiAgQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9ET1dOTE9BRD15Cj4gIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfVVJM
PSJodHRwOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3dubG9hZHMvcmVsZWFzZXMvdG9vbGNo
YWlucy9hYXJjaDY0L3RhcmJhbGxzL2FhcmNoNjQtLWdsaWJjLS1zdGFibGUtMjAyNS4wOC0xLnRh
ci54eiIKPiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9HQ0NfMTQ9eQo+ICBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0hFQURFUlNfNV80PXkKPiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9DVVNUT01f
R0xJQkM9eQo+ICAjIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfSU5FVF9SUEMgaXMgbm90IHNldAo+
ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0NYWD15Cj4gIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxf
T1BFTk1QPXkKPiAgQlIyX1BBQ0tBR0VfTUVTQTNEPXkKPiAgQlIyX1BBQ0tBR0VfTUVTQTNEX0dB
TExJVU1fRFJJVkVSX1NPRlRQSVBFPXkKPiAgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9HTFg9
eQo+ICBCUjJfUEFDS0FHRV9YT1JHNz15Cj4gIEJSMl9QQUNLQUdFX1BDTUFORk09eQo+IAo+IFdp
dGggdGhpcyBmaXgsIHBjbWFuIGJ1aWxkcyBmaW5lIHVwIHRvIGFuZCBpbmNsdWRpbmcgZ2NjIDE2
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlA
Ym9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCwgMjAyNi4wOC54LiBUaGFua3MKCj4g
LS0tCj4gIC4uLmNjMTQtV2Vycm9yLWluY29tcGF0aWJsZS1wb2ludGVyLXR5cC5wYXRjaCB8IDQw
ICsrKysrKysrKysrKysrKysrKysKPiAgLi4uLUFUS19PQkpFQ1QtcmF0aGVyLXRoYW4tYS1wbGFp
bi1jYXN0LnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3
NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BjbWFuZm0vMDAw
Mi1GaXgtYnVpbGQtd2l0aC1nY2MxNC1XZXJyb3ItaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwLnBh
dGNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BjbWFuZm0vMDAwMy1Vc2UtQVRLX09C
SkVDVC1yYXRoZXItdGhhbi1hLXBsYWluLWNhc3QucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9wY21hbmZtLzAwMDItRml4LWJ1aWxkLXdpdGgtZ2NjMTQtV2Vycm9yLWluY29tcGF0aWJs
ZS1wb2ludGVyLXR5cC5wYXRjaCBiL3BhY2thZ2UvcGNtYW5mbS8wMDAyLUZpeC1idWlsZC13aXRo
LWdjYzE0LVdlcnJvci1pbmNvbXBhdGlibGUtcG9pbnRlci10eXAucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmM1YzMyMzJiYTAKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9wY21hbmZtLzAwMDItRml4LWJ1aWxkLXdpdGgtZ2NjMTQtV2Vycm9y
LWluY29tcGF0aWJsZS1wb2ludGVyLXR5cC5wYXRjaAo+IEBAIC0wLDAgKzEsNDAgQEAKPiArRnJv
bSBiOTdjNjMwYWY5Nzk0YzBmODdiZjNiOGEwYjc3NTMxYjAzNGQzMWE3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+ICtGcm9tOiBNYW1vcnUgVEFTQUtBIDxtdGFzYWthQGZlZG9yYXByb2plY3Qu
b3JnPgo+ICtEYXRlOiBGcmksIDI2IEp1bCAyMDI0IDEyOjEzOjMyICswOTAwCj4gK1N1YmplY3Q6
IFtQQVRDSF0gRml4IGJ1aWxkIHdpdGggZ2NjMTQgLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlcwo+ICsKPiArZ2NjMTQgbm93IGRlZmF1bHRzIHRvIC1XZXJyb3I9aW5jb21wYXRpYmxl
LXBvaW50ZXItdHlwZXMuCj4gKwo+ICtBZGQgcmVxdWlyZWQgY2FzdHMgdG8gdGhlIHJldHVybmVk
IHBvaW50ZXJzLgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9seGRlL3BjbWFu
Zm0vY29tbWl0LzEyYWJkN2UxNzlhZGI5ZTMxZDk5OTgyNDA0OGE1ZjQwZjkwMjE4ZmQKPiArU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KPiArLS0tCj4gKyBzcmMvZGVza3RvcC5jIHwgNCArKy0tCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3NyYy9k
ZXNrdG9wLmMgYi9zcmMvZGVza3RvcC5jCj4gK2luZGV4IDA2ODZhNTkuLmIzNThmNTAgMTAwNjQ0
Cj4gKy0tLSBhL3NyYy9kZXNrdG9wLmMKPiArKysrIGIvc3JjL2Rlc2t0b3AuYwo+ICtAQCAtMTI2
Nyw3ICsxMjY3LDcgQEAgc3RhdGljIEF0a09iamVjdCAqZm1fZGVza3RvcF9hY2Nlc3NpYmxlX3Jl
Zl9zZWxlY3Rpb24oQXRrU2VsZWN0aW9uICpzZWxlY3Rpb24sCj4gKyAgICAgICAgIGl0ZW0gPSBp
dGVtcy0+ZGF0YTsKPiArICAgICAgICAgaWYgKGl0ZW0tPml0ZW0tPmlzX3NlbGVjdGVkKQo+ICsg
ICAgICAgICAgICAgaWYgKGktLSA9PSAwKQo+ICstICAgICAgICAgICAgICAgIHJldHVybiBnX29i
amVjdF9yZWYoaXRlbSk7Cj4gKysgICAgICAgICAgICAgICAgcmV0dXJuIChBdGtPYmplY3QgKiln
X29iamVjdF9yZWYoaXRlbSk7Cj4gKyAgICAgfQo+ICsgICAgIHJldHVybiBOVUxMOwo+ICsgfQo+
ICtAQCAtMTQ1NCw3ICsxNDU0LDcgQEAgc3RhdGljIEF0a09iamVjdCAqZm1fZGVza3RvcF9hY2Nl
c3NpYmxlX3JlZl9jaGlsZChBdGtPYmplY3QgKmFjY2Vzc2libGUsCj4gKyAgICAgaXRlbSA9IGdf
bGlzdF9udGhfZGF0YShwcml2LT5pdGVtcywgaW5kZXgpOwo+ICsgICAgIGlmICghaXRlbSkKPiAr
ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKy0gICAgcmV0dXJuIGdfb2JqZWN0X3JlZihpdGVtKTsK
PiArKyAgICByZXR1cm4gKEF0a09iamVjdCAqKWdfb2JqZWN0X3JlZihpdGVtKTsKPiArIH0KPiAr
IAo+ICsgc3RhdGljIHZvaWQgZm1fZGVza3RvcF9hY2Nlc3NpYmxlX2luaXRpYWxpemUoQXRrT2Jq
ZWN0ICphY2Nlc3NpYmxlLCBncG9pbnRlciBkYXRhKQo+ICstLSAKPiArMi41Ni4wCj4gKwo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3BjbWFuZm0vMDAwMy1Vc2UtQVRLX09CSkVDVC1yYXRoZXItdGhh
bi1hLXBsYWluLWNhc3QucGF0Y2ggYi9wYWNrYWdlL3BjbWFuZm0vMDAwMy1Vc2UtQVRLX09CSkVD
VC1yYXRoZXItdGhhbi1hLXBsYWluLWNhc3QucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjBjNTYwMTVmNzkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9wY21hbmZtLzAwMDMtVXNlLUFUS19PQkpFQ1QtcmF0aGVyLXRoYW4tYS1wbGFpbi1jYXN0
LnBhdGNoCj4gQEAgLTAsMCArMSwzNiBAQAo+ICtGcm9tIDNhZTBlOGQyZTI2ZTZlZTU4MzZkZjc2
YjRkYjMzNzhiN2I2MWM4ZTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEFkYW0g
U2FtcHNvbiA8YXRzQG9mZm9nLm9yZz4KPiArRGF0ZTogRnJpLCAxMSBKdWwgMjAyNSAxMzo1OTo1
NiArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIFVzZSBBVEtfT0JKRUNUIHJhdGhlciB0aGFuIGEg
cGxhaW4gY2FzdAo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9seGRlL3BjbWFu
Zm0vY29tbWl0L2NiMmU4MWU0ZTU0NWZmMjZkZDZhNDEwY2NjNTIzNjZjYzk4YmE4NTgKPiArU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KPiArLS0tCj4gKyBzcmMvZGVza3RvcC5jIHwgNCArKy0tCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3NyYy9k
ZXNrdG9wLmMgYi9zcmMvZGVza3RvcC5jCj4gK2luZGV4IGIzNThmNTAuLjI4YjE5Y2EgMTAwNjQ0
Cj4gKy0tLSBhL3NyYy9kZXNrdG9wLmMKPiArKysrIGIvc3JjL2Rlc2t0b3AuYwo+ICtAQCAtMTI2
Nyw3ICsxMjY3LDcgQEAgc3RhdGljIEF0a09iamVjdCAqZm1fZGVza3RvcF9hY2Nlc3NpYmxlX3Jl
Zl9zZWxlY3Rpb24oQXRrU2VsZWN0aW9uICpzZWxlY3Rpb24sCj4gKyAgICAgICAgIGl0ZW0gPSBp
dGVtcy0+ZGF0YTsKPiArICAgICAgICAgaWYgKGl0ZW0tPml0ZW0tPmlzX3NlbGVjdGVkKQo+ICsg
ICAgICAgICAgICAgaWYgKGktLSA9PSAwKQo+ICstICAgICAgICAgICAgICAgIHJldHVybiAoQXRr
T2JqZWN0ICopZ19vYmplY3RfcmVmKGl0ZW0pOwo+ICsrICAgICAgICAgICAgICAgIHJldHVybiBB
VEtfT0JKRUNUKGdfb2JqZWN0X3JlZihpdGVtKSk7Cj4gKyAgICAgfQo+ICsgICAgIHJldHVybiBO
VUxMOwo+ICsgfQo+ICtAQCAtMTQ1NCw3ICsxNDU0LDcgQEAgc3RhdGljIEF0a09iamVjdCAqZm1f
ZGVza3RvcF9hY2Nlc3NpYmxlX3JlZl9jaGlsZChBdGtPYmplY3QgKmFjY2Vzc2libGUsCj4gKyAg
ICAgaXRlbSA9IGdfbGlzdF9udGhfZGF0YShwcml2LT5pdGVtcywgaW5kZXgpOwo+ICsgICAgIGlm
ICghaXRlbSkKPiArICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKy0gICAgcmV0dXJuIChBdGtPYmpl
Y3QgKilnX29iamVjdF9yZWYoaXRlbSk7Cj4gKysgICAgcmV0dXJuIEFUS19PQkpFQ1QoZ19vYmpl
Y3RfcmVmKGl0ZW0pKTsKPiArIH0KPiArIAo+ICsgc3RhdGljIHZvaWQgZm1fZGVza3RvcF9hY2Nl
c3NpYmxlX2luaXRpYWxpemUoQXRrT2JqZWN0ICphY2Nlc3NpYmxlLCBncG9pbnRlciBkYXRhKQo+
ICstLSAKPiArMi41Ni4wCj4gKwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
