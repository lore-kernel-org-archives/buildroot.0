Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F5606B2ED
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e7NW4ZbX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=HRaKYf+V
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F24040854;
	Wed,  4 Nov 2026 20:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjiyzxS4Jogd; Wed,  4 Nov 2026 20:42:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FD844084A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793824955;
	b=Cy5fWreQSVxI2jX2z7KGypR4Xc5L2z6Ck3PE0JHM/Fp4VSCqd5HUX2DeExhUgiZ4oypx
	 1ajpNdA+CwLeLUl5Z8uqShBWLltt1m6EyHfF5p3qt/BkWQWMsQHoUYcQJ0L0Z4TitSjkE
	 Q6rb+MczvB3DWNQDLJf7e69JEjh5hDc49Mi8z/EXU/dCxwMCEMA8tHGMuOoETUfukcuhT
	 SKyXYJOV7tCq0F/rQWvn2XWZDwNn/137FusCTXqs+Df8X5PeDfVdKuRfGdtIbWgEZrfYg
	 lPBopKeI7obzCHbKjp0Vgky3nF9/kALU8nDsqf4tunXEEfne5UODZZIZh5Z0SFDwE4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793824955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:
	 References:MIME-Version:User-Agent:Cc:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=heZSnumfgTLBDcjqmTzdWJClHYylnRX527unJvHaaZY=;
	b=PRm5oloyrU/VgdWl6P2VrH/1VXMbEEIXIRJ0ZInqwib6FGitakCx7G9Tvsvd7qaC85Vk
	 NvMHkFGmbjAbJS1UtQhnw5UzsaszlmqJ4VJ2KSNBfVbY8jSyyEkItzlsX2PVE22/MuY03
	 wMPZWqMUTBsBf0GHeECPET647F2fHMh3iBJ+xrjL75I2onek947iksvgjq0daCPEU+Bzf
	 ykBOPQR+XsnGI5hnia3bKxEOhJnO8FMgVYZ43yQPi0ZT6/Hx2wJLX2zQdZhR3P4xMLGvN
	 W6DDpSMz3mTGR/G8lCfOPFQpy5Q/H5pRnflzOqIsJ2Et7yAr7m6Yzzw7dJKRPH6WDvA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793824955;
	bh=heZSnumfgTLBDcjqmTzdWJClHYylnRX527unJvHaaZY=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=e7NW4ZbXpvdVPoHG1NUXTMwo/bkfr40utt2XlyJXyicIML3gmn3+7HK6esWesUIbC
	 c7Bmy24poZglD+YDf0p637tclltV81dkzlDhLhdRzcAFyeHUsrn2ynUlbj7SlMXqtu
	 7h0kwq9O3tWsI9NXRCK1IKa1J6m4NND3P1tf7YiPrKmLOW0KqHhp6NZhf8csZNDYLy
	 QmQ8uTBcwHo2lOS+8PnjMmaV09DovJP80nQdhK+M41Yd/F+SiyH7KDo5YvhzSAGhN4
	 RT1RaH6OsWru3EqxYNMamr+EmFJdBQm5uvRDPHmNUufKXpmc8mFaWGKwPdlrSgTa/Z
	 v6OksmSfiUprg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD844084A;
	Wed,  4 Nov 2026 20:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E647B6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03EF0811E8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs3rmw-BOgwe for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:42:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1833810EE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
X-Greylist: delayed 315 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Nov 2026 20:42:32 UTC
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org
 header.a=rsa-sha256 header.s=ciao2026 header.b=HRaKYf+V
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Received: from ciao.gmane.io (ciao.gmane.io [49.12.148.96])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1833810EE
 for <buildroot@busybox.net>; Wed,  4 Nov 2026 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=m.gmane-mx.org; s=ciao2026; h=Cc:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Date:Subject:From:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ei8ZFTt0U1o6r3au/7SH8HUOevkZ7yrAl0QNlvESEX4=; b=HRaKYf+VaY4D3i+nTmYT0sAdRG
 Za4OO7YR81bvarIoh3stgUp0wD2oKT+qBndxkA0/4owtFccMpLbDaAfRA2Qw0Actn1LJQubiWJdkN
 DQGM9Ofn08Qp79fzD1YrJdPK35P7qPAIeloDmWZUoAGEK+Gh6DSK26mV5lqOS1EJ7uhWJX5u1SpIe
 sC5DYFvSbFFARdCWSZcnxxGw75ZGJVC4iKN72da78EQIucfY36rCJxzJdwFv7a+Cdf8ubpsR8p3f4
 PlATnLQtOCRA2q1Qoh/tvjTL/JCBXF89RRjPlf0K9wRR81AKoHhbyGATQPNBA2XyLrlHDguOcR/Yw
 TvhQ9IKQ==;
Received: from list by ciao.gmane.io with local (Exim 4.98.2)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>)
 id 1xOhjL-00000007FNM-14Xq for buildroot@busybox.net;
 Wed, 04 Nov 2026 21:37:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 04 Nov 2026 21:36:35 +0100
Message-ID: <pan$e3688$bbe879c3$9318f006$3db2d852@ID-313208.user.individual.net>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net> <auO2ugenOrGrEKGM@windsurf>
 <BN0P110MB16090AD1C42FD6EAAAFABCD69F6DA__1775.67241932906$1793370569$gmane$org@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
 <pan$1b902$b669761d$4f2dfd93$7e06a599@ID-313208.user.individual.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Wed, 04 Nov 2026 21:22:20 +0100 schrieb Bernd Kuhls:

>> - I noticed that we're building the interpreter in shared lib mode.
> CPython's `--enable-shared` is interpreted differently than general
> autoconf recipes. There is a new flag I recommend we use in 3.15 [0] so
> there is less of a performance penalty on the interpreter.
> 
> I tried that option but got build errors:
> /home/bernd/buildroot/buildroot/output/per-package/python3/host/bin/
> python3: error while loading shared libraries: /home/bernd/buildroot/
> buildroot/output/build/python3-3.15.2/libpython3.15.so.1.0: file too
> short

Hi Vincent,

short follow-up: A second try to build python3 works now with --enable-
static-libpython-for-interpreter, maybe I messed up my build dir...

Sorry for the noise. The new option makes sense to me and I will add it to 
the version bump patch.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
