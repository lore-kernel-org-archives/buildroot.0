Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0537F606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hz4+WH0X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ye70wT3+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C98CA40F4F;
	Wed, 21 Oct 2026 20:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpZdiBZ6EltA; Wed, 21 Oct 2026 20:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E80E940F46
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614562;
	b=iLbxKD0JD+UJjTeoRSNlQG/wzNq8ym91lcqd2o9FannF1Gn64PzMajcyiFNhwwMOQxC0
	 MympWKGtxzzRVT6wVBDnD88bd/M3HqyJQg0Rt0CP0UcXDc6R/0hhrziHVBm+X7ordICHW
	 1XrNi/FVhGmGjokruFbEnef+9HwCDyKd8R4jPTkEvXUjjpzUk6SrEr7+SGrrMwOg9ZJ1Y
	 +TwTR8KovfEvQi++WDiUcB/bxvoz3Xk5PvkyqFfQpPucJJ7bcL+n8z/4lRebRODRX6d6n
	 V+u4Uu2KjcjGOccaG+6ULJrVqOGtnczJ80flbiq/VkyfUCRMOKVZ19YuTiEoCqrCIQQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=tX5W7jLbZxXfVc5fwWg/THEYJopSVSY0CZcwcXH2i8s=;
	b=OKNyTzzZqOrG40ItXpF+Sa5blbwL1k7djqHiyRj3o7pX8kgUinjl2D3MKSdsmRhfS/NF
	 qkp6jeSAPMOIdY5VYg/LpvWyqihfgtPhkfaZyiXv11SaqiAJh5XkMMBEMsj8+3fIaxwF4
	 Pt3T5f16Anl0LjiY/PYjuW5uH6YjGuGy6+/MT7KiEC9oSizDj6aFe7b2kAlaB7B0Geqry
	 0rIzjQxpcO95Ja5QKhgCjP3mrehZCZu16UDVJ2Kdx2mGSwl7VGl0vZ1J/ONMfWe9OyaZM
	 luw/kPgh9Whw2avVODChNzsJtoETvewZWaI4bphj8NIxiQHyOKT4Gg/jBRf3exN2t5g==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614562;
	bh=tX5W7jLbZxXfVc5fwWg/THEYJopSVSY0CZcwcXH2i8s=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Hz4+WH0X1FIMGgVEXzH/bqFr8R+wfmEkAqVVte2Gk+97mYNs5Y2zN1aqAEtQQSbMv
	 vZiL2ea+lX5P+6sYjvIHrx2qwmPlC7ynfQCXHNCQ+Lc4yFIR8JjuekhyANAsNYIyeX
	 SI+3Z+89lW3G8OmEw4BzB4Xnk1xywoywRoKwZaJO/2RkXnMaq6rH1awXbXewne2mPz
	 /lYKeIJlqPoIBq90sw/hy1bmukPZr/4nfklQsv1CYDSg4ITpHtX4xWcjz9ruPxkO37
	 86KU6LRvbmttDvXhRL5Db2cyoEagsN42+ADR8tjdkCDD8eY1FHyJfkCQ2mRcyZXSGO
	 SjUrV9ZqStu9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80E940F46;
	Wed, 21 Oct 2026 20:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 659D7769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A8ED4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKC2mbtDzWkb for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 936F440042
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::92d"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792614559;
 b=tOdnyN9CXrU7zGpZnYa7YGMoK5gnV+Fvw4847Ulzky+4X45e8SREWoBZhoJh/pyV1Bt4
 aLOoJmXUFBHXAERR8LNw18BkMiklKSy7Di5LqyXsgWcDQai58hzHjYBYayAJ9z7GvXY3w
 9yOZofkFMmTbmdLcZbERJsAzrjDhMUzIAHOmpBYIqN3/yVNVLT76C54d4LdfFQiJQCvsl
 9KUxD2dLDIgNJcuCbsjufGOaVsxBxoJjEEFj97JGbV/T7L4AV7bkjat3bV97Pq7zJekd7
 TJrv/APhDofsGZwyE9SwHmIZtqHQbwFhchwVmckk1T0n5zsaZFrdfQZaFVcWyXGB+PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614559;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=51tuj73aSRqwxM6V9ffltHhCbs8pR+1hkkuzrsMlFkE=;
 b=PzmSPreGBGLmiJmD8VmZ1j2QB4YaSZgnsVDPsLdI6uWC6vXd8KejmKKB/gSOMT3u199o
 xQ94Ytjh0rXQlaJ70sFA3FcybEMHCguboEy4GJVmHMZV8On8YHIUpeixlzLoQ1JUG+Mag
 Ep8Myj5iCoJUCve35rqxFLnrhW64RLzHi4t57rP6kKlYA5dZiuPHlIdOdy9LsnWxgCqUi
 W2176iLHTfBe/DIJ7AiQPnl6DxAeuJtPnKDnpiT+x3hH9H2djRYNetp3YiG7GkW7Gd0Gp
 j65tNUxb2EUfoqqvbyJCmSNEC6NROjkEKIToFyFGUb+RSWhuciJy4vINTKDAQK9DrRQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Ye70wT3+; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::92d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ye70wT3+
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 936F440042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:29:19 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-9908e3cd939so547873241.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792614558; cv=none;
 d=google.com; s=arc-20260327;
 b=fBHoyQY9IlMbVaWxSoGlIua5UrwKJJxjCljXzN1LKgQvPDO9CVc75GmC47JMLCwfdi
 wEPF6CMXlf8q2K0DPhklX9IaxVRbRvCAJQUIIJd2uopVVBt1X9TaBjLYesYAJJ55H/ch
 X5SRp/9Juoh15dohDbjoVadzHwK0D0BPe1wE9KSDijXgBRa2KOztze3FpEIOnh7VMH1j
 qtUBqVuvHDnoZz2LjaA1REzTdLv0VBlj90eibAE0059aLldH1lAHljJbnNa+n2sILJlx
 hEvmcY0W+ovQkum4XScbsSFjBGZiKr1j3myEyfzhYCzPAW7gKl9hYOx+y6DegZrQVNX9
 OQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=51tuj73aSRqwxM6V9ffltHhCbs8pR+1hkkuzrsMlFkE=;
 fh=xbOgN+LnOToYmtBzYOVUsFBlo9mXVTr3nMHfWsIwCLk=;
 b=UIJgBHjtp2X+VG/TtcvirV0jvyF5BDdhrkgiWoHUX2+YwzcElN8UiuZHSgXLpWrSMO
 L/hSgmojD0EWn7rwb2qUPvN2Lx1qBH2O+BxibREtwtPNIBJOpbWZMvP9SRnkcBxn/Oa/
 pbCKEZfz7KqFu0F6hiVdf/5KUoR+R0N5zOSFfH50o7N4nbctidVmVeJdWIyrWqQEb/PH
 cbYVKm59cgwAmkfqWktGmxLG8k/J8ud6Y5JIgMlaJ8qUhD3Seso176qe8aIfZhb7duR4
 kSdwopzJSQHYan4+PswfvSsaVPXEx5zDUHifx4CPbbFPJpRyyRfgQh6Y3HyFdDNIlPyy
 kj9g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614558; x=1793219358; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=51tuj73aSRqwxM6V9ffltHhCbs8pR+1hkkuzrsMlFkE=;
 b=Ye70wT3+ppOyKmwXvQyUSILsusPU9Dkt1L2MI97K8FTuhBHM72jJuUuXLy2PvIvZr2
 rWIB/YF1FlEsHCucbCAsVAVPVDtId/e/YO2X7pqdfnuiF872e9UvW3WvPPAOHNsdlexm
 p1J+yot9UHduPRO3tkwczG5tL9of0Uvj2mbPKeUrJEw123C763BslzqLIEya0hHrRDsx
 CF8EsyMK9+9tnhdFr3Z+XcLX1iVrG3AW4rnv+q14SWbT8zm0PeDCtfjf6blzikFzMqvl
 GxvpF6lkdISXYG9ldbDodat20S0Wh9ZqtgqJzC3a2VBfzGgzTfTTxftrTGCqC8fhQ5CQ
 PovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614558; x=1793219358;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=51tuj73aSRqwxM6V9ffltHhCbs8pR+1hkkuzrsMlFkE=;
 b=IkoKPd3SEEmvWWCk7ptkJ1Au2FANtb89dbb++hyvT8ELxbLYrreNQsPVtMZ51S6SkD
 xqjgHByuetW7mQCC3fOmu4eV2Kr7b3PkTrLHlAqYf6+71WeR0LqVLwcalCigAMfEk2KI
 e/miNwKUmY/b/QjFsQzf1zz7BjrKHa+XVDpc22UsU1RHIqgP3PTeVU+R45QEoP347/yy
 3a1URjsk3usA4Axn91NVFT3u6CNT/gkgWtEdjbVfmWsW3XUOJaoAACdSU3FvXZo8rqYf
 Ck2UjNjS9s2vpnd6B4kJmT7+HENhRHGGIX4ZmcmkmPYqwAQO59/cL3m/B3gYwrIykgKL
 O2bQ==
X-Gm-Message-State: AFq9FYIjg26YiVPJtRjOwm2DFtTlSORDm8Pzml6QI1W2ANgsTGaHcyfG
 R7DdOoivjtin2LCifuYtVtVa1tuUcx1ts8RV4Vz14yMzveaRMAKXrpTfxRBqY4QHJ71kaIxh7Bs
 wUP5uGBiV11eIicP9+p7bfPLfc9aasyk=
X-Gm-Gg: AYBFou1UbNpGMQPC2XrjpQ492dbKDUbDJPxpFffYs/+7R+drnClBxVA9FfGgv6A1nyk
 ryeXeJbnUtXQRNsZVwAr6lQ4PSAwSCtKOk9XdyxrrtutwQ7cv1xOr0izAsVyPtZDu0S3VT0ot+Y
 T3YqloXU15Q1llGcKw0EyxYdTTTuiArqokbmFPKGQ9pARh1Riay5As5lmwVr3sKPdLt0itwaBuX
 +NTABV7BiHWmV34tiViznUo5ao7W/UyAqNFENCxfhxzJIOJgqlxtdeXweiZeyDl+tOgqX3/7i4i
 8fZpTdAKPbh00h8Pmmxj/vPgg170lC1a9bZU09AuapKbGEsjWnzIHOBo6jLP2NqL5ldrZO45JHq
 x7VJUM4H9QrovZKe5QaT5+AdyITUW3fadii8afYFguf33m53IYVArqxCho3lza/NQb7lriVg2WT
 vz2KcIsAJmVjME11l9emC+dAUCKBvnyocg5n+DKg8M7osITmD+Yy0nt53IcSiGb83m9cy4Q6UlY
 205/YQE75v6ud1JWBTRT1Boc87zEQ==
X-Received: by 2002:a05:6102:91b:b0:7cc:2b48:cb1b with SMTP id
 ada2fe7eead31-7cc927397c1mr1323543137.35.1792614557761; Wed, 21 Oct 2026
 13:29:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <20261015193243.3299884-9-james.hilliard1@gmail.com>
 <435a155f-23ed-4186-978f-ee44df724620@gmx.de>
In-Reply-To: <435a155f-23ed-4186-978f-ee44df724620@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 14:29:06 -0600
X-Gm-Features: AclHuK-oI2xN_7E_5obPhEFSK0cMT-_ysE25yjEB7onqdQ0Kin3ZLePIDt10oFQ
Message-ID: <CADvTj4oHUm48SZ8LTPGNP52pUp6=nWGGsnZGOWMhc-DWDN8NEg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH v2 9/9] boot/uboot: add
 host-python-pkg-resources dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgMjoxNeKAr1BNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0
ZUBnbXguZGU+IHdyb3RlOgo+Cj4gQW0gMTUuMTAuMjYgdW0gMjE6MzIgc2NocmllYiBKYW1lcyBI
aWxsaWFyZDoKPiA+IFUtQm9vdCBjb25maWd1cmF0aW9ucyBzZWxlY3RpbmcgQlIyX1RBUkdFVF9V
Qk9PVF9ORUVEU19QWVRIT04zIGFscmVhZHkKPiA+IGRlcGVuZCBvbiBob3N0LXB5dGhvbi1zZXR1
cHRvb2xzLCB3aGljaCBwcm92aWRlZCBwa2dfcmVzb3VyY2VzIGJlZm9yZQo+ID4gaXRzIHJlbW92
YWwgaW4gc2V0dXB0b29scyA4Mi4KPiA+Cj4gPiBBZGQgdGhlIHN0YW5kYWxvbmUgaG9zdCBwYWNr
YWdlIHVuZGVyIHRoZSBzYW1lIGNvbmRpdGlvbiB0byBwcmVzZXJ2ZQo+ID4gcGtnX3Jlc291cmNl
cyBhdmFpbGFiaWxpdHkgZm9yIG9sZGVyIFUtQm9vdCByZWxlYXNlcyBhbmQgdmVuZG9yIHRyZWVz
LAo+ID4gaW5jbHVkaW5nIHZlcnNpb25zIHdob3NlIEJpbm1hbiBzdGlsbCBpbXBvcnRzIGl0Lgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tPgo+ID4KPiA+IC0tLQo+ID4gQ2hhbmdlcyB2MSAtPiB2MjoKPiA+ICAgIC0gVGllIGhv
c3QtcHl0aG9uLXBrZy1yZXNvdXJjZXMgdG8gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04z
Cj4gPiAgICAgIGluc3RlYWQgb2YgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOLgo+Cj4gT25l
IHRoaW5nIEkgZm9yZ290IHRvIGFzayBiZWZvcmU6IFdoeSBkaWQgeW91IGNoYW5nZSB0aGlzPyBB
RkFJSyBiaW5tYW4KPiBpcyB0aGUgb25seSBVLUJvb3QgY29tcG9uZW50IHRoYXQgbWlnaHQgbmVl
ZCBwa2dfcmVzb3VyY2VzLCBhbmQgdGhlCj4gZGVwZW5kZW5jeSBzaG91bGQgYmUgYXMgbmFycm93
IGFzIHBvc3NpYmxlLgoKQWgsIEkgdGhpbmsgSSBoYWQgZG9uZSB0aGF0IGJlY2F1c2UgdGhhdCdz
IHdoYXQgc2V0dXB0b29scyB3YXMgdGllZCB3aXRoLApJJ2xsIHJlc3BpbiB3aXRoIGl0IHVzaW5n
IEJSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTiBhZ2Fpbi4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4g
RmlvbmEKPgo+ID4gLS0tCj4gPiAgIGJvb3QvdWJvb3QvdWJvb3QubWsgfCA1ICsrKystCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC91Ym9vdC5tayBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiA+
IGluZGV4IDk2YjhjZDBkMmUuLmRhYTg0MTMwOWMgMTAwNjQ0Cj4gPiAtLS0gYS9ib290L3Vib290
L3Vib290Lm1rCj4gPiArKysgYi9ib290L3Vib290L3Vib290Lm1rCj4gPiBAQCAtMjY4LDcgKzI2
OCwxMCBAQCBVQk9PVF9NQUtFX09QVFMgKz0gRFRDPSQoSE9TVF9ESVIpL2Jpbi9kdGMKPiA+ICAg
ZW5kaWYKPiA+Cj4gPiAgIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04zKSx5
KQo+ID4gLVVCT09UX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbjMgaG9zdC1weXRob24tc2V0
dXB0b29scwo+ID4gK1VCT09UX0RFUEVOREVOQ0lFUyArPSBcCj4gPiArICAgICBob3N0LXB5dGhv
bjMgXAo+ID4gKyAgICAgaG9zdC1weXRob24tcGtnLXJlc291cmNlcyBcCj4gPiArICAgICBob3N0
LXB5dGhvbi1zZXR1cHRvb2xzCj4gPiAgIGVuZGlmCj4gPgo+ID4gICBpZmVxICgkKEJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQpLHkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
