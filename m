Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67026606A329
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 19:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FmAbjaEt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=rBlpigAS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD87606AE;
	Sun, 15 Nov 2026 19:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7yhSWOre3nA; Sun, 15 Nov 2026 19:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 422996060A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794770431;
	b=AMc3VD+4xfDqqKTBrEHNYrCn7u06sDxoF3Zhn9Zrq1ENvrVhUmZF1ZT23+HkkbRPWUp+
	 zJtu8yLjkW+wAwrFHP5HpNeM3Oc4f/2Iw5knZ9sBN3OgMDp2iJ6hAOVeTZFMSuRgntqZm
	 Dqv8qcafTRs8RyOnkOoW70jjjdpvJ9VuIwstC7GVmtzvfUlJgnC2MtB8mU+Bt2xYxuqbZ
	 HJ9zk/D2buVf5XqWHfo8fPVtHkYJVNqCDucGTmN2Z9cRKv32kuop0D0zka/7v4iP316Eb
	 JOWhao2PTFsd6pRN7QCtUFepieX+NTMkSs02PgJr5s0IrQgCkQD0dF2h4nAPqswaYjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zSknEUVs17ez0QmVN3/szZs78n1Gj31zT9O53PocHNs=;
	b=npu2DOdtiAB3R2bEaYr9fBtT1PKDQOhajHnUld8/44Uwfq4OtfrRowPJIxYis7wyCKEf
	 XD9FIvZDioSgqVBdcMpAI9iIdrC8XaNzRs7faWyA/Y9+4s2LREMxhwYhNGjP1OPIZDlOj
	 TyRdmFK1DP5RRJJrg8R/9NfNjRAOQcXj96MMmi/mE1RJP9A81PjNZKHF3im/y1QLqgMEo
	 jJPaKkLGpE+0rLB3GBpraUOHCNtNpuX5OJ5L9SWDoqldPYzgT8AxYrdcvtHEWMOzKxJPN
	 ZydrVsfOWjVdUkn/NdkuN/en3fp/KJ35VHpC6Vz+LEw3oOLW9FANNcDMBfzLISPkKiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794770431;
	bh=zSknEUVs17ez0QmVN3/szZs78n1Gj31zT9O53PocHNs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmAbjaEte4tba7dRPn8HCoXNWNmZ0UxwkHXMzIEco5dVIZ0OfI+tUR31amn1Eqfdg
	 z9Xfz+yaQXYW6y7YmJlzAvp2TdQ29DxSzGEWaNGgca5FKQQSRAmoEXK9eQphLB6Dtp
	 kGbJZW9N9ekDF2mEGMCc4RsrFo7zu36s7wqhfinib85i45vb2Xgru2lYIOxBI9UzqR
	 hY730HsQXC92ZaEw3KANQy8peFC8PpTWc1Zg6IjPSMtfJ3GVUK3h+ZwUxV+mekUDhq
	 0sKLsqlqQvMkbOqUM1DyE3AXRc26VEpPP8YN/yfYlo9wA+NPlaWkwr5y8sgfhujStc
	 KFo76X/vr0P4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422996060A;
	Sun, 15 Nov 2026 19:20:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4672FE
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4205F80D96
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfmsWZaKVp7X for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 19:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A61D80D85
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rBlpigAS
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A61D80D85
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:20:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=rBlpigASJam01HwW1XJF2wkZf/tRu4j4c+scO3wABngsnJiT+RUieqAXSdfR2pOtK8xOeCE74+abdf159XBYYWAxqPGtyYaCnNJP3PPKRTOJUy3M37W5n6aJuOdJxfkBfHffArbjMLhylEqC6dK20IcFIb4nkGwUUspfoaETsy/MbnOqrYTsRplZ0ZLpW1PIKuK9ZXBmwTkKyLWDT32BZWYWevQ8kjZEMQVzy0IBMQY7k/aqtqOBulKiW0Tj8Gtjk7b2k+0DvAt6Ym6CFjxlW4xonvEJe2tfPT/C3AJm/cTowLBKNioWCDl1z+IXiv0l7RAinLuS0CQmUq73fp2zxQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=T2Fd4GttvbQtEObYwZDLxcJaHODZPxPbGC9Zk2JKljQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2037236092; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 19:20:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSfm3-000000002ID-0Irj;
 Sun, 15 Nov 2026 20:20:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261115120424.1235918-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sun, 15 Nov 2026 13:04:23 +0100")
References: <20261115120424.1235918-1-ju.o@free.fr>
Date: Sun, 15 Nov 2026 20:20:22 +0100
Message-ID: <87jymd6gw9.fsf@dell.be.48ers.dk>
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Buildroot commit [1] changed the default CPU architecture from i386
 > to Arm AArch64. The test configurations which were relying on the
 > default i386 architecture are now failing.

 > This commit fixes the issue by adding BR2_i386=y to the test
 > configuration.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158060

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
