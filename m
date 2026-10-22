Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A59606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IKFWcYmf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=fSxb7LUg
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A06740967;
	Thu, 22 Oct 2026 21:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrvOVhctoCck; Thu, 22 Oct 2026 21:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5641540959
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703593;
	b=Z4PcVVaPXgZ7jiIWJFHyV1PhdEhRwt6/qa5yxjLNm9Dcz4kNykdpO8HFXMNEp0QbeWaG
	 faImawnpn29D0/U9HkcfDijt8bFpL8rLG0xYTNCndMNrN1LhGDjHLTwgVk8cZM1HmbC/+
	 OU6SscmwYgaqVGnJhzHI8Ka+98lYSRYI1Hj25j0POLbzW1bnCMqwxHCgN6d9ENop3DGS7
	 xs2tkPylv9T3AlvFcAZNIwJfEqxAvxn6IoWJ/07kaAs4sYJjbH+5IDWK/CiwXnHKavdQj
	 UWR1Om1ckt9zaRGLSwr2Zd2PMTyUSJZ/4xtOlh57yA3lRH6tKHKPgJKP2gKM8sy3B1g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RTfeEmi8E+99FlWrRtQTs0eyovFb7rDOW84LpbriNkQ=;
	b=mF8eOAEqzVocf1NO0LMDoITWO57xR7pUu7HeKioTmV5w86iLcRPahJcxzEaVQ0Xk8uPc
	 CNa+hoCc/2XKIuG8+jF4gKAzTfkl2Q3VeCCx/nEvb0x50xsg80rIgBiqNiWSPosyn3E+3
	 ieKqOj0KKERIuCRFjzC64UhVHVi9thBC3HdSPNVXd4ejkVeZ/auLFer1nX/QRyUJNHUG2
	 vjG1YlFV/3Dqxu2gmaRraj/esdpu8EyDpZBN+nUW8mmPzer0sZpNs8qVa8OY2X2Hi/1zy
	 SrC6/qU2SIlf3kWVrdFocTwdd7zxjQH0os1r5uBrUEFXQwSAeR/rfNYsKnxSjXZFlaw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703593;
	bh=RTfeEmi8E+99FlWrRtQTs0eyovFb7rDOW84LpbriNkQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKFWcYmf58wJjZgCYoz9ssXGWWiP9ddNwuMdlepHc5cViwR5uj+wLafFsFUa4Hixi
	 mh3o3DDtj8P6tQpf81zjx87tJtKJIMUsrfai1hM7nSqk5fHMzeAeeUWlDjRtT/NpUw
	 ysfAcvh+8RUk1oqcZoaHZdLX47WRHDUlwdTW8R4dPtH9NlYGgOzx40lrmkYPplX+oN
	 Xlg95mHkjI4Zgeao3s1znvbc18GP3P3HPomqdUJ1WBIbJqtwieMsUpDFCVDvrZbGR1
	 j0CFPE6d3A7SEGSMTlAkk1KFvyMvBSek+/TnbsbF+F4vQqMus3aKthfqmC3lvOJgva
	 I1h50db+fVJCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5641540959;
	Thu, 22 Oct 2026 21:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3DBE4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4F6B81255
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5GVrUuljI9M for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 653C1812CE
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::122d"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792703590;
 b=WdBw6f0TYBcYU8UKnCplL1FtrdSb8SFEGtDlz1GujEEnZr3XKdpBv8c1/Ef5cVLsZZvM
 iIuPEn8x4tsMD09PLmqCB6fC6NW1QPydFZgjMzVLqjmf0hTXig4hJlLwadFkCCQ5BE8xk
 59RO9M2WUlfSaA3ADtIVWxzvVJ20EgzrbRZQxYP0WKuNnrSleFl0OsXk5RKTvyk6xmsGo
 wlAD0rhvh/2Bcz2HctKQQ54x51S5DBpe6yrF34WzVGdTzdyfHGP+JQhcnBQAsamgnV+lr
 H6HwXMLvySUeAfQuyipvhldICLdZFk2cKGssB1T9t/pG9K5nvMLcoHCfiFIR/CQD9dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703590;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=ba+JI6ijcoPWilJwjLvREDHft+SZZNUpj3fuytM0gF4=;
 b=KS7jo/DvBS64xHy8VKxN7IBsjJWb9AORTGIw+W6jLCCA20+DGLjeJX1tmOLuWQ9nO2V9
 Vo9a6h6GyUB+J7kYkLHq/yRABpW4D6WV1fie2gBBeoEiVzo0DDgFBHY9Ix+M0lXf1ENZO
 kpsheAqD/4DWrfX3vKX3uOaKgTrZv20kTRroDe5/iDOLaWtigKVZt5UrUBOb9w2ZI0AQn
 LAMr+vp1vtdCHPusqNrOj7+OPCCNHBTQ70pIVJZmU1flnCmV1PlUoogbYl7aa1aTTO/eM
 de7Z5sVhQsSypUExNSvJSvZohFD9dA6u+L1aGIHqw9o96cLo+WTrBF3NSRVYUNMqYdw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=fSxb7LUg; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::122d"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122d; helo=mail-dl1-x122d.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=fSxb7LUg
Received: from mail-dl1-x122d.google.com (mail-dl1-x122d.google.com
 [IPv6:2607:f8b0:4864:20::122d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 653C1812CE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:13:08 +0000 (UTC)
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-1846bc43c28so247659c88.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792703588; cv=none;
 d=google.com; s=arc-20260327;
 b=h8iNkTjKqAWTEpzi4FwkaSjw000Xj/vocd1/86MwBVUOUAfpQOjCcA0QvZmALcIAsD
 gMoUuU2NfR1mS2u9dbGlYwuJg3etHvDgi5Wi+cz1N7Yc4f60NPLdHeVb25HuMHN0cJM2
 yoEnW9aSDMwA33Ezz4/Wx3VsrIEz4wV9tUSQD5B1IvtMzdh/7mPeV3qn6NLMo4njPo65
 kR6lb4SBQdgvquDrpBDiSeq8k11di+ZZpCK+iKQJF1iAfylh7nUShEsBDF1cUZd/lJBV
 NNo5fxpxApNoV165O6Fdi3JVMdHsv/s9eskDPWr+3kwsqtg/dbhgi6jSZoWmNHts4GBU
 gwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ba+JI6ijcoPWilJwjLvREDHft+SZZNUpj3fuytM0gF4=;
 fh=X5FpC8BIl/slchl2PcPxE+UTqza7suL0xy4uUJq2NHQ=;
 b=SFbX6Zg7I14dhhZJwjh7ZYQlSvcu3eGZFQ9n6ukL+gAiNWR9XLPENX7PyVVS0mhwfB
 AnbAa9TIarPKOlEu5HgSTBTjs3Xy9L39a5thopbINtpZNkN12xT7aW0pgETWpmkno0Fm
 WrEoMr6jRbYfC+nU/YPFj4EbOJCB+NPbPTmnEQmpf7jq4em4DnL3z6OIn+TtZY/aR2gT
 UxdbTc5HCy8woo8dI6ojZVgkghjeuzSlJ/q3qD9Dn/Ecfp0dy+N6ZqfzTNV+b00A6omC
 hBkPg/vuiMPvlN9R2R2kfy/L5FknVH30gt3WVm8mJ5KDP3Z5YyNNUresO7dU/H/XNA2B
 dYoA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792703588; x=1793308388;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ba+JI6ijcoPWilJwjLvREDHft+SZZNUpj3fuytM0gF4=;
 b=fSxb7LUgb1C1sNFce1G5gQ6msWlVyvTUDG09cjCB3mO9wmZ50wZBFDjQkS5XnOPZwT
 UAdwN1BbKPJbhPRQxxZeQQ+eDp96JEiZwTsylZFbngg+Kigr0+DtoZJeAqs84c9WD8dG
 4M5Fv6gHzpCKLps3b23SoLThxflPymirR4AbueBG3cNhGWNS3iJZorpu86LzBpxYjPdF
 cTV9jcBjwLvo4WJtlULaCXc/yiC70RygEpktYwGk5pNKd35vevIOyvAz5FdkNNDCDLhQ
 Avf64oQtElDdZP6WObG2tiqYO/PxbYk0gvuHxk0M9uqt7FHSLYh8YnmVVqvhEfDf8Wek
 8BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792703588; x=1793308388;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ba+JI6ijcoPWilJwjLvREDHft+SZZNUpj3fuytM0gF4=;
 b=HawFfk9DCltRVBxY63Cc+apvQeres58nCx3jOdoHsowOl37/B3h8IOcU7ugTBhkWb/
 Y+fZVK00qtqjeaujdZCYbKChaQOi2ubIk22biOTztJvFFZOV/4UuvOH4GquFAp5Gqb9+
 o7jfE0nVrEeD0mdAZre1vczJ1JIouFaaZFJjGoN8D8TQ6ZB9lvXGcCBOPkLonpqbEVOw
 Yqytcp/fau9fuCfWSSW3jKsHWijBXBh5QB0MdpjVaQKGvW5Dj059H19005KaSHET0HQp
 3y6hl0zhatNT5gkmTFVn2Zf08MRLfLynJ2YT3u911/3z76aFcdIx2x62YnjAODPBrVaj
 pz8A==
X-Gm-Message-State: AFq9FYI2iB9F73E2otleyvAFnPb3bxYEuaGpxw5tbeZd+XIcl0ECbJoU
 jexYn77CMR7f21LjTWOUWLfh55/TQVAlJMAd4Hfw0rDkpkB3EZ7DhUaI/4SywKBOsiuj9S9cEuL
 /x5scTLLxFXzfhto0CheapZoS5rgflvrpYX/NyrwjFw==
X-Gm-Gg: AYBFou1BjbhCHdlfVyva+9CiCcs4gC0NWFBb7gqEcEr5I4hKaiKCk2ejdG3FZKTIXkA
 hE9N8wa21iac6bmk5nat36la5DK9MWzyH6/iMT1RC5SwyHVx8uNbX7hF33kJF6lv5i6YPIs4bV4
 eXbdaTvTP5FJo/+X5/WcfaMqVqASKunyOQdQbXSTbt4yl1huqtPXzhjz0YMSJQnpXr2aSrRs/Us
 25cZ+HVaZPAcxqmsxa7jCyx4tFCOTPvvOcGssmVGleJnNRPLAzmqiuZfBOzdE2wLnjsnp80ABGf
 wBBL7O1bNIU7rvCbzc9mR3MNDmDPKObUSxfAMp5A2I5xF5wv4YX/LsebrJaENi6urBUtsbe+Ycm
 rYcsxPK7dIkxhygqwt5isCdo5C65r78EMP0bvJ4idZVmp0V6UzIUq1xVa7GccAvJWxZ/gK/a3Wn
 NuA19qGkIx2SvzJkzDOeQ6qg==
X-Received: by 2002:a05:7022:223:b0:150:1cea:31a8 with SMTP id
 a92af1059eb24-195c56ffd5bmr656227c88.19.1792703587823; Thu, 22 Oct 2026
 14:13:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-3-j@j-ernberg.se>
 <atkstjA4-icjE-BI@windsurf>
 <CA+tfhucpM468eDtqH3pDG7WZkfDJQXcy64ZNQkOumgS6GTkSbg@mail.gmail.com>
In-Reply-To: <CA+tfhucpM468eDtqH3pDG7WZkfDJQXcy64ZNQkOumgS6GTkSbg@mail.gmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Thu, 22 Oct 2026 23:12:56 +0200
X-Gm-Features: AclHuK_X9_OsWg3fUhf9S7-Twdn8mtgDwpUlFwYKtaoG5d8rvYWgzSnWRAgZM7k
Message-ID: <CAAHg4ZgbxrM1D8aLNBeF6i6GEMw_Ai6eaup-c2SmB4rVVG6hbw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, 
 =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCc0LDQutCw0YDQvtCy?=
 <aleksandr.o.makarov@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Ernberg <john.ernberg@actia.se>
Subject: Re: [Buildroot] [PATCH v2 2/8] package/libest: Drop java support
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQmVybmQsIEFsZWtzYW5kciwKCkJlcm5kLCBhcmUgeW91IHVzaW5nIGxpYmVzdD8gSSBzZWUg
eW91IGhhdmUgd29ya2VkIG9uIHRoaXMgcGFja2FnZSByZWNlbnRseS4KCk9uIFRodSwgT2N0IDIy
LCAyMDI2IGF0IDk6MDbigK9BTSDQkNC70LXQutGB0LDQvdC00YAg0JzQsNC60LDRgNC+0LIKPGFs
ZWtzYW5kci5vLm1ha2Fyb3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IEkgd29ya2VkIG9uIGxpYmVz
dCB3aGlsZSBJIHdhcyBhdCB0aGUgY29tcGFueSwgYnV0IEnigJltIG5vIGxvbmdlciB0aGVyZSwg
c28gSSBjYW7igJl0IHNheSB3aGV0aGVyIHRoZXkgc3RpbGwgdXNlIGl0LiBJ4oCZbSBub3QgcGVy
c29uYWxseSB1c2luZyBpdCBhbnltb3JlLgoKRG8geW91IG1lYW4gQ2lzY28/IFdoZW4gSSB3YXMg
bG9va2luZyBhdCBnaXRodWIgYWN0aXZpdHkgZm9yIHRoZQpwcm9qZWN0LCBpdCBzZWVtcyBJIGRp
ZCBub3QgbG9vayBlbm91Z2ggYXQgdGhlIGlzc3VlIGxpc3QgYW5kIGp1c3QKY29uY2x1ZGVkIGl0
IHdhc24ndCBiZWluZyBoYW5kbGVkLiBMb29rcyBsaWtlIENpc2NvIHNodXQgdGhlIHRlc3QgLwoi
Z2V0dGluZyBzdGFydGVkIiBzZXJ2ZXJzIGRvd24gaW4gMjAyMyBbMV0uCgpbMV06IGh0dHBzOi8v
Z2l0aHViLmNvbS9jaXNjby9saWJlc3QvaXNzdWVzLzEzNQoKQmVzdCByZWdhcmRzIC8vIEpvaG4g
RXJuYmVyZwo+Cj4KPgo+INGH0YIsIDIyINC+0LrRgi4gMjAyNuKAr9CzLiwgMDA6MjEgVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT46Cj4+Cj4+IE9uIFN1biwg
SnVuIDE0LCAyMDI2IGF0IDA1OjUzOjIyUE0gKzAyMDAsIEpvaG4gRXJuYmVyZyB3cm90ZToKPj4g
PiBUaGUgcGFja2FnZSBkb2Vzbid0IGNvbXBpbGUgd2hlbiBKYXZhIGlzIGVuYWJsZWQuCj4+ID4K
Pj4gPiBJdCBoYXMgYmVlbiBicm9rZW4gc2luY2UgY29tbWl0IDNjNjZmNjVhNmE1NCAoInBhY2th
Z2UvbGlib3BlbnNzbDogYnVtcAo+PiA+IHZlcnNpb24gdG8gMy4wLjkiKSBmcm9tIDIwMjMsIGFu
ZCB3YXMgbGVmdCB1bmZpeGVkIGJ5IGNvbW1pdCA4ZGM3NDQ1MDU2ZDEKPj4gPiAoInBhY2thZ2Uv
bGliZXN0OiBBZGQgc3VwcG9ydCBmb3Igb3BlbnNzbCB2MyIpIGZyb20gMjAyNCwgd2hpY2ggYWRk
ZWQgYQo+PiA+IHBhdGNoIHRvIHN1cHBvcnQgT3BlblNTTCAzLjArIHdpdGggbGliZXN0Lgo+PiA+
Cj4+ID4gTm8gb25lIGhhcyBjb21wbGFpbmVkIHlldCwgc28gcmVtb3ZlIHRoZSBzdXBwb3J0IGFz
IGl0J3MgY2xlYXJseSB1bnVzZWQuCj4+ID4KPj4gPiBOb3RlIHRoYXQgdXBzdHJlYW0gaGFzIG5v
dCBtYWRlIGEgc2luZ2xlIGNvbW1pdCwgbm9yIHJlc3BvbmRlZCB0byB0aWNrZXRzCj4+ID4gb3Ig
cmV2aWV3ZWQgcHVsbCByZXF1ZXN0cyBzaW5jZSAyMDIyLiBbMV0KPj4gPgo+PiA+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9jaXNjby9saWJlc3QgWzFdCj4+ID4gQ2M6IEFsZWtzYW5kciBNYWth
cm92IDxhbGVrc2FuZHIuby5tYWthcm92QGdtYWlsLmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBK
b2huIEVybmJlcmcgPGpAai1lcm5iZXJnLnNlPgo+Pgo+PiBUaGlzIGlzc3VlIGhhcyBiZWVuIGZp
eGVkIHNpbmNlIHRoZW4gYnkgY29tbWl0Cj4+IDdlMzRjZDdjN2U1MDk0Zjk5ZWUyNmIyNDQ5M2E5
MDA3YjY0NmMzZjkuCj4+Cj4+IFRoYXQgYmVpbmcgc2FpZCwgSSBwZXJzb25hbGx5IGRvbid0IHJl
YWxseSBjYXJlIGFib3V0Cj4+IGxpYmVzdC4gQWxla3NhbmRyLCBhcmUgeW91IHN0aWxsIHVzaW5n
IGxpYmVzdD8KPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+PiBUaG9tYXMKPj4gLS0KPj4gVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+PiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+PiBodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
