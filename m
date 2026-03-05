Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C66EFCE5F
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 04:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BAAB80F23;
	Thu,  5 Mar 2026 04:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5TmoBEv0GQH; Thu,  5 Mar 2026 04:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0866C80D66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772686318;
	bh=y5QWO4Jt8W+cbzpl+TEYbPzkYoBcgNwtO5gEGMQfGTQ=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P6JxOFRwQ3sHpoE5fDhsJOruLWTgtrSsCvDp2HScS3YIWJeZ2FUpWbgrEgL9Spiof
	 laKI5A3zGv6bmJlNdyssh6CsTQhRistUz/5Q+R39AS/hiPXanAAI0HE1ejACUOLY4x
	 IdKRJAltjA1ILXTCID4DhQqGqgTnkbpbY7rvDEyI2fQTi7nuX0dcvHtUqrnbn2mVu4
	 e9zNU7yG9SSQ1PvyDWWN932sKIJGmxmi4B96N1MFhgS7drjzQAFV7Pbn7oeDoy+6A+
	 yh0c5tWn2aAwFQAg2pBNAeQvQE1ylgfGdTQtQGimrOdLdvXUPh1cNK/7jGj3/8HoFs
	 Sn+cXxBBQiiWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0866C80D66;
	Thu,  5 Mar 2026 04:51:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96FC9223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 04:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CC9680D36
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 04:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-GGmOJwEnpM for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 04:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.57;
 helo=send218.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E914880D30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E914880D30
Received: from send218.i.mail.ru (send218.i.mail.ru [95.163.59.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E914880D30
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 04:51:54 +0000 (UTC)
Received: by exim-smtp-558f87dcd7-s52vp with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vy0gg-000000009Zi-1Qcc; Thu, 05 Mar 2026 07:51:50 +0300
Message-ID: <2cb128f3-3df9-4522-bb99-3620b5104627@inbox.ru>
Date: Thu, 5 Mar 2026 07:51:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260304191607.3488559-1-bernd@kuhls.net>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260304191607.3488559-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9406AA218EDC7AA2712B38E3A8E0155080BF498FAD539A555182A05F538085040FD9AFD61BF468F0F3DE06ABAFEAF67053973CD7E9AC9C2D7E7E1C5C670CC8317A0EB5089CA368F65
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B2F1B2566C686A20EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2D3BF365A10BACD152E070BE324C7D3C418360B74C9ADE6B8BB0A4F435E46E6718B35066C979671628AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0F60A601881DBAB3C8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B68CC5112E3E56BCDBCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF27ED053E960B195E1DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE798228CBAD4AC77F6731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A51AC62E62E51B15435002B1117B3ED696EE90122E81E1BF30C89B063BDC7FAC35823CB91A9FED034534781492E4B8EEADA2D5570B22232E1EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659D4E04056F016A312320E50E8DECB8473E4708A24E40236554EFDF12A8E0141700D64E4364FC9619CB8341EE9D5BE9A0A77017581DE931F177B3F436BC03A2484140791D800F15E1F8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVbwN8XFWZxQUk79UaEJDzVI=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2ED92A681DF7535FC7D9CC01B44193CC27843D0295720283990DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=SywigB4WIqyxKng2Cqe8zBTWdqlhaaqp3A1/Trf/pkI=; t=1772686315; x=1772776315; 
 b=CagWVS4GwGDESMlTvSCzmuryznKtuhLcA0PEbAwbX4UDB3PazwjBIPxKlqq8tqp+pUcD5lC+u+F
 uD2VZBCeWapkH41e7+FbKsZJUdKSQ/h7pz55qXVSS9vwRiMztmMoi29ETGxa+i65Bu6RJV0A5Pd4y
 fZD9azn7NfQbg5AJAAf6UmY4XrdbP30weGFgU3Uy6JCRiIa3+ULcqKEj3iqYjXj6ijxPZCUq57xJL
 FMYdAWLkOS7oKtmGH5j89sJVWPG5045oTlyobq5u+fyf5GlNr8eKT2/J61ZlJby66no6q+KSvfosx
 ksGY6sbZzf/9Y65Jvmmc70+9LqUTj94jtJUg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=CagWVS4G
X-Mailman-Original-Authentication-Results: exim-smtp-558f87dcd7-s52vp;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 18.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

04.03.2026 22:16, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-183-179-1613-1517-and-1422-released-3246/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
