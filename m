Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CA4EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 21:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA2D60B26;
	Mon, 26 Jun 2023 21:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EA2D60B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGhRtk5y-yrj; Mon, 26 Jun 2023 21:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE7660BD5;
	Mon, 26 Jun 2023 21:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE7660BD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 923281BF2FC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 21:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B3B7404C4
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 21:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B3B7404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhAm8scRVmll for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 21:06:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 191B74048D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 191B74048D
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 21:06:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:88cf:b268:1dd:7043])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6BC462003C3;
 Mon, 26 Jun 2023 23:06:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Jun 2023 23:06:33 +0200
Date: Mon, 26 Jun 2023 23:06:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230626210633.GH646621@scaer>
References: <20230611104518.337528-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230611104518.337528-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687813597;
 bh=n0SmscrQtnZOEw9PHwl2sqvYsY2nrvQSdZoqcJvuYQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JbSoy5U5OBfb6aeBnMb0D+zs4AZzlY+LxpFcuZb0uIJfhOM9xV6ki2rLThkCAydtQ
 G93aGiKrKvcE6a8mpgdRGZSjjDGcdHbOxQEC7BwOz+Juiq7p47/BSfEVf/7Pv80kgj
 OY0I+ViRX3+vX2+zatfzqeXKGvXYdFMTAssPH6evtY+Ql29PWvj5SmPJoWA30LSWkQ
 zRNVFADnDKldy6+VFmPBlXWScCP6sQbeTcGgatWJAK06C4sH1ADffly4DP2wOFz4lT
 nbt3O0Lq0J+UTP9bDZOaovfaGZG7eagvfuaUUqCm36BM1dKGoZdNbM/IyEuDNNMpDf
 dtsETIS78qPAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JbSoy5U5
Subject: Re: [Buildroot] [PATCH v2 1/3] support/testing/infra/emulator.py:
 change the shell prompt before running tests
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-06-11 12:45 +0200, Julien Olivain spake thusly:
> If a program has the string '# ' (i.e. the default shell prompt) in
> its output, the test execution in the Buildroot runtime test infra is
> failing.
> 
> This can be reproduced by adding a single line in a package test
> script:
>     self.assertRunOk("echo ### this is a string with hashes ###")

The most obvious issue is when testing the environment of the shell with
env, which will output PS1 itself... There is not easy way around to fix
that, of course... :-/

I was beaten by this when adding a test for bash. I eventually solved it
in another way, but took a note to find a better solution "for later"...
;-)

> Since the string "# " is quite common, this patch changes the prompt
> after the emulator.login(), by setting the PS1 variable to a string
> which is less likely to appear in a normal program output. A small
> caveat: since there is a command echo, the command setting the new
> prompt needs to be protected to make sure it will not be detected as
> an actual shell prompt. The prompt is encoded by single-quoting
> each character (e.g. abc -> 'a''b''c').

That's not really what join() will do. E.g. with your code:

    >>> s = "#BRTEST# "
    >>> "''".join(s)
    "#''B''R''T''E''S''T''#'' "

But we don;t really care because it is then quite improbable that some
random program will output exactly this...

I was on my side thinking about using ANSI escape sequences to carry the
information that the command was actually fnished, something along the
lines of:

    export PS1="\x1B_BR_COMMAND_FINISHED\x1B\\# "

  - \x1B_ is APC (Application Program Command),
  - \x1B\\ is ST (String Terminator), which terminates APC

Instead of APC, we could use any of:

  - \x1BP DCS, Device Control String
  - \x1BX SOS, Start Of String
  - \x1B^ PM, Privacy Message
  - or even \x1B] OSC, Operating System Command

But maybe that is a bit overkill in the end...

Anyway, your patch at least breaks tests.package.test_bash...

Regards,
Yann E. MORIN.

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - reworded commit log, to mention this issue was also seen while writing
>   a test for the dmidecode package
> - the patch series also introduce the new test for dmidecode
> ---
>  support/testing/infra/emulator.py | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index 02cf486128..390c582e9d 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -13,6 +13,7 @@ class Emulator(object):
>          # can take a long time to run the emulator. Use a timeout multiplier
>          # when running the tests to avoid sporadic failures.
>          self.timeout_multiplier = timeout_multiplier
> +        self.shell_prompt = "#BRTEST# "
>  
>      # Start Qemu to boot the system
>      #
> @@ -100,6 +101,15 @@ class Emulator(object):
>          index = self.qemu.expect(["# ", pexpect.TIMEOUT])
>          if index != 0:
>              raise SystemError("Cannot login")
> +        # Set a special shell prompt while testing. Since the standard
> +        # prompt '# ' is quite generic, a normal process output could
> +        # contain that string and confuse expect. When changing the
> +        # prompt, we also need to encode or escape it in some way to
> +        # make sure the command echo will not be seen as a prompt
> +        # itself. The prompt is encoded by single-quoting each
> +        # character (e.g. abc -> 'a''b''c').
> +        encoded_prompt = "''".join(self.shell_prompt)
> +        self.run("export PS1='{}'".format(encoded_prompt))
>          self.run("dmesg -n 1")
>          # Prevent the shell from wrapping the commands at 80 columns.
>          self.run("stty columns 29999")
> @@ -110,13 +120,13 @@ class Emulator(object):
>          self.qemu.sendline(cmd)
>          if timeout != -1:
>              timeout *= self.timeout_multiplier
> -        self.qemu.expect("# ", timeout=timeout)
> +        self.qemu.expect(self.shell_prompt, timeout=timeout)
>          # Remove double carriage return from qemu stdout so str.splitlines()
>          # works as expected.
>          output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
>  
>          self.qemu.sendline("echo $?")
> -        self.qemu.expect("# ")
> +        self.qemu.expect(self.shell_prompt)
>          exit_code = self.qemu.before.splitlines()[2]
>          exit_code = int(exit_code)
>  
> -- 
> 2.41.0
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
