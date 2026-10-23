Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DE606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bnwDJMZA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE8440943;
	Fri, 23 Oct 2026 15:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkQYk5Kc8stj; Fri, 23 Oct 2026 15:10:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9DCC040955
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792768245;
	b=aSTrHr16iOOEik9I1fnjUBSkneFHyzB5a39+MBlNC98f3igpfP9ZzOdOHF92yBkjGu+y
	 zH2ueoABrMsRD0iTciw3wY9kn5gUoYgGAaQI61zsxtuxdm249d9JC44PigdqnuUr04cic
	 /5zAQB4/nE/LucxIgSnyOSVFeLlfdo5mYUkl4wINSb4qDzJuPcg2a7fMYVLe+FuMGo6es
	 3jC1DP9G1GpErpQvb4iZt1T0bfomnXKbr+GfUDVBBgZwBSNKm99t4uYWocCqPgh5j2UkC
	 aFv0ZXQmlZQzybvEhyhdA6sppSh15RE+nseDGLQQyEM+ayAByb5XmjCdi+5P4WMBZBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792768245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=1sXwDcaW0k2Ecb3lxAHoERhdsBHCm+hjad1DeaY9tqE=;
	b=NlPMYp95938uAQwbWC00zyMTh86GI4xQMRFxxSvAVEF2GjT6lg77KtQx8YpaRcaP4V7u
	 wNZreGjzS5q2U1TtP8KcChEjfLnrT25W3ZZYz3SbmL8SRSS/2x5OOIqK3nquoKZj2ONS9
	 d+qJerHFboioPMKgJEhNRX8/INzpYcu9zzW9XLYl5POy9Jq1giQsgJxqUrqJ3kOAPWGF7
	 WNQngwm9mKuOffL/gYRfEFzKk8c03Invp2Cs2N22/folijF63Nyq283zpYMdAG5Km4l6a
	 ZNegH9iOKLDjQVqzhNV6ms5HwRvckaKWDWw24AC7nvse6+KNVk4Jm2ihTKWXTS6B8VA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792768245;
	bh=1sXwDcaW0k2Ecb3lxAHoERhdsBHCm+hjad1DeaY9tqE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bnwDJMZAUA/s2rDgi4i3yLUgq2pvI+DgW/pVe1uM4kYzUo1SZdH9+MLpnWcTevYFZ
	 sft4WQrjpyEL5BXXp2yJbfnnDKUB4DhzLTw/oWZUoD9tDmr004e5yR0TMOtevIWmug
	 zPjCR3gNuj7wkID6XPLz/9YwkCWtLiqobLsoXSeHL5G7y7suJwuBQ4Zpph9Jmh6FbD
	 288xaIeNlvWNPg3W2d5lEOLAWNmeLAa6iohH3d4F87S4gDLdGm0q2Pvp5yEDwYhg8x
	 WOq2iYL/3fbyTu0iDpQOSnEJBGYxzQwaivVlwTSh6JBXEsNkTt61gKUyjOKRbLxFo6
	 8gvJ1Ix0zY7kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DCC040955;
	Fri, 23 Oct 2026 15:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50C3E235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36F8540943
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41ibov2C5lk8 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:10:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 302AE408B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792768243;
 b=IQCeNIlFlaAjdDexUqlzKu5Ws/2WO9QMhunmVYiZtQw4kgMEf26pS2e8BHuBXSdysvYD
 JaRTrjYGkK+tPahhCkcqsnEuGLVBF/x2Wvr6m155kEewrR+xRdeta7/fr1+EyWe7Rlt4/
 48pShW5HafLRm/25EwjOg+x/pC+ZJrAq7qWN5zZOFmlDu1HcHQF6mPB/Tv0dH0aIdMrYY
 mnTK4/Ut7P6VdPG8K7kiZsq1kEPCAJqOfeDmkl2aQN4QKn5VYBFVLEofz9VgMkBJt1yY2
 ydaYPgf6foPyizqQvXRJNrQsBFoTicZvKj8AffZoQqw4nABqtrF0vbiyh8vDhOsj5/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792768243;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=KFqMd87X73dvPm4nO45mBDFUVkUnla295a+LC59NCgE=;
 b=lsxLixPWTq0uto1bfVhKwG2g3k0eiM4SarwvMLMs78FqCupB1cmdRnR5bp7vvJqkVbKp
 +2AFWTcbyZVGzQNaOA+KLxZp4vQQRdM9g7cxxABTuf/vhJRlVmxlllOhyltSAMlpzsAf/
 to9lLD+/tsQ7K0cG6mIqEO7fHjDLZTJNts5HMc5qlFNKmuvDF50rvpd+zQgn4z+Qq+riL
 uyG2ax7Ol0UOkFvScQZXsOrwRNTB/9u6bHpYijlCKKPaOZMyy91TlFlNi9BWMUN/Nx4GT
 GU9EtAUYrHtkWM4HyAhIVj/rDY2q58IvzfAI7GYWP062s1suZv+vJiueZMQF6lSIhOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sFlcmdLu; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 302AE408B3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:10:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 94F3519F5BE;
 Fri, 23 Oct 2026 17:10:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 17:10:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 17:10:39 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023144815.1747831-1-raphael.melotte@mind.be>
References: <20261023144815.1747831-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <4da6ef1474619950746df9fc48aed8d5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: security bump version
 to 4.3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTAvMjAyNiAxNjo0OCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBWZXJzaW9uIDQuMy40IGNvbnRhaW5zIGEgZml4IGZvciB0aGUgZU11ZGhyYSBpbnRlcm1l
ZGlhdGUgQ0FzIChbMV0pLgo+IAo+IFJlbGVhc2Ugbm90ZXM6Cj4gLSAKPiBodHRwczovL2Z0cC5v
cGVuYnNkLm9yZy9wdWIvT3BlbkJTRC9MaWJyZVNTTC9saWJyZXNzbC00LjMuMy1yZWxub3Rlcy50
eHQKPiAtIAo+IGh0dHBzOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL0xpYnJlU1NML2xp
YnJlc3NsLTQuMy40LXJlbG5vdGVzLnR4dAo+IAo+IFsxXTogaHR0cHM6Ly9lbXVkaHJhLndlLWhh
dmUtYS1wcm9ibGVtLmNvbS8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8
cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
