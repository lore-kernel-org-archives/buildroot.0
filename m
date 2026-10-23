Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86D3606A321
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mZbjXdQB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4B7181687;
	Fri, 23 Oct 2026 20:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wI6AAp1O8KM; Fri, 23 Oct 2026 20:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D42EA8167E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787220;
	b=Yq/f6bVMm5QAbjlRyeNmFJCZntAmYrfLWQjXisBZHfBMn0P7OjsHeNLAeva7O/th7FJz
	 +8e43l+nriWm/bVyH44A8/CwxsNKcss9moVVRIDZFswTFTlZXuPtD+FJBkbqW0GMXo0Cs
	 Nyb6/vJgQZo/CWOt/bq1Ujzeugm4QNW7kz7eRF32bpztqDAEUldNQ8Hw1RX14plgTjA/k
	 952oZFElpDTAUxAfsqxd0YxR8lVUupnxndzMip3Lr/ZTWLhj506eDHJoZOtiHpJBEY1iG
	 GXeUT0x2YUMTmSDz+v+9v9CLB2oil9ckIFmVt8ooRgMevXUSoZPBC76gVCaeJhNITMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=Fswib1ZmSVlRF1xA32eRNo1OCSh+6c5lKfd29QNtxZNhrsRCKMnF32hjaW+WxAI0+5By
	 lBfnMOS05r/ShOP/kSdrMVze7Qgdp7JzzCxxlBC1aRBD5PYlM8mXE23O6oy6EzR3iFiCu
	 y+/yeqK3n139K1Tv3b0u4ifnSTpmZQDqJGc/SMr7NQIypds/+oZA07rQlzJVZtVhGZVk8
	 5KpeD5ORO3PqEnbCnBoE8/AtT7qYwsbxu7HBwXQOeZBEVEzbrKGX+q6MhyqtOHiUR8zVY
	 G6jiJmugMMiG6YloqOKcT7HX6eQDpLslUd68f4zplGhT3vXSoKTQJtOssefvXqbC4gQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787219;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mZbjXdQBxkxshR7+PYu0UqgxNXNBR4A00kdXivB1AMqEB4vsTbTy1R9I07oopcHTU
	 zuotMfSwraYPIl4PS1p+JkipfcKvkMmWiu/VVfzYnTzJ+iW2YgdGLPNag4cw89GLA+
	 vzxAY1lOIl6CyzQFMbKG+Fxl9HMJ9SY5p21ud9YzkhagnXEbFeuwUwi+C+L9fieHq2
	 62rIwWA6+Q0gj7JBtF+jsGEeMIKD2l9cEFbLCnA/QEIX+MKUMWemaa6HlCH1urOQ7D
	 nxsOmZSTqKIpDZnwEvO3Y2DoaIAe//RVEu094SFEZhggS9I2nAFIxStgI/gvt8kE7w
	 4CeD2lQCX655g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42EA8167E;
	Fri, 23 Oct 2026 20:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 068C7356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0CB28167E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIOfnbHZN7uH for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:26:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3FDD081678
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787217;
 b=nWpups+co3YEiW/94vme+V3o7PVj2QtxvdRPW3+r8dbDNTQd7u6YVfHrfiyu1PlOu9XA
 24+O9Ow95o55si6Rc0BfXdO+SIXII8OnrDNuXwBAhyoigJlKB3JFa3tS7HNPWWWdjc6D4
 BmWDCDZBV5vBNRrep8xJ1n+RU66c6nCEQt9YVFHZrZ0Ssafdub0Do792bE24rNxj0NEp5
 7pix2ZEtcwHBk9fsxi8EcZDItndO5QUG8wCyBRejcwYbS7W5HJM5iVHp8iII3SaBq8wZl
 tLmlKkvgSjM/fZXzvRdjIJSNNxO2HixgB12yGYpuSCBwlXdTJZhk1fJNqidQomiBr8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787217;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=suS/h6BIooeOUM5/abAEOf0sOUspdiCnSnfzynzVwv41Zfxg4NAmROuTGxlh4pd2ZmG1
 naFp9NnT/JKcDUHDhT/0QiBzkbUfN87Fx/f3I4xZE3QE5GniASL2N5nxlLfQwQwwpTox5
 bMOaJtdug308mbAig1SGi8hOmchtHPfXxavqTdgzUoXeZ9kxsB64CDBkWg/EAuSi7WzOB
 G0ZleRSUeKDppd2ZwekYTXuE6Qi3yOWK+rPHHvCamtjo4BU7E3+u3gP3c1Q+PGzYUzneN
 9gOOWv4LPkOEPmp8Udd8EaF/8f5QlfuCwePihW/zTLT0Yek8L2H8Yzgg0tu79866xkQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DFlUHEOQ; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FDD081678
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B43555FFA3;
 Fri, 23 Oct 2026 22:26:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 22:26:53 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 22:26:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-7-james.hilliard1@gmail.com>
References: <20261023181818.920329-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <df1deae5df9da045943af0c021394c5b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-cachetools: bump to version
 7.2.4
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
