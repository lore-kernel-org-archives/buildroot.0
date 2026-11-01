Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB612606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hKAY0Z3s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A1A80D1E;
	Sun,  1 Nov 2026 17:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eacZpZcYxcgc; Sun,  1 Nov 2026 17:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCA9D80D5B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553080;
	b=kKwQhtNuY5/19LkunFQEpgv7OWzfpahvqG/PUWh/f5YKBtT3yn9eHD5EZYIGJNmOqjC7
	 JSmMpmFVeBPlQKjl6fDU+y1B8RJfMUvV/tpbbjvqA5Ye9gc+/h01sJ55dSqdWYnvQhcsY
	 IHKaX4xhsIi6G3G9jbl8I/HMYrlvl/H0GGyHO46MiLPpsUMmJ0POezZYkGlVrOWl1tF3L
	 2ivatkIP5hRZrd8DynFacBeFZU6Tv3hAzFEEBKyukMNlvugaX+RPwkbVbcfvx2f2gESTt
	 DhPkDkj1vYaGoPXeWE+JwEKSVK3NBcKax5tZSq79VepZDH7yAXyzlHlxOkVAGJdyRQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=c/BMrDlcr7tfUC+O5iai0muNkY7QgooLhaKO0lOqdL9X3S01vq6YKMjsQub8I31zuEkj
	 SfVRb1DhOHtyJCspJp1XLEgdNJ2fys/e3bIoQi34O43sw3P1qLm7YPjz5dxGXf9nPubI9
	 7tzjyYXDmSFrL2hiWXpqtHavJKlYbZPgcPqD7vf9t7WmpaZGZWdArDjv/nDUaBxnfL8Yz
	 IMkDi5wdZ4+03qSymgS/gGqqjH/uOwP6fZWSI+SOw7B9o+aSswNKq0ph19Rf06OYkv5YP
	 ge81EP+iEyR94Rt2NNIH7iYk+1CTHidfWzj5OwBzklvnDp2g/O3dh6VGPZe5+1k2U2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553080;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hKAY0Z3s/fkhT28NvUuj2H8hOxlszw70uWINpVVcoPEUe16fbedE6Cl6u2WCg9/ZI
	 DFvB8BFg0qv9E5m41kEAMO4v/PUgY4nDqMWXyjCDyyGPYMvoVLVRqvSFXXEGFladnO
	 g1G5rCvJGJE0cTX6yByXSatC9tOoDpWm1ZJ+Csf2Wg4gLD7NY0yQWAb4VTexi59q8x
	 UqjoiGNvglQYaUHhiCGReqbh8a0dShrUTE6qvIc5S/LCa1Tq85GGWzJ2TTD6pKW5r4
	 MDh4BhRxnwolddtbgn0NYW3xOw2nRFOAtDl6IWrXyBG3HOzDL6LdxJnv0TOU9jh5eu
	 SuxwOo+w+oaDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA9D80D5B;
	Sun,  1 Nov 2026 17:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF6102AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D52D4405CF
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTrHBGchuE73 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31F6E405B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553077;
 b=Ip6Wr8k/0y9AVhC+Jt0lp0SlHVkZE7+gFS28vXr7DSRA/Nei3nWFspcK/1myqR5v89Vw
 CVY8f9n0Pdcam40uQHg+k428z6AkW8HVFoMeQQVg/nf6rK34FPO1Wwaz7KNhFN1Qm//Yh
 OUIdmf5maYqvCx1zKK7moCUKYHfsc5nYDIn+nKzGiLCR+jPgCFrByFqqM2plamM5iE+DT
 fSMFP+wAS44KGZ5/kGlZb0trJvJfZwNcXn65+TDVw0VdKCClWdEYndwkurzwmkAG+Sikf
 2B8Dl/x8iNObkuIlRtfLioqeulmL+IkGqs4tUIGc9kdJPsTrxoKqCXBsWOTseVK9mmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553077;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=ZYmklRWWJ4NKXejedMroaolvvArh3i8sDpXwXOsfAwT/BYouutvgSMHxpwKRLtm8qYvQ
 0Uxhksn61qtv4bLFVsLZF7IvcW10Yy+J5s3WyYtsUdTpsoqYGakdkfWPconsYG73SlKKa
 3cpEQ7fz3JpY460eDvK0z90roH/IdIyQ9gQ8q7FJ4QWI/dTMbQJtP3+GMYfXmZ1gIKdyr
 PNCxoxOSYMlO//1e++ZH0zOn3oovOTVmNU28/OjFYykchXwd+w5Wm/Di+C2WplpmnHGFe
 VPWxBTZxmKB+FZSFMhOfGgF2FlRgjqcKGC2r1RM9GWBAqMrwEwGv9TMtSJmRv+9r/Fw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IyW6X70x; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31F6E405B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 06B71B0054C;
 Sun,  1 Nov 2026 18:11:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:11:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:11:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-15-james.hilliard1@gmail.com>
References: <20261031172019.2683287-15-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a438bde3e59dfb5415b24aad10997fde@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pyasn1: bump to version 0.6.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
