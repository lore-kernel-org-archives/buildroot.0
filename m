Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848F606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NG81JE6T
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C348D60850;
	Mon, 16 Nov 2026 15:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EAFSWqGileR; Mon, 16 Nov 2026 15:40:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB41D6084F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843654;
	b=tLgBoVpJjhcstRuOCnMK43dLKjz3nBaGgo7Pqt2a5hDsZViNX4/XmXIO9ehgdsAY0wtr
	 Htb3IsD4ZLbhieRBRvo9ETM7AP7YD8RsWw8cVZuNXmtFQxy/B07K/VVNl602rcGD27Cqr
	 Em+TNpvyfFKULcW6XsR0MlNEuoTmWybTugangNYCvVIBISNYZCKkJQEtAz1q4u9QJTZi4
	 ySI3KNJYgIIYMepYy03A/pv93w1w7zDGGDcYAIuBvbjBrZEE4WjlVhdWTjE3a6a2l5VvE
	 EGdqOIuepmxsxeiPTb5Mq0SNYdhB2QkUjbUq3EfFozc16Z79Gl+GOcqC4XDEeIK8rVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AfGkWIwc9oeEMJI+/sDXKW0f8k2+pHvhS/NQHVswv9w=;
	b=aTGiPkm/kzd1bUgd0+cfYZ4cKcCM7NjDGckun2/Cl/HNXUIid15XFWRCFGCfTe8QqmZA
	 sEdTYpXVxw1kY+sYbom3M4Ef8Oh9xXG2Q9Rp6uBipAkS7l5RfxESKqahoJC19HWWSMTGB
	 MIpH0R+pSccrK6C4XzhPlX713m4EcEoIpcrf1njJgzup6K6bnskpBpuyr9iLl/tQzgUYn
	 sddC3JMM+8wi4EIkkHBY/CLJKVanuLwwGulDvknY78iuGUsCyukDR9N5cmNHp0+jOodls
	 S8SxR0tA9OQRDXiB9W/aJiHj+eZz+bfA6nknRWm8CWCD+z+EK22eUHO7tdcgoqlPJ/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843654;
	bh=AfGkWIwc9oeEMJI+/sDXKW0f8k2+pHvhS/NQHVswv9w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NG81JE6Th0j/C/MTd36YZ0CGQV/Z2rcbq675c9T8rTvQ3wuTTwC1rfU/JS6qHvZN0
	 S9MtQddbw5AyMJETiLABarRzt9UQkLsZDdOXW7RA6gqjnORMjvdQhDPIlLI/fMx7KM
	 ELjyGrTXt4f04RPo1jv1Bv1LThMQDDdi6DVnjnH4EiBsy145dXE8kUjg+c2N3C/Rph
	 1mXjXQHB/a32DgWzqylNagKJxg5v551s2+Z39wZfbAnpL+MS3aXJw/0bqDTcbEpAbt
	 AldYGiexc/phEKjklnshmw202uSvh7u1HixOuSszj/n+oq7AwpuQmLJdkYVxripkIW
	 t/NA6MCbMETRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB41D6084F;
	Mon, 16 Nov 2026 15:40:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DD92FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 049316084F
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nrc0pSydKUmg for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E8860607EE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8860607EE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso13162375e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843649; x=1795448449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LCyuCg8nbVWXXybHSkkdy9Fd35sBv8iMN2lfemzjOY4=;
 b=YIJovNTahcPO4V9/uRnQoFVoXsDhFBVdjPx+ehTGg5b2XeVSs9/aR3fXQlaPLde9VM
 5oZ6uujsgoOTrTRnIkSmuu8tjve+sc/dfT8C6+DSuxEmGpQZuKi4Uz4lbExY9tHxeeAk
 +9P40EQPnG6d0slKEAXkl0o+EKQ4AyMBOQzaDNe0cB8NkturSRjjzzNzfQeFa6oCYvFA
 QCHQMtwLcUkJXAZpp1+DUIFv4PHlTAdpcDzHrtk455iJWJh/BRWY+t7XZuA7alxiMFAk
 t8vn6CNhsWjfjtEXMdrLRCs0Ug8tha35uq7cfOBCMs5WVUCMpEHMsmVQVS8aKGAH1Epn
 tV9w==
X-Gm-Message-State: APuU4Z/BMD8YNLMT9Lk5dHbgKQPhroDp8H680eAou5SKXthIuZFPbzXc
 /60eO02eNhCh3uPUuyozMWa8zLjMg70dGWQa8GshujDf1rkvmjlLL2ssH7/CVNkzrDMlMAFhWb5
 +l9y7LLg=
X-Gm-Gg: AYBFou2MkPZXy9BMkRDF+TvspgEE9WTkfTwwwHXv0ij28Tchl6E1/XJVITdND132tsS
 U2GBCJ7qToM8cPUKUJkS1B9KBMMwTSMIrl8/0vVBQm0Jtkt/T2sJ9+YwNCAZjRNRTpRcqN6Z/hH
 4BKsOYbgz0x7zIVJT+fuhGFhgDbH3UkkGywsvzN0b9fOjIPcdUZMwSUa35PejtlrfYK+KmF5mJs
 FkpxyUTeib7tkGf3uzQV0dAGVjwIf0aBnajo7OOqiVZvEzXRNLG8DoFKw+e6216FnMMndIvXjDu
 8meJKMcEh7Tkxbaph5qBGpSPzIv2Ba2YDSCnslo11qizjKmh+u9pjZyPlRfXAFGDnVUrLUXZHCf
 J6kJwvipID1N0o46/WvMpoLInhvm/nEa4RzD3ykaNolliXbFUQ5jUDACg7JGezuCW83cRC/18sM
 4uClaDDtsanFmni4IR3E/WQymjhFcOa9lyMH8kYWyEtQbNPZu2lFa858yXKU10FH5fNORT1tRXt
 96+7wUNCwDr/GTBHYzMQVvH7XuAAdcv2Fqs6DIgkGvRbszpID1bnWzUGUXiN6tDlMPDhYV7ufE9
 IXOxHjt3iT4bJITvkdkLRoMawuh8MgI=
X-Received: by 2002:a05:600c:6992:b0:4bb:68b9:f610 with SMTP id
 5b1f17b1804b1-4bb68b9f729mr125372655e9.9.1794843648870; 
 Mon, 16 Nov 2026 07:40:48 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb64ec7b58sm240843425e9.5.2026.11.16.07.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:48 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:45 +0100
Message-ID: <20261116154047.726129-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109155508.583886-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/python-dnspython:
 backport fix for GHSA-vvf4-9x63-8xvv
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulnerability:
> 
> - GHSA-vvf4-9x63-8xvv
> 
> A maliciously crafted zone file could use a WKS record to consume
> excessive memory and CPU, possibly causing the process to exit due to
> memory exhaustion.
> 
> For more information, see:
>  - https://github.com/rthalley/dnspython/security/advisories/GHSA-vvf4-9x63-8xvv
>  - https://github.com/rthalley/dnspython/commit/388db14ee9923288f6e73f86e482c77706e59d73
> 
> Assisted-by: LLM
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .../0002-Constrain-WKS-bitmap-size.patch      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch
> 
> diff --git a/package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch b/package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch
> new file mode 100644
> index 0000000000..369a99d85e
> --- /dev/null
> +++ b/package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch
> @@ -0,0 +1,48 @@
> +From 388db14ee9923288f6e73f86e482c77706e59d73 Mon Sep 17 00:00:00 2001
> +From: Bob Halley <halley@dnspython.org>
> +Date: Tue, 3 Nov 2026 12:01:13 -0800
> +Subject: [PATCH] Constrain WKS bitmap size.
> +
> +(cherry picked from commit a62e1be066da0ed71b5b59f37435bb17cfa0070f)
> +
> +CVE: GHSA-vvf4-9x63-8xvv
> +Upstream: https://github.com/rthalley/dnspython/commit/388db14ee9923288f6e73f86e482c77706e59d73
> +[thomas: backport
> +  - stripped tests and changelog
> +  - adjust context to 2.7.0, this version does not have the to_styled_text() method
> +]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + dns/rdtypes/IN/WKS.py | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/dns/rdtypes/IN/WKS.py b/dns/rdtypes/IN/WKS.py
> +index 881a7849..365dee61 100644
> +--- a/dns/rdtypes/IN/WKS.py
> ++++ b/dns/rdtypes/IN/WKS.py
> +@@ -44,6 +44,10 @@ class WKS(dns.rdata.Rdata):
> +         self.address = self._as_ipv4_address(address)
> +         self.protocol = self._as_uint8(protocol)
> +         self.bitmap = self._as_bytes(bitmap)
> ++        if len(self.bitmap) > 8192:
> ++            raise ValueError(
> ++                "service bitmap must be between 0 and 8192 bytes inclusive"
> ++            )
> + 
> +     def to_text(self, origin=None, relativize=True, **kw):
> +         bits = []
> +@@ -77,11 +81,12 @@ class WKS(dns.rdata.Rdata):
> +                 else:
> +                     protocol_text = "tcp"
> +                 serv = socket.getservbyname(value, protocol_text)
> ++            if serv < 0 or serv > 65535:
> ++                raise ValueError("service must be between 0 and 65535 inclusive")
> +             i = serv // 8
> +             l = len(bitmap)
> +             if l < i + 1:
> +-                for _ in range(l, i + 1):
> +-                    bitmap.append(0)
> ++                bitmap.extend(bytes(i + 1 - l))
> +             bitmap[i] = bitmap[i] | (0x80 >> (serv % 8))
> +         bitmap = dns.rdata._truncate_bitmap(bitmap)
> +         return cls(rdclass, rdtype, address, protocol, bitmap)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
