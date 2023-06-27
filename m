Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81178C001B0
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 19:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CADAA8130E;
	Tue, 27 Jun 2023 19:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CADAA8130E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Yw1OHDWfvDg; Tue, 27 Jun 2023 19:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE18D81238;
	Tue, 27 Jun 2023 19:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE18D81238
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9301BF951
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 672DD81238
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 19:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672DD81238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRq0scvQt37N for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 19:43:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1DAA811F4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1DAA811F4
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 19:43:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1F8462003C1;
 Tue, 27 Jun 2023 21:43:35 +0200 (CEST)
Received: from [37.167.114.166:54518] via [37.167.114.166] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 Jun 2023 21:43:35 +0200
MIME-Version: 1.0
Date: Tue, 27 Jun 2023 21:43:35 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20230626210633.GH646621@scaer>
References: <20230611104518.337528-1-ju.o@free.fr>
 <20230626210633.GH646621@scaer>
User-Agent: Webmail Free/1.6.1
Message-ID: <802f2f6d2163a5e097b909ac2e13c57a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687895017;
 bh=pKvyH2b0cORUf67JPOjgWkUmGgZ0ULtiwd35ZKrUd8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ES2a+wefQYJS/zshLth8IglX0FGZaNcvIhmd68GiyG+OnLy11q8g0dWFET7VT/qbZ
 w7uSWQS5i3JiRjjFwao4Njwf5IKQBbxc5Pn6LSTWWoRkaJKt27GZY5hyCvx1FFFPXD
 IAFp9NtTh/M/4hrlN/mjI1oi7bk7A5TZrN4BRMIPon6VlJxQXpFanQgN5KteqnZZk3
 W6Ozr1XiB70KV6VFh6KY/ENWJq0cXZz4pT3w/az0xLQ+ZHf/vXAPhU+dnLb7Tbr42c
 jMZC55WKiIuZGJfQrP125z1vtd83K74346GiGn2NmArBEr/HEX8Ebjls2RxYwXbJ0t
 DUy7ZsrR5vVcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ES2a+wef
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 26/06/2023 23:06, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2023-06-11 12:45 +0200, Julien Olivain spake thusly:
>> If a program has the string '# ' (i.e. the default shell prompt) in
>> its output, the test execution in the Buildroot runtime test infra is
>> failing.
>> 
>> This can be reproduced by adding a single line in a package test
>> script:
>>     self.assertRunOk("echo ### this is a string with hashes ###")
> 
> The most obvious issue is when testing the environment of the shell 
> with
> env, which will output PS1 itself... There is not easy way around to 
> fix
> that, of course... :-/
> 
> I was beaten by this when adding a test for bash. I eventually solved 
> it
> in another way, but took a note to find a better solution "for 
> later"...
> ;-)
> 
>> Since the string "# " is quite common, this patch changes the prompt
>> after the emulator.login(), by setting the PS1 variable to a string
>> which is less likely to appear in a normal program output. A small
>> caveat: since there is a command echo, the command setting the new
>> prompt needs to be protected to make sure it will not be detected as
>> an actual shell prompt. The prompt is encoded by single-quoting
>> each character (e.g. abc -> 'a''b''c').
> 
> That's not really what join() will do. E.g. with your code:
> 
>     >>> s = "#BRTEST# "
>     >>> "''".join(s)
>     "#''B''R''T''E''S''T''#'' "

I agree doing this, we miss the first and last quote. This is exactly 
what
the next line is doing:

     self.run("export PS1='{}'".format(encoded_prompt))

Note the extra quotes. If you look in a run-test run log, there will be:

     # export PS1='#''B''R''T''E''S''T''#'' '
     #BRTEST# echo $?
     0

This was my initial intent: setting the PS1 without the local echo
begin caught by pexpect.

If you prefer any other encoding or prompt, please suggest something
else. I initially tried by temporarily disabling the local echo with
"stty -echo" but this was creating other issues...

> But we don;t really care because it is then quite improbable that some
> random program will output exactly this...
> 
> I was on my side thinking about using ANSI escape sequences to carry 
> the
> information that the command was actually fnished, something along the
> lines of:
> 
>     export PS1="\x1B_BR_COMMAND_FINISHED\x1B\\# "
> 
>   - \x1B_ is APC (Application Program Command),
>   - \x1B\\ is ST (String Terminator), which terminates APC
> 
> Instead of APC, we could use any of:
> 
>   - \x1BP DCS, Device Control String
>   - \x1BX SOS, Start Of String
>   - \x1B^ PM, Privacy Message
>   - or even \x1B] OSC, Operating System Command
> 
> But maybe that is a bit overkill in the end...
> 
> Anyway, your patch at least breaks tests.package.test_bash...

I overlooked this bash test, while testing this patch. Thanks for
pointing that out. I tried with a dozen of test cases, but not that
one.

The /etc/profile in Buildroot skeleton is overwriting PS1, see:
https://git.buildroot.org/buildroot/tree/system/skeleton/etc/profile?h=2023.05#n5

I was able to fix this test_bash by passing the PS1 in another exported
variable:

     self.assertRunOk("export BR_PS1=\"$PS1\"")
     self.emulator.qemu.sendline("bash -il")
     self.assertRunOk("export PS1=\"${BR_PS1}\"")

The "bash -il" return code is no longer tested, but I don't think it's
an issue since the rest of the test covers that.

If you agree with this workaround, I'll send an updated v3 patch series.

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>> Changes v1 -> v2:
>> - reworded commit log, to mention this issue was also seen while 
>> writing
>>   a test for the dmidecode package
>> - the patch series also introduce the new test for dmidecode
>> ---
>>  support/testing/infra/emulator.py | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>> 
>> diff --git a/support/testing/infra/emulator.py 
>> b/support/testing/infra/emulator.py
>> index 02cf486128..390c582e9d 100644
>> --- a/support/testing/infra/emulator.py
>> +++ b/support/testing/infra/emulator.py
>> @@ -13,6 +13,7 @@ class Emulator(object):
>>          # can take a long time to run the emulator. Use a timeout 
>> multiplier
>>          # when running the tests to avoid sporadic failures.
>>          self.timeout_multiplier = timeout_multiplier
>> +        self.shell_prompt = "#BRTEST# "
>> 
>>      # Start Qemu to boot the system
>>      #
>> @@ -100,6 +101,15 @@ class Emulator(object):
>>          index = self.qemu.expect(["# ", pexpect.TIMEOUT])
>>          if index != 0:
>>              raise SystemError("Cannot login")
>> +        # Set a special shell prompt while testing. Since the 
>> standard
>> +        # prompt '# ' is quite generic, a normal process output could
>> +        # contain that string and confuse expect. When changing the
>> +        # prompt, we also need to encode or escape it in some way to
>> +        # make sure the command echo will not be seen as a prompt
>> +        # itself. The prompt is encoded by single-quoting each
>> +        # character (e.g. abc -> 'a''b''c').
>> +        encoded_prompt = "''".join(self.shell_prompt)
>> +        self.run("export PS1='{}'".format(encoded_prompt))
>>          self.run("dmesg -n 1")
>>          # Prevent the shell from wrapping the commands at 80 columns.
>>          self.run("stty columns 29999")
>> @@ -110,13 +120,13 @@ class Emulator(object):
>>          self.qemu.sendline(cmd)
>>          if timeout != -1:
>>              timeout *= self.timeout_multiplier
>> -        self.qemu.expect("# ", timeout=timeout)
>> +        self.qemu.expect(self.shell_prompt, timeout=timeout)
>>          # Remove double carriage return from qemu stdout so 
>> str.splitlines()
>>          # works as expected.
>>          output = self.qemu.before.replace("\r\r", 
>> "\r").splitlines()[1:]
>> 
>>          self.qemu.sendline("echo $?")
>> -        self.qemu.expect("# ")
>> +        self.qemu.expect(self.shell_prompt)
>>          exit_code = self.qemu.before.splitlines()[2]
>>          exit_code = int(exit_code)
>> 
>> --
>> 2.41.0
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
