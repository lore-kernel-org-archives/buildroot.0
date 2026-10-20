Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E4606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tb3p0PYE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=CGq+oO4O
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A151940655;
	Tue, 20 Oct 2026 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTGsGTrGBPpJ; Tue, 20 Oct 2026 16:43:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C789E405D0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514639;
	b=WCOAn6UFoqRbWAT88IHIT1BJkKlXdTVCBR1eXvp9YmdCsBypI4Z3lM2Te+V3WPXHgMJZ
	 Cs4XkY5nPX7Y7xNAVk2yKgPchHmuNg/LFZwUm0CKQQQNeaoFDOZ73cL8KDD69Wa4c8N6u
	 ksqeIDkX7XO6o8O1e7b9KsUxgFTvrpdCb0TMW2IqG0Ouly8BXfRdmiWgmW/UlyDGeQvAD
	 CjEpXyxTMSORFtG1yL3Syr8FgFyrB40p+BzETclVl1D/oPG54JsU555v3d2DwCXl85igu
	 Z5DYlnfJoQxM3ULg1Jigf/JeZXe0SraoJ7ixXp1Hb2Zy4btTO54IQ9Cj44ZKaqcBUNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514639;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AN+pzSXqrg5rhpXWnn2gLfVw4x/1LTbMZ+8JYf4s5Eg=;
	b=sPOcfO1IlYIg07Qmy51w7oBs0kd60yoNG0E5f9jH7TLhKi0rYxsR5emhpR+dIJW9m003
	 gkktqu4yZFmjg1HP7V7ZgZVdA9W8rAnGnjJR7X3K57+bXAKLq+6/MRJudH3uAf4IO7QI2
	 00SpbzBC9tpwnnidT/IEh5+53isTvegxgMkgiQzNyFGFZ0Zg8oQ9Hf64wdx9V5czOK0AG
	 mYIY5eOISNo2gJsO85bakb1PMOGxaHAHMT9bqZUe8+6MOniwjXTX9PPROrn0ans+tmus5
	 wwBEQErFHl76H2tFZG5W7h5xgijc6Lf1GxNTCxWRVfyd1Xwhw03SBMHnHTBUo+/TDWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=CGq+oO4O;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514638;
	bh=AN+pzSXqrg5rhpXWnn2gLfVw4x/1LTbMZ+8JYf4s5Eg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tb3p0PYELjk8aQCW243EtbCFa3i+U4fJV52jYmt4KQMKYy9G2y1JMpUp65flziOR1
	 tpoBvujYO0gR+BkAvHAvMy5EXrmLLKtu0fyKkDgHlTwrMOIYiLH87FNAJe3aMubyD1
	 DGcOk7F2md/sXRy2HEIhshbLP2CGnDJJJxKMSQByk5+/gEx3GhL5/8tSk8rHo4eAb1
	 aGPkjrKhe7NOcaUJm0KdTPw4uKmETyI81BG2f3a0vOGdEbJ7O0eiojyoVsqGKT5iU1
	 sAAI1yvHVqyDwAMyq0crcnuALOG6SkDTka7Ek4LYoaiwFVrEZgGxPZumJbWeZwf7Mr
	 zmY8XqhOc3Fog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C789E405D0;
	Tue, 20 Oct 2026 16:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9D41E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D954405D0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35RaxJrrZGvO for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:43:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA195405C6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514636;
 b=ofasG0EfdlUpL6rgVOuP2sHenIPLMJXAchEMByZcj6XkIlGJLrgBpgMMAMKapJ6/g09l
 rxTVFDn0eDcJWZgIDmAUitbiOASq9UovLlmcpoQeveWTW/UMiZ/93Bmy2r/MCncB0ADzf
 uiBHvo1+7Udad5r20KR3zQS/Stb3ZMtLK4sF/2AD1/vxObxjDq1SMQ3fBSi3uc1IgScvP
 UgqRF8vuF+DnH+bB/gpbMt70BIeOpmnZH0ufvb2tt9EWhCO7FzlKywhrd1nwAuYTJA9Kg
 DOKZ8jiO6mvZl/sslUYzsPd2kPKfqLU2eYb0RPfk3qYyOnRI5a3A3xjygNh1QGmJxEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514636;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=MhfARkEr1kXeh0u31Z7k2cBWxoPvpMmBBt6fDYHdA04=;
 b=IN99nQRj7R/t6aR3L82Bh8iiZbSXrx2b3cpUMzXCgdh7LsSL7tAEBNGTbnKzI2P1Gbp/
 csRw7S2qENVW0cwACMEQtIr9JfeJJbZX4Z3Mn3kepReVmjUkIJCrCbR1vUW4K54HNLdPQ
 u1Mfjr64z0H0QRnNhVilm5ks3uBLlQWWvl48tpFuPPa+7BUWmDlpJl5YYSy+/6cs53xw0
 e98xTRXJv0oHpOnBJMpie22ekLN5QNkcDW7QHek+sH93AtMljiZL/cY64h292phnp1dBN
 qMLYZChLtnST92QHsv8DLhNXdzTb9REszf1OK8pyyuwxMkHiWWNjMl+7Rq9umghw5uA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=CGq+oO4O; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=CGq+oO4O
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA195405C6
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:43:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=CGq+oO4OBeabvTnMoeB/5qoyvnr8pm81CE/A7JHeJze+rOEpPxwp2n/t+M+8rs8x9vb2kErvhhDBwd1nJnyFQ2vJzz/LWdy78vag935q4PhiBxTSZdSDVZC5LWU8xllRiYg9Utx2b3av1vmM7kCks5jwT/BIULEASz8spwb4ag/Y9BYwBDMxM7ksQ8e+CzmvUzGNNoZOgKIYxT7Sjg8gkU0R4roS9M6PeECRjV0dX+ZGya+cw2BictaebBwXnI2yaGMpXNJ5uPSvRV8gy7yIXYtxbUzyqwY7Xw3vIUlhisnGeWPb9MtC1rfH/yOAG8mciXCksDaGLf/LdG4FtI40Hg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Rnlp0N8R/XZ9x8HdVazybFNBBG14AR3+xusrBkVo3pY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -426336557; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 16:43:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJCwH-00000008CBp-1eph;
 Tue, 20 Oct 2026 18:43:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Francois Perrad
 <francois.perrad.86@gmail.com>
In-Reply-To: <20261020120646.1306735-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 20 Oct 2026 14:06:45
 +0200")
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
 <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 18:43:49 +0200
Message-ID: <87tsmg8gqi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > By default, hare will store its cache directory in $(HOME)/.cache,
 > which is a problem as we don't want a Buildroot build to write outside
 > of its output directory (to the exception of DL_DIR, of course). The
 > build of hare-package packages currently fails with:

 > Error creating /home/br-user/.cache/hare: Permission denied
 > make[2]: *** [Makefile:15: dbus-introspector] Error 255
 > Error creating make[2]: *** Waiting for unfinished jobs....
 > /home/br-user/.cache/hare: Permission denied
 > make[2]: *** [Makefile:19: dbus-scanner] Error 255

 > due to this issue.

 > We fix this by passing XDG_CACHE_HOME when building hare-package
 > packages.

Do we have reasons to think that this environment variable will only
ever be used by hare packages? If not, then we should perhaps rather do
it globally / in pkg-generic.mk, similar to E.G. how we set GIT_DIR=. ?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
