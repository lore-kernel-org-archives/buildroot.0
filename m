From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 22:25:43 +0100
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <20171102221215.1250bc0b@windsurf>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
 <20171102221215.1250bc0b@windsurf>
Message-ID: <20171102212543.GE30054@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-02 22:12 +0100, Thomas Petazzoni spake thusly:
> On Thu,  2 Nov 2017 19:14:05 +0100, Yann E. MORIN wrote:
> > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> > index c2cfc34284..797c07c3f9 100644
> > --- a/package/gdb/Config.in.host
> > +++ b/package/gdb/Config.in.host
> > @@ -1,4 +1,17 @@
> > +config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
> > +	bool
> > +	default y
> > +	# The ARC version needs C++11, thus gcc >= 4.8, like gdb-8.0.x
> > +	depends on BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_arc
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_arc
> 
> Why do we have a dependency on the target compiler version for
> host-gdb ?

For two reasons:

1. you said so in your analysis. OK, you could be wrong, so...
2. that is the case for gdb-8.0.x, later in that same file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
