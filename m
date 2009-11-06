From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 06 Nov 2009 09:52:16 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
Message-ID: <1257497536.1962.15.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-11-06 at 08:47 +0100, Joachim Pihl wrote:

> I had a look in the archives, but did not find any recent information that  
> seems to cover the problems I am experiencing.
> 
> About 18 months ago, we had our target build system configured by a  
> consultant. This is an Xscale target. We made the root FS fit in the  
> allotted space, just fine. Preparing to add a new controller card to our  
> product range, I decided to download a fresh Buildroot, then configure to  
> match the old setup (which has issues building on Ubuntu 9.04 or later,  
> possibly due to some package we have added). Busybox and uclibc config  
> files are copied from the previous buildroot environment.
> 
> As it turns out, the rootfs of this configuration is several MBs larger  
> than the previous one, mainly due to an explosion of shared libraries.
> 
> /usr/lib has a lot of glib*.so files that were not previously there, and  
> also iconv has been added. In addition, both libstd++.so.6.0.9 and  
> libstd++.so.6.0.10 are added. /usr/lib is now twice the size of that of  
> the previous target, meaning it won't fit on the target anymore. I believe  
> glib* are parts of GLIBC, how come it is installed when I am trying to  
> build a uclibc system?

glib is http://library.gnome.org/devel/glib/stable/glib.html and should
not be confused with glibc.

I assume that some package you selected pulled in libglib2, which itself
pulls in other things like iconv. Just check your package selection and
make sure that you only select the packages you absolutely need.


Sven
