Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252F4606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ngORNr8F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=aF8cMzge
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009EF80C4D;
	Tue, 20 Oct 2026 10:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HVgpgrjyA_T; Tue, 20 Oct 2026 10:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C2EA80BBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491526;
	b=gy2Ej0OpOvdl67xnR30vagHntqo+rPmsZWLDaNygLSxNoIFhw12ooUpUtxzzeoQZCKkq
	 N1x6Lorxd1sL7TXAK7GsdFvB29NZb1sgYyjPFXiLHrE3fiKoHyWXPkOPkuQru1YuImGXn
	 6vZIRaLgHjo0JmD0KoTk3uQbhEl74OcTH2HMVkuFliFCrgkpaUx15UXn60mip1ZYVvaSd
	 tzMPd/aOiIogA83P8OFLGFjZ11Wx2tyXBFTlOTfPAcyUIf3sVsOO0dYxqq5aEU7fph6uE
	 AjuLFo11+Neppvv3/74seF959sxmC7O8qOuF7v1Q9ELNCQZ5b1ZV3jKYhXrcmiih7AQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K61gVoyc3fsiArjg4Df2i9D6Bxpc2ipCh1osoFqVLRk=;
	b=Iw2RSGS/mDVPBdlplJiespcbiVtSsmLFubukfqPrfjkAvoUyBUtbxNxVoS70frB5ye5O
	 PSWqxf0G1n12iRUbwWIaZw2FVPJMIBcdWCyDRORL0f7iIutcj3rpPT/+xT4orx+yWfmE6
	 Hn7YjqLdkDR7K3S/6Jf1/1f3NRNoZDDdERXAiLYXIFLItI3KDJWpFuSoLX7YI7n+RQFMN
	 1rTu67Hic7qMLfds0yyslcHnyjsAYpffuvqWnTxOfklNmc5bbKFrYbWvhY3bmejOU03fb
	 eZ2HaX70syNjP9qp+4RkOOvsObBdCv2tl/dV1jI/DWRQ3t87G42DvvnkBG9tRFFcBJg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=aF8cMzge;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491526;
	bh=K61gVoyc3fsiArjg4Df2i9D6Bxpc2ipCh1osoFqVLRk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ngORNr8FNlOxIgS7iBLJOmA6TIRsh0lU7oZ67dMBCkbi+25RRRRhCQ7p+xIgxh52R
	 wx61xphvHFoCdbb32tQR9c9QVN786+bt8ScaNXTu7tVrZohzUuw3NHq88+DUoC3OTM
	 qfIeYvw5QLKUdfxj/3eXqQFHoNb5L8uCOcPLnr3trTByaqcJ+3DFACuD3MCXRofCxr
	 6vF/en/Xjb2CCak5G038VicTmO5X7/aOovEJD/a5wAe6EDOvBk50DJ7CjCsKX9vKLD
	 Qu393p6iTtOrhq4qV6oqbAiYQ+eRFH1hjuqoEdEbtU15IkEbZjjcxBVHAibFaX9Rnp
	 wE/7wxW7geuJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2EA80BBD;
	Tue, 20 Oct 2026 10:18:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB8651DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E1180AC4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9bFKYXwKuxK for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 94AC380982
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491523;
 b=Z5J+jHlK41om1A9q49t7wv7IEb6kfX7kLWnLx0AL8+52vSKoPn4pzxoeBMqiR3cr2fMl
 nYBjF/EPKqAIdqjOwIWaiTIDs9ISjHTkuzGp53wvTGvX5dCM6pzHZCJpk2fDksIpm6oQv
 A502y4mbOA183NT+Og+gk4CbAAQUbB9wYYoAR+bdv6BsxtSKbQscYnwucRLdIgo3IEUnb
 EFFd42af00fPN+JKRkaxmYZ9Zo+lfTp2IywYsmKynSyBArDowqLHCyAaSZe9yXAyLvJjP
 7XWEP+cCPWcv/FbLP8e90F3NkRNZrZg2r0JpStrez7FDNccyd4zN556UrFTkVnNNrvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491523;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=qzl/Cwj38x/zULtxxjzaFPirTN0KY+tL8a+Vbbtt0tY=;
 b=MA8JCzWD3LRZo6LXNWygk4IBtJN5Yc3XHUwK+K6Vu3mgoSnsJlZYpmaMi3KeDoxot6IS
 CVP0hjnR8t7JnoHe2S09ygDdmmlvZjeze85OSknkE2TTISG0waj/BkaaB7UQagspg1MeZ
 ua98tiFdpRQYwYvupEDlNtRUw5FVFJ0ltxLSgnqJnBqQmjp2gdgmBg29QkbNzjEOZs9yA
 AYohAUHAJ/cDnZabp2z8YRVazv7hmrvuFM+nMmUoNkMy+JF5IpMQ1ayXA6ntLo9DFqrfJ
 BT0AuimftZThvn7hr9jt6D8sADB7HMBojOG+/OTPo5R1PjYcJOK5RfOUI0E5+cQqHFw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=aF8cMzge; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=aF8cMzge
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94AC380982
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=aF8cMzgetTBX5uzGF1DQuHn4FO074cowHWLPp/DEU6cDLf9HNQ9UrlJ5o1gNdLEZsrNlSOKcKGCUXmcoD2DaWH7+U1RQ2ZtkqHLr9UGx+PMezCjePuOxhbDu2hLG3h96615Mc287Zmqc36BXiMtWyPyB0ywYZfRvi31kuF1Ajmq21WwPcB8wEo4RRcvBIiY2y2sa9K6KS4rhXOE+SylkAm1NUs8Xhdlt1dXT8/2/LKdpxzVMGbvL+jLFPeP0qEP6qbOSDCqh5V6jxQlMJcw7K+0XM8BC3rYaZrtItpKXXq+QeE4gZ8jyqkOAONTWoH4EfDY7nfLElMQMZn65u/cwKg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=jDkNrdD1lL3x4A+0H+nFOlA9Fu57sbKLHcHsTslsoO0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1484127157; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:18:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJ6vV-000000081dN-2vSH;
 Tue, 20 Oct 2026 12:18:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Lothar Felten <lothar.felten@gmail.com>
In-Reply-To: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 14 Oct 2026 09:37:42 +0200")
References: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
Date: Tue, 20 Oct 2026 12:18:37 +0200
Message-ID: <87mrs8d69u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/am33x-cm3: fix build with gcc
 >= 15
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > gcc 15 defaults to the C23 standard, where bool, true and false are
 > keywords. The am33x-cm3 code base defines them in its own stddef.h,
 > so the build fails with:

 > src/include/stddef.h:18:15: error: 'bool' cannot be defined via 'typedef'
 >    18 | typedef _Bool bool;
 >       |               ^~~~
 > src/include/stddef.h:19:8: error: cannot use keyword 'false' as enumeration constant
 >    19 | enum { false, true };
 >       |        ^~~~~

 > The upstream project has not received any commit since 2018 and none
 > of its branches fix this issue, so rather than carrying a patch that
 > cannot be submitted to an active upstream, force the GNU C11 standard
 > in the .mk file.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
