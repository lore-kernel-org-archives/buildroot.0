Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7B3C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE5860AC6;
	Mon, 31 Jul 2023 14:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE5860AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmieCqkXUFc3; Mon, 31 Jul 2023 14:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE8260AB7;
	Mon, 31 Jul 2023 14:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE8260AB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 643EA1BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CFF460AB7
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFF460AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMIbdI60d75I for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:17:57 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 14:17:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D043560A92
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D043560A92
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:17:56 +0000 (UTC)
Received: from [172.25.4.220] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QTbkqdW8lA2CpQTblq8MG4; Mon, 31 Jul 2023 16:10:49 +0200
Message-ID: <a9b895f5-5136-6d92-34a7-ada38a3da21f@benettiengineering.com>
Date: Mon, 31 Jul 2023 16:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230726202838.1931660-3-christian@aperture.us>
X-CMAE-Envelope: MS4xfJRlJeu94Yy8WnGFPnPiW1pf4VnKZra+l+/r8GBZXRAQWOPAmRcrG7Et+cdSVLugrrfifMgZlPcfy3CH1x9EdzvFr7eiKY/BqVcYKBPl8ClWuuNqg45A
 5dgL4pO54LgKQ6uuhfvVQbtbBcK0bwE0rAW0cCAtc1v6rSMYcxKpvwlFrzgApTN5BUL0sEsrBSnQqxk4pQGrnR4GQd2byLjErqRcBqNXkWGznFVJ8cP4D0j7
 2pIgO2X70LBZEwYo+/AvAgFPqvDJv2fT2jR0TwK3vJX1JgCJhEoX0DKbfNfcdnZaC6Q4+M57jiLabCuwYk+Wzwgssl5EsvWk3tM5oOiSYUc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690812649; bh=wyeyOQhBZ8dKjG09ORth7uAuMxWnrNQMR3+fw7Xc7c4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=YBHyNvL6DypznUQStpxNYVNJTEHMrlc2CCJ8Tyc3k/mp216zZ8E6X2CTt18+aS4B1
 dZsG8fr2QB4/oodeOaj6V2gGWqj1gEdQaFjGHiY7kQx+Q6DC+eZq7BZgxnvHizW6Tt
 D3ddSLimOVtnxiIn0Ti646syEzBNFd+NLO5hdMntu5UFxhEhTAIG1shGMZZi0MOw5X
 52UKusCywor6QvZWI7TEgeWX+OKTII+y+zVXzebAvpyhaLjHyhUk7W3PuG5kGSxm/6
 buFbrbzJBopp9TnMC5ra3NWUWp6Q7mZHhCLiPiWjdCu4SAiS+K81wrQ0XJ6Kzwc/8/
 P7CqlkP8k1N3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YBHyNvL6
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian, All,

sorry if I don't answer on the Thread but I've lost previous e-mails :-/

On 26/07/23 22:28, Christian Stewart wrote:
> If BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is set, add a dependency on
> host-python-pylibfdt.
> 
> Fixes a build failure with uboot 2023.07:
> 
> $ make uboot
> error: pylibfdt does not seem to be available with python3
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>   boot/uboot/uboot.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1a6e70a792..73ef204292 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -217,7 +217,7 @@ UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> -UBOOT_DEPENDENCIES += host-swig
> +UBOOT_DEPENDENCIES += host-swig host-python-pylibfdt
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)

U-Boot approach for this is to force Python3 to build libfdtpy[1]
but what we experience here is a consequence of Buildroot's commit 
231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 [2]

Something happens after that patch has been applied that basically
passes Buildroot's host dtc to UBOOT_MAKE_OPTS:
```
UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
```
The root cause seems to be Python3 anyway as U-Boot patch points.

Since we can't patch every U-Boot version we could fix Python3 but
using the approach proposed by Christian is easier to be honest.

To prove it's a Python3 issue you can see from one of my Gitlab-CI
failure[3] that various U-Boot versions are different, not the last
one(2023.07).

I've tested this patchset successully, so:
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

[1]: 
https://patchwork.ozlabs.org/project/uboot/patch/20170329194123.2361-1-stefan@agner.ch/#1630820
[2]: 
https://gitlab.com/buildroot.org/buildroot/-/commit/231d79c81e9a1f8c2ef14861374a40fcdc5e6b33
[3]: https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555892

Best regards
-- 
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
