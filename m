Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53550606A33C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iXHZhwnD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fwExgHTE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF8240AEF;
	Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSWmHb1-C1L9; Wed, 11 Nov 2026 11:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BF1240AF6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794395339;
	b=gRB7/z+qiMdwGEldUNI+TKJWul7L2ylUbEsY4AXvNjK9Tef+/5XyFzMn8Ttq6LpmMufR
	 4kkfX239uFX9aMDVUygs56Zcslo1YE4R4bSLzjqK/zHDKXUmawwuZqOVNVxL0pZINxKEa
	 OEbx8+LmZGxIZ2XJITO1EMPhbob6BI75yUYgfKzBSuL7u5YiImMvhaVYmf9keopMBvIfZ
	 0DtEGO3NllChuk6WaD7S3TR6ugmVuoTSD3hxPIWVTLzwWt70Bv9S2CtLlGJxmlxBcK74r
	 thn+mjwzVHoYpDrp5laLMYKjROECCeU7HNqcN8qqAhEUTfdRSoMof5+wnEyajzmM3gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794395339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w0PVRkgcFZuCRd+fUHh9e6LK685tAWnsxQ8eVQgzk4g=;
	b=szNfxDybZ1ozirvvcPWMjx5eUqfR6QqV6rFdJAGef/ot4hngxBIuqWP97yflluq3yh/w
	 GWQn+3JT07VA/8VSsRaXzRv8mXlEfZ6DrhDGA1VTGjll/lZP9qbD03iyUedNMoZbotmtt
	 ugcgrswPX2W5kItOgq40E349sjUVt01eGHS4oOesX6Knyf4INlll1FXbAl84DoxHpFfjR
	 /7yqcjhC3JgQLYrC+HKAT8yZ4OlwzvGAxF9NiC/nm5nFnRQ7GPGeKbR2dR064U/vI7OAh
	 TgMjCNGYDmEoCnkcniaLcfa3Kx8Z3WEG6oDHGNG1vn2Cht5+JccDt8gIwJ6qL5ukt6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794395339;
	bh=w0PVRkgcFZuCRd+fUHh9e6LK685tAWnsxQ8eVQgzk4g=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXHZhwnDG+SPNHUiyVnC9JmuPmqKvfBngg9RW8FHELPGQ/cBtygfKazYiYNH4BUgF
	 jeAVUBJJHSh+n14nMdyLGuiNge8dpDWqHG5pBbGmfMsmFi+F9dMze7yMtEdAsLKmVi
	 JI/KL6lpaqMTFpXblnDLLnsWdlxK0DRXQffQErOj9yQmv2KJJFt3ITBfLb6r/NptT7
	 LPfe30kRgiAAYEkllImtE7uG2BA/lb5gAPaRpbSdcoFPEul4Q0oTCtVpxhR1rIlGme
	 sjjAc1pxNF4W5p9a9z/lCfYDQYFISU+kkSDPWK/rOJgk0Y0o1W0286S/7qrjNcvvjD
	 LzE3i5G71PtIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BF1240AF6;
	Wed, 11 Nov 2026 11:08:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FAD731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A33C60796
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phTNrYeoc7BQ for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 99D50606E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fwExgHTE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99D50606E0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:08:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=fwExgHTE33DHMEtHrOJ8sNA+dChiDwXGzhmSWgrIHT9CznENPvtiU23VctnNYYtEhi9RnDJr7TO0duj47hedW9+1N3rIEO6hJ1Jg5WIOEfJveSB5ewn4nkIXCHQLcaEmzXiuYnmdl/zTAqU03We5EJNiYuKZyGwGWzhjinslH2MOg4ulifa9MOdwivP8gI/ZQSywBigFoUYupf9DsCfN23An8f1yolyBh/gOWNw1T02R7QpwHbic4QIj0Y9rztQ45wjrCNsj5bWAOuMer7mwKEStDnoLyvKW8Ak4suKLHEUUbnENGm/4Nl/BWkM6+X04qzgO76RCBnOoj91+IR+LYQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Wj7k8TRAmGSPFXphmvUgFeJWE+aqFxMgmIubrDlWI1M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 324492242; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 11:08:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR6C6-00000002QK9-3agM;
 Wed, 11 Nov 2026 12:08:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261111081946.3850218-1-yegorslists@googlemail.com> (Yegor
 Yefremov via buildroot's message of "Wed, 11 Nov 2026 09:19:46 +0100")
References: <20261111081946.3850218-1-yegorslists@googlemail.com>
Date: Wed, 11 Nov 2026 12:08:46 +0100
Message-ID: <878q2zmxq9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix host build
 with GCC 15
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > The host pasm assembler fails to build with GCC >= 15 on the host:
 >   pasm.c: In function 'main':
 >   pasm.c:437:9: error: too many arguments to function 'ppCleanup'; expected 0, have 1
 >     437 |         ppCleanup(Pass);
 >         |         ^~~~~~~~~ ~~~~
 >   In file included from pasm.c:75:
 >   pasm.h:576:6: note: declared here
 >     576 | void ppCleanup();
 >         |      ^~~~~~~~~

 > ppCleanup() takes no arguments, but main() passes one. The empty
 > parameter list in pasm.h hid the mismatch until GCC 15, which defaults
 > to C23, where "()" means "no parameters".

 > Add a patch, submitted upstream, that drops the extra argument.

 > This issue has been present since commit 725efef8313a
 > ("am335x-pru-package: new package"), as the bogus call has been in
 > pasm since 2012, but it only shows up with a GCC 15 host compiler. It
 > therefore affects 2014.11 and later, including the 2025.02.x and
 > 2026.02.x LTS branches.

 > Fixes:
 > https://autobuild.buildroot.org/results/d6e70d200a3a7003a1d3fb03000fcfbd6b9dcc56

 > Fixes: 725efef8313ae5591bb497fec3aa7e62717af9a2 ("am335x-pru-package: new package")
 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
