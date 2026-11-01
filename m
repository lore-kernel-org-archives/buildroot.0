Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67E606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G+HDEuwv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IXNrQZGN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A244680F8B;
	Sun,  1 Nov 2026 12:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOTvoS3R0PYU; Sun,  1 Nov 2026 12:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CA6080F66
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793537893;
	b=MDnlMwqpWP0hAVO50kpro5xCifR8dXhrZLcz0S37fYjhut7vR14XImMPARqMKMhleT8Y
	 fm0cUIY0FQGa0FjGr60p7x4PW2Bw6xy9x+xi6sTFoqTMYylALeAuJ/LD5sQseWifdoGU6
	 YGY9uAZQ56vdehfdlmQEN/re5kBJKOOXO5LzfqH1sdjLzefp4Ai+sw5OLDEwcc1ACiwC5
	 z16n4pm+p9iCWCpua1RvRfXETEIQZYydxUXnZfoggEW09odfG/pfYae0o2VwCsnLWTodp
	 IR0BRlfjdVBCbhrSgNvX9dm8PI4NWAzDPt8vGsrSw9+QXV7TNwCINR51luAE/um1Www==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793537893;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:To:Cc:References:Content-Language:From:
	 In-Reply-To:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Transfer-Encoding:Content-Type:Errors-To:
	 Sender;
	bh=tG8tZu1bHsCUs+1NhRBElT1FuHE3agqg5s8CcsxcIjM=;
	b=UkqheO8Ho1u+7i3Yr3/AB+YVVOleghvr3u1StWJoGxrnsWGgXU4p5uJigsdbYt3yKgx2
	 MGALGTrLTSe/DLUzYlqlazC54UPh//116EZkumP2+LH12el2nkvBmIBucfCVOwcesAsE6
	 g5qXh4BUHX1QFABOaj6oLenjwEZrvzrfe6GjHjcdtMsHGN+brlFGYlSCb018nV6oqv8UW
	 UKKU15Amnr8Pk+RP3SCch+exVY0J/W66Fa2Hg3JLgIfwK8t5x7nFFfoYuOUwdSn3LE7+V
	 BYVFCAzqUkNkFCi9icyxLjgd6/3hO7uOgHCoITw3kwnFGViQ8mZxWpPabxDk6cAry+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IXNrQZGN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793537893;
	bh=tG8tZu1bHsCUs+1NhRBElT1FuHE3agqg5s8CcsxcIjM=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+HDEuwvSWwkR5CP0POjMbW/4qGYAVnuWOhE0RTzQOvublG98cBUDuG4p5GAhU25R
	 H5sE2brkLZebCi7WDCnJMbP+bcPPY85sU+poAA67W6CydicLn9aWsQyS1dpkAS6LVb
	 Em3GwbND8BTdGY2cQl5ObUajpeBj9GweS5tV87Fbw7L45KXmkEgMHVvSWVzqi0tqzs
	 FJsXJ7dSJNQxIKnsJX8Fd3R2zdtvO29bmKrPe6BBZaW6DEaakaqgnfU2BUTqcagi4q
	 tdm7lJOibc0kKJosb4epOjePD3ObXYuCBEXJCbQk91pH+VL8/0eDbeMLj6gSWZjdZ5
	 WK9y5Kgfr6TSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA6080F66;
	Sun,  1 Nov 2026 12:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E44E323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 12:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 600BA80F66
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 12:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0S-MouHIqhu for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 12:58:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3198E80F62
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793537891;
 b=OCZSJVOcOTkzS0uzxzC9JmN2M9UN0/1HEQjFb0hTCnNCRNSbvQ1u9xYtE45RoJr9NH6q
 zH98NH+hia9YbsFwPv4FXtNjeNWoeENm0itTmlNAwhJ1Rjwzot3AMky7EskFXRM3Aa6f0
 xWHa3IaahiVa5Or1PAZJF4G/BAxqCeOKi+xkDgfsF07SfO4HgAH0qgQl2Ftlt97rGgJnT
 w1zpGvBxFhhM3sID1zDoWFSNN+6AHXwGFgiA2V1W9RocyAzM301HB42qqiJWSMPqMdXng
 WWwHExfs+SkRZ+tlnctHfrhKchMEP//cB1MA2tLfljWtCWtLhrcoi6RnB8XRekNNiJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793537891;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9jr2xxtoyPT1gzE/PU1COMOx8Vte3CnYQpZBH/LM9Ds=;
 b=pBSJyXWQgfVRL5tp3LTl0dl+h1qpnBbeABNA3QtNV+2G9KDe/jNFiWBTZj5tPiEAltmY
 xPeuuw5Dh3Bt5mNLWOBEhUOGl69b1lYIq4pGFNG2Eo2TEN5taR3HNnME7gDkf51IPXZ8R
 GIssioshlNu4DuQwfNLWd3d5tYowu4Xb0Eqgd5Z+R2CGfTeXuz94DV6A813MIhPy7adhO
 Tn7zYXWnZ3A6GBd4TvcqQzlzdAs9WDmWJ9jFbfidLHA49UwUdQAR258KgwajSVQE9/Mzl
 tMk1yb8CwFLNhIKNXxA9F4xRS7oJUMrffxNpWtKzrguFeKkSV7kNHFvvUH5at1DemgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IXNrQZGN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IXNrQZGN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3198E80F62
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 12:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793537886;
 bh=9jr2xxtoyPT1gzE/PU1COMOx8Vte3CnYQpZBH/LM9Ds=;
 h=Date:Subject:To:Cc:From:In-Reply-To:From;
 b=IXNrQZGNlMp0XTRKgMmRcZ1gY2F+Lo7XJMJftLk1WVUFe2Z7WHxnt9ruSzkrhlzds
 ZLikrkCT8w5lfewykwGEhvBRny9j1ZMyaNsc+0wBuN/fmSuAw0/rih3fDg7MbEO2u+
 O48DNjGZJx1tdO2m1ifEdF4Fmm/uBvUfd8Y0FjeWfUpoOYdsGWbtMbo49jGYGtIQ3K
 xnPjKhfcJDteu8RLd7h0c1i3Li8JnYQIqOBqd2Dg3YDwy2tbu4XU0jQX7zndx/EGGr
 eFIhfqsQ5syhZCxFjuP9OKOZoL8EZFsbOr0J9svm/IZ8eb87I2f9qPUkxYieob7oi6
 65cT7RJ+2IY+A==
X-KAS-Sym: v3:f51bdf72230551df:ERWm9lB1LOscUI2QTIBjBBpLnXtzaSMIzBpUQj2ig53h5
 yq9vI4vg3dPS+l/yrNM/ah1ikKZBLkgHCH7akCGig1BkcSJDKL7cN/o5edOFqQCdV14LEc6XkWB
 p9LMivhMSmdA6Y/ulo7zPrMbXqi70++3tg90KgG07dW6j1XRmjPfLjZVsA89glHQr15pA+BNiZY
 /wTpEnkpoATkkI+hTZo7ajJX2m7IZZO2AhJcS9nXS8rE7hg8NKqTROqvMSg5Tfc5fzdgu7Z0p4j
 3e48GCndn8fM/cC0EMtcCOp41JKe0NvuGOTRZDtjpwdV6Ju500As+6x3GAw5WZsFjNybXvAw==:
 oYGYSNmn29vr0QM58vOBSn+UMcx/Ycs6JW1RdHiGuJsDV+phJBkNt+kgQntxmBtXZ1+P2ivr3+g
 N3UkVU5PvJpRqSOpm22FUFcibKtoFyobnLGHMbyzoTTPZ9u5TL+CUkLo55HLcB/MCqj6QU3Pah/
 jXh8YzlardnB+fv1v91dKKxr8Ui3iqYGf2XDRvtzLt5s7xCPNL9Fc+qah0l4puE0lKn0jjIuDZJ
 VPtrrRcAqBt2a5eMCTia+JP45dR0MUZTSYvwxFwOOPnqCbA3qaY/L43oZaL0xj+LdEQkosjM6Ya
 cWCth1DZOX/ZUzrjK0TClnWkIN61YiHtupeuvRPMwwdlO0IfUrnT8ur49Tftg6+j8geqmwmGjHM
 MuABce+MnWpv/XeJzfuTA3C2uhw6ecBNt5rFrhzFhqkr8AxwPrRGjXrAPiVk7iZOH0qqemfBH4/
 20QW7HMR4+xQwcVCF2LASWKoNhPqxE++g+nVMIh8bnRIuZrKOn0KXa7hFDAuuTwIpu8Mk19K3OR
 ttiRbAWRCraUghBxXbmFS/CBEjh6uyd24e44HlhWQtboCJXyPeJ1ln7b7q8Rg0MtB73/1hcKWWC
 aEDuVZaedTl/fI3i3KHzU0tn00lq8Q753tZPJRPlTVpKvoiQXFo5pQ0VE5vxYcs=
Received: from fli4l.lan.fli4l (p54a1b5d2.dip0.t-ipconnect.de [84.161.181.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F97AA4C2DB6;
 Sun,  1 Nov 2026 13:58:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34636)
 by fli4l.lan.fli4l with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.100.1) (envelope-from <bernd@kuhls.net>)
 id 1xNV8J-000000001pe-0Obb; Sun, 01 Nov 2026 12:57:59 +0000
Message-ID: <42b8c14f-f90c-40b6-9296-d2b7ad88e1db@kuhls.net>
Date: Sun, 1 Nov 2026 13:57:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-3-bernd@kuhls.net>
 <179353660655.149264.14673315638167558606@ping.linuxembedded.co.uk>
Content-Language: de-DE
From: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <179353660655.149264.14673315638167558606@ping.linuxembedded.co.uk>
X-Spamd-Bar: /
Subject: Re: [Buildroot] [PATCH 3/6] package/libcamera: bump version to
 v0.7.2-167-g8fe1f4514
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QW0gMDEuMTEuMjYgdW0gMTM6MzYgc2NocmllYiBLaWVyYW4gQmluZ2hhbToKPiBRdW90aW5nIEJl
cm5kIEt1aGxzICgyMDI2LTExLTAxIDEwOjQ1OjMxKQo+PiBUaGUgcmVsZWFzZXMgb2YgbGliY2Ft
ZXJhLWFwcHMgYW5kIHRoaXMgcGFja2FnZSBhcmUgbm90IHN5bmNlZCBmZWF0dXJlLQo+PiB3aXNl
LiBUbyB1c2UgdGhlIG5ld2VzdCByZWxlYXNlIG9mIGxpYmNhbWVyYS1hcHBzLCB2ZXJzaW9uIDEu
MTQuMCwgd2UKPj4gbmVlZCB0byB1c2UgYSBnaXQgdHJlZSBuZXdlciB0aGFuIHRoZSBjdXJyZW50
IHJlbGVhc2UgMC43LjIgb2YgbGliY2FtZXJhLgo+IAo+IEkgdGFnZ2VkIGFuZCByZWxlYXNlZCBs
aWJjYW1lcmEtMC44LjAgdGhpcyBtb3JuaW5nLgo+IAo+IFByb2JhYmx5IGp1c3QgYXMgd2VsbCB0
byBtb3ZlIHRvIHRoYXQuIENhbiB5b3UgY2hlY2sgaWYgdGhlIFJQaSBhcHBzCj4gY29tcGlsZSBj
bGVhbmx5IGFnYWluc3QgaXQgcGxlYXNlID8KSGkgS2llcmFuLAoKbm8sIGxpYmNhbWVyYS1hcHBz
IDEuMTQuMCAoYW5kIGdpdCBIRUFEIGFzIHdlbGwpIGlzIGJyb2tlbiBhcyBleHBlY3RlZCAKYWZ0
ZXIgYmlzZWN0aW5nIHllc3RlcmRheSdzIGdpdCBIRUFEIG9mIGxpYmNhbWVyYS4gVGhpcyB3YXMg
dGhlIGxhc3QgCmJ1aWxkIGVycm9yIEkgZm91bmQgd2hpbGUgdGVzdGluZyBmcm9tIHRoZSB5b3Vu
Z2VzdCB0byBvbGRlciBjb21taXRzOgoKLi4vY29yZS9vcHRpb25zLmNwcDogSW4gbWVtYmVyIGZ1
bmN0aW9uIOKAmGJvb2wgCk9wdHNJbnRlcm5hbDo6UGFyc2UoYm9vc3Q6OnByb2dyYW1fb3B0aW9u
czo6dmFyaWFibGVzX21hcCYsIFJQaUNhbUFwcCop4oCZOgouLi9jb3JlL29wdGlvbnMuY3BwOjY1
Mzo0NjogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiAK4oCYc3RkOjpvcHRp
b25hbDxsaWJjYW1lcmE6OlRyYW5zZm9ybT4gbGliY2FtZXJhOjp0cmFuc2Zvcm1Gcm9tUm90YXRp
b24oaW50KeKAmQoKY2F1c2VkIGJ5Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9jYW1l
cmEvbGliY2FtZXJhLy0vY29tbWl0LzM0OTExYTFiZWIzN2ZiZGYwMGRlNzQ4YjRmMTdmNGVkYTM1
OWQ5ZmEKClRoaXMgY29tbWl0IGlzIHRoZSByZWFzb24gSSBidW1wZWQgbGliY2FtZXJhIHRvIAp2
MC43LjItMTY3LWc4ZmUxZjQ1MTQwYmFjZTMyNjc3YjFmN2I5YTE3YWUzYjRmYTg1YTU5IHdoaWNo
IGlzIHRoZSBjb21taXQgCnJpZ2h0IGJlZm9yZSB0aGF0IGJyb2tlbiBvbmUuCgpCdXQgdGhlcmUg
aXMgbW9yZToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2NhbWVyYS9saWJjYW1lcmEv
LS9jb21taXQvOTc0MTAyMDQ5YTQxMDI5ZWYyMTUxOTMxZGIxZTI0MTEzY2E1ZmUzZgoKYWxzbyBi
cmVha3MgbGliY2FtZXJhLWFwcHM6CgouLi9jb3JlL29wdGlvbnMuY3BwOjY2ODo1MjogZXJyb3I6
IOKAmE1ldGVyaW5nQ2VudHJlV2VpZ2h0ZWTigJkgaXMgbm90IGEgCm1lbWJlciBvZiDigJhsaWJj
YW1lcmE6OmNvbnRyb2xz4oCZOyBkaWQgeW91IG1lYW4gCuKAmEFlTWV0ZXJpbmdNb2RlQ2VudHJl
V2VpZ2h0ZWTigJk/CgouLi9jb3JlL29wdGlvbnMuY3BwOjY2OTo1NjogZXJyb3I6IOKAmE1ldGVy
aW5nU3BvdOKAmSBpcyBub3QgYSBtZW1iZXIgb2YgCuKAmGxpYmNhbWVyYTo6Y29udHJvbHPigJk7
IGRpZCB5b3UgbWVhbiDigJhBZk1ldGVyaW5nQXV0b+KAmT8KCi4uL2NvcmUvb3B0aW9ucy5jcHA6
NjcwOjU5OiBlcnJvcjog4oCYTWV0ZXJpbmdNYXRyaXjigJkgaXMgbm90IGEgbWVtYmVyIG9mIAri
gJhsaWJjYW1lcmE6OmNvbnRyb2xz4oCZOyBkaWQgeW91IG1lYW4g4oCYQWVNZXRlcmluZ01vZGVN
YXRyaXjigJk/CgouLi9jb3JlL29wdGlvbnMuY3BwOjY3MTo1ODogZXJyb3I6IOKAmE1ldGVyaW5n
TWF0cml44oCZIGlzIG5vdCBhIG1lbWJlciBvZiAK4oCYbGliY2FtZXJhOjpjb250cm9sc+KAmTsg
ZGlkIHlvdSBtZWFuIOKAmEFlTWV0ZXJpbmdNb2RlTWF0cml44oCZPwoKLi4vY29yZS9vcHRpb25z
LmNwcDo2NzI6NTg6IGVycm9yOiDigJhNZXRlcmluZ0N1c3RvbeKAmSBpcyBub3QgYSBtZW1iZXIg
b2YgCuKAmGxpYmNhbWVyYTo6Y29udHJvbHPigJkKCmFuZCBzbyBvbi4KClBsZWFzZSBiZWFyIHdp
dGggbWUgYXMgSSBhbSBub3QgdXNpbmcgdGhlc2UgcGFja2FnZXMgYXQgYWxsLCBqdXN0IHRyeWlu
ZyAKdG8gZ2V0IHRoZW0gYnVpbGQgd2l0aCBmZm1wZWcgOS54IHdoaWNoIGlzIHBvc3NpYmxlIHdp
dGggbXkgY3VycmVudCAKcGF0Y2ggc2VyaWVzLiBObyBvcGVuIFBScyBhcmUgYXZhaWxhYmxlIGZv
ciBsaWJjYW1lcmEtYXBwcy4KClJlZ2FyZHMsIEJlcm5kCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
