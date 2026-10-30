Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F414606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CWeN65al
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB79B81DAB;
	Fri, 30 Oct 2026 15:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz9Vbwsf9fuy; Fri, 30 Oct 2026 15:31:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 26C5F81D65
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374281;
	b=jfmwJVzcXOUSWpsoOJxdP9zoVl5A5PUIeiQ5sksXAIS5a7jUEgEk6Vazu1JE9Ds6ueSp
	 m0LN/Hv7H7Ssp2JXBkArtRS310xwSEi+c9au8QcuorQRtVkVqzF065dxq5HKfxEdq7z+p
	 ekA+GLBiA56PGDk73Iho/iThZT8EhmOlCZHIT/rO3pjUDIw8018Sv/2a3XobqmhoDDKeB
	 hJMXSKqkd/oy50fIfI2PvA0sxDkmiuIx7VsALy6t+dJyRGnvXW5VxOzjlU7y2LSy/o9xW
	 sP+H12uLoTJ1d/KH4e4E3F5k9mdo7SSqH8TWSvC9caYMgr7NsF4uw36GwOgUy+yTh5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5iU8ad0NP49ByKKfVuL/NqzPma4aXKgLn4UwAVdeP7M=;
	b=oBfgDv9zOGWe6BEIUDq2qaTospQHwwzuhvouOhBKFQRpQe8yjXXaEP370mPkb8IWPr8O
	 iN9nwMiILmRrGSqgJNfIWr370/LxpGHP7vu/5m1HbGT99YvmWUTm2T3YccDCpirWQYW4N
	 9TNThu9BDo3N/qsYW9rox66sdMcHs7CX2bwXWX2QGL45JPKz+OvAdXRnfzM7hL/rObM/D
	 8uFO0j8A10lbWGy74DZgIZom+4vVY+hu/ZxN1Vr/qq+nKD1+Z6qeTSGzA98VXJz9XW91u
	 q3hxBTWO7tlPZVUOytoBO0BgYpRy/EXOqavLXllsNBIJERgpkMPDAqG1fIniRw5o4MQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374281;
	bh=5iU8ad0NP49ByKKfVuL/NqzPma4aXKgLn4UwAVdeP7M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CWeN65alCjD/yW5bByzVgwEMQ5BBg9ej8NtoDU1aFNudJF0WpEGTZy2MpKlq3bw5B
	 73wu5EfJ648z7pJWal4+TJvDZD9y3ValrExA2Wp6p/K13a19130+H/rJOlc2z2CC7B
	 imGUR+Im6ifyELG2cOhrtM/7Q2Vjw8JV28Ntwvq63oVAOBB9/gJmWFTQ8/HZ63fCsZ
	 ZG3N0DaC23vW23tpoXl72bU5Yo0j9KjuOWZ1yYTKWTK3y4vBJkq9u8giDDDzy/94XM
	 +LEOeYVZ5lC41PJTERbwJxKFZ49JCdCdAlU6MNlvxFYv4i541aGOW3tZ5vPjRBkKzY
	 STlJLUGOqOi2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C5F81D65;
	Fri, 30 Oct 2026 15:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CCC7D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E83D081CD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjrKmr_MOqXz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8346081683
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374212;
 b=ZspqM4RQea66jNCo5TuHqD0a6DEXs4prmYN02Luufn6UeUWtjnFnVJgUDT7mKsCQ19HI
 HGI/o3CD+6rM6RRSHZyf2Ik6idldq02V7D0x1U3y3J6VbDNd9bldsOSaPWy12xCIKC5B+
 TpcJQRPHlHzhLGBOsndKVO+EpxeYcwmHhRzMXQYHa9MncSKjq+vvNOrQoeWDMhbc9LDRa
 TO3Lav+WUmVdUuVbSFOznyeQF/003HSD9VQLGWfChmC4JCQ1TyS88iwSSfafBt/7YgZvG
 n7fmCd/uv7nQYhlKr3EipR/XIcaLMTVCnkjHvgpQGjHkbjPC8I0RJmLsJrTOcVdeShA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374212;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=H/hYX55yYDA9INtAyYQ13QsP2UsBklYrIJ1OQBcCbBo=;
 b=ptf71b61owWo+ofLIdRv0JdK+s5wLFdIdMNuD4SRr0rUTqqrbwc7A2PmTFG1VJLKj9FZ
 MhrpVoZtbXrzVrzCTIX7hHFu0fk9eRNWOw1Ujgp/bdfa4ACaHtKtRTO7n1ZYveREyc6Yk
 BJTs6wOZim+qHwDutxPsWRqXV4JnGQANWS4IYU8yqzgqob5GpZIsTK0qQASYOvuFKWBlG
 GeTHAX5zcNpZsxYh6mn5pT0o+QA9AKUb9ULO9BqQBPCqGRpn6/1MYbhZnyJbrWjCJZmzH
 gwC9aJfSjOHEKk+bP283p6F1sRMla275paJQ35VvHr/MfwP/wJPir2dlR3kBoZ2UjEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EUXs6JEh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8346081683
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so821036f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374208; x=1793979008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H/hYX55yYDA9INtAyYQ13QsP2UsBklYrIJ1OQBcCbBo=;
 b=ZlNAvwNc3XiWID0mF61H7WnRTC9T6xELdUgGQHgx29Sr1COhIAe21W6kbsfbyg4dZ6
 9xpasObwKeMfwZ0YdDEp9VnO6Yn8DfWt8S+4PB6+Rwx6MbqEQaPINUzEbG3xkRd8ArQ3
 2vNuxmoqFXx9/bcheVKgvb358cvxRWRXdxcqEcz+TX0Q39xYIqvJxVUjRD+W8sz+5qXD
 S7HkSPaYIeNb+1HxitQTNc5w5SG9XTUg9tA3SOaw+DHFmVYdvNi2+9mOw9lSp5TpKNV7
 bMMkuX1UkaxG6NxTgWjYYseS7U/9znMLQkE9djUtHyjQxHNKIM5UTmqgPfjqnmXqzvMl
 z9aQ==
X-Gm-Message-State: AFq9FYJ+Ot82ybgs+bby81vWhUfqNHgzfq3OMXiNQLnXVa8Q/4QqHhJd
 i4ivvcskd5hOP8b+EqRlTV6zwVQN9uUxNwG2NtC6bvAsQa51VPuN2JBY2w+YCODLsSya7vo70qY
 VIaI6Z2I=
X-Gm-Gg: AYBFou1czPyBWKBG2fd8J3z1c+Az98vGP7LjHlHqpxTM17FOMRET2LwuXH9Wi9lWkHA
 agRJ0PBBWTzmLF94SRLthprhVF5y0ye8purW3BC1iVIwRU31QzKlXkccvw4vktc+12k/f2kr/Mp
 q1SH5UBlosTKP3e55dLsEOO7c/kZXqfz9dd320XlgGTIoPRMSFlD7jD6bnVKB53AQ6HSa4b9SzE
 EHMZyArSXgt2o5K2AjzOs6tQMVmW1G+Mi2lQG5i7zg6oDeXphBH1yuGf2aGjR1rG5kBV2r0+QmR
 9tNdEvrYfr4/BWeONjkdxXpVbwav8OQLhPXhthfJA292dnik36V4saDmq2VH0NCLhzIEbPDhJBa
 uhdQksHUMNt58x3z8bcQEGsqcpqWWyyRhT3N9s9k4X2Mgtxe4ZMzLfvP9O2o2IwCLVzqfGa5087
 ojePnHv2apowvAOm/GNklnJ9LCSSRBG5S+0BcP5PTS5zMBrhE057tIamRdKtonqHYdIfpIY4PbC
 CK+lqZsJmiie8xhkqmf3xhJEosOAQMlwmHthVoMgzIutSuAw4KeDApO1+B3qfQvNywYZT7VysMh
 DpadiAC1fqRlNQzQgTqeRGdmojY2xVAFvdzFjQ0dgls/eqncVGyT7zVLWWUbxynvgESMF5HJ
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id
 5b1f17b1804b1-4ac17471285mr58437065e9.7.1793374208488; 
 Fri, 30 Oct 2026 08:30:08 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d3e9sm4109810f8f.6.2026.10.30.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:05 +0100
Message-ID: <20261030153007.1908308-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025174835.190885-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: security bump to v2.4.20
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
> See the release note:
> 
> - https://github.com/OpenPrinting/cups/releases/tag/v2.4.20
> 
> The additional patch is required to fix the build with the option
> `--with-dnssd=no`. This build error can be triggered by not enabling the
> package `BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT` [1].
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-55453:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, the backend/ipp.c
>     quote_string() function preserves carriage-return and line-feed
>     characters in a remote printer-controlled marker-message before
>     report_attr() writes the value to the scheduler status stream. The
>     scheduler can parse an injected newline as a separate PPD: control
>     line and persist an attacker-selected PPD keyword. The reporter
>     demonstrated that a later print job on a Foomatic-backed queue could
>     consume an injected FoomaticRIPCommandLine value and execute in the
>     filter context as lp.
>     https://www.cve.org/CVERecord?id=CVE-2026-55453
> 
> - CVE-2026-55467:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, the cupsdCreateJob
>     option-string builder in scheduler/job.c maps attacker-controlled
>     destination-uri and pre-dial-string values from a configured fax queue
>     to the phone and faxPrefix options. Unlike ordinary IPP job
>     attributes, these mapped fax values bypass the control-character
>     sanitizer and are copied directly into the filter options argument. A
>     user permitted to submit a job can therefore inject control characters
>     into the downstream option stream. The reporter states that a
>     downstream fax filter passing these values to a shell or modem command
>     could execute code as lp, while the maintainer states that CUPS has no
>     confidentiality or integrity impact because the only known code-
>     executing filter is optional Foomatic and addressed separately,
>     leaving possible disruption of the affected queue.
>     https://www.cve.org/CVERecord?id=CVE-2026-55467
> 
> - CVE-2026-55480:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, copy_model() in
>     scheduler/ipp.c creates a predictable TempDir/<connection-number>.ppd
>     path in an lp-group-writable directory and opens it as root without
>     O_EXCL or O_NOFOLLOW. Exploitation requires an lp-group process able
>     to write that directory to predict the connection-derived name and
>     plant a symlink before the root open, while a privileged add-printer
>     or modify-printer operation using a model PPD triggers copy_model().
>     The reporter treats an existing lp foothold and the privileged
>     operation as distinct prerequisites, while the maintainer assesses
>     high privileges because installing the relevant filter or
>     administering the printer requires root or print-administrator access.
>     If the race succeeds, the root scheduler follows the symlink and
>     truncates or overwrites a root-writable target with generated PPD
>     data, compromising file integrity or availability.
>     https://www.cve.org/CVERecord?id=CVE-2026-55480
> 
> - CVE-2026-61702:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, copy_banner() in
>     scheduler/ipp.c uses the attacker-controlled IPP attributes-natural-
>     language value as a directory component beneath DataDir/banners when
>     processing a job-sheets banner. The job-sheets value must first match
>     a registered banner basename, and the traversed path must contain a
>     matching reachable basename; selecting an arbitrary target as
>     demonstrated additionally requires pre-positioned path state such as a
>     symlink with that basename. Subject to the scheduler's filesystem and
>     sandbox access, path separators in the language value can escape the
>     intended banner directory, make the root scheduler open the reachable
>     file, and copy its bytes into a job-sheet spool object that a
>     configured backend can deliver to an attacker-observable endpoint.
>     https://www.cve.org/CVERecord?id=CVE-2026-61702
> 
> - CVE-2026-87875:
>     The cupsUTF32ToUTF8() function in CUPS's cups/transcode.c lacks a
>     source-length bound and can read past the end of the source buffer,
>     resulting in a heap out-of-bounds read. This is reachable via SNMP
>     supply-description parsing in backend/snmp-supplies.c with attacker-
>     controlled content.
>     https://www.cve.org/CVERecord?id=CVE-2026-87875
> 
> - CVE-2026-87876:
>     Two case-insensitive comparisons on request-derived usernames outside
>     the main authorization path in CUPS's scheduler (printer ACL
>     validation and private-attribute filtering) could allow bypass of
>     username-based access controls in certain configurations.
>     https://www.cve.org/CVERecord?id=CVE-2026-87876
> 
> - CVE-2026-105326:
>     An argument injection flaw was found in CUPS. When email notification
>     is configured, the CUPS scheduler accepts printer subscription
>     requests that supply a mailto notify-recipient-uri. The mailto
>     notifier passes the recipient address to the configured sendmail
>     program without ensuring it cannot be interpreted as command-line
>     options. A remote attacker who can reach the CUPS service could supply
>     a crafted recipient value starting with "-" to influence sendmail
>     behavior. Successful exploitation depends on the installed mail
>     transfer agent and CUPS network exposure, and may lead to execution of
>     attacker-controlled commands with the privileges of the CUPS service
>     user.
>     https://www.cve.org/CVERecord?id=CVE-2026-105326
> 
> [1] https://github.com/OpenPrinting/cups/pull/1740
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...stination-enumeration-without-DNS-SD.patch | 29 +++++++++++++++++++
>  package/cups/cups.hash                        |  4 +--
>  package/cups/cups.mk                          |  2 +-
>  3 files changed, 32 insertions(+), 3 deletions(-)
>  create mode 100644 package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch
> 
> diff --git a/package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch b/package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch
> new file mode 100644
> index 0000000000..b342427023
> --- /dev/null
> +++ b/package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch
> @@ -0,0 +1,29 @@
> +From 23a183b63a4c94ae7cd0f36c63ee7eb905be60fd Mon Sep 17 00:00:00 2001
> +From: Rui Chen <rui@chenrui.dev>
> +Date: Mon, 5 Oct 2026 22:55:47 -0400
> +Subject: [PATCH] Fix destination enumeration without DNS-SD
> +
> +Add the local destination fields used by cups_enum_dests to the non-DNS-SD callback data structure.
> +
> +Fixes #1739
> +
> +Signed-off-by: Rui Chen <rui@chenrui.dev>
> +Upstream: https://github.com/OpenPrinting/cups/commit/a197d30e27b5dd4d8c41d7a8ab136727290ed7de
> +Signed-off-by: Thoams Perale <thomas.perale@mind.be>
> +---
> + cups/dest.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/cups/dest.c b/cups/dest.c
> +index dac26f119e..676470e70c 100644
> +--- a/cups/dest.c
> ++++ b/cups/dest.c
> +@@ -125,6 +125,8 @@ typedef struct _cups_getdata_s
> + {
> +   int		num_dests;		/* Number of destinations */
> +   cups_dest_t	*dests;			/* Destinations */
> ++  int		num_local;		/* Number of local cupsd queues */
> ++  cups_dest_t	*local_dests;		/* Local cupsd queues */
> +   char		def_name[1024],		/* Default printer name, if any */
> + 		*def_instance;		/* Default printer instance, if any */
> + } _cups_getdata_t;
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> index 7cb25fc4dd..eb029e8683 100644
> --- a/package/cups/cups.hash
> +++ b/package/cups/cups.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.19
> -sha256  820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389  cups-2.4.19-source.tar.gz
> +# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.20
> +sha256  ab4d9cd7f3e58060091d2b24972223d6401675f11c49b65abf4f6ef31dea22ff  cups-2.4.20-source.tar.gz
>  # Locally calculated:
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>  sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 3e85a2eecf..2fbf65e58e 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CUPS_VERSION = 2.4.19
> +CUPS_VERSION = 2.4.20
>  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
>  CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
>  CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
