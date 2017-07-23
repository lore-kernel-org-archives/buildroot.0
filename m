From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 22:39:12 +0200
Subject: [Buildroot] TestIso9660GrubExternal and TestIso9660GrubInternal
 failing
In-Reply-To: <20170723200237.GJ26998@scaer>
References: <20170723092643.GE2917@scaer>
 <5974e7554c7c_30a1600b705951e@ultri3.mail>
 <20170723200237.GJ26998@scaer>
Message-ID: <20170723203912.GL26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-07-23 22:02 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> I plan on doign those tests;

  - build on 16.04, run on 16.04
    ==> builds and runs OK

  - build on 16.04, run on 17.04
    ==> builds and runs OK

  - build on 17.04, run on 16.04
    ==> builds OK, does not run.

So, I think this is realyl a regression with newer binutils:

    $ ls -l fail/build/grub-0.97/stage1/stage1
    -rwxr-xr-x 1 ymorin ymorin 129M juil. 23 22:10 stage1

    $ ls -l works/build/grub-0.97/stage1/stage1
    -rwxr-xr-x 1 ymorin ymorin  512 juil. 23 22:09 stage1

Similarly with stage2 and above, with file reaching over 256MiB...

So, definitely something fishy with binutils-2.28...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
