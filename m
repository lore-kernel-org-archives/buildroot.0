From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Nov 2013 21:56:54 +0100
Subject: [Buildroot] problem with building kernel modules.
In-Reply-To: <3FF194268D984DEF96AF81E6681E03E9@JohanW7>
References: <3FF194268D984DEF96AF81E6681E03E9@JohanW7>
Message-ID: <20131115205654.GH3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On 2013-11-15 21:24 +0100, Sagaert Johan spake thusly:
> I have a kernel module that I build and install trough the build system.
> This works fine, the module gets build, installed and depmod is run for it.
> 
> The problem occurs if I change the kernel config, the kernel build system
> removes all target/lib/modules/2.6.36.../kernel/* files , including my built modules.
> 
> As a result, my modules are missing.
> 
> How can this be solved ? 

There's no guarantee built into Buildroot that rebuilding a package will
rebuild other packages that depend on it.

The only option for you is to explicitly tell Buildroot to rebuild your
module:
    make fm25clxx-clean-for-reconfigure fm25clxx all

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
