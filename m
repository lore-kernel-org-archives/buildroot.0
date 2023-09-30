Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B89E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBC983D44;
	Sat, 30 Sep 2023 09:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BBC983D44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sometUuGh_Rk; Sat, 30 Sep 2023 09:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD8E183C7B;
	Sat, 30 Sep 2023 09:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8E183C7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8131E1BF397
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69E0D83C7B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E0D83C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rju1e3S-EzX9 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:00:57 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EADFE83C78
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EADFE83C78
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E9769B0059A;
 Sat, 30 Sep 2023 11:00:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 11:00:51 +0200
Date: Sat, 30 Sep 2023 11:00:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230930090051.GA2579@scaer>
References: <20230926154703.160448-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926154703.160448-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696064454;
 bh=RK1YECt4D0wzXbJBeySAHAcqFRvnQryKza4GPVTxIyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fg8KbyKhMZdYCuwyalViyaPdIVgNr5alOzGJc7ZZph4fPdS8Qda9K+BGdnR9HdjPM
 tJpjOfqHWa+/aSaHKoyM65ab3Mm3dxpLdGCp6rXoa9mwG5MDez7t2P4L/kn2yZ+cBe
 NZ75g/Ree9RnCNPSOYNdeq5M7fBRpz0xmQtc6cK2OojWI1Xp8/Tl0iZeJIgz6wnjje
 A56Ep4kVr/wmcudf6VKYWzHgrzGTedHVVFU2kYhwuIUN7asWgPMQArTQlvGbc443lT
 Frjd0MzKFmLMjoum3i8kRq/X03VUEJGgG24KTikGwA6SgTwapX761ISEG3QE5VpMJB
 BJV5ImXojVXpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fg8KbyKh
Subject: Re: [Buildroot] [PATCH] support/runtime-test: fix weston test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-09-26 17:47 +0200, Yann E. MORIN spake thusly:
> The weston runtime test uses the CRC of the framebuffer to detect that
> "something" is being drawned on the framebuffer. This requires that the
> sampling of the CRC happens does not happen too early after trigerring
> an action, or the rendering may be not be finishe, either:
> 
>   - weston may not have had time to initialise, or
>   - the test application may not have started rednering,
> 
> The sequence of rendering that has been observed yields this sequence of
> CRCs (elided for brevity):
> 
>   - boot:
>     - alternating between 0x4c4126bf and 0x5d2f9aa5: console cursor
>       blinking
> 
>   - start weston:
>     - 0x4c4126bf: weston switches to an clearted vt)
>       ...
>     - 0xe54b7895: weston is starting
>       ...
>     - 0xe54b7895: wayland socket appears!
>       ...
>     - 0x6bf28bdf: weston is ready
>       ...
> 
>   - start weston-simple-egl:
>     - 0x6bf28bdf: application is starting
>       ...
>     - 0xNNNNNNNN: random CRCs while the application renders
>       ...
> 
>   - stop weston-simple-egl:
>     - 0xNNNNNNNN: izero, one, or two random CRCs while the application
>         renders before it handles SIGTERM
>     - 0x6bf28bdf: application is stopped
>       ...
> 
>   - stop weston:
>     - 0x6bf28bdf: a few CRC identical to when weston was started, while
>         weston is processing SIGTERM
>     - ocillating between 0x4c4126bf and 0x5d2f9aa5: console cursor
>         blinking, back to initial vt, weston dead.
> 
> So, we need to wait "enough" after each action. Moreover, when the
> wayland socket appears, weston may not have stabilised yet, so we also
> need to wait after the socket appears.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Julien Olivain <ju.o@free.fr>

Applied to master after fixing the typoes, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_weston.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index 276788c649..df1b7a4135 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -78,6 +78,7 @@ class TestWeston(infra.basetest.BRTest):
>          wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
>          cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
>          self.assertRunOk(cmd, timeout=10)
> +        time.sleep(4)
>  
>      def stop_weston(self):
>          cmd = "killall weston && sleep 3"
> -- 
> 2.25.1
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
