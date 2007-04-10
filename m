From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 10 Apr 2007 10:38:06 +0200
Subject: [Buildroot] arm compile problem around multi-cpu stuff
In-Reply-To: <cd7850860704091507t6d0e1d46s329828870aa429d0@mail.gmail.com>
References: <cd7850860704091507t6d0e1d46s329828870aa429d0@mail.gmail.com>
Message-ID: <200704101038.06153.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark,
All,

On Tuesday 10 April 2007 00:07, mark roths wrote:
> I am trying to build a recent (uclibc9.28.3 based) rfs using one of the
> latest buildroot snapshots.  All are failing
> to compile ./build_arm/busybox-1.5.0/miscutils/taskset.c
> 
> cpu_set_t is used but nowhere defined.  In addition there are lots of
> undefined macros e.g. CPU_SETSIZE()
> that also create errors.

uClibc-0.9.28.* and before does not support cpu_set. Disable taskset in BusyBox,
or try a snapshot of uClibc.

Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
