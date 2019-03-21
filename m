From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Mar 2019 23:26:25 +0100
Subject: [Buildroot] make log messages with buildroot 2019.02
In-Reply-To: <CALtfCQZXsSWLFNSxii9JF0Bixt0tcu_iRScVRRzfLsiEmHUf9A@mail.gmail.com>
References: <CALtfCQZXsSWLFNSxii9JF0Bixt0tcu_iRScVRRzfLsiEmHUf9A@mail.gmail.com>
Message-ID: <20190321222625.GE2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar, All,

On 2019-03-21 21:08 +0100, Oscar Gomez Fuente spake thusly:
> I am checking buildroot-2019.2 with raspberrypi3_defconfig and I've
> noticed something a little bit weirdo after the execution of the
> script: post-imagesh:

Note that the logs is all line-wrapped, so it is not easy to read it.
I had to do the build here to be sure what was going on...

> >>>   Executing post-image script board/raspberrypi3/post-image.sh
> INFO: cmd: "mkdir -p
> "/home/oscargomez/GIT/raspberrypi/buildroot-2019.02/output/build/genimage.tmp""
> (stderr):

So, the above three lines are in fact a single line.

And the stderr messages are "normal". By default, genimage uses a
"loglevel" of 1 if it is not specified on the command line, and this is
what logelvel==1 does.

I agree that this is not very nice, indeed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
