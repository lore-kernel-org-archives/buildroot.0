From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2020 13:57:55 +0200
Subject: [Buildroot] evmctl sign fails in fakeroot 1.20.2
In-Reply-To: <CAE58QoM1yfu4GXYrkAZWWnhuXMtm_13toi=1VMmhqAMbuZexAA@mail.gmail.com>
References: <CAE58QoM1yfu4GXYrkAZWWnhuXMtm_13toi=1VMmhqAMbuZexAA@mail.gmail.com>
Message-ID: <20200410115755.GH29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Juan, All,

On 2020-04-10 12:48 +0100, Juan A. Rubio spake thusly:
> Hi all,
> I've recently experienced issues while signing binaries with 'evmctl' from within the fakeroot script. 'evmctl' produces IMA
> signatures that are stored in extended attributes (
> [1]https://sourceforge.net/p/linux-ima/wiki/Home/#labeling-the-filesystem-with-securityima-extended-attributes ). The version of
> fakeroot in Buildroot (1.20.2) is actually not handling this correctly.?
> This particular issue was fixed back?in 2016 in fakeroot version 1.21.
> [2]https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=801977 ?

OK, so in the end it is not that extended attributes are not supported
(which is what you were claiming was the problem), but rather that large
extended attributes are the problem, hence the incomprehension when I
was doign my tests locally and it was working.

I'm glad you found the actual problem, and even more so that you foudn
the solution.

> I've verified that fakeroot 1.24 does not present this problem. If there is an interest, I could submit a patch.

Yes, please send the patch. Add me in Cc.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
