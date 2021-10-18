Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7120EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC5560EE2
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AC5560EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA43782B1E;
	Mon, 18 Oct 2021 20:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caYhzhHU1Xkc; Mon, 18 Oct 2021 20:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E18382ADD;
	Mon, 18 Oct 2021 20:33:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D63871BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C62786078A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38l6iGNvrnTn for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:33:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D72ED6074F
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:33:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87d:8477:c454:3318])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C72DF20039E;
 Mon, 18 Oct 2021 22:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634589210;
 bh=mrWjWpdwRkyLzw6zkJNzEaWzPQp0mOJigjQ0yKY1MXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6897zK0QpTP9+6IGYcxeIYaj7oQjiR2CPKCdOdtMmJQQXY9sP/iotwqEwCoWlhX3
 LdHLFdU0GaHp0ELVggYYV8TESRPuoLwaE/bXVl8xmBYc0RAn5ekCvf78tmMVPl2qwh
 CLZJBLv58RJZcwM3wElV6xdKch0VOcRIjvuF79OJ1e21+vZruxzFJsl1hrlVbfKwrP
 aUrNfrPumMzCx3Y9hn41FaTgRtWtcOUdl44oDLCSE0KVgY3n2csRNWavHKqL+IGNLr
 C9Dnyx2DUzWCdkirOrM0lhSmaaktiH9Y/YDixMth2cWRhjI8NuydHCuQ8e3bCxmB3R
 6st4O1WNQ/Wyw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Oct 2021 22:33:26 +0200
Date: Mon, 18 Oct 2021 22:33:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20211018203326.GU2400@scaer>
References: <20211018195822.2263226-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018195822.2263226-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] tests: sample_python_dbus_next: ignore
 F821 flake8 error
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-10-18 21:58 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The dbus-next package uses the Python type annotation for dbus types. This is
> not compatible with the python typing assumption that flake8 makes.
> 
> Exclude F821 from this line.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1687009829
> partially:
> support/testing/tests/package/sample_python_dbus_next.py:17:36: F821 undefined name 's'
> support/testing/tests/package/sample_python_dbus_next.py:17:48: F821 undefined name 's'
> support/testing/tests/package/sample_python_dbus_next.py:17:56: F821 undefined name 's'
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

You beat me to it, but I still managed to put my little touch: I've
changed the title to:  support/testing: ...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/sample_python_dbus_next.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/sample_python_dbus_next.py b/support/testing/tests/package/sample_python_dbus_next.py
> index 1fcb76f45a..710bfa8c04 100644
> --- a/support/testing/tests/package/sample_python_dbus_next.py
> +++ b/support/testing/tests/package/sample_python_dbus_next.py
> @@ -14,7 +14,7 @@ class SampleInterface(ServiceInterface):
>          pass
>  
>      @method()
> -    def ConcatStrings(self, what1: 's', what2: 's') -> 's':
> +    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
>          return what1 + what2
>  
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
