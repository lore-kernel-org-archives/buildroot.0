From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Apr 2014 18:44:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-06
In-Reply-To: <20140407063008.806A9100D3A@stock.ovh.net>
References: <20140407063008.806A9100D3A@stock.ovh.net>
Message-ID: <20140407164426.GA3215@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-07 08:30 +0200, Thomas Petazzoni spake thusly:
> Detail of failures
> ===================
[--SNIP--]
>        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/540e1ef5cb629b65f79a1dd43d87e6aa16e31dfa/

This one is because XBMC is selected, but there is no Java on the host.
XBMC needs Java, so we may want to have Java installed on the
autobuilders to be able to be able to build XBMC.

[--SNIP--]
>      avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/980374d9b4dca7e46c6ba3aecb1c8e7f46119008/
>      avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0ec39a1e3c4c3baa5aaad7ec037436b1f407e08a/

This is caused by:
    0aa9019 toolchain: print actual version of kernel headers when checking

The avr32 toolchain uses gcc-4.2.x which does not support the
-print-sysroot option.

Investigating...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
