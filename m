From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Wed, 11 Jun 2014 11:21:57 +0100 (BST)
Subject: [Buildroot] ICU 51.2 bus error
In-Reply-To: <20140609184755.54864d4b@free-electrons.com>
References: <1402328606.59886.YahooMailNeo@web172305.mail.ir2.yahoo.com>
 <20140609184755.54864d4b@free-electrons.com>
Message-ID: <1402482117.58318.YahooMailNeo@web172306.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again. Just a quick update on this.
I tried a lot of flags/configurations and none worked. Unfortunately I haven't been able to obtain a proper core file to debug what's really going on with ICU.
I tried to build versions 52.1 and 53.1 and got the same bus error result.

So I went back in the past and tried version 4.8.1.1 (taken from Buildroot 2013-08) ... and it works !
I might try versions 49 and 50, at least to identify the version that started to cause the issue I'm having.

For now, since ICU is not vital for what I have to do (QtWebKit), I'm happy I've found one version working.

Regards,
Massimo


>________________________________
> Da: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>A: Massimo Callegari <massimocallegari@yahoo.it> 
>Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
>Inviato: Luned? 9 Giugno 2014 18:47
>Oggetto: Re: [Buildroot] ICU 51.2 bus error
> 
>
>Dear Massimo Callegari,
>
>On Mon, 9 Jun 2014 16:43:26 +0100 (BST), Massimo Callegari wrote:
>
>> I'm having a serious issue with ICU 51.2 on a MIPS platform.
>> Everything builds fine but anyone using ICU at runtime gets a misterious "bus error" fault.
>> At first I thought it was my Qt 5.3.0 build, but then I realized even the simple "icuinfo" tool fails with the same error.
>> The root filesystem is mounted on NFS but I hope that's not the cause.
>> 
>> 
>> I enclose a strace run of the icuinfo command at the end of this email.
>> From the trace it seems the lookup of file "/usr/lib/icu/icuplugins51.txt" is the cause of all the evil, but I tried to manually create it and nothing changes.
>> I double checked on my PC and it doesn't even exist, even though the icuinfo command works properly.
>> 
>> I'm afraid this is a cross-compilation thing, but I can't figure out myself what it might be.
>> Does anyone have any idea or is able to find the issue from the trace below ?
>
>First of all, thanks for your report!
>
>Could you run "ulimit -c unlimited" on your target, and then your
>command? It will generate a "core" file that you can transfer on your
>development machine, and then do:
>
>??? ./host/usr/mips-<blabla>-gdb -c core target/usr/bin/icuinfo
>
>and then run the "backtrace" command in gdb, to see where the crash
>occurred.
>
>
>
>
>
>Thanks!
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Free Electrons
>Embedded Linux, Kernel and Android engineering
>http://free-electrons.com
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140611/e98411f5/attachment.html>
