Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F4606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MIp9kiFO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=MKBNUYWM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BB4281115;
	Fri, 20 Nov 2026 13:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fay1sGxsPuC; Fri, 20 Nov 2026 13:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6FD408145D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795181844;
	b=Eq4ws3j+uUTiSU6r+hibyC5JI2ektHBjJ8UVjc5uji+n/afnoATfWCyqVMV3EydcQ1ab
	 PBVh/c7JVcPx0ih2BFZpGfkE4XHzXl80m93RNJpuPis0H1ZdLBRZcyjMALlzoCfEUu1Am
	 f6RSmgZbHUTDynCnehZTqQHen7KmGMtRhtDZ2uklorobB3ntIT0dEnPAUFkSETYgcOpY7
	 xYuzm+CKpqhna54ZN7XejKKN4tu1+DnTTh5k2l1ySWiZm7bIAr0k0/LTNxQ1WGzfugzkk
	 3FBVSbOU1EJvWePfB0m2Hy4OAEfobdUTIS/ueoJycwHpFdhHr5RpqgO/LmQO1kWOo/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795181844;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZhtpuDJo/RFgnYSACsSF8xO9JKPV6XZEy43ITDaL3+w=;
	b=rxOzmxyzpxY01rnchVHxNkx2Ey4YQxbVjigfxToCb7KnGfGYL2OY4PTPgqcTmBQNpkUw
	 +2wP4wiI61GlDrbfRnJvUVi0vMRoVrX/5Q5Kzts5BGhgJJ0rw/Dp+Lu0KNhsGUfqdlrK+
	 X1IwUAB7VK8opMi3HpAnbxhxpUx9cjx/+DH6H0MY3XmzcYVM6VQGPK2/jhMYbdoxQwCNW
	 XsSukRVjAiz0DdVNtOYGO3gUmQ5Y32EJwuVXg0wAtGWXnXYieFyXga54C4d2yPKR7x8c9
	 o1a+/Bu5rS3xBsNVJKk0U1SiPwcSjmkQwtF2Faoa3rOg/E+qs+3RHjPR+D0R+KN6JzQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795181844;
	bh=ZhtpuDJo/RFgnYSACsSF8xO9JKPV6XZEy43ITDaL3+w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MIp9kiFOV3VR/z397YT+aTt0i/cKojyWgi6Na2+jVzktB8tf9gjXbf76ks4CjEFx/
	 XnSI4ot5c1fOnnOoJ+a/peNJID1T+rJIXp5YZNsfWzrRjVMCPKE5fpcrIaK+khbkwV
	 yelIr7rsdmFKVPuA2rjV/Fo+Wmt4WG8fij826k2DFlg6Z2yq1GSIWiNJoM0fIIGyeJ
	 yvUl675z9CdukTU/UUzbIETaQEQPg/vgKkjImeqpdKySNu+U1oWNtdqXe5fUxtkr6j
	 gJkwhtymZEb0C0opnTZSAs+Bc1M+FogW4kfLpBfrrGpt6TIWFBHylwwBFD3Kij1WbO
	 c7zZBCNG1gDfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD408145D;
	Fri, 20 Nov 2026 13:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86F121C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78ECD60755
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5V8wElq4pP9V for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:37:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 68CBB606C2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MKBNUYWM
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68CBB606C2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:37:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MKBNUYWMEf6L/yyNIFsylAKAT1S0s2tQbHvCOpfgL1+Lx3ufQevciLv6Jco4/r0UqC0z/ymH85P5dWX4xRQSI1TrUgZ1tmReR7j/YKoy6loUp+coNg9eEJD6ROIa/geWJTzx/JDt0Cox7EsNYUF351giGdmwicdfQneyVWPE3FKymgl7sjVM9JvfTDEHtRoLz/Q93zRb5pO/IyxB5h7FX/locqdoP5+GFJUmWRpXc3de1m1GbOI2Mpq6/P1jRr9k5/s/YkzVGZX11d8e8yoqHc1Z4l+10OIO00VvCqo5vhvL1mJXoRyUcBXDZFqIowhmDNyLu3bmnFbDmdwdZlZBiA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=+r2xeWidl2UsSTa2D3nL1ZOBRfxxwiYzQBSa7pHi8+k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2055585344; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 13:37:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUOnf-00000003ukp-1akO;
 Fri, 20 Nov 2026 14:37:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261120100106.542645-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte?= via buildroot"'s message of
 "Fri, 20 Nov 2026 11:01:03 +0100")
References: <20261120100106.542645-1-raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 14:37:11 +0100
Message-ID: <8733svvd2w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_grub: fix test by
 selecting BR2_i386=y
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSW4gcmVwbHkgb2Y6CiA+PiBCdWlsZHJv
b3QgY29tbWl0IFsxXSBjaGFuZ2VkIHRoZSBkZWZhdWx0IENQVSBhcmNoaXRlY3R1cmUgZnJvbSBp
Mzg2CiA+PiB0byBBcm0gQUFyY2g2NC4gVGhlIHRlc3QgY29uZmlndXJhdGlvbnMgd2hpY2ggd2Vy
ZSByZWx5aW5nIG9uIHRoZQogPj4gZGVmYXVsdCBpMzg2IGFyY2hpdGVjdHVyZSBhcmUgbm93IGZh
aWxpbmcuCiA+PiAKID4+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSBhZGRpbmcgQlIy
X2kzODY9eSB0byB0aGUgdGVzdAogPj4gY29uZmlndXJhdGlvbi4KID4+IAogPj4gRml4ZXM6CiA+
PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE4MDMz
MTU4MDYwCiA+PiAKID4+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9jb21taXQvODYyNDBmYTQ1ZDExZTMzODg5Njg1MjBiNGEzNWYwYTQwOTU0YzEzMgog
Pj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKID4g
QXBwbGllZCB0byAyMDI1LjAyLngsIDIwMjYuMDgueC4gVGhhbmtzCgpXaHk/IFRob3NlIGJyYW5j
aGVzIGRvIG5vdCAoYW5kIHNob3VsZCBub3QpIGluY2x1ZGUgdGhlIGNoYW5nZSB0byB0aGUKZGVm
YXVsdCBhcmNoaXRlY3R1cmUuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
