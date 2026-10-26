Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B912606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=acDEVFrF;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Mh8XUkhV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B571405D2;
	Mon, 26 Oct 2026 06:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA1my7QqrfoW; Mon, 26 Oct 2026 06:06:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 796C1405C5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792994799;
	b=L05i6bprPNw5TTtfxCmPZ5QB7k88T5eRV04HdYI0BQqrEloiYUglvyyOwNn7w7wCVsoD
	 IEqq4h3MfLnlljBwH/Z1I5YEH8U62LF9W9hEuf/R679LlK/TRUWfTUJkdZnc4iU5sStNp
	 LrFge1oqSL90yhH1/sy7DfMdZNKD2W4IOF9YRG3YiJZHSbUIfq/dJdFkYPrO1JzOInFg7
	 9vqP4Mu7OqMDjTWq5Pu8HibHW03gHvj8oUKE1lNAXmh4IgOGej3q1kGgLRCN8ImJXUdo3
	 FIcp14n8WpHvyd6fTILV/6cJIxWsFrF2rZJMK080fbwhyJdnpw7cF00Sf8WtYjX3qww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792994799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=au0hYU0ycjdc+8ilATpl8iV8ojeCdJR8uTYDhxE5wWc=;
	b=sQKkXjk153yCW1ePxha7YYqDr5br8keNap+ahpLcr/f897FNYUUIjBG4jxdyZz7zobdP
	 gi4jlqzr6gTXZuCAAqtnBn2qzgJ0Jhs+l2sZeJXtw+8ZEYHC0MbzH4bJYfpkI27mN8bCG
	 fSWfQfw6vs0H2JeXmo9OF5OnsbGFASPR1lIAQl5MYhIRghoNTPzfc3zsovOw9yshWmhBV
	 EKLj0RLpCOfsFcqlAkL/g3Y/m+eK6m+psJcy6IPUpl6iVw1cswrm0cxuRk2i1QvGOnlJb
	 d2OBK4ALQIn8LCjJqhjg0Y72885xjDzaMAnctWZJIaJB/6iOHI3pepIT5D0XKTmHNnQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=openadk.org;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792994799;
	bh=au0hYU0ycjdc+8ilATpl8iV8ojeCdJR8uTYDhxE5wWc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=acDEVFrFkrp83UU3Xklm2WW7ypvN0xtjt1Vob/5EBMYH7U5l9ko4nPrC9UqqMwUVC
	 gLjc5l5E6xmpBReqSCD1flv7hGVP0Y2FLo7iPGfP2nYE9iQi/vqojGc/PWdVpRvBMz
	 0d1UZV8V+jwk3Ph5rZv7+WXxb290Ju5tTTzRIsJ43SVT2heM6NDtXubAUnbqvhE0r/
	 d24Xjhs/c9eHD9as+IvC2hkZ4GmkkSA1+UpVrkhCZ6y1cpCBbNk4EDR3rl+bv0e5+Y
	 msMY5Z/nRF8dJbk98X/cbQyr/epukFfSsF8p7uxN21n+Cs3xas4GOmfOJGulSMjkYn
	 HEGhgYHOeoxHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796C1405C5;
	Mon, 26 Oct 2026 06:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55C2D279
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 466E5405CB
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoXCLtFyru2v for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 06:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 859BE405C4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792994796;
 b=alh0m4/lvn9WZNgbE+2txkWkMPKPqKJ4G3Kq1FhO42vR6TwwsoXWC55+Nyn/x+eGpFzZ
 RZOY3U04zS4oMWHeNVGNqt1sePJTsZbsuIsQtaQ9zVHYSdB+4Ogn5n/MYx+a5HusNhyx8
 ygdFbTue6LlhaJv0PYs5v0XQmCND03jIoIaZkDVI9VuTPmuumaYYM7kf9KVOPqhAKBAo8
 mtaToaOWMKr4Dt2EtVVE7dKA4KTxu6NADM8HPC3Nr2atVhAXgMW3C8WInk0o6b9Xf2qoN
 1aPUB5VsLg+p5mH8/gLm1a4Q0KgjM06CCuVqkzN1E01Yzs2ubzU6Zbv7ylYEHnUFNAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792994796;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=765GloyoTNtqxRZGHgZgXo4IEx+/yrKas0OnEbX3UKI=;
 b=YjOai0xeZd8puYDhvy9/T8H9Xm45dhpjkQlqEBbPsyo/BSrpt/SWDPFMWKmeaiMVRfXA
 nFrpUVj6Vg/t5AbEFByWP4RWNMFDxC89jeNBovExeOhQX64QGA+pggxn5rMUnPBJ9vYxb
 FFTEkjGGi9TlNoT3/QWaZLmoK87N9LaDdM9TxuGVxG7BWyM8uGkNRvICX4h+34UZX8PGX
 UG7LFln3TpuzPLFp7zH4dzLbU2rLYUOheRvb5Jq+7mJMs5EzRyZF2Nijz3FnXTR7O7rP8
 zLUh2Q5pNcJGfv+j1S0pl+XjFLILKp3wvRUPFwjgVbO22xPZSCrGo60Ewryke+7yUeg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 859BE405C4
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792994794; bh=765GloyoTNtqxRZGHgZgXo4IEx+/yrKas0OnEbX3UKI=;
 h=Date:From:To:Subject:From;
 b=Mh8XUkhVovT5l9mD/SkSA4z/6PBBni3n8+gBPtfZqqa7KAqrvXQOShiTxpKjY58vk
 Gghg1cAxMqMCcZPoLaZ0ylTtWk3cHenTVQaVems9H4RUlmcfhNe3a+Vy/XY27KNHEH
 3y6YttiHGlwtgHcVJvbWXwas5v8pcja2DHAP8l8QKet3q1baE0IY+iAI6WMyNiYHKO
 tC6ngDJrsvopurhimQx7oaAJTpxy8BQipNkPmmGE/c5KCFmG6stB5QoXmFMbx0QdOP
 KWreOlbgwF/CtQmFgVXalKFHmuaS+1VqXFZKUs1b9eKt6+Cx+06yqB4GBrZJ27xEiB
 N0fqeqeD9auzA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1F35331E0B39; Mon, 26 Oct 2026 07:06:34 +0100 (CET)
Date: Mon, 26 Oct 2026 07:06:33 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <at7t6Uwmu1T_lD8h@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] perl packages for LTS branch
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dear LTS Maintainers,

I would like to ask if it is possible to add my maintained
perl packages from master to LTS branches, namely:
package/perl-cgi/
package/perl-cgi-session/
package/perl-log-message/
package/perl-log-message-simple/
package/perl-switch/

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
