From: Kunal Chauhan <atkunalchauhan@gmail.com>
Date: Sat, 9 May 2020 23:36:06 +0530
Subject: [Buildroot] Help: debug binary in build_root
In-Reply-To: <3c88b9e7b58476542e54ae0e13f175b5@umbiko.net>
References: <mailman.7.1589025603.138573.buildroot@busybox.net>
 <3c88b9e7b58476542e54ae0e13f175b5@umbiko.net>
Message-ID: <CACEFAc09yq+y0W1anXNOfHuVbE3z0kTrz37YLu9=F-gwCckJaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi team ,

1. I have not done static code analysis before, no experience , would you
give some hint.?
2. If i have a log till where the program shows prints and after that logs
is not come as binary carshes.  Will it will be help ful in static analysis
and i can narrow down my debugging.?

Thank
Kunal




On 9 May 2020 10:45 p.m., "Andreas Ziegler" <br015@umbiko.net> wrote:

> Hi Kunal,
>
> Message: 14
>> Date: Sat, 9 May 2020 16:33:47 +0530
>> From: Kunal Chauhan <atkunalchauhan@gmail.com>
>> To: buildroot at busybox.net
>> Subject: [Buildroot] Help: debug binary in build_root
>>
>
> 1.Please help/hint if we have a some binaries in build-root and its is
>> crashing and also code  reside in LINUX folder of build-root. So how i can
>> find a crash in it or put valgrind if some chunk of code is crashing as
>> per
>> logs.?
>>
>
> Are you looking at memory leaks and crashes inside a vendor specific
> kernel? Linux has a framework for memory leak detection. I never used it
> myself; the documentation is here:
>
>   https://www.kernel.org/doc/html/latest/dev-tools/kmemleak.html
>
> You probably need to add this capability to code you patch into the kernel.
>
> In case of crashes, the first step is to look at the code. When deploying,
> leave debug symbols intact and don't strip binaries. The kernel dump should
> give you the location where a particular crash occurred. Sometimes the bug
> is obvious and can be found via a code review.
>
> If that does not help, or you are referring to a program in user-space,
> unpack gdb. You need to enable the package gdbserver in Buildroot and
> compile for debugging. Check the documentation for details how to use
> gdbserver /gdb client:
>
>   https://gcc.gnu.org/onlinedocs/gcc-4.6.4/gnat_ugn_unw/
> Remote-Debugging-using-gdbserver.html
>
> 2. As point 1. Without using or running binary on board can i check the
>> memory leaks at particular file ?
>>
>
> If you have cross-compiled code, that may be impossible. Static code
> analysis might locate some of the more obvious defects.
>
> Kind regards,
> Andreas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200509/e9f05e30/attachment.html>
