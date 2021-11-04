Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015A2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:20:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6394361215
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6394361215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24B0540114;
	Thu,  4 Nov 2021 20:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ki33PqbUJKZr; Thu,  4 Nov 2021 20:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D1FC401F4;
	Thu,  4 Nov 2021 20:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB951BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B93F40114
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZF9CLXAQsDu for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:19:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A68A5401E7
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:19:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6A807E0005;
 Thu,  4 Nov 2021 20:19:53 +0000 (UTC)
Date: Thu, 4 Nov 2021 21:19:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211104211951.522e6d38@windsurf>
In-Reply-To: <20211103201932.296897-1-james.hilliard1@gmail.com>
References: <20211103201932.296897-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-cryptography: add
 host-python3-six host dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Nov 2021 14:19:32 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This dependency wasn't added during the removal of
> python3-cryptography.
> 
> The conversion/dropping of python3-cryptography was done with commits
> [1] and [2], and the commit log of [1] states the dropping of the
> host-python3-six dependency was intentionally:
> 
>         [...]
>         While at it, drop host-python3-pip and host-python3-six as these
>         dependencies are not needed. Indeed, pip was never a dependency of
>         cryptography and six is not a dependency with python3 and will be
>         dropped in version 3.4 and
>         https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
>         [...]
> 
> But the package python-cryptography is still at version 3.3.2 (and
> clearly depends on six)
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
> [2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add explanation for six being required still
> ---
>  package/python-cryptography/python-cryptography.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks. I am curious to hear why the target version
of python-cryptography does not need python-six. Is it because our
target Python interpreter is recent enough that it implements all what
python-cryptography needs, without python-six as a "compatibility"
layer?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
