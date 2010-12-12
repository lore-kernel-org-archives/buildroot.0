From: Justin Mark <oilehus@yahoo.com>
Date: Sat, 11 Dec 2010 19:37:36 -0800 (PST)
Subject: [Buildroot] Problem to add DConf in buildroot
In-Reply-To: <1292057462.24014.176.camel@coalu.atr>
Message-ID: <681873.12388.qm@web111105.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

Thanks a lot for the reply. I checked the uclibc config file, UCLIBC_HAS_ADVANCED_REALTIME was already turned on.

But I found a note in the file "uClibc_vs_SuSv3.txt":

Unimplemented optional interfaces:
----------------------------------
...
fcntl.h: posix_fallocate (depend on ADV)
...

so there's no implementation for posix_fallocate(). Since this function is only called once in Dconf, like this:
 if (posix_fallocate (fd, 0, 1) == 0)

maybe I can patch the Dconf file, if anyone has an idea on how to replace the above code, please let me know.

Many thanks,
--Justin  

--- On Sat, 12/11/10, Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> Subject: Re: [Buildroot] Problem to add DConf in buildroot
> To: buildroot at busybox.net
> Date: Saturday, December 11, 2010, 12:51 AM
> Le vendredi 10 d?cembre 2010 ?
> 22:24 -0800, Justin Mark a ?crit :
> > Hi
> > 
> > When I tried to add DConf into buildroot, I got the
> following error:
> > 
> > ../client/libdconf.so.0: undefined reference to
> `posix_fallocate'
> > collect2: ld returned 1 exit status
> > 
> > but I can build DConf without any problems outside of
> buildroot. 
> > 
> > In the Makefile.am, there's a line 
> > 
> > dconf_LDADD = $(gio_LIBS) ../client/libdconf.so.0
> > 
> > It seems to me that a dependency of
> "../client/libdconf.so.0" is not in the path when I built
> under buildroot, if so, anyone has an idea how to patch the
> makefile, so I can build Dconf and link with libdconf.so.0
> > 
> > Many Thanks,
> > Justin
> > 
> 
> Hello Justin,
> 
> I think you need uclibc compiled with
> UCLIBC_HAS_ADVANCED_REALTIME
> option.
> 
> Regards,
> 
> --
> Lionel Landwerlin
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


      
