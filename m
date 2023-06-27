Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79BEB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 21:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BE8940649;
	Tue, 27 Jun 2023 21:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE8940649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NevH1uPDj05C; Tue, 27 Jun 2023 21:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2687F40B9C;
	Tue, 27 Jun 2023 21:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2687F40B9C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A31C21BF38C
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7856F4173B
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 21:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7856F4173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LA09kM_AG2lR for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 21:21:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFCB4408EF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFCB4408EF
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 21:21:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:18c3:b0f7:15f8:b6d1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 06DD8B0054E;
 Tue, 27 Jun 2023 23:21:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Jun 2023 23:21:16 +0200
Date: Tue, 27 Jun 2023 23:21:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230627212116.GK646621@scaer>
References: <20230611104518.337528-1-ju.o@free.fr>
 <20230626210633.GH646621@scaer>
 <802f2f6d2163a5e097b909ac2e13c57a@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <802f2f6d2163a5e097b909ac2e13c57a@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687900880;
 bh=u1JMg8dYKOJBSEBJfVDQXBZGs0fSq6fuGztURn7moHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2xEID3CeLWjAkLauGeZt+90cvsf0SWFhkNS4yFKLzSeadDy6N4Iv1ZGR+kA+ffbQ
 Oz9iCjP943C/D3zO+q46J+QLsuJe0Q+WIpp7KSAkcc5tAbyUl/THBuNIeD+ZHT5HoP
 8WVQyULkXwxlCrw9TlCzgs4DtguCv00GN0qzx5tDUCz1H3SwJQknEq5RR3S/gAyzto
 5hGnCUeR4OWFsnkWQ4GSI4aAVNGgP4mxJH3gL2r/LbdXO0lo97+NCodGUJPtdTrloQ
 XyaWaU3bpd00LhWVX3Im+qDVTtDmWCr7VBXtJFfD65Hn9qlFUhLXpf3HhVdQr/Nf/t
 LKKwSkmoK9jxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T2xEID3C
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

On 2023-06-27 21:43 +0200, Julien Olivain spake thusly:
> On 26/06/2023 23:06, Yann E. MORIN wrote:
> >On 2023-06-11 12:45 +0200, Julien Olivain spake thusly:
> >>If a program has the string '# ' (i.e. the default shell prompt) in
> >>its output, the test execution in the Buildroot runtime test infra is
> >>failing.
> >>
> >>This can be reproduced by adding a single line in a package test
> >>script:
> >>    self.assertRunOk("echo ### this is a string with hashes ###")
[--SNIP--]
> >>an actual shell prompt. The prompt is encoded by single-quoting
> >>each character (e.g. abc -> 'a''b''c').
> >That's not really what join() will do. E.g. with your code:
> >    >>> s = "#BRTEST# "
> >    >>> "''".join(s)
> >    "#''B''R''T''E''S''T''#'' "
> I agree doing this, we miss the first and last quote. This is exactly what
> the next line is doing:
>     self.run("export PS1='{}'".format(encoded_prompt))
> Note the extra quotes. If you look in a run-test run log, there will be:
>     # export PS1='#''B''R''T''E''S''T''#'' '
>     #BRTEST# echo $?
>     0

Ah, yeah, so the prompt is not "encoded". Rather, the command setting
the prompt is obfuscated to that it is not itself detected as a prompt
being displayed.

OK, got it.

> This was my initial intent: setting the PS1 without the local echo
> begin caught by pexpect.

Yup.

> If you prefer any other encoding or prompt, please suggest something
> else. I initially tried by temporarily disabling the local echo with
> "stty -echo" but this was creating other issues...

Yeah, I think using a side channel to inform pexpect that a prompt is
actually being displayed, would eventually do the trick. That, combined
with your trick to obfuscate the command setting the prompt:

    # \033_ is APC (Application Program Command),
    # \033\ is ST (String Terminator), which terminates APC
    self.prompt_esc = '\033_BR_COMMAND_FINISHED\033\\'
    # Obfuscate the command setting the prompt, so that it is not
    # itself detected as a prompt being displayed.
    self.run("export PS1='{}# '".format("''".join(self.prompt_esc)))

And then, the emulator would be changed to expect that ANSI escape
sequence; everywhere we expect("# ") or expect(["# ",...]), we switch to
using self.prompt_esc instead or "# "

Totally untested, of course! I have a little doubt about whether the
escape ANSI sequence can be obfuscated that way, though...

[--SNIP--]
> >Anyway, your patch at least breaks tests.package.test_bash...
> The /etc/profile in Buildroot skeleton is overwriting PS1, see:
> https://git.buildroot.org/buildroot/tree/system/skeleton/etc/profile?h=2023.05#n5
> 
> I was able to fix this test_bash by passing the PS1 in another exported
> variable:
> 
>     self.assertRunOk("export BR_PS1=\"$PS1\"")
>     self.emulator.qemu.sendline("bash -il")
>     self.assertRunOk("export PS1=\"${BR_PS1}\"")
> 
> The "bash -il" return code is no longer tested, but I don't think it's
> an issue since the rest of the test covers that.
> 
> If you agree with this workaround, I'll send an updated v3 patch series.

I think we should instead tell bash to not parse the default bashrc et
al.:

    self.assertRunOk("bash -il --init-file /dev/null --rcfile /dev/null")

And this should solve the issue: PS1 is in the environment, so bash will
inherit it.

Regards,
Yann E. MORIN.

> >
> >Regards,
> >Yann E. MORIN.
> >
> >>Signed-off-by: Julien Olivain <ju.o@free.fr>
> >>---
> >>Changes v1 -> v2:
> >>- reworded commit log, to mention this issue was also seen while writing
> >>  a test for the dmidecode package
> >>- the patch series also introduce the new test for dmidecode
> >>---
> >> support/testing/infra/emulator.py | 14 ++++++++++++--
> >> 1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/support/testing/infra/emulator.py
> >>b/support/testing/infra/emulator.py
> >>index 02cf486128..390c582e9d 100644
> >>--- a/support/testing/infra/emulator.py
> >>+++ b/support/testing/infra/emulator.py
> >>@@ -13,6 +13,7 @@ class Emulator(object):
> >>         # can take a long time to run the emulator. Use a timeout
> >>multiplier
> >>         # when running the tests to avoid sporadic failures.
> >>         self.timeout_multiplier = timeout_multiplier
> >>+        self.shell_prompt = "#BRTEST# "
> >>
> >>     # Start Qemu to boot the system
> >>     #
> >>@@ -100,6 +101,15 @@ class Emulator(object):
> >>         index = self.qemu.expect(["# ", pexpect.TIMEOUT])
> >>         if index != 0:
> >>             raise SystemError("Cannot login")
> >>+        # Set a special shell prompt while testing. Since the standard
> >>+        # prompt '# ' is quite generic, a normal process output could
> >>+        # contain that string and confuse expect. When changing the
> >>+        # prompt, we also need to encode or escape it in some way to
> >>+        # make sure the command echo will not be seen as a prompt
> >>+        # itself. The prompt is encoded by single-quoting each
> >>+        # character (e.g. abc -> 'a''b''c').
> >>+        encoded_prompt = "''".join(self.shell_prompt)
> >>+        self.run("export PS1='{}'".format(encoded_prompt))
> >>         self.run("dmesg -n 1")
> >>         # Prevent the shell from wrapping the commands at 80 columns.
> >>         self.run("stty columns 29999")
> >>@@ -110,13 +120,13 @@ class Emulator(object):
> >>         self.qemu.sendline(cmd)
> >>         if timeout != -1:
> >>             timeout *= self.timeout_multiplier
> >>-        self.qemu.expect("# ", timeout=timeout)
> >>+        self.qemu.expect(self.shell_prompt, timeout=timeout)
> >>         # Remove double carriage return from qemu stdout so
> >>str.splitlines()
> >>         # works as expected.
> >>         output = self.qemu.before.replace("\r\r",
> >>"\r").splitlines()[1:]
> >>
> >>         self.qemu.sendline("echo $?")
> >>-        self.qemu.expect("# ")
> >>+        self.qemu.expect(self.shell_prompt)
> >>         exit_code = self.qemu.before.splitlines()[2]
> >>         exit_code = int(exit_code)
> >>
> >>--
> >>2.41.0
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot@buildroot.org
> >>https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> Best regards,
> 
> Julien.

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
