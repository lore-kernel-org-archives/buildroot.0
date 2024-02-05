Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8F3C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A4EE40C02;
	Mon,  5 Feb 2024 21:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4EE40C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGQWe-lIbFJt; Mon,  5 Feb 2024 21:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5152E40BED;
	Mon,  5 Feb 2024 21:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5152E40BED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43DFA1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AE9681E9E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE9681E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kc8hx6vcPc3b for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:31:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33F2181E10
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F2181E10
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CE35240002;
 Mon,  5 Feb 2024 21:31:23 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:31:22 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205223122.32116c63@windsurf>
In-Reply-To: <20240126172920.1628617-1-fontaine.fabrice@gmail.com>
References: <20240126172920.1628617-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWH7xgFWyD/zPHxPiVioU/egBv2NcVYFalDaajXn28Q=;
 b=oym1IkWMO+zFNHUW0ExODYsP0lyJyiKrTB+buZIZw1qH40QBpnHFXIZ4SAdUNRi+3Riolr
 z7vB1TkccgEZKn8/lqbtP2/Fq27IqpfgBu9h648HtYZiflV1g3F/DZ0ivGwxCCDR8AsBAD
 WJG0q9WZkioldo7Q9RGOT8Q7UDZnZCespkHB+6IQI2uZ2nlHJcI3cyz+8n9H94rH2RdgOX
 hiZlnfxnIjpeYlmuAjB94VS9eSUslStUOF7p0ItYo+lSkhyX4kx0cWDKNGUAN2uWEOgm1h
 w1q8ROUe7dOZ7MjfA+LzcZI3j6f3Oa4rxwHD5PnsHhf8PKn47tJZOOI5rGCqTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oym1IkWM
Subject: Re: [Buildroot] [PATCH 1/1] package/brltty: disable emacs and lua
 bindings
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mario Lang <mlang@blind.guru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Jan 2024 18:29:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable lua bindings to avoid the following build failure if host-lua
> and lua are built before brltty raised since bump to version 6.5 in
> commit 82c6e87d5eaaf5b32aa340ab384f88539238cbe1 and
> https://github.com/brltty/brltty/commit/42bf48ca010d9163652cb0a014662fa243132736:
> 
> configure: lua package: lua
> configure: lua includes:
> configure: lua libs: -L/home/autobuild/autobuild/instance-0/output-1/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib -llua -lm -ldl
> checking for lua5.4... no
> checking for lua... /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
> configure: Lua shell: /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
> configure: Lua library directory: /home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
> 
> [...]
> 
> /usr/bin/install -c -d /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
> /usr/bin/install -c -s --strip-program /bin/true brlapi.so /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
> make[3]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/brltty-6.6/Bindings/Lua'
> 
> [...]
> 
> brltty: installs files in /home/autobuild/autobuild/instance-0/output-1/target//home/autobuild/autobuild/instance-0/output-1
> 
> While at it, disable emacs bindings which have also been added in
> version 6.5 with
> https://github.com/brltty/brltty/commit/64a487e29941df54796645229a872ecbe2a06bfe
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f424e6727bbe61ea4b7703e93aae6fcab7506898
>  - http://autobuild.buildroot.org/results/bf4a161fc66fb99a24f08bea3436b13738f2e383
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/brltty/brltty.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
