Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B59C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D93F40702;
	Wed, 26 Aug 2026 20:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ed7_poT57M04; Wed, 26 Aug 2026 20:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787777423;
	bh=lr7AyD7u2xHaG1D3e8Ot9D6NwgLH7VzTymcbyGHP0ko=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CPMiZU8bGtrEdyZ22km6kBEYLVRufryMj727EzapS1f3EJJLbV0wQlhoCrntF+B3Q
	 ZFdqBwkcU44t1Nz0k4wbGCHFNS0ty2bnX0+s2a2OK0TbGAkFoBFXIEi8xvxLk9Xung
	 QbUSB+RTWo8u54Hry6HZOeiITA1ImWdTzFyl4/UOXYSX7vGTqaIYdoG/12KU731WSw
	 0rGK+3JJ8x7OxDyf6VnQ8t6cvDtCqJauiWC9dn0MLcDhDWu5OAX9FOR0Gx5cjtbmbU
	 pt30sErzUYcAnXS8zenPWrGwOnWu0xg/cTw9GxE3AcUYxk6/qk73qutIk6QJ1yfm+w
	 UqCZB6+oZ+vFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE8840703;
	Wed, 26 Aug 2026 20:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D712A39E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD88A60642
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FqvnBMcg-5Q for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 986ED60649
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:50:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DD61619F57E;
 Wed, 26 Aug 2026 22:50:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 22:50:15 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 22:50:15 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Stefan Ott <stefan@ott.net>
In-Reply-To: <20260826202207.976260-1-thomas.perale@mind.be>
References: <20260826202207.976260-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.18
Message-ID: <8e31011ae99dc132b80b230305f589ea@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/unbound: security bump to v1.25.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/08/2026 22:22, Thomas Perale via buildroot wrote:
> See the changelog:
> 
> - https://nlnetlabs.nl/projects/unbound/download/#unbound-1-25-2
> 
> It fixes the following vulnerabilities:
> 
> - CVE-2026-14586: Assertion in libngtcp2 when under pressure in high
>   concurrency DNS-over-QUIC environments.
> - CVE-2026-32665: Remote DNS-over-QUIC denial of service due to
>   `quic-size` budget bypass.
> - CVE-2026-40691: Packet of death for DNSCrypt over TCP.
> - CVE-2026-41637 Degradation of resolution service from improperly
>   accounted client-terminated DNS-over-QUIC queries.
> - CVE-2026-42955: Extra fix for CVE-2026-40622 to also clamp the TTL of
>   A/AAAA records disallowing a one-time 'ghost domain' delegation
>   renewal via glue records.
> - CVE-2026-44621: Libunbound applications configured with
>   'unwanted-reply-threshold' could eventually be abruptly terminated.
> - CVE-2026-44687: Off-by-one error in 'harden-below-nxdomain' logic can
>   shadow a stub/forward zone by a legitimate parent's NXDOMAIN.
> - CVE-2026-44690: Cross-zone wildcard cache poisoning via RRSIG.labels
>   manipulation.
> - CVE-2026-46582: A wildcard replay, as another piece of data, triggers
>   poisoning in the serve expired reply path.
> - CVE-2026-50045: 'max-global-quota' reset by DNSSEC validation
>   restarts.
> - CVE-2026-50046: Possible heap use-after-free in an error path when a
>   DoT forwarded query is jostled out.
> - CVE-2026-50243: 'response-ip'/'rpz' can rewrite BOGUS answers instead
>   of returning SERVFAIL.
> - CVE-2026-50248: BOGUS configured primary hostname accepted for XFR in
>   auth/rpz zones.
> - CVE-2026-50251: Attacker supplied `0.0.0.0`/`::` glue triggers
>   defensive full-cache flush.
> - CVE-2026-50252: Possible cache poisoning attack by mapping source 
> port
>   population per thread.
> - CVE-2026-52863: Memory corruption could lead to crash and denial of
>   service.
> - CVE-2026-54478: DNS Cookie bypass when combined with proxy-protocol
>   use.
> - CVE-2026-55708: Privacy/configuration issue when adding local data in
>   views through 'unbound-control'.
> - CVE-2026-55717: 'serve-expired-client-timeout' and 'response-ip' 
> CNAME
>   redirect could lead to a crash.
> - CVE-2026-55973: 'dns-error-reporting: yes' leads to stack buffer
>   overflow.
> - CVE-2026-55990: Packet of death for a DNSCrypt misconfigured Unbound.
> - CVE-2026-55991: Remote DNS-over-QUIC (DoQ) flow-control assertion
>   failure in libngtcp2.
> - CVE-2026-56416: Possible heap buffer overflow when validator
>   canonicalizes RDATA that contains domain name.
> - CVE-2026-56444: Degradation of resolution service when
>   'discard-timeout' and 'serve-expired-client-timeout' are combined in
>   unusual configuration.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
