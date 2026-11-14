Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B343606A32E
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NSVnFDWd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ToIX2UM6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5BB81220;
	Sat, 14 Nov 2026 09:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgwTrF5zMvS6; Sat, 14 Nov 2026 09:43:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77C668124B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794649404;
	b=F0/K/41dC2cfSbj7WgCK4/EDCjRuf6oUPBHu6HS/ZPNZrhs/3g7nym3LvF8XkC5p94Sg
	 6qUgn0Wzn0x8jhxhuLAjx9p8SyzJfcsqFbAekFrt2rOkDMGZgrZS1Yl3TAWqxNWili8Dp
	 fsppimFO+FwuwtlaCU1+ZKlHujzeI0KJ1eiefs9tzxsA3W8T8OUQaMwqDg4foIH/fG1kp
	 LNsFZXSWk02+b9dvXlG+6k/fvSILrM6n2OaPkMepW0oXv7r1P3fqDE2yRjYWtI3F+k+Sf
	 W10rHijP5tFI2Z05fY05m2r2UQlYoJd/E8Gp4JykCG8uX4GQ04d/tcymZrD8wl8IavQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794649404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hRVrbZAgZQB8p24CMB1sUkt+oZpcH1N0wlW5Go8YLpY=;
	b=N0+kqOzegXzOIA2uY3NIzx+BNCvYI8J5CqvUs9apGc7jfDlzKOZ04H67NxyDBATbxjr+
	 QTW1X5EtSoiS5x8M2ydWXQnDUW8os9cWNLKKs2f+A6XbdBkI+o/pB3rThYuNokSvzQbjg
	 OdECwHSWF+VxsNuoUo5fSZdrPc3H0yIXsdJhrlNlb9UvWcN2HNNSyFD53jnqdqVpvEngP
	 /VI2oU9w81fQ+z8Zq8+/OXGh0Ns8nUhe1Jhh8bogyOyt+byhgOMly0s8NST/uAvSKQqF1
	 Uyg/PhNmYHk+yRhMDuBqiQsbRgknuy/U96Em7n50F8eEcwzpxU0tWMoPKbbN3vEEaew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794649404;
	bh=hRVrbZAgZQB8p24CMB1sUkt+oZpcH1N0wlW5Go8YLpY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSVnFDWdjjKHkCXpVU0s/dJVyTxfp5y8IAIa70pNzxN5uhoI4lPf7aGBVYl6eQ3oX
	 cmUkdLC1PE0E3ppHbAgJGoTyrFxi72HRUkYqLNjOV0kxtIwSBiO74I1tIG5drQKUuZ
	 AjjCg6UKzbVVYsfRXhJYblGZGlnUID9M/a5HCchYGvrqccWLZcV/knGzOTjFXuS7uq
	 FYYhcCDD4QuQ70bRynqNgQ5RH4BHu3JUzKflaNDWmqeEsXCjnNl2hEhI6o1c14ONYn
	 KgMEIXZ5DhM9bl6AfwIVAySyPqPWqFVdqN9Hy1Ei8/f5mLP1CU/Jjd0/6fzfXU4un6
	 9EUfscVw+SaKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C668124B;
	Sat, 14 Nov 2026 09:43:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AB6170B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8022F40875
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRC7KrOaF3-n for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 09:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3DE45408E0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ToIX2UM6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DE45408E0
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:43:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ToIX2UM6+iRb8WEUe0NPLJ2twkEOW6+tP7PFsesVUgFO072VYnVUs92x4NP9q12MCfibvGpMStFCvFmRUcKIvs3HQNFGfYLRseecHw6O7XKi9m0bY8rAaHiyuEi8CUr2HWhMeCCbDVgJMgXybXaiC5CLEONCh0zdYhmq88pT2iMK6pSVjsNOn+LpBc4WKT4qAGexyXG6BS4yR3BSxKgD15imwMVF4IkdkBqMGOwAL5Sdx4ZHw+xoCTlKq3/Ud1XJyMK++szscz64jck/7EyVen+c1ysgi69ljq7m2xbi8OeS1oB6VrAA9W1dkwvN/S0dHcu/YwVWn9gE8idcdy9bEg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ossrCfOTR37Vh1N0yzXihsHVdEYrOoUuLhVWCZfAyQ4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1483454824; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 09:43:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSAHs-00000005oF4-29mN;
 Sat, 14 Nov 2026 10:43:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261113-fix-host-vim-build-v1-1-58b2e5f832b2@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Fri, 13 Nov 2026
 16:12:20 +0100")
References: <20261113-fix-host-vim-build-v1-1-58b2e5f832b2@armadeus.com>
Date: Sat, 14 Nov 2026 10:43:08 +0100
Message-ID: <8733t3g34j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/vim: prevent host-vim from using
 host's libncurses
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gV2hlbiBjb25maWd1cmluZyBob3N0LXZp
bSwgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgbG9va3MgZm9yIG5jdXJzZXMKID4gd2l0aG91dCB3aWRl
IGNoYXJhY3RlciBzdXBwb3J0IGJlY2F1c2Ugb2YgdGhlICItLXdpdGgtdGxpYj1uY3Vyc2VzIgog
PiBvcHRpb24gcGFzc2VkLiBIb3dldmVyLCBob3N0LW5jdXJzZXMgaXMgYnVpbHQgd2l0aCB3aWRl
IGNoYXJhY3RlcgogPiBzdXBwb3J0IChlbmJhbGVkIGJ5IGRlZmF1bHQgb24gbmN1cnNlcyA2KSBz
byBob3N0LXZpbSdzIGNvbmZpZ3VyZSBzY3JpcHQKCnMvZW5iYWxlZC9lbmFibGVkLwoKQ29tbWl0
dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
