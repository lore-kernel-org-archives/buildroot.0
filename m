From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 10 Dec 2010 19:08:38 +0100
Subject: [Buildroot] [PATCH v3] fix iproute2 dependencies and define AR
	for iptables and iproute2
In-Reply-To: <201012101900.44789.yann.morin.1998@anciens.enib.fr>
References: <0e6c629d481e9024055833cf47d4543e0b1f2d76.1292000704.git.smiley73@users.sourceforge.net>
	<AANLkTimVB8tTYopQxQrzAXbQxhBygGZd6xDj0tUFeNjv@mail.gmail.com>
	<201012101900.44789.yann.morin.1998@anciens.enib.fr>
Message-ID: <201012101908.38592.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serj, Heiko, All,

On Friday 10 December 2010 19:00:44 Yann E. MORIN wrote:
> On Friday 10 December 2010 18:56:02 Pkun wrote:
> > Unpack the iptables and search for the $(AR) within the project. There is no
> > $(AR) at all.
> 
> Yes there is:
> 
>   cd iptables-1.4.10
>   ./configure
>   grep -r -E '\<AR\>' .
>   ---8<---
>   ./Makefile:AR = ar
>   ---8<---

And:
  grep -r -E '\$\<\(?AR\)?\>' .

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
