Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5B606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DyiIn/JY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=ZDAgv9EE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 778B96063A;
	Sat, 21 Nov 2026 10:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82EQvZL-oQwY; Sat, 21 Nov 2026 10:36:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C11486066A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795257416;
	b=L/OYnLua+l5bxJCcbjI5BPGMRi+eBTF9kxRi91cuTwS5cjR0U3uz1ke6M+fuNwIn+jzP
	 AkGcQHSkCUX17NlbJRNzdbd0NxjxTuITZH9HzvnPTh5n0ZILVMrtzorLwN2eJBQZb70Bo
	 DwOSNuKd9579RvqXz/5PU9gZSXzJHKA4osXJj0w9nx56oC1+VcunZeWt7WRK2c3AMfxD+
	 tUwXVj6+MToeJ6VRmcS+esOMbNELLQfvts7oUA09SuBLK1wHDk+rQ22lgr6OPYsTAn9we
	 fTb0/CQZ5ffG4swpAx/mDDh1GTWfuryckXqtiiaQETXOXK8mFRwv5Ty59xORL1KwX1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795257416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=L5dqzlA8z4Lc2cDTgrhm9grKqCliHlNBsLCnYrdRHAw=;
	b=rAnlehAI5JdWFw/skk5ODxcJFp75QpYHgaviOXaBCx13QXd8sQuN/PjS6D7S2NLKQpYx
	 thxOnik7vn62OvxHqe4hhjf1M6iFW7iw8PH1cQ9zm7apM9KGX6NkTdBHGy2VkrCgryzQG
	 bCyis9zbaWjBViqJ58X+N9uuCI5a85QSdH09YTN4GC7edlnPhPVffGq4+ZyMFL15t77qr
	 hihj0qgU2l75yGi+XyjkHXN2S1MsXpofLBR3RYN6OGlt+DIPjt7oQTfu7o4TW1pXBTpbV
	 dMcuSO/XSX2qjVIr2QJ15TBE6YgtxYarM7OGBN++jeAsDHbc5NaWHkUNhLZeex9zfPw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795257416;
	bh=L5dqzlA8z4Lc2cDTgrhm9grKqCliHlNBsLCnYrdRHAw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyiIn/JYeiHLuffJgeNQgEX/28MQdhwE+V+W6qMAa5N1xJSe/qRGHJJ3vHbBXy+Zo
	 Oy5nXsK6pkkT8qIWscf0Py5AyZgjaM7Twy+jzCH0VGFsiVfVHx1SxH3PY2P8zjNu7V
	 vDx/ArCHUerQ+6uaTTC+qv2fpQ8ZTzogz+quKYLvv5ZBrB6wQpvlU92woehrK4rnPa
	 EpDZgYe5SU+7xptcEOndFjXisY7J4XhHviQKi/oAWj9tou0EyOBO44qg5b/mb8oV8g
	 +JqecwEerbzo665CtKCDqNB6TAAUVZUVlUXR252ZxSuk6h9UhEjK4EPjwFuAlhH38Q
	 WI2xH2S+RysaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11486066A;
	Sat, 21 Nov 2026 10:36:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5C971AB
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBFEA8133D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivFvYTAOJvow for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 10:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9148681415
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ZDAgv9EE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9148681415
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:36:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZDAgv9EEF9ZYLQZeYXpVGh20awlu2Bkyi8MLzVYjKtQWwOQJnXIMiwFamrK/qWP1CmXW44MqlxFqN/gxseRgM/7qgAyWFL+7f7Kx6/HzimDDJ2sMncQhU59yMaQxWUcGnb9OK0NIWycXSnVV/zwHMenoqyrgmJ+DsBQL7wU6ikxUUz3veNGN9V5apVJSZagwoSfj//QkEWMH6tq8Yf7n+LSr4+q71l/4wLf3ENEgK74F7CnEn+wzUZvH8K1JMlhUr4doZNlCgElOJ/Av/LohcMAmGpkn1gpKVCG0V6XW9iM4YPHDTXf2zty1w5bDNoGeUDG17fdnyc/5dvT6yATxHQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=UkAZ/V1TFHGWku4S/ThRY++eR2EpT9wnlO7re/uSfHk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 331000415; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Nov 2026 10:36:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUiST-00000004p2a-2ZML;
 Sat, 21 Nov 2026 11:36:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <f5679391-fea4-4ad3-a0dc-01e7031dbd7b@oss.othermo.de> (Sebastian
 Michel's message of "Mon, 16 Nov 2026 09:15:27 +0100")
References: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
 <87bj7r8qcv.fsf@dell.be.48ers.dk>
 <f5679391-fea4-4ad3-a0dc-01e7031dbd7b@oss.othermo.de>
Date: Sat, 21 Nov 2026 11:36:37 +0100
Message-ID: <875wxqtqru.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wireguard-tools: switch to
 git-based source download
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

>>>>> "Sebastian" == Sebastian Michel <sebastian.michel@oss.othermo.de> writes:

Hi,

 >> Ahh, as the author of cgit, Jason would probably like to know about 
 >> that. Did you contact him?

 > Not yet, thanks for the suggestion. I'll contact Jason to report the
 > issue with the cgit snapshot download.

Did you hear back from Jason?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
