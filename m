Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDF1CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 19:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A814040F;
	Wed, 22 Oct 2025 19:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFgmjTpWzmny; Wed, 22 Oct 2025 19:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C8840450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C8840450;
	Wed, 22 Oct 2025 19:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CA56DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E4B403F4
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1LMB-b2mmBF for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 19:27:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68C94403CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C94403CD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68C94403CD
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:27:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 220E319F593;
 Wed, 22 Oct 2025 21:27:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Oct 2025 21:27:25 +0200
MIME-Version: 1.0
Date: Wed, 22 Oct 2025 21:27:25 +0200
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251021-bash-5-3-v1-1-b28c4c46a3a3@gmail.com>
References: <20251021-bash-5-3-v1-1-b28c4c46a3a3@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <32a24b32628e6fd22aa5035c95ff52f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761161247;
 bh=GoYriK1N2oV9ScEhvjkKq513wJYXYw7stfxln7RYIvM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y8fl6T2kenidP1gmaI0klWyCwwJ22BBxhjIzw/ah303qEdpdwwVzJKVRvtx49xmZA
 Grnej+Lh7dvLctW9IfnawLKRbOiE77sHHm5kSCngyyy5VTQTGnzE9cgFYDBCs8mJ69
 3G+RLlwh496wlBggVcAQceOqInyoUHQPM5zMjIrnO3aGU0RA6hLJPmIpnPLgHuaQVL
 UCpqFAT90oeODhDvEbJnJ0Mu5y2LHXJ5tCnHMdZOp7IrmERGvD2S58vi4CgCs/fnOO
 VkrhJXdJpjoF0KF0+rLKnMn8MvSJb1kGVtE85r3h4Q4WDLqI4jIfvESVrAxwGUfWw1
 TdBX0wVu1ALxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y8fl6T2k
Subject: Re: [Buildroot] [PATCH] package/bash: bump to v5.3
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

Hi Joseph,

Thanks for the patch. I have few comments, see below.

On 22/10/2025 02:37, Joseph Kogut wrote:
> See the relevant announcement:
> https://lists.gnu.org/archive/html/bug-bash/2025-07/msg00005.html
> 
> Changes:
> - Removed upstreamed multibyte compilation fix
> - Rebased missing include patch that remains unmerged
> 
> Fixes:
> - 
> https://autobuild.buildroot.org/results/4d7/4d747e67e64020b4aafbc665eb0d158e2019df53
> - 
> https://autobuild.buildroot.org/results/cf5/cf54a49175531372f7988c10dd64411b85891088
> - 
> https://autobuild.buildroot.org/results/f13/f135a97fa8bd2750ffc9a10ae21524f6668888b8
> - 
> https://autobuild.buildroot.org/results/ed3/ed39befdd73f3c107d7ee251d88127d1d493fd5d
> - 
> https://autobuild.buildroot.org/results/95d/95d86fa81ac62ffce0411018281ec15c6a9b5e08
> - 
> https://autobuild.buildroot.org/results/6de/6de3e106d062252574ed31835acace62045797e2

I cannot reproduce those build failures anymore (as of master at 
e1ef4be70).
It seems most of those build failures were already fixed by:
https://gitlab.com/buildroot.org/buildroot/-/commit/00fa6003038b4c4483f52dded1f8b9cf2fa57e5a
https://gitlab.com/buildroot.org/buildroot/-/commit/6d09b25d08fe72e9781578fb512d5aa391b08c3f

Can you remove those "Fixes:" links, please? (or provide a minimal 
config reproducing
those issue on the master HEAD).

Also, the comment added by the commit I link says the "-std=gnu17" flags 
for target
and host can be removed when bumping to 5.3. Could you remove those, 
please? See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/package/bash/bash.mk#L29

Finally,  the "make check-package" command is generating errors:

.checkpackageignore:232: ignored file 
package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch 
is missing
package/bash/0001-input.h-add-missing-include-on-stdio.h.patch:0: 
lib_patch.Upstream was expected to fail, did you fix the file and forget 
to update /home/julien/work/buildroot/.checkpackageignore?

Could you remove those ".checkpackageignore" entries, which a no longer 
needed?

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
