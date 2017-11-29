From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Nov 2017 11:22:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-28
In-Reply-To: <20171129070009.BC0F72037D@mail.free-electrons.com>
References: <20171129070009.BC0F72037D@mail.free-electrons.com>
Message-ID: <20171129102201.GI2889@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-29 08:00 +0100, Thomas Petazzoni spake thusly:
> Build statistics for 2017-11-28
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2017.08.x |  11 |   0 |   0 |  11 |
>       master | 176 |   4 |   0 | 180 |

Woot! :-)

This is a pretty good state for the upcoming release. :-)

> Results for branch 'master'
>     mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/2b8c810bd8775413fd4567b2f8495be70b7bb808 |     

Parallel install issue. I'm on it...

>       mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/ed88a03eda6bf40634534578e6e870a25ed66261 | ORPH

callNative.S: Assembler messages:
callNative.S:161: Error: float register should be even, was 1

This is for a mipsr6.

Vicente, should we disable jamvm for mipsr6?

>          arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/624f2db9baad4f1d6c41ff74dc6310a4228679f2 |     

  CCLD     prog
OBJCOPY prog.debug
objcopy: Unable to recognise the format of the input file `prog'

This is for an armv4.

I've looked, but the dependency chain looks good.

Philippe?

>         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/e09731abe257ee187e20aa0e75beee22004bd3e2 |     

src/client/options.cpp: In function 'client_options
process_command_line(int, const char**)':
src/client/options.cpp:139:1: internal compiler error: in
merge_overlapping_regs, at regrename.c:304
 }
 ^

Waldemar? Should we disable it for or1k?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
