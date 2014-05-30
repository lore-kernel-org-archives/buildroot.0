From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 May 2014 22:57:41 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <5388ECDC.6050909@gmx.net>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
 <5388A9DC.1010204@gmx.net>
 <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
 <20140530222718.5cb42dd5@free-electrons.com>
 <5388ECDC.6050909@gmx.net>
Message-ID: <20140530205741.GE3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-05-30 22:41 +0200, Peter K?mmel spake thusly:
> In short: anybody assumes "#include <GLES2/gl2.h>" works when the search
> paths of pkg-config are used. But when pkg-config reports /usr/include/GLES2
> gl2.h could not be found, because there is no /usr/include/GLES2/GLES2/gl2.h.
> 
> Until now this doesn't pop up because by chance the directory GLES2
> resides in /usr/include and this path is added by most by build systems.
> But the cmake configure scripts of Qt5 test for "GLES2/gl2.h" only in the path
> reported by pkg-config.

And what if we do not specify any Cflags in the .pc? Is Qt5's configure
script happy with that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
