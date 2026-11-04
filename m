Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A43606EEB6
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q3enJ5UQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=HgZU4MaS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FAF84046C;
	Wed,  4 Nov 2026 20:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jdEwV0tcl35; Wed,  4 Nov 2026 20:23:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 34B434081F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793823793;
	b=cSyK0efmmoYLBP68y/UjsZCmVAeXpVQbdrEB2jBqTs9o/hyzATfTug/cxve61/WTuVg7
	 D/MQj27cEV+yyQ64cIEWtTOhIG04xgnJEh87B/We3yqTl6zRUElXvMEISQz7rud7goM2P
	 OwSJF5HRNasAkOLGr9fgxF43BwLLX8rl7ZpT60TwnAnbn/L4l9d7y4sAKRX02891qmP/0
	 y7bipJVKsjb+xjGudzvPT3pqL+FbYG/o8GHNdynV9v3WgvEa0OEcic0wD8WBTrrxxdIQ4
	 MRgf5MaCXDHju6k00RLT9l3IIeBozb9rB/n9/e/sfFYg6zB3+RH1Q2xWeDnXyWR01Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793823793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:
	 References:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vj2TF6G7VZJtcRss27R2JZnA7nNsB7QJFk08AIPBETo=;
	b=Erxt5qD3CXVsNMCjjEjeJAytebM6S2L4mPYsOyM29anHGhed9P232T4sAoR4DJLQy0dk
	 hlik86lw37qutK8fl49EdMoTZUiwA3V6+t4gjHOKcrU4XrSY/L6EDoIAF4IDOGNw6XbwA
	 Popnu4QHpqjz+zBIpQjpquG0AiircjdQlK15Nb++g6T2WR7NtU3kte9PolQiP9r/V++Ws
	 c2JUDhYd/Gat8HC59d8fjOOuF70LqRC6gKFoiH1hGszw/PTEpc/NxYzVElgwHfd0dtkvf
	 12HF+9sLty0jGR68wV6evf7aZ5x4c/mCbsaGm2o7a4DPg9U7ctQGIgkUA1qilQS/DRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=fail header.from=kuhls.net;
	dkim=pass header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=HgZU4MaS;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793823793;
	bh=Vj2TF6G7VZJtcRss27R2JZnA7nNsB7QJFk08AIPBETo=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=q3enJ5UQX65K99b++rLWMzwQUXO5RntNdDbNhG+kvwNVOe+mcoktSQQUNxQuYk6Tu
	 bCA0FdFaROpM2YtWcC9q19Kks94SiD0wyMI11KgVQw9C98jPlvkUMpPzG90x+bOcXS
	 ZjmTqAD8Ik/b60jhD6Vct14y1gbAiewvvXu/jwLk+VwWwHqHdD65I0ORtYYk10g3si
	 8Lr5W7AgyBJaPlFg5WFlDRL7Sje9vjsy72eE8AIVUry/406OjH8Ibs+YCzTQC+VqzG
	 ftljS2jYAgEPXS7K/LvcoCcSbWRQiaAKsMZvhjp5dxV3HvS5hQ43Do/X66E+h4SGyK
	 o6TaG1zqvPQeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34B434081F;
	Wed,  4 Nov 2026 20:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F8C9C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE054046C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAsgU0bGaJQo for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:23:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A0C94081F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org
 header.a=rsa-sha256 header.s=ciao2026 header.b=HgZU4MaS
Received: from ciao.gmane.io (ciao.gmane.io [49.12.148.96])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A0C94081F
 for <buildroot@uclibc.org>; Wed,  4 Nov 2026 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=m.gmane-mx.org; s=ciao2026; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Date:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hPbnqwA5Ory+1ygfadrjnTFSGSJ7n6r0TuKiz3RDmkg=; b=HgZU4MaSICHKSfHPf1jLkBrkDx
 Wwo6xbfqzct5cqnUtgSKM+lokkYoAgQmuLlq3NgtG8NAam35vpDmvSlUxiQTDxjf20bga3tmVly5A
 BG19MIbZkc0Sz7rwk3q7ieiNOr7Wf4XW0zxJlkyIOEseLVSSkhOE0z+d3JL15hGXy55kxFHhQBjg5
 slOz87/fza1LTidA/IVjPWjxwljqyEXbuHP4rr84brRbCRylnfWJ2WNDnVLYwiEQIP+bGEDoDv3C7
 OgcR4ZdMF5n2GCUGLl+05ByNwrQDecFmRkDn17OrhDXlKCY0cAHaA/EFp4km5ldzfBuFryiv3wUsn
 kiOiN5Ow==;
Received: from list by ciao.gmane.io with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xOhVh-000000073Fh-3QE6 for buildroot@uclibc.org;
 Wed, 04 Nov 2026 21:23:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 04 Nov 2026 21:22:20 +0100
Message-ID: <pan$1b902$b669761d$4f2dfd93$7e06a599@ID-313208.user.individual.net>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net> <auO2ugenOrGrEKGM@windsurf>
 <BN0P110MB16090AD1C42FD6EAAAFABCD69F6DA__1775.67241932906$1793370569$gmane$org@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

Am Fri, 30 Oct 2026 14:29:00 +0000 schrieb Vincent Fazio:

> I may be performing more due diligence than is necessary, but here's 
what I know:
> 
> General:
> - python-dbusnext is broken and needs to be removed in favor of python-
dbusfast (already in-tree)

done, will be present in my next series:
https://gitlab.com/bkuhls/buildroot/-/commit/
659ea2539f3e905d5b93663135c0f0f07f76974a

> - I noticed that we're building the interpreter in shared lib mode. 
CPython's `--enable-shared` is interpreted differently than general 
autoconf recipes. There is a new flag I recommend we use in 3.15 [0] so 
there is less of a performance penalty on the interpreter.

I tried that option but got build errors:
/home/bernd/buildroot/buildroot/output/per-package/python3/host/bin/
python3: error while loading shared libraries: /home/bernd/buildroot/
buildroot/output/build/python3-3.15.2/libpython3.15.so.1.0: file too short

> [0]: https://docs.python.org/3/using/configure.html#cmdoption-enable-
static-libpython-for-interpreter
> 
> -Vincent

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
