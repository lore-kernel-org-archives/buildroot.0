From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jun 2014 23:27:54 +0200
Subject: [Buildroot] libcec needs to be patched to provide a correct
	libcec.pc
Message-ID: <20140613212754.GB16169@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

You previously said (on IRC) that  "libcec needs to be patched in order
to provide a correct libcec.pc"

What I saw is that libcec.pc has:
    Libs: -L${libdir} -lcec

Do you mean it should also have -ludev, like:
    Libs: -L${libdir} -lcec -ludev

The issue I see with adding -ludev is:
  - libcec can not be built static, so it is always built as a .so
  - libcec.so has a DT_NEEDED tag on libudev.so.1
  - normally, the linker will follow the DT_NEEDED flags of .so

So, linking a program against -lcec should be enough (unless that
program itself requires -ludev, but then it should specify it, and
that's unrelated to libcec)

Can you elaborate a bit on why and how we should patch libcec.pc,
please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
