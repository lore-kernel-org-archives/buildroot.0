Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083C606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sGPUOORC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=X5RbAnqg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6EC60613;
	Sun, 25 Oct 2026 21:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GtiDJr9faLE; Sun, 25 Oct 2026 21:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 814F660617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964451;
	b=nZzMkqSIcaEKRJKNRGqTjAL8G58D8iu/JdMtoShe6TvPuXxyoWErXgVQl42yvmUf0Cjm
	 sN88DBcvtkMyTDj5AfchpByL7K0EGMfys55STIjWMCzV/htyi/Yz2cmQMSNvDlSzXbgij
	 W+ogYVURhNyqGJ80ZdsB5UVqSpL7ckAFupoJZZzcnPCYzl6lSRhR+RvrzDkNXzJJn/CZI
	 8rdbuvTHdbOeR29LlLCNNBz7T+XMoMRsACNojS+dLPDDNjVSovlsrIZmyA7soeUhzg79N
	 wwgSp7ZX1JrrWfFr6yOBO1vX0q9FE8pmxvTGGHy6Y2c8T4ZiLSYnvZaO84C0Rs3Iy/Q==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964451;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kZImD1Wb2ll86AXAslCn91p5dcnAvgBA8e9KYUQjIoU=;
	b=MO8nJRzY6OQpWqsl6hMuf3wjUV1cjjLTKS+1iygGFTX4ck+TM5fb3U+I4KqCPUIsbheO
	 tDPAF9aWVoM5RVVeqx+KPJKTa7b5pQdKiNqvMw+NZ2ha/N5rxLR+Bg19fxmubctKSu/vm
	 PsfCTU9fWfCjHXL1mrmhGgHCxcTEqWPiG7WwCpuTwBWhjXJSe1FM4q7/MAUdlxR1VWXsZ
	 2sNqVkVhSSBrd4j8K4m1KDb/GXOKIuUpHdvvjlM64ee68JDPWd/fcwogxP987Hl7+DVZG
	 yS3HZhBCQRNos1C5YOYQskwGuzH0chM4ct2XgA7bwrJaV7gYhQ8FdgQd5ysyva5IRqw==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964451;
	bh=kZImD1Wb2ll86AXAslCn91p5dcnAvgBA8e9KYUQjIoU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGPUOORCP5iaWA8AIpPtX7Zm23R0MXHLjWz2y2+xF0dTyoFrjsn17yHwOmeho3smp
	 yD3/cMTc0V5pkgU2wm5J2dN/RknWraZxignu4OmTfxCH/LnUPJtCtdSYinqWW2NvLs
	 HlZ1nml7WEj+1xlv75QvqAAhx2DwPxc9r0JquWFK+v4fJhLr1dyuVoed+7gGMtQWls
	 wDu7GvstiN23D3BS498v5geaRnyVTFdLD3b+PBU62e1nV02h3we8/nY31rSS2in5FY
	 vd7NMFMR1OtocJaZYmjS7Wy8MXX9j0DimnYlYMLWhsOAKPDDXNIICnWrL7hw5nBbyi
	 iguheNya4KFag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 814F660617;
	Sun, 25 Oct 2026 21:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F7F2380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2523E80C46
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjPLDAxR2i-E for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:40:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E743D80A89
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792964449;
 b=bGkoR9nQpqLWTu3NhSieejNaTwXyUVmxFuih6FsMiyetxfB5P4RYi0JM2xckhZOoG8P0
 Wy66h2h2QpVWOTKYKrp+39eEzLd3uKvJg0rUc/J9NncuIPLGYvTZZr8FnJ6R/VUg3CJYR
 gamIs/G6g+HTASfPWs/XN0WD0Ss8ayXqkwyIhwaqzcqi0gLOr5ijeeY6n2cRPv3XlqGwq
 ZVoO6hwe9PqZ16AQsN7VahqgWIYkZC0/oP48rWmC+aF8FSF4NlPvN6UZxnL1fSIejDDkY
 V5PVTqO8KXvlr5PEAXpXg3MBpoIHx5steGe9wOltVKVXUdnqVCb6WJkLxcVnzcY2qUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964449;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=G2cUb8HBxmUO3SdvtMUk+DN7DKldZ92KEkcCTuz86zM=;
 b=TBqKR0GtLk8Hr7DZdFOCKkYzGvCKGAEkOOkfwDHc3YYPAmw9CTBKmhcc8Fp08AqM2PyZ
 TwWdXv1M7LToTvj2+RXGfHoZ/CtTbqjRksSiq80+1AEMBrzbCa4dqBXly+zfDxuN50OF6
 loE+tOMyYMcwumlUwSJJD+nCGAsB33/yT/h9HpIPIgj+t21eQSSsmK7b/wEAvbYXCauLx
 dLvlx6cw3gC35aD98g41FaARW4hxlqkd3fiHNWrjDQ2CzNtnzNB9YJ3oGDseq+rmsfVbH
 ocNabtAM3iZxnSKnhAhPMR8rLpItCGRxV3WxBWO0m+iVJhXX3ACI+a8BAbmLwgdp2tg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=X5RbAnqg; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=X5RbAnqg
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E743D80A89
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:40:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa377c61so2980175a12.3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792964447; cv=none;
 d=google.com; s=arc-20260327;
 b=kCh6yS3MepHE/faJyDiY4D0NYFYJzWKBPgIKkKAX1mKr+Bw+dY0ynsU+FC7MAn+JFg
 wXdBBgzQdYsyEs+CCBnHulxB8f42CKN7/PjxhTApeTvNkMFrZwLvnfjXJ8XVOxa3hVKy
 jSi2ltKyO7C86NOSxi75oEB72zZeywggnbvwBOEslbN9Xpu8IJpmDaX0HVsw2d/MHbt4
 5SeThSvyAkkPWHA1tCnq2vKfdAF+MGdP7xkyVF4+A+vkG0qQW/Kbe7ghi7zJAfIoXKPF
 cWllNe2oQe9brc0LGhnsybVtBRB3KHdlXj/cwW3+cO9OBQ9FKjikZFA8lUH//e15r8WP
 0KVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=G2cUb8HBxmUO3SdvtMUk+DN7DKldZ92KEkcCTuz86zM=;
 fh=rv2xj3s37abIQOpkeSnq/awGv2wAiXb9H6BTX7+xyTE=;
 b=XoALIdRf6AOFBv7MITed/EcGritsIEGVq1ONq3MJKPcji+GdSi4bCZwAu4MxhUfFeC
 D0jwQn453jk4/8ET8wauaz5Rsg4/1eTY7ZJf4X5nhqG1DDSDG1/jvthLvCg13Dnj8W5M
 9yfkJSwCQ3SfFL6cthYWeKgdcd5xkFmtAN5KVEfM+md1oAvL2piQmFQKIiyBeIgTx7vi
 tbbHe0LNBfahwBZdKNeV5elX0iyzpRELbJ+ZIzCLM72WUDG+JXyf7C0HwkZ6T2Z4yV4X
 LFZkbrr7Ox89QQ5wmZxSL4FqnqnDxrDR1yeD0k2WnHAP2wWLnIYQfbEMqnEEdyaSPP6e
 E6wA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792964447; x=1793569247; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=G2cUb8HBxmUO3SdvtMUk+DN7DKldZ92KEkcCTuz86zM=;
 b=X5RbAnqgOfe9XGQNfawQsWDCI7mSReX59wOPhh/Dmsd740IKvkvbg54ZeLmf9g9N4U
 Q0+ytS5hno4E3RtN+75J3b2hU6PLGFmAbWRUU7ACR4K7+/uCP9Uz/ql1KLO8KKT9eh97
 N6K1b7nX9RXf5S5JQsFcIpJHgGlJZWjtj/ZR/0b5J5UFobxhnLWSIQEVyaF7SDVwduw/
 dQYUIrhq/88Q95H4y9k+N5fp0tsdAz1ofb1aH0hZnazTOzwwVJ/zUZ13ZuFjdztURkfg
 AgYQqXLebYKpCcT8cr2omQfnHkYXLJMyG+f/XjryWRPmqtGzK8XcONV0gvK/JvnfMGMf
 eEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792964447; x=1793569247;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=G2cUb8HBxmUO3SdvtMUk+DN7DKldZ92KEkcCTuz86zM=;
 b=WI9kLdX1ZMaUBsvSipGiCoYbOZ7MK/Eq53Hd3+IOO25tDkrMud4QB/50zRC3L5oTsl
 5wKx241NV7j7fWllCzQVgF0wSS4Vfgbbt3sCqQ1xUccrIzJlJ2oooLDyE6lvIqIilo1R
 5uv9EhV1e3d+7zkZT3610pw7Yx1QkZnbHFj08ZQQp4+ol2QNOWW0LyUQyO8IUWpt9zC1
 tJkanhyYTJxFXVQphtwy8hWtkhPWAfUXvC/zxjx75+j8tCaeIw6yPlSpidbO9+IC7vY/
 iqZWgWO2QkA4sXdMkpHZWbEudNRc9iVKaJIcQ4kCU1n4ikKm6LJiV05/97jW7JS37c6M
 nDkw==
X-Gm-Message-State: AFq9FYKY3MYvwN6PuZcmn00NGhimrRO0Wu3vyIznLUtygTcQFw9f57k6
 cwqfJe2+gX2Ll3WgGMVU2gPW629Ykbm5WOG5U+RuueJ57hVLgfgAe+rjY9fD5wqdjHApGo+hPR3
 97kprifJBwVJVN/iXawmwJANESoDIaEgR1910
X-Gm-Gg: AYBFou2n1anXxSSHBlrU/KRVEn4zAsq3CUf01OizibW8eM0AAygxGRdCMF36RAZOeoV
 lZPiUwxpze+GClWzXw3gO8NPh6q9xgO6kWfudQZZCruXdD5oI+3FFTQHp5ZthNgEglFW61BOT97
 GpM944Vnyu68cZiaBnAGdNd1qJS1ZAf72Ai4G1ncNHXuzdfHUgQ0flSiMHHJf0NHMx7w8CQc01K
 INQruY9tLJB8OL91LA3UlLcxjUd8RkuhekMRhQDifPu2rvMT8jvxAv7JLCA7K7W6nAm+mH6kuEf
 Ts6HMvCAbIVPBZ3nlJ43nBlZIXpyd9PYcfizNoG5+yC1ZGougWyFCKlTkOmTP530KvchQSbpOpR
 QbP9mo2mx6+Amc1PzvW8zqsaxzZjFQAx9KymM+A==
X-Received: by 2002:a05:6402:11d1:b0:6b1:82e4:b2c7 with SMTP id
 4fb4d7f45d1cf-6b442ffffdamr6522939a12.27.1792964446545; Sun, 25 Oct 2026
 14:40:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023074432.947659-1-yegorslists@googlemail.com>
 <CADvTj4rE1i=jV_Dc0AyCRi5c_7v=p8-4mEC4giRCysBkqBTQqg@mail.gmail.com>
In-Reply-To: <CADvTj4rE1i=jV_Dc0AyCRi5c_7v=p8-4mEC4giRCysBkqBTQqg@mail.gmail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 25 Oct 2026 22:41:15 +0100
X-Gm-Features: AclHuK-tiYtisqVaBCzE8PNCA-BzpZWSDzpK5Y2BVTwgIR9eArj3Wy9qFNOtlJs
Message-ID: <CAGm1_ktqG-XEXUTLj6cYOyU8LXHos8Upp1L=fN_Nehq_kVR+DA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Subject: Re: [Buildroot] [PATCH] package/python-remi: fix build when
 setuptools_scm is installed
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmFtZXMsCgpPbiBTdW4sIE9jdCAyNSwgMjAyNiBhdCAxMDozOOKAr1BNIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDIz
LCAyMDI2IGF0IDE6NDTigK9BTSBZZWdvciBZZWZyZW1vdgo+IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gcHl0aG9uLXJlbWkgZmFpbHMgdG8gYnVpbGQgd2hlbiBo
b3N0LXB5dGhvbi1zZXR1cHRvb2xzLXNjbSBoYXMgYmVlbgo+ID4gYnVpbHQgYmVmb3JlIGl0Ogo+
ID4KPiA+ICAgRmlsZSAiLi4uL3NldHVwdG9vbHNfc2NtL19pbnRlZ3JhdGlvbi9zZXR1cHRvb2xz
LnB5IiwgbGluZSAxNzQsIGluIGdldF9rZXl3b3JkX292ZXJyaWRlcwo+ID4gICAgIGFzc2VydCBp
c2luc3RhbmNlKHZhbHVlLCBkaWN0KSwgInZlcnNpb25fa2V5d29yZCBleHBlY3RzIGEgZGljdCBv
ciBUcnVlIgo+ID4gICBBc3NlcnRpb25FcnJvcjogdmVyc2lvbl9rZXl3b3JkIGV4cGVjdHMgYSBk
aWN0IG9yIFRydWUKPiA+Cj4gPiByZW1pJ3Mgc2V0dXAucHkgZmlyc3QgY2FsbHMgc2V0dXAoKSB3
aXRoIHNldHVwX3JlcXVpcmVzPVsnc2V0dXB0b29sc19zY20nXS4KPiA+IFdpdGggYSBQRVAgNTE3
IGJ1aWxkLCBzZXR1cHRvb2xzJyBidWlsZF9tZXRhIGJhY2tlbmQgYWx3YXlzIHJhaXNlcwo+ID4g
U2V0dXBSZXF1aXJlbWVudHNFcnJvciBmb3IgaXQsIHNvIHRoZSBiYXJlIGV4Y2VwdCBmYWxsYmFj
ayBpcyBhbHdheXMKPiA+IHVzZWQsIHdoaWNoIGNhbGxzIHNldHVwKCkgYWdhaW4gd2l0aCB1c2Vf
c2NtX3ZlcnNpb249RmFsc2UuIElmCj4gPiBzZXR1cHRvb2xzX3NjbSBpcyBpbnN0YWxsZWQsIGl0
cyB1c2Vfc2NtX3ZlcnNpb24ga2V5d29yZCBoYW5kbGVyIHN0aWxsCj4gPiBydW5zLCBhbmQgc2lu
Y2Ugc2V0dXB0b29sc19zY20gOC4wIGl0IHJlamVjdHMgRmFsc2UuCj4gPgo+ID4gQWRkIGEgcGF0
Y2gsIHN1Ym1pdHRlZCB1cHN0cmVhbSwgdGhhdCByZW1vdmVzIHRoZSB1c2Vfc2NtX3ZlcnNpb24K
PiA+IGtleXdvcmQgaW4gdGhlIGZhbGxiYWNrIGluc3RlYWQsIHNvIHRoZSBzdGF0aWMgdmVyc2lv
biBpcyB1c2VkIHdoZXRoZXIKPiA+IHNldHVwdG9vbHNfc2NtIGlzIGluc3RhbGxlZCBvciBub3Qu
Cj4KPiBUaGlzIHNlZW1zIGZpbmUgYXMgYSB3b3JrYXJvdW5kIGJ1dCBwcm9iYWJseSBpc24ndCB3
aGF0IHVwc3RyZWFtIHdvdWxkCj4gYWN0dWFsbHkgd2FudCBhcyBhIHByb3BlciBmaXguCgpKdXN0
IGluIGNhc2UsIGkgcHVzaGVkIHRoaXMgUFI6IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXdweXRob24v
cmVtaS9wdWxsLzU1NQoKPiA+Cj4gPiBUaGlzIGlzc3VlIGhhcyBiZWVuIHByZXNlbnQgc2luY2Ug
Y29tbWl0IDg5MzdkYjhkZDU5NQo+ID4gKCJwYWNrYWdlL3BrZy1weXRob24ubWs6IG1pZ3JhdGUg
c2V0dXB0b29scyB0byBwZXA1MTciKTogYmVmb3JlIGl0LAo+ID4gc2V0dXAucHkgd2FzIHJ1biBk
aXJlY3RseSBhbmQgdGhlIGZpcnN0IHNldHVwKCkgY2FsbCBzdWNjZWVkZWQgd2hlbgo+ID4gc2V0
dXB0b29sc19zY20gd2FzIGluc3RhbGxlZC4gQ29tYmluZWQgd2l0aCBzZXR1cHRvb2xzX3NjbSA+
PSA4LjAKPiA+IChidW1wZWQgaW4gMjAyNC4wMiksIGl0IHRoZXJlZm9yZSBhZmZlY3RzIDIwMjQu
MDUgYW5kIGxhdGVyLCBpbmNsdWRpbmcKPiA+IGFsbCBtYWludGFpbmVkIGJyYW5jaGVzLgo+ID4K
PiA+IEZpeGVzOgo+ID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2Nm
MTk4NWMwMDhjMGFmNmEwYTJkYzA4Zjk4YWU0MjZiM2IxNzg3NGIKPiA+Cj4gPiBGaXhlczogODkz
N2RiOGRkNTk1ZTA5ODg3NTFlNWRiYjU2OGU4NzBiMDdiMzljYyAoInBhY2thZ2UvcGtnLXB5dGhv
bi5tazogbWlncmF0ZSBzZXR1cHRvb2xzIHRvIHBlcDUxNyIpCj4gPiBBc3Npc3RlZC1ieTogQ2xh
dWRlOmNsYXVkZS1vcHVzLTUtNQo+ID4gU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHll
Z29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+IFJldmlld2VkLWJ5OiBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIC4uLmRyb3AtdXNlX3NjbV92
ZXJzaW9uLWluLXRoZS1mYWxsYmFjay5wYXRjaCB8IDQzICsrKysrKysrKysrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3B5dGhvbi1yZW1pLzAwMDEtc2V0dXAucHktZHJvcC11c2Vfc2NtX3ZlcnNpb24t
aW4tdGhlLWZhbGxiYWNrLnBhdGNoCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LXJlbWkvMDAwMS1zZXR1cC5weS1kcm9wLXVzZV9zY21fdmVyc2lvbi1pbi10aGUtZmFsbGJhY2su
cGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1yZW1pLzAwMDEtc2V0dXAucHktZHJvcC11c2Vfc2NtX3Zl
cnNpb24taW4tdGhlLWZhbGxiYWNrLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMC4uNjcxOTBhNDUxOQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIv
cGFja2FnZS9weXRob24tcmVtaS8wMDAxLXNldHVwLnB5LWRyb3AtdXNlX3NjbV92ZXJzaW9uLWlu
LXRoZS1mYWxsYmFjay5wYXRjaAo+ID4gQEAgLTAsMCArMSw0MyBAQAo+ID4gK0Zyb20gYzY1M2Fi
MjRlMzZlZjZjNDE5MGU3MGUwNjRlODEwMjQwMTI0NzQyOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiA+ICtGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+
Cj4gPiArRGF0ZTogRnJpLCAyMyBPY3QgMjAyNiAwNjowODo0MSArMDIwMAo+ID4gK1N1YmplY3Q6
IFtQQVRDSF0gc2V0dXAucHk6IGRyb3AgdXNlX3NjbV92ZXJzaW9uIGluIHRoZSBmYWxsYmFjawo+
ID4gKwo+ID4gK1RoZSBmYWxsYmFjayBzZXR1cCgpIGNhbGwgc2V0cyB1c2Vfc2NtX3ZlcnNpb24g
dG8gRmFsc2UuIEJ1dCB3aGVuCj4gPiArc2V0dXB0b29sc19zY20gaXMgaW5zdGFsbGVkLCBpdHMg
dXNlX3NjbV92ZXJzaW9uIGtleXdvcmQgaGFuZGxlciBpcwo+ID4gK3N0aWxsIGludm9rZWQsIGFu
ZCBzaW5jZSBzZXR1cHRvb2xzX3NjbSA4LjAgaXQgb25seSBhY2NlcHRzIFRydWUsIGEKPiA+ICtk
aWN0IG9yIGEgY2FsbGFibGU6Cj4gPiArCj4gPiArICBGaWxlICIuLi4vc2V0dXB0b29sc19zY20v
X2ludGVncmF0aW9uL3NldHVwdG9vbHMucHkiLCBsaW5lIDE3NCwgaW4gZ2V0X2tleXdvcmRfb3Zl
cnJpZGVzCj4gPiArICAgIGFzc2VydCBpc2luc3RhbmNlKHZhbHVlLCBkaWN0KSwgInZlcnNpb25f
a2V5d29yZCBleHBlY3RzIGEgZGljdCBvciBUcnVlIgo+ID4gKyAgQXNzZXJ0aW9uRXJyb3I6IHZl
cnNpb25fa2V5d29yZCBleHBlY3RzIGEgZGljdCBvciBUcnVlCj4gPiArCj4gPiArVGhlIGZhbGxi
YWNrIGlzIGFsd2F5cyB0YWtlbiB3aGVuIGJ1aWxkaW5nIHRocm91Z2ggYSBQRVAgNTE3IGZyb250
ZW5kCj4gPiArc3VjaCBhcyBweXBhL2J1aWxkLCBiZWNhdXNlIHNldHVwdG9vbHMnIGJ1aWxkX21l
dGEgYmFja2VuZCByYWlzZXMKPiA+ICtTZXR1cFJlcXVpcmVtZW50c0Vycm9yIGZvciB0aGUgc2V0
dXBfcmVxdWlyZXMgZW50cnkuIFNvIHJlbWkgY2FuJ3QgYmUKPiA+ICtidWlsdCB3aGVuZXZlciBz
ZXR1cHRvb2xzX3NjbSBpcyBpbnN0YWxsZWQgaW4gdGhlIGJ1aWxkIGVudmlyb25tZW50Lgo+ID4g
Kwo+ID4gK1JlbW92ZSB0aGUga2V5d29yZCBpbnN0ZWFkLCBzbyB0aGF0IHRoZSBzdGF0aWMgdmVy
c2lvbiBpcyB1c2VkLgo+ID4gKwo+ID4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF3
cHl0aG9uL3JlbWkvcHVsbC81NTQKPiA+ICtBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVz
LTUtNQo+ID4gK1NpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29n
bGVtYWlsLmNvbT4KPiA+ICstLS0KPiA+ICsgc2V0dXAucHkgfCAyICstCj4gPiArIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gKwo+ID4gK2RpZmYgLS1n
aXQgYS9zZXR1cC5weSBiL3NldHVwLnB5Cj4gPiAraW5kZXggZmZjZGE5YS4uMWFiYzI3ZCAxMDA2
NDQKPiA+ICstLS0gYS9zZXR1cC5weQo+ID4gKysrKyBiL3NldHVwLnB5Cj4gPiArQEAgLTI2LDYg
KzI2LDYgQEAgdHJ5Ogo+ID4gKyAgICAgc2V0dXAoKipwYXJhbXMpCj4gPiArIGV4Y2VwdDoKPiA+
ICsgICAgIGRlbCBwYXJhbXNbJ3NldHVwX3JlcXVpcmVzJ10KPiA+ICstICAgIHBhcmFtc1sndXNl
X3NjbV92ZXJzaW9uJ10gPSBGYWxzZQo+ID4gKysgICAgZGVsIHBhcmFtc1sndXNlX3NjbV92ZXJz
aW9uJ10KPiA+ICsgICAgIHBhcmFtc1sndmVyc2lvbiddID0gJzIwMjIuNy4yNycKPiA+ICsgICAg
IHNldHVwKCoqcGFyYW1zKQo+ID4gKy0tCj4gPiArMi4zNC4xCj4gPiArCj4gPiAtLQo+ID4gMi4z
NC4xCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
