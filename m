Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F353AE94115
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E64760F37;
	Fri,  6 Oct 2023 20:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E64760F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0w3SwPJvpA1W; Fri,  6 Oct 2023 20:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26B260FA4;
	Fri,  6 Oct 2023 20:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A26B260FA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C31081BF2B5
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BF3F83BC7
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 20:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF3F83BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xVc9_gWYavd for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 20:09:11 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BEB083BC0
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 20:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BEB083BC0
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 21B415FE03;
 Fri,  6 Oct 2023 22:09:07 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56562])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Oct 2023 22:09:07 +0200
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 22:09:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20230926154703.160448-1-yann.morin.1998@free.fr>
References: <20230926154703.160448-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.3
Message-ID: <ba14bf4c30a93426a052d846729ec05c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696622948;
 bh=EgM+T2nhfQG4SVSVIVKXpS3fuLgrYAJhgEnoZRnssmk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eyaUOJZ+qWwDQP4qqILBd2aNsCuX8nOq99GXNl0xu4uOl+cNMvqKEW45B6sHDS+Dx
 SKpZvYGaxPp3kuNSIk7MaDP/nitilIrCvmYPG3dYSydYS9UW7lTxDdFoBdruHGCGyK
 gDtI7sEogXnEQZLHP4uNSnvOZMiBSGnCHIcw42P9fYs6zWq2LTpR9Nt/bt7h9WRtmn
 BeKWlo3uPhXTYNV/7PymesbfOdQkJrIA3pcXzF54I1WSpbGtwVl2Y0r7OvwUm9v8eo
 3wop8BcS1lcY7s0nzO5lZWuW+7wtoquHEOhxc+mfVCNdc5j15VCSs2qIZNVQiz7NOr
 k7z8DkZAbg+bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eyaUOJZ+
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 26/09/2023 17:47, Yann E. MORIN wrote:
> The weston runtime test uses the CRC of the framebuffer to detect that
> "something" is being drawned on the framebuffer. This requires that the
> sampling of the CRC happens does not happen too early after trigerring
> an action, or the rendering may be not be finishe, either:
> 
>   - weston may not have had time to initialise, or
>   - the test application may not have started rednering,
> 
> The sequence of rendering that has been observed yields this sequence 
> of
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
> ---
>  support/testing/tests/package/test_weston.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/package/test_weston.py 
> b/support/testing/tests/package/test_weston.py
> index 276788c649..df1b7a4135 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -78,6 +78,7 @@ class TestWeston(infra.basetest.BRTest):
>          wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
>          cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; 
> done"
>          self.assertRunOk(cmd, timeout=10)
> +        time.sleep(4)

I was wondering if it would be relevant to add a BRTest.sleep() method
for sleeping on the host test controller, that would adjust the sleep
time with BRTest.timeout_multiplier.

Since those sleep times are meant to adjust the host test controller
with emulator execution speed, I believe it would also make sense to
multiply those sleep time as same as timeout_multiplier for pexect
timeouts. (Maybe timeout_multiplier will need to be renamed to
something else like speed_multiplier).

What do you think?

> 
>      def stop_weston(self):
>          cmd = "killall weston && sleep 3"
> --
> 2.25.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
