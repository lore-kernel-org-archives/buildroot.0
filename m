Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CKdKhcuU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 550FA4099B;
	Fri, 23 Oct 2026 13:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up-xa4oJ1a9H; Fri, 23 Oct 2026 13:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E9F5240921
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761589;
	b=kKdIdbaCrtm5EU+tLwDLY2WS6n65QGlZO6mlnJ6XsU8aRbCDrSk3UMSjAMNtMxqETEHK
	 Wms534EJHC0sbTKKKvHTNTlKRgD0twjqeDoK0sGjhnIlCF1uZ8nKeh2uIGOOLhd7lm29J
	 jPdpkD1h6IQl8mLdmf8V4IOIFnwTXCRdQsDJ98JZYNf7K5FgUo7tSMnSxUxE0z+jLYER7
	 ZeF/K4U1UiVu4M3ZPR6vRYZWakYZDBEkzYoRhiP9rBmOFxR4ifm3fd2v+dDzlPXuTQ+It
	 Ca/nLmP4ZMcKlSf54tMJcmcXbr1W9a3hPtzz3FIeZasmYZgt1NDHMXndz1ecOeQcAzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761589;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qpIazUsFIPrfVDrwdxQCN8YAQ5G9103H+aoavzvE3I0=;
	b=QjQ6wPAImBZZlUY5cBdDtavVV5kpzpFq0+B8Sy8iac4HzQ/ToXdTLYnhiS/sgSt1P77X
	 YZ/dvSjVSUqTmTlvg9NMDSshXyghYpAiniCNahzjlZuBFKWXdc1n2/xHezAe+wl7yDAGH
	 vhzZVxKpDfTstCExY27Pqwo6IpSye/dZvD0KmX4hC9udKQjSgvrcS/Pc35IQc470pisoH
	 PUviPh78lu3owiu/X5Nuj+WXEJtWwrAd2ot3kfo+kJcGq8h7O3zpj0e3+qM51oGXIIrZx
	 Ev5UDhggkD4OzZN6PpDD/vanvjArSr6bWGzWFg/xRowzb7xsqTTlUhTAYaVoK/jlRbQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761589;
	bh=qpIazUsFIPrfVDrwdxQCN8YAQ5G9103H+aoavzvE3I0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CKdKhcuUU7aNzKDu8RpQ3nM71m1ZV1g4MTusjPpTQ/JREFMazcANnc5QQFZJ/cGrY
	 d49a3CHoIU6iaPhM4QHGjdlRLL7gy6Mo64yS5XNY9ZTEp2wmWWReNnka9TblSJcOzy
	 yuGJMwBVHBZmR11ChjnxPkuD/ZqejFPQWAnOKQKYQw+8mvtBT1qPSuKR2Cs3Py5Jsm
	 PlLh2+opltTHmK5h3gAdNmTGsZfj6jL0bwUg+kYmn07np3JHZ0cZWefv3FzitZ1ogg
	 tFC24Fnj1zCkQ1snomesrQQqog6y4wjczNx06hikG3ch0dd/GRnql2abciksoBkoO+
	 B14/3L9ovIpKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F5240921;
	Fri, 23 Oct 2026 13:19:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4A13C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE2E4401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgKEqH5_l4yI for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ADBB4400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761584;
 b=D8G+5mfidwOWKyxqHd/kpINve4NyFNiw6Ele5jk6dYxzltBuJXxb4a4djVCYRuX0EiP1
 HXJpBzW7oVo0reATAoiopye/2wRNBo6POln0rfKPRGRLti2XeFCMHkTNtludtop1+7j4m
 7DSOpbNBrGI+SE8KtIPlIO1v7V3I3n5+Pgle8RUxj89G3ncRtbk041Jyk8KAxtqtvB64N
 QpUFipOY1VOirPaacpqIyHi1MCHQzJD/K5ftDx+/jLuxmfOiPsDMBWCPaghBYxYqLuM2L
 P7Ciy6XCfwFiQ5Rn2M1ZsKmCr7J1CTOabxrWs6i67ZjB6gcmpJej+My3RfdvxfAMekA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761584;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=aFzoNttGxjP1uFaGcyAW/K0rGz0WTIEXM096FHMqktY=;
 b=LxT4lM39xgPPF2lIF3x4VNdlfLiFKAkuJ/ZCqbTLXP/Bnnkot/GCv3nn6Ipx995brxux
 TO+U37nyEmeIjclglUwqG+cWEKTptGwFEvBdawTTv2ituBqrMuwN4DE/thvrGQ8BXUhMa
 BOfglSYadg43frxk9H5ficXy/JEmxoz9OGU2hc4Qj8+pCpLbjbKXCcFv7SmGo1pzJ3HAW
 UXh0sAMZP/ilIKtDkY36IyBh9NlZjq7o5VK1It6y5VTg48rBUWPpzX4lkVmlIVGkth+J6
 nrPTo9CvvfM5Eso7k4cve32TUPPE9K2pWJYg8lb+yCoJ6YVnWFxRXPaojZnZcQrM+RQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Jf5/zC9V"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADBB4400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so9135435e9.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761581; x=1793366381;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aFzoNttGxjP1uFaGcyAW/K0rGz0WTIEXM096FHMqktY=;
 b=dLD792JmiCeQ77ommf3OJKApiDtND9dJyTKps+EEPD6d9/JLjtnP3Mh4mseFsPoih4
 FH0SfR8vxKAG95VAuphwd6ROfHPagUO42XCoAz7ovmQFsbjjZ7VipawaEI/3qrbvc8rm
 1iAeeEjYgS2uQ+mNKLIQQT1gP93aShABnDFB7hc1Y5kWJD6pJXhd3sQRGeqH2R1PqT9e
 +1BQsq4uiZ/6TZRkYYsM/qYwBvl/D6tZgOAOUUFbfAb1N9+bW4FXfxl+alDduRcgmqZn
 maKGn29T0wmEf+6ywGtFryGVRmmZL0G4As8cAGkxw4UgYO6357Urn18OXplQ9j0EXOL7
 8Jcg==
X-Gm-Message-State: AFq9FYJNyPY495ivvs0A4myJfklr2Wl8qSxE94vFzq1soCMxpunC3/w1
 EuvInmAosNlON8Kl461h8gLqd9jtfZZ7kajCMkZn48kl6N6xPQBJZUBEl66rP+23jnLQ0/iq8Dx
 DYh/WMX8=
X-Gm-Gg: AYBFou2/xPScmjjil+8RAPt6SLKMSQTD3lllyc3VmT5+5MTL81qww0WgBwU+kczO31v
 eYY4ztz3Px0sUT/MfS+Zgxh9xagUtW6Gy/WvnEI5MBrt+qBgyzGHbJ4MCGTe+wZOS6+OxMZOzrt
 fEzaZswKSGMQXBF21EPJF2JJ2H1ejF7OkncruH/Ztv2LrDCG4wAGvKiIN3NTOtY54fFo//47wA9
 crl694ug34+9PTgDlRMkuBdrUmmBBPjQMk7fWwAPDLyTPc3AMWT3RQvimgMemhZ4+WEsAFcU++5
 mXVOAb5r5Icu/TPc/D0mRzcvSHy/jPYXHzplfERjmgZkDlWBuf6rviHNdM/yTlpw4sT9IiUC3yw
 HI3I+nOgDMjBZxeBzVAz2e/yW249OonLzeRUbiNisVA9a8ektIN8Dmcv7KjAKvO+6/F1CLGxWzb
 MqrVNXJpNzPLCoiIg/GEdtTLuMejkdZC8WXEPRX5516nYlnhZpzXaJSQcMEO2rz+BkVkoYF6cpJ
 hmFp5dAuaL8uoFL7RuD+oSb/bEIsJkC412tHelewiS4OeAPocv1r06lCQ==
X-Received: by 2002:a05:600c:1c09:b0:4a1:f377:5c6d with SMTP id
 5b1f17b1804b1-4a211cd5bb2mr40660045e9.6.1792761581243; 
 Fri, 23 Oct 2026 06:19:41 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cdb8401sm4960765e9.10.2026.10.23.06.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:40 -0700 (PDT)
To: buildroot@buildroot.org,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:37 +0200
Message-ID: <20261023131938.1606328-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828-xdp-tools-tleb-v1-1-463c25b5a99b@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/bpftool: disable feature
 auto-detection for host build
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gT24gbXkgc3lzdGVtOgo+IAo+ICAgICAkIHJlYWRlbGYgLWQgaG9zdC9z
YmluL2JwZnRvb2wgfCBhd2sgJy9ORUVERUQvIHskMT0iIjsgcHJpbnR9Jwo+ICAgICAoTkVFREVE
KSBTaGFyZWQgbGlicmFyeTogW2xpYmVsZi5zby4xXSAgICAgIyBBQ0sKPiAgICAgKE5FRURFRCkg
U2hhcmVkIGxpYnJhcnk6IFtsaWJ6LnNvLjFdICAgICAgICMgQUNLCj4gICAgIChORUVERUQpIFNo
YXJlZCBsaWJyYXJ5OiBbbGliY2FwLnNvLjJdICAgICAjIE5BQ0sKPiAgICAgKE5FRURFRCkgU2hh
cmVkIGxpYnJhcnk6IFtsaWJMTFZNLnNvLjIyLjFdICMgTkFDSwo+ICAgICAoTkVFREVEKSBTaGFy
ZWQgbGlicmFyeTogW2xpYmMuc28uNl0gICAgICAgIyBBQ0sKPiAKPiBBZnRlcjoKPiAKPiAgICAg
JCByZWFkZWxmIC1kIGhvc3Qvc2Jpbi9icGZ0b29sIHwgYXdrICcvTkVFREVELyB7JDE9IiI7IHBy
aW50fScKPiAgICAgKE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFtsaWJlbGYuc28uMV0KPiAgICAg
KE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFtsaWJ6LnNvLjFdCj4gICAgIChORUVERUQpIFNoYXJl
ZCBsaWJyYXJ5OiBbbGliYy5zby42XQo+IAo+IEhvc3QgYnBmdG9vbCBhdXRvLWRldGVjdHMgb3B0
aW9uYWwgZmVhdHVyZXMgYnkgcHJvYmluZyB0aGUgc3lzdGVtLgo+IEluIG15IGNhc2UgaXQgZmlu
ZHM6Cj4gIC0gbGliY2FwIHdoaWNoIHJlc29sdmVzIHRvIG15IHN5c3RlbSBzaGFyZWQgb2JqZWN0
IGJlY2F1c2UKPiAgICBCUjJfUEFDS0FHRV9MSUJDQVA9bi4KPiAgLSBsaWJMTFZNIHdoaWNoIHJl
c29sdmVzIHRvIHRoZSBCUjItYnVpbHQgb25lIHRoYW5rcyB0byBsbHZtLWNvbmZpZyBpbgo+ICAg
ICRQQVRILiBCdXQgd2UgZG9uJ3QgaGF2ZSB0aGF0IG1hcmtlZCBhcyBhbiBleHBsaWNpdCBkZXBl
bmRlbmN5Lgo+IAo+IEF2b2lkIHRoZSBtZWNoYW5pc20gYnkgaGFyZGNvZGluZyBGRUFUVVJFX1RF
U1RTIHRvIHRoZSBlbXB0eSBzdHJpbmcuCj4gR29hbCBpcyB0byBtYWtlIHRoZSBob3N0LWJwZnRv
b2wgbW9yZSBoZXJtZXRpYyB0byB0aGUgaG9zdCBzeXN0ZW0uIElmCj4gd2UgZXZlciBuZWVkIHRo
b3NlIGZlYXR1cmVzIChmdXR1cmUgeGRwLXRvb2xzIHBhY2thZ2UgZG9lc24ndCksIHRoZW4KPiB3
ZSdsbCBhZGQgdGhlIGRlcGVuZGVuY3kgZXhwbGljaXRseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBU
aMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byAyMDI1LjAy
LngsIDIwMjYuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL2JwZnRvb2wvYnBmdG9vbC5t
ayB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2JwZnRvb2wvYnBmdG9vbC5tayBiL3BhY2th
Z2UvYnBmdG9vbC9icGZ0b29sLm1rCj4gaW5kZXggMWI3NjViYTM4Zi4uOTRiZTlmNjc1NCAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2JwZnRvb2wvYnBmdG9vbC5tawo+ICsrKyBiL3BhY2thZ2UvYnBm
dG9vbC9icGZ0b29sLm1rCj4gQEAgLTEzLDYgKzEzLDkgQEAgQlBGVE9PTF9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRSBMSUNFTlNFLkJTRC0yLUNsYXVzZSBMSUNFTlNFLkdQTC0yLjAKPiAgQlBGVE9P
TF9ERVBFTkRFTkNJRVMgPSBiaW51dGlscyBlbGZ1dGlscwo+ICBIT1NUX0JQRlRPT0xfREVQRU5E
RU5DSUVTID0gaG9zdC1lbGZ1dGlscyBob3N0LXBrZ2NvbmYgaG9zdC16bGliCj4gIAo+ICsjIERp
c2FibGUgdGhlIGF1dG8gZGV0ZWN0aW9uIG9mIGZlYXR1cmVzIG9uIHRoZSBob3N0IHN5c3RlbS4K
PiArSE9TVF9CUEZUT09MX01BS0VfT1BUUyA9IEZFQVRVUkVfVEVTVFM9Cj4gKwo+ICBpZmVxICgk
KEJSMl9QQUNLQUdFX0xJQkNBUCkseSkKPiAgQlBGVE9PTF9ERVBFTkRFTkNJRVMgKz0gbGliY2Fw
Cj4gIGVuZGlmCj4gQEAgLTI4LDcgKzMxLDcgQEAgZW5kZWYKPiAgCj4gIGRlZmluZSBIT1NUX0JQ
RlRPT0xfQlVJTERfQ01EUwo+ICAJJChIT1NUX01BS0VfRU5WKSAkKEhPU1RfQ09ORklHVVJFX09Q
VFMpICQoTUFLRSkgXAo+IC0JCS1DICQoQEQpL3NyYwo+ICsJCS1DICQoQEQpL3NyYyAkKEhPU1Rf
QlBGVE9PTF9NQUtFX09QVFMpCj4gIGVuZGVmCj4gIAo+ICBkZWZpbmUgQlBGVE9PTF9JTlNUQUxM
X1RBUkdFVF9DTURTCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
