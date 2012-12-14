From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Dec 2012 22:12:16 +0100
Subject: [Buildroot] [PATCH 01/20] package/vde2: new package
In-Reply-To: <87vcc4j0h7.fsf@dell.be.48ers.dk>
References: <cover.1355435224.git.yann.morin.1998@free.fr>
 <1f7225d5ca0a09c835187bbfea4eb4ce1b6eb121.1355435224.git.yann.morin.1998@free.fr>
 <87vcc4j0h7.fsf@dell.be.48ers.dk>
Message-ID: <201212142212.16415.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Friday 14 December 2012 Peter Korsgaard wrote:
>  Yann> diff --git a/package/vde2/Config.in b/package/vde2/Config.in
>  Yann> new file mode 100644
>  Yann> index 0000000..f344d67
>  Yann> --- /dev/null
>  Yann> +++ b/package/vde2/Config.in
>  Yann> @@ -0,0 +1,10 @@
>  Yann> +config BR2_PACKAGE_VDE2
>  Yann> +	bool "vde2"
>  Yann> +	help
>  Yann> +	  VDE is an ethernet compliant virtual network that can be
>  Yann> +	  spawned over a set of physical computers over the Internet.
>  Yann> +	  VDE is part of the virtualsquare project.
>  Yann> +	  
>  Yann> +	  http://vde.sourceforge.net/
>  Yann> +	  
>  Yann> +	  Note: only the libraries are installed.
> 
> Wouldn't it then make more sense to put it under Libraries ->
> Networking?

Nope, we also install the executable to drive the VDE switches. I'll remove
that sentenc from the help text, and leave vde2 in "Network Applications".

> A quick test build seems to show that it needs C++ support:
> 
> checking whether the C++ compiler works... no
> configure: error: in `/home/peko/source/buildroot/vdetest/build/vde2-2.3.2':
> configure: error: C++ compiler cannot create executables
> See `config.log' for more details
> 
> I don't see any C++ source files though, so it's probably better to drop
> AC_PROG_CXX from configure.ac

Yup, fixed.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
