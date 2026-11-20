Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96B606A534
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W/wofaAk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325DB40B1C;
	Fri, 20 Nov 2026 06:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuP9rTMzOAgt; Fri, 20 Nov 2026 06:11:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3524540DAD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795155103;
	b=LCOJTOjunjN7iCA0JkR3WYLNjKa+KXdEi4YRIEEr5NQotn48yFAWx+ZvRlF5TwkMi/9o
	 ClfPps38Yh3vtb5tASZf6hntnldm9b20i4mme+P5UoPCChfFS+RthvQJNXO3g9QZcJQVi
	 d8wIevH/ekZ/VMfI4qx2cMoDDnWVgxjbTuKhZLS1ezEg0fMJ35oiMY+0oLp5kTWU1ih5C
	 6/7InXg/tRUqY8df721LWzbi0/7XbsV1H/5vi8jF4PAHJHswvBm+NOKfNyuRqwyA8CnNV
	 sDA+u8DUVuJJoz3UrDS53XCSouoJQgFuJ3thRhxtYZwqQAm1YKFutNo6lWWd900A2Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795155103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Mailru-Src:X-7564579A:X-77F55803:
	 X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:X-Mailru-Sender:X-Mras:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=iMxykHlMCwecaxZM9erh4RbJ3vwiztKTE6g3kCBbLHA=;
	b=iYKjTub9tMNZYOpoTowYjvx1DX3kSvifHjfR20KVfZv0XX0UNUE+qjQsGS5R9y+d045F
	 EYqK98FVx6LOWGDj3OassEEzp7gpJ2S5cVCmHvRhtOAZ3Za4UNpV8SiELXBw6vZXkusB6
	 J2BtQvpHIk7IoWM4BqxSPorF12BFhS6IT2nbDHKDk4gs0oKdwL7BpSTHQ8Dl3hweli+Zw
	 Ldq3hyGtGuePRfa5nAvN+aa/2AlIqNAcX1YRBnLPfXDPowloEnwsq+trmLkqn1lcgaS4T
	 g9Q9bqPx2MA91yIwQqjPhTGyGTUow17AGeZaETtcl1OPpj4KEWDob6TQLo9fS26Y8Jw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795155103;
	bh=iMxykHlMCwecaxZM9erh4RbJ3vwiztKTE6g3kCBbLHA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W/wofaAkQ7AfaJAgoF/hJu6B+MAnYAHRAYIi0kNAwiQhcN0nsgCkYc0CR5NWYtpls
	 dRbvWfVC3Cfv/8qcR3WGGYDVYB18dibf+EiDWrLWxhdmpwZEc0Qalkk+8exNzicy2t
	 +vInjoD+n//mvs73F0g4Q/7wTcA1Q6WHg8mnmQYVbudkCjZaGOrZRh/C4lwiZS7kuW
	 W8rDjb1Ghy8bzY2wzqxGGB6wup1MvsPMulFVDgocyRhXp8+eG2eb0omrPX8yq2Z7uv
	 DZ0jlGhC9JrOF09ap2f0+gmekpbyL1/+cp4ljPqdlfYTHZcAcH8zdhl/9N0McsPPLw
	 IHrhZGmsQmkXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3524540DAD;
	Fri, 20 Nov 2026 06:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDDD9260
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00DF40122
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBbxjWTvEDD7 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:11:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 94417400D6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.152;
 helo=send57.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send57.i.mail.ru (send57.i.mail.ru [89.221.237.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94417400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:11:38 +0000 (UTC)
Received: by exim-smtp-56bb8ff957-bmj85 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1xUHqQ-00000000OY3-0tLo; Fri, 20 Nov 2026 09:11:34 +0300
Message-ID: <49acbba7-dce5-4964-9de4-9f1ef24dfadc@inbox.ru>
Date: Fri, 20 Nov 2026 09:11:33 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: thomas.perale@mind.be, titouan.christophe@mind.be,
 Bernd Kuhls <bernd@kuhls.net>
References: <20261119112329.234753-1-raphael.melotte@mind.be>
Content-Language: en-US
In-Reply-To: <20261119112329.234753-1-raphael.melotte@mind.be>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F934A8CA1FA66AEEE903A271CB147A1039182A05F5380850402AED741DFB2D2FFF3DE06ABAFEAF67054FB191E310529AFA77953514E24547C07D861803BCE79B5D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5259CC434672EE6371C2A783ECEC0211AD4AD6D5ED66289B524E70A05D1297E1BBAC83A81C8FD4AD239742502CCDD46D0D5C553DABC76643498638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B26E2737C1C27712D32E070BE324C7D3C40A0F05C6EAD44A65BB0A4F435E46E6718B35066C979671628AA50765F7900637F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C04A3B2F4BA56A4D558941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C309A7649CC036878F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A52E33B4D4635F2F275002B1117B3ED696C826FCE6C75C690B9E040399BDE4761E823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6599FABE18A98DB127B29A3BB51D4C0C9C0219C8F415D57D37BE0FFEB0653BF61962DCF02029A739284B8341EE9D5BE9A0AC52F828BF4916BE233E92699422B894F36B59ED51D168B199350E1BD188BD56E4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWK1wqbD3NwBxtEW4g7DlDWI=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B313489DD78036D091A7ED0B2036DFF315948DA7977C6895EDBA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to version 17.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MTkuMTEuMjAyNiAxNDoyMywgUmFwaGHDq2wgTcOpbG90dGUgd3JvdGU6Cj4gaHR0cHM6Ly93d3cu
cG9zdGdyZXNxbC5vcmcvZG9jcy9yZWxlYXNlLzE3LjEyLwo+IAo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgQ1ZFczoKPiAKPiBDVkUtMjAyNi02NDYwCj4gQ1ZFLTIwMjYtNjQ2Nwo+IENWRS0yMDI2LTE0
NjYxCj4gQ1ZFLTIwMjYtMTYyMzcKPiBDVkUtMjAyNi0xNjI0MAo+IENWRS0yMDI2LTE4NDQ3Cj4g
Q1ZFLTIwMjYtMTE2MzAzCj4gQ1ZFLTIwMjYtMTE2MzA0Cj4gQ1ZFLTIwMjYtMTE2MzA2Cj4gQ1ZF
LTIwMjYtMTE2MzA3Cj4gQ1ZFLTIwMjYtMTE2MzA4Cj4gQ1ZFLTIwMjYtMTE2MzA5Cj4gQ1ZFLTIw
MjYtMTE2MzEwCj4gQ1ZFLTIwMjYtMTE2MzExCj4gQ1ZFLTIwMjYtMTE2MzEyCj4gQ1ZFLTIwMjYt
MTE2MzE0Cj4gQ1ZFLTIwMjYtMTE2MzE1Cj4gQ1ZFLTIwMjYtMTE2MzE2Cj4gQ1ZFLTIwMjYtMTE2
MzE3Cj4gQ1ZFLTIwMjYtMTE2MzE5Cj4gQ1ZFLTIwMjYtMTE2MzIwCj4gQ1ZFLTIwMjYtMTE2MzIx
Cj4gQ1ZFLTIwMjYtMTE2MzIzCj4gQ1ZFLTIwMjYtMTE2MzI1Cj4gQ1ZFLTIwMjYtMTE2MzI2Cj4g
Q1ZFLTIwMjYtMTE2MzI3Cj4gQ1ZFLTIwMjYtMTE2MzI4Cj4gQ1ZFLTIwMjYtMTE2MzMwCj4gQ1ZF
LTIwMjYtMTE2MzMxCj4gQ1ZFLTIwMjYtMTE2MzMyCj4gQ1ZFLTIwMjYtMTE2MzMzCj4gQ1ZFLTIw
MjYtMTE2MzM1Cj4gQ1ZFLTIwMjYtMTE2MzM2Cj4gQ1ZFLTIwMjYtMTIwMTM5Cj4gQ1ZFLTIwMjYt
MTIwMTQxCj4gQ1ZFLTIwMjYtMTIwMTQyCj4gQ1ZFLTIwMjYtMTIwMTQzCj4gQ1ZFLTIwMjYtMTIw
MTQ1Cj4gQ1ZFLTIwMjYtMTIwMTQ2Cj4gQ1ZFLTIwMjYtMTIwMTQ3Cj4gQ1ZFLTIwMjYtMTIwMTQ4
Cj4gQ1ZFLTIwMjYtMTIwMTQ5Cj4gQ1ZFLTIwMjYtMTIwMTUwCj4gQ1ZFLTIwMjYtMTIwMTUxCj4g
Q1ZFLTIwMjYtMTIwMTUyCj4gQ1ZFLTIwMjYtMTIwMTUzCj4gQ1ZFLTIwMjYtMTIwMTU0Cj4gCj4g
KGFsdGVybmF0aXZlIHRvIGNvbW1pdCA3NTY2MjcxYTgxMjdhOThiMmFmNzI1NTg2NzE1OTIxMTRi
NTA0ZGJjKQo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90
dGVAbWluZC5iZT4KUmV2aWV3ZWQtYnk6IE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gu
cnU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
