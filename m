Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B743CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F25E805F7;
	Thu, 16 Oct 2025 20:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geNCo-wozYNd; Thu, 16 Oct 2025 20:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 955D0805EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955D0805EC;
	Thu, 16 Oct 2025 20:04:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92DE9968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 844EB6081F
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6yP9tJtOy4y for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BE8F60819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE8F60819
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BE8F60819
 for <buildroot@uclibc.org>; Thu, 16 Oct 2025 20:04:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6821C2003B4;
 Thu, 16 Oct 2025 22:03:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Oct 2025 22:03:58 +0200
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 22:03:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
In-Reply-To: <pan$d7936$2755a29a$2a498cd9$162fbb2a@ID-313208.user.individual.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
 <20251013175513.86276-17-bernd__3196.32096668414$1760378335$gmane$org@kuhls.net>
 <pan$d7936$2755a29a$2a498cd9$162fbb2a@ID-313208.user.individual.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <240ae79956c001acbb9d4e069ef1fe92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760645039;
 bh=+t8Ow5Y1UKbWWpknmgr19v3ZssTb6X3adhIAbv68iVM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TJM2CTokb81qiR0FE7DsQLlA4U28SEDHpJEsj1ZrBpWjNw8mKGoDs2KQXdPiHPfO0
 vZ/aQXz+Y0HYxMDTVPK7yzdgDedwqDXucGg6Vh+1OoDA02PwOf2tgLshaMF3GXFI3w
 MJsbZKkte6adwomv3+p5ol4MLMzEg6VQZCqTcYDoEaOeKKSqmeIWTnMeOlZQYXYFDz
 /4UATDB0D+CIiDxGQHDO+i1y42qCieZQzurdNPT3olMj5e4miv3of+OOgvkXkBOj0K
 VxzsQqGh/d2uDxiM6hGh3AUbgSgn4qbvEG900sEWRpOar72aY7KB+csorczKJffKex
 gxGypr1GLmzOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TJM2CTok
Subject: Re: [Buildroot] [PATCH 17/36] package/python-pynacl: bump version
 to 1.6.0
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

Hi Bernd,

On 14/10/2025 23:13, Bernd Kuhls wrote:
> Am Mon, 13 Oct 2025 19:54:54 +0200 schrieb Bernd Kuhls:
> 
>> Signed-off-by: Bernd Kuhls
>> <bernd@kuhls.net>
> 
> Hi,
> 
> this bump needs libsodium 1.0.20:
> https://patchwork.ozlabs.org/project/buildroot/patch/
> 20251014211145.120019-1-bernd@kuhls.net/
> 
> according to the changelog
> https://github.com/pyca/pynacl/blob/main/CHANGELOG.rst
> and the build error I observed.

I applied this patch, after applying the libsodium bump.
Thanks.

> Regards, Bernd

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
