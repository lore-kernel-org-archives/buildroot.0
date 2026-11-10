Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C760A2600
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iDuJN2bt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=KmpTyIwM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63268404DE;
	Tue, 10 Nov 2026 17:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEVB_oY-wtmE; Tue, 10 Nov 2026 17:19:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6242D40820
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794331175;
	b=Ehwy0Z1irGHJIwALdObUbQPkI+Sz7cl8i4Wjp7ifMPew2ct42Ktjs511IGxleBvkM6cC
	 hM+1n3eBGLq9IiVIIv2bH2L/Xb2dpLSK3EHqAxz+ltlUlcFmNB7MFxvavu3FKB7Gkv3XU
	 Oak8YXMuiPWdFC/u/o4qcNN/RpiVNN77P35K0V0kX3TAoTNvegfPQbYqOZVAUlkdS79ja
	 D5w4h1B/KN1YzxtOdsiz99fADgszQa/gvG4gpH5D712CuYZOlACyt4YJzF2I73HJAWibp
	 mfCTsp+KTcljq+iUvDJqNa19aAJxg/B7/1cTc8q66zejMnryknaJt7cv/rM3fQt7V8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794331175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZN4rRcW1VtrqjK1OhYwfBi9+BqoTUdIKZgFs84psYKY=;
	b=frrx3XYBhrLaYX1bGrLR4xnLHVguEFLG69WWVTBdKCxKu8/zP8W5BNi+Zo7m5mbQg+jW
	 feE/eIgflT7m9KwL5Iw5cdtnLBEJpj66ndssCL9GupiSCRFgvruFkr0zjXZJ9fUobWQTL
	 gVCN6lMxLrIuBeUSvSTekmRU2l3jLNpqCVXvGOEDpGVFwv55cA7XUXcz7bmwQhDhL4p9l
	 SgolPH+T9WJZSy4WTiMkO02G1VWGLnJyu668SURY8Y9YBDyLMCxKq7ASnMdplKH9te3Ra
	 mR/BYiX38ven+9Oqt4nZho354iG/kCU4LGwGhKa3xw/kynpPl/Tf1e3rXdViYtWsxiw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794331175;
	bh=ZN4rRcW1VtrqjK1OhYwfBi9+BqoTUdIKZgFs84psYKY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDuJN2btPtGZYg8E1KKs9+JaZpVL/vm2MHiiS8ZPWnnZcmckTenjUDFU+vt5GrfbS
	 gppODiiouGbjId6jmG7+MDHG3FWGvquOmUPVUp36ctXecE69JUeFj6kIiScun4/mtV
	 6/PcTOrj4mLVc/LjcdzYy1QpVupjoIfWKtQUXQjp1jkuQLEh/RP0xH8aebl0JxwoHM
	 GZrRsbWdO0c7tOmJBp06a0m8vS6EPx+o0n8YH23J0tud8i3IMhMb0MlttHBpXwCKEm
	 M1+TTDJbSSQb2rUXXRpq3n/O2CWmc1c1X8Sk/lCphjr0tm55ZYvjLxXGW6LoD5u2HS
	 I7VTJrX4cVJsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6242D40820;
	Tue, 10 Nov 2026 17:19:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E0C128C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA948118C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClCPJlMrXW-k for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D87180881
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KmpTyIwM
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D87180881
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:19:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KmpTyIwMpbtFkHmF3LF9Ua4GRdfjjdC2gO3favgoyOcwDpP6inJrotwOk6HzszHe18yeeEahs9Fo42FyqFWT2oKKkatMOB79uENue0+wcPolc3EaYd1t0HIjCXnk+EsS0kYPBVLoycPVAirnUcUzGbEv85akWAK7voRt3/cfg5YWo8noY9QE6D7bxfnSC7vvEyMC0vxJ4mkZ8cH1/MX6pLhY/d6Lp8dRY02xUf2HiqK6fJGFCaklMrktUt9rklyI8VzyiT1s5J5ab6qwGeb5J5H9jY7+7ELzEH5jgxdCVaEE1FsudSrjR0tOzgw+VMnNtI8CzBn47O1coPyiqQ476A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YOTMgUqWCV4MYHBUf1hgHF8dxY5U7FKWLMZU3u1UH80=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1328840983; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 17:19:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xQpV7-00000001HXi-17bf;
 Tue, 10 Nov 2026 18:19:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261110105623.702862-1-yegorslists@googlemail.com> (Yegor
 Yefremov's message of "Tue, 10 Nov 2026 11:56:23 +0100")
References: <20261110105623.702862-1-yegorslists@googlemail.com>
Date: Tue, 10 Nov 2026 18:19:17 +0100
Message-ID: <874idovc2y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libaec: security bump to version
 1.1.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Fixes several memory safety issues in the decoder and the SZIP
 > compatibility layer, among them heap buffer overflows in
 > SZ_BufftoBuffCompress with negative parameters and when decoding is
 > resumed after AEC_DATA_ERROR, and an out-of-bounds read for very long
 > fundamental sequences. No CVE has been assigned.

 > For more details, see the changelog:
 > https://github.com/Deutsches-Klimarechenzentrum/libaec/blob/v1.1.8/CHANGELOG.md

 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

Notice: My tar complains about some unknown extension headers:

tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'
tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'
tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
