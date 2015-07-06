From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 Jul 2015 10:33:40 -0300
Subject: [Buildroot] [PATCH] collectd: fix parallel build issues
In-Reply-To: <20150706152250.54ec1b86@free-electrons.com>
References: <1436188343-11234-1-git-send-email-gustavo@zacarias.com.ar>
 <20150706152250.54ec1b86@free-electrons.com>
Message-ID: <559A83B4.1010902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/07/15 10:22, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
>
> On Mon,  6 Jul 2015 10:12:23 -0300, Gustavo Zacarias wrote:
>
>> +diff -Nura collectd-5.5.0.orig/src/daemon/Makefile.am collectd-5.5.0/src/daemon/Makefile.am
>> +--- collectd-5.5.0.orig/src/daemon/Makefile.am	2015-07-06 10:01:17.820506239 -0300
>> ++++ collectd-5.5.0/src/daemon/Makefile.am	2015-07-06 10:02:03.364054763 -0300
>> +@@ -49,7 +49,7 @@
>> + collectd_CFLAGS = $(AM_CFLAGS)
>> + collectd_LDFLAGS = -export-dynamic
>> + collectd_LDADD = libavltree.la libcommon.la libheap.la -lm
>> +-collectd_DEPENDENCIES =
>> ++collectd_DEPENDENCIES = libavltree.la libcommon.la libheap.la
>
> Can you try instead to get rid of the empty collectd_DEPENDENCIES
> definition? Because when undefined foo_DEPENDENCIES automatically
> contains the contents of foo_LDADD.
>
> From
> http://www.gnu.org/software/automake/manual/html_node/Program-and-Library-Variables.html:
>
> """
> If _DEPENDENCIES is not supplied, it is computed by Automake. The
> automatically-assigned value is the contents of _LDADD or _LIBADD, with
> most configure substitutions, -l, -L, -dlopen and -dlpreopen options
> removed. The configure substitutions that are left in are only
> ?$(LIBOBJS)? and ?$(ALLOCA)?; these are left because it is known that
> they will not cause an invalid value for _DEPENDENCIES to be generated.
> """
>
> Best regards,

Hi.
That won't work in this case since it's added upon later (if 
BUILD_WITH_OWN_LIBOCONFIG ... ).
Regards.
