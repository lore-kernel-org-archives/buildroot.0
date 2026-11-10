Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE20606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NICMcHxL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=KROMYhHD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD6C40878;
	Tue, 10 Nov 2026 17:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kw9LQuhSEHFa; Tue, 10 Nov 2026 17:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 74B1540851
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794331528;
	b=OoO/CsGuSuYSVffjzg/RmD3bjJuDueDYZb144bKXLF1DfVO5FXVrJQw73lNXW2KMbc8a
	 JVlPQtDGueUu8vKh6uMhbXhzMRsy6ASz/QyKqUdPIBrk/hk0BDgBGEtgpRIB2uQa3Fry1
	 rP/I2K7RMkMm0BsHUDb90RAlOqSNtNtOxSv1fzkK5tETza5RGhQ38N/oOyUcrid7gf3e6
	 J3ihzadQslt2ObgqA1sNuTrDYqKoD9DCY/EC9Ezx6bHARQzzSHniU3LRCYeMcacg05gV7
	 9CV0r/n3cemOBbwRpUPyiYsCe+hPnQsE/s3hIio/2r0Gf3V1vhrqmUXHAlw+qv0U38A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794331528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hDGqpOQO2cVVmsWI1shvSGeBgQ4gKyqkdkjj5F5ZUjM=;
	b=mpBO9cH/hVlrfrzWYY47X6JRGm/XWEus+C7/Qgf7HECbfAhDzYgw2f5jSX4zz8GtFGJh
	 R0wRM4vK3scdMfmvZN4TcL4zmMx/YIInpDQFecpNhNUjBlDkm8299CQN2zdUYLyMkeXTg
	 home/G7tKM8WHQFhBT2BsIZW+EJsrWF1gzPuXr2LFsotu8RRtZTldzBaplwVsMVIk9m23
	 4MKhxP3GC4xYdEZe/6L0nlQvont69t8MSwAYJdN48/MIs3Sl2RqYmsFB2PssV5/sZ53V7
	 jTS4EWBLW7ku5muZzIscKVDuEaGBUaB4UjIAJoC0BX5C/+vb33T+2CpbKzbI0OGR4iA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794331528;
	bh=hDGqpOQO2cVVmsWI1shvSGeBgQ4gKyqkdkjj5F5ZUjM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NICMcHxLNlVgUD+z+gwHoeZyFE2yLHuo3Vc9a8uEWraumfQzD8+xwSIBok/Wue1jD
	 za9IRRLvbYlLVvos33RKlm3jTsDAxNyA72nV5g0Qqbx3eIdCXGCc2Jxhw6wlESRF96
	 wSF0YieU7oK16m4PdEprqtMrjgIPRx7pHTljG07ZEEY/XrUsvvCI9OWkOlUSm0nHUR
	 NXhL1+yx10wrkFaVt231OUPBy44C5QM72Pd2KJM7G9IAZX1VPoczd68+TBQNWPyFVy
	 /KjnlrvIJYcaba3Y90QS571W5p/mG3TBK2UcXXNi8WTZmiWGfiiawqOSK3/Cg3KNcM
	 Den6xxySp4Mlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B1540851;
	Tue, 10 Nov 2026 17:25:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41372731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 271C680DD7
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAZB7URhM6Nn for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:25:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DE3580DCB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KROMYhHD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DE3580DCB
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:25:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KROMYhHDU5lSN/fFKxDuPlqOHTVwSQHNGM88MNNd4SlITJXbvjZCf7Nlk3ehPK13ZN85y9n8Lb0xyDLRgXYZtRpb6Q5BQmKS6V0g6cCvQZnMOVQDPUtMUOxanuBL7cq/Eugwiq5PX5s6++JCqoxBmofxp3Ip1g3Kbxcz+3rtnFN4x4gmUIS8phymWe6Q7yTPW1OSDfaKjaurp29o2dNeI68urQlxeXvfqqoxZ/7rt87L6LtSF6HFWbldV2M8hQ8Sk3DthTN80xpA/cRTPUiwhXMgRANxrS/wh/gQDlXpzmVEqGK51h/1CPpnhP7vSmdzePHjfiv4972w90MFf59LKA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=PhfI1hptpxj0ddmdlWRjb7tG370rACsEy/XtYefY5oc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1610763831; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 17:25:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xQpat-00000001IPH-1E19;
 Tue, 10 Nov 2026 18:25:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org,  Ash Charles <ashcharles@gmail.com>
In-Reply-To: <20261110140830.3359501-1-yegorslists@googlemail.com> (Yegor
 Yefremov's message of "Tue, 10 Nov 2026 15:08:30 +0100")
References: <20261110140830.3359501-1-yegorslists@googlemail.com>
Date: Tue, 10 Nov 2026 18:25:15 +0100
Message-ID: <87v764tx8k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pru-software-support: download from
 git
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

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > git.ti.com no longer serves cgit snapshots. Downloading the tarball
 > now fails with HTTP 400 and the message:

 >   Unsupported snapshot format: pru-software-support-package-v6.0.1.tar.gz

I do get that 400 Bad Request, but I do not see that error message?

 > All other archive formats fail the same way, and the tag page no longer
 > offers any download links. The package is currently only fetched thanks
 > to the copy on sources.buildroot.net.

 > Fetch the v6.0.1 tag from the git repository instead, which is still
 > available. The contents of the generated tarball are identical to the
 > previous snapshot tarball. Only its hash changes. The license file
 > is unchanged.

 > As this is a change on the TI server side, all maintained branches
 > (2025.02.x and later) use the same snapshot URL and are affected.

 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
