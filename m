Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F1C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 18:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC8244191C;
	Wed,  1 Jul 2026 18:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCC2C1dL_UnH; Wed,  1 Jul 2026 18:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC3141919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782931626;
	bh=DRK7w7dcc4R5gZ/jkiFg/WOQrnTNIGO2PrRBVqrP9+4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nHKSn6oMxrtzB+lCps+ElqieBGuWGKWX8JrcPKvEeYzJrJj5PyqC4fhffXs2A3IXp
	 aV8c6YzJOTliJ5DOywOP1wa+Tb0QurIGNnjj/U4oA+4caFMSscpQpXqlEgmFDnB3wN
	 78KaU/Qe9xH7gKCodPUZ9SJLg1YbkkcOrvQp89IJthXxsSWI2ttCx+ak2AQwB+qBwG
	 RJQSaOKbR60LuHl7RJKBb7lQVHBjkRE/QgZcrFjzuUrGjSWBX7GxEfGSuJRJs56s9t
	 PK9IjTtpgzJYPNW5JhNDNLVKytWtPyumQ0QzPW9Sv6F5TFuKLuyeDX4ujOdkUqmwo4
	 jwQM6L/c3l0Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECC3141919;
	Wed,  1 Jul 2026 18:47:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 119A7127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 18:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F1C582172
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 18:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Cp1wPc0DeVp for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 18:47:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8871381A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8871381A99
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8871381A99
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 18:47:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhuU-1wsjT72qUk-00Eu8j; Wed, 01
 Jul 2026 20:46:59 +0200
Message-ID: <40161b04-a2ad-4a67-8dc5-fdb4445d32bc@gmx.de>
Date: Wed, 1 Jul 2026 20:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260629214710.736022-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260629214710.736022-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:zghiIaJKl1Nz6OytijYH9M/WITaYFLCRqts+PJQxt2zVfCjJZsG
 SrUwQgNWZSMn5ueiEW4SdAFVeyADJIeSYNaL7rDng0gqfv4w5v482j7URh1flIc1LgEsWgl
 g4XqaTkZTH7vaX04F5+Mo0Z55d+gO5ajFunD8BPPIhtTibAu4E1Bivy2qA9f8Teut71zuLU
 dzEN8qdrxLkOQ8t/90i0w==
UI-OutboundReport: notjunk:1;M01:P0:4SshrhifySU=;zctAvyxiqJstiQjzgfSqUOkMIjz
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782931619; x=1783536419; i=fiona.klute@gmx.de;
 bh=57lGJQyql5d+RPqSoBKO/3sfJNO2aM/jRiYHWmxUgVQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=D+gVCNh4TVIYB3gKeyyuvWSzj+JHCFEke5TT9w+QWByBC8aEXZhX8Jz38tCkcbWd
 1uSU2PgdJw/FTAjfRU/MuBwfY+jKXO2319eMk8l6usyb8rUDy4DcwrF1UdmumDZQS
 KUSuwLEgePqLmOedruof+bc5FFQuVG+rbsxhB8zCikR8zXB0WXoOUe6AmjeDuZJRV
 TYYqs7OCgF6kLI9EXEVOH9s9tYG5qyFZGeTyAdZBiiAVjjD5aSN7V0iszzTCsBNRl
 GmP7EddXDOFNDTc24frb8Yi/X8ymEzQ/hPlB156e8BhamknoG0rAqKmVa1HmSziCK
 61OYtkFs3dSaDbdg7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=D+gVCNh4
Subject: Re: [Buildroot] [PATCH] package/mariadb: security bump to v10.11.18
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 29.06.26 um 23:47 schrieb Thomas Perale via buildroot:
> For more information on the release, see:
>    - https://mariadb.com/docs/release-notes/community-server/10.11/10.11.18
> 
> It fixes the following vulnerabilities:
> 
> - CVE-2026-48163:
>      MariaDB server is a community developed fork of MySQL server. From
>      versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
>      to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, during the SST
>      the donor node is interpolating parameters that the joiner sent into
>      the command line. Not all parameters were properly validated which
>      could allow a malicious joiner to execute arbitrary shell commands on
>      the donor side via the rsync SST method. This issue has been patched
>      in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and 12.3.2.
> 
> For more information, see:
>      https://www.cve.org/CVERecord?id=CVE-2026-48163
> 
> - CVE-2026-48165:
>      MariaDB server is a community developed fork of MySQL server. From
>      versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
>      to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, a high-
>      privileged MariaDB user could've used wsrep_sst_receive_address or
>      wsrep_sst_donor global system variables to execute shell commands as
>      the uid of the mariadbd process on the galera joiner node. This issue
>      has been patched in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
>      12.3.2.
> 
> For more information, see:
>      https://www.cve.org/CVERecord?id=CVE-2026-48165
> 
> - CVE-2026-49261:
>      MariaDB server is a community developed fork of MySQL server. Versions
>      10.6.1 through 10.6.26, 10.11.1 through 10.11.17, 11.4.1 through
>      11.4.11, 11.8.1 through 11.8.7, and 12.3.1 with  `wsrep_notify_cmd`
>      enabled would execute shell commands embedded in the name of the
>      joiner node. This is fixed in 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
>      12.3.2. As a workaround, anyone who cannot upgrade now should disable
>      `wsrep_notify_cmd`.
> 
> For more information, see:
>      https://www.cve.org/CVERecord?id=CVE-2026-49261
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thank you!

> ---
>   package/mariadb/mariadb.hash | 4 ++--
>   package/mariadb/mariadb.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index ca23b36a38..e2c13e3302 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.mariadb.org/mariadb/10.11.17
> -sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.11.18
> +sha512  45fa3c746138aa51b55d61efe11d44b0476fdcb104d5a40929ca2910145668ae749664e2afed7f9d59825d5b2b14e920c012513a4efa4eb0f8af1607d44ae31b  mariadb-10.11.18.tar.gz
>   
>   # Hash for license files
>   sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index c718c1ce7b..7d3c505ada 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MARIADB_VERSION = 10.11.17
> +MARIADB_VERSION = 10.11.18
>   MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>   MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>   # Tarball no longer contains LGPL license text

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
