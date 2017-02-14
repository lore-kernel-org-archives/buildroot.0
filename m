From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Feb 2017 17:39:27 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214142725.1b9e98ae@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <20170214163927.GA3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-14 14:27 +0100, Thomas Petazzoni spake thusly:
> >          arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/6f197c643972e92f0b27b3afac7da7b4b1115f7e
> 
> BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"
> BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
> BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"
> 
> This seems like a quite messy configuration: we have mesa3d as the
> OpenGL provider, and rpi-userland as the OpenGLES/EGL provider. Yann,
> what do you think about this?

I believe this case does not make sense. We should protect against that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
