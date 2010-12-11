From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 11 Dec 2010 09:51:02 +0100
Subject: [Buildroot] Problem to add DConf in buildroot
In-Reply-To: <200580.42715.qm@web111101.mail.gq1.yahoo.com>
References: <200580.42715.qm@web111101.mail.gq1.yahoo.com>
Message-ID: <1292057462.24014.176.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 10 d?cembre 2010 ? 22:24 -0800, Justin Mark a ?crit :
> Hi
> 
> When I tried to add DConf into buildroot, I got the following error:
> 
> ../client/libdconf.so.0: undefined reference to `posix_fallocate'
> collect2: ld returned 1 exit status
> 
> but I can build DConf without any problems outside of buildroot. 
> 
> In the Makefile.am, there's a line 
> 
> dconf_LDADD = $(gio_LIBS) ../client/libdconf.so.0
> 
> It seems to me that a dependency of "../client/libdconf.so.0" is not in the path when I built under buildroot, if so, anyone has an idea how to patch the makefile, so I can build Dconf and link with libdconf.so.0
> 
> Many Thanks,
> Justin
> 

Hello Justin,

I think you need uclibc compiled with UCLIBC_HAS_ADVANCED_REALTIME
option.

Regards,

--
Lionel Landwerlin
