Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239C5CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDBCF80674;
	Fri, 10 Oct 2025 16:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6yZBfcZWBQd; Fri, 10 Oct 2025 16:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EC5380675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC5380675;
	Fri, 10 Oct 2025 16:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E64014B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04F7680673
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nEclBrOpI8s for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C8DC80671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8DC80671
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C8DC80671
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:36:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 824B5B00572;
 Fri, 10 Oct 2025 18:36:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 18:36:22 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 18:36:22 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Alexey Lukyanchuk <skif@skif-web.ru>
In-Reply-To: <20251010162053.238542-1-thomas.perale@mind.be>
References: <20251010162053.238542-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <c1c4e2dfdf78d6f37a5ac095e17db73d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760114184;
 bh=TlkuWmJ76lV5zkGs3T9KOGeJRa3hJVH6Nao+fVuXO6Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qrvhIkmX7YwfYMGh9cP0wV8FfRT6ptfto470Dz5/nEcm+gF0rYgWxiZd36qm2ST58
 UiA3i4QopE7903U2Di5m0jnXv8dgfVXJwBvMn47Tv7CxcxEX50FwNOVsBJhDNtwqYt
 SYlZ+pcxN9H27Tgd0jwwnPsLrZyGE1jmyA4Hsk49X3po/dwT/Jx+GBC29UKrC0YXEn
 ErqSLf485aQY8FZdjFl2Bv6Saf5wfol9PHyKyEPwI2l+0PnVs5vngiiadZYA3URw0+
 AUTtw9P5u4lwYd2UsyHPUmVRmkSA79NOUDnfiVNjpM/XV8h1pvLWh110DCAGFr2Cte
 xC/9hNUjA0jwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qrvhIkmX
Subject: Re: [Buildroot] [PATCH] package/zabbix: security bump to v7.2.13
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

On 10/10/2025 18:20, Thomas Perale via buildroot wrote:
> For more details on the version bump, see:
>   - https://www.zabbix.com/rn/rn7.2.13
>   - https://www.zabbix.com/rn/rn7.2.12
>   - https://www.zabbix.com/rn/rn7.2.11
>   - https://www.zabbix.com/rn/rn7.2.10
>   - https://www.zabbix.com/rn/rn7.2.9
>   - https://www.zabbix.com/rn/rn7.2.8
>   - https://www.zabbix.com/rn/rn7.2.7
>   - https://www.zabbix.com/rn/rn7.2.6
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-27231
> 
>     The LDAP 'Bind password' value cannot be read after saving, but a
>     Super Admin account can leak it by changing LDAP 'Host' to a rogue
>     LDAP server. To mitigate this, the 'Bind password' value is now
>     reset on 'Host' change.
> 
> For more information, see:
>   - https://support.zabbix.com/browse/ZBX-27062
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27231
> 
> - CVE-2025-27236
> 
>     A regular Zabbix user can search other users in their user group 
> via
>     Zabbix API by select fields the user does not have access to view.
>     This allows data-mining some field values the user does not have
>     access to.
> 
> For more information, see:
>   - https://support.zabbix.com/browse/ZBX-27060
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27236
> 
> - CVE-2025-27238
> 
>     Due to a bug in Zabbix API, the hostprototype.get method lists all
>     host prototypes to users that do not have any user groups assigned
>     to them.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27238
>   - https://support.zabbix.com/browse/ZBX-26988
> 
> - CVE-2025-49641
> 
>     A regular Zabbix user with no permission to the Monitoring ->
>     Problems view is still able to call the problem.view.refresh action
>     and therefore still retrieve a list of active problems.
> 
> For more information, see:
>   - https://support.zabbix.com/browse/ZBX-27063
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49641
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
