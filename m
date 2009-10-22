From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 22 Oct 2009 19:40:19 +0200
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
Message-ID: <200910221940.19877.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anders!
Hello All!

On Thursday 22 October 2009 11:47:52 Anders Darander wrote:
> To  make sure that debuging works, it is preferred if both the host
> crosscompiler gdb and gdbserver is built from the same gdb version. If
> we take the gdbserver from the external toolchain, this is guaranteed.

Yes, this is highly suggested that the cross-gdb and the gdbserver are
from the same /version/ of gdb, as they have to speak the same protocol
on the wire, and that can change between releases.

> I'm not sure that the implementation is the best, it migth be  a
> little bit "hackish". Looking forward to some comments for
> improvement.

I'm afraid this is a bit too crosstool-NG centric. OTOH, there's no clean
way to know where in an external toolchain we should look for the gdbserver.

This is some API that crosstool-NG should expose to outside: tell me where
in can find the {gdbserver,duma,whatever} and the corresponding dependencies
(libs, scripts...).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
