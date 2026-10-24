Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED9606A32F
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RPnMeoHD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A58680C1A;
	Sat, 24 Oct 2026 13:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzUZD37rT6to; Sat, 24 Oct 2026 13:23:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A054B8096C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792848220;
	b=oAY8WbEAzU8KY3YiRXPvfbU4uPHeXYS3GCutZfrGAm1wOddFPCSDhDwOt04kl137XhTX
	 dr8h9ozhKGktnQT/Hoa4JjC97h5LH60NNNLR5Kx/vZ4gqEqjybNnvDPvD44VR7KJOoKHb
	 DpooIoVLP7//99oE2+im5LKgbCiQbDprfuY3o7cTA21QBnrS22euur1yJ8o2QVcaRL6z/
	 ckZa8TAWaRKUmijcWsLSTUPZxEB3cXAoiDs2m5fgPjVFyDaZdTBGRqMV1OTLVQgUoFXOi
	 zu7adxTWj1EnPDDCPpHkAv0xDucmjo3EbhRzJULS0eGMM9KooUMiG4h/eRmtO4qYM4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792848220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=heD7k+2A6D1kv8rKBn/i6iQWfkHXe5JqimiLkYPGchcsJcMLOO91TdtKrPHflbMF0Dxh
	 KadSZlgmSH+90JyJGsRD86i+OJOMiNRphIZUStq0pP1h7dgw8vI8KfTfHrhm6ZCIRsbA/
	 /4srLR06Mc2uMx+U5wbeO2cNNwIXgeNDJ8wfjXMH64MhFj/3CsOgq6r5P4WcTs8NpYJH0
	 xvJot/QKijLFS2qaVg2nZBzMat5K4DHoZbfFo8lvuMMy37Msxjyt3qP3g/w0TnyZBgvtb
	 vVjTuLIMA5HVNmoZ2/l/WNdh55dH2Yy33TDq3ZsZRfMSaWLwG8cqiuuVIBbduirTpQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792848220;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RPnMeoHD+Og9bDzvxAQ8gcmy7vZeEzNyZYfKuVSEveO4cIJkOsnLFvYPGRce93JQQ
	 7XwoYaslsjFpVihUw4Q6ywr+g8aLQq8aejVSv5aQQoq1ajH9uCPBO+LN/G5PJR8Is5
	 wcWeDDrrLPZhwG5ke6mN0QXE2l387H7zlCKQgmyfyE7zqsj/+WQEMS3gcMwxolAqs/
	 MBOq7A1RxMTrTYFNe80MFw+Xld3Hh20e9EFmEvdOVSfbzOrNSbKC0cXM1pw/NNCWoh
	 Fl/NvlFlKxR+LHosu8QXSgtZD06HJHMA00rpTgeDcr8hkNxMtghz1muXl92UYKOi3Q
	 C2kv6R1QPMSzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A054B8096C;
	Sat, 24 Oct 2026 13:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE41343
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 945EE409E9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0OMRA7w67Wg for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:23:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 05BDE409E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792848218;
 b=h6IUyFeA9fz75ZbSgOVDdhfJMitbuBb3hLycOnJ3I9PucITSk9ofQzwGygkgpHQxkNCf
 8+5fsAU2fmcVxw7Evk4b/ApRJjKcjrMF6dqzyL5NcXKvlDL4M9z0/sNISFLRtZcvQMGWd
 4mnwx/jmS0q6GICzLVWgVn6oR2yAmMYLZNdvyRkolf8WFpKPySrMuGT8K+LDJi1giKavY
 UJPskvNgA4rhmH8UA3oHrYJ3CU7WRj5QDheMKInBurdFvFpCAocTZi6ASZ4bnWKZc5hyt
 srVS2JdCURby0ajkzQ4DetN8OY+L6f16987uJd9rFH6ZpxgzLI0rmT4b6UYohuNcCMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792848218;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=QUduzOeM2b2/WZprvLfljWm7rE9qXS+aGOgKELfZgLgYEvvn3TDNLBwpcvxrfduC57td
 bTFf+wmt9dMrn6hTz4wVs1wQZVUBnS0PGNF7eG/DUs356/PuEH5hFcDW1xnc7+BXfvOAB
 w8aD1dJoOrfKo5ezgI4Ax3Gd88PlyFh1DQZi5Qse+0ECVjjujLP1Sxhnp7Kao2S2a454z
 XINXrDQ1DaDU8SxMniq0QGatqanZmUeM1lU5uYPl+eLXQNljeBVYSjWt5eYK/uPVWesmr
 ieHhmKT/sg2oG4PB0OSuZvhA4VAsZwMBEQwi9B8aCvfOuPgLPQkq+oAdismi+MFZbAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FSfbfrjH; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05BDE409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D8823B0053D;
 Sat, 24 Oct 2026 15:23:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 15:23:34 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 15:23:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-11-james.hilliard1@gmail.com>
References: <20261023181818.920329-11-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <015ff145365b5bf5f6832693bbd61407@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-googleapis-common-protos:
 bump to version 1.76.0
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
