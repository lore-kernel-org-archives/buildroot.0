From: <bogus@does.not.exist.com>
Date: Wed, 23 Apr 2008 14:39:25 -0000
Subject: No subject
Message-ID: <mailman.6.1213794405.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make[1]: Entering directory
`/media/EkstraDisk/buildroot/build_i686/dnsmasq-2.41'
cd src && /usr/bin/make \
 DBUS_MINOR=" `echo -DNO_IPV6 | ../bld/pkg-wrapper pkg-config --modversion
dbus-1 | nawk -F . -- '{ if ($(NF-1)) print \"-DDBUS_MINOR=\"$(NF-1) }'`" 
\
 DBUS_CFLAGS="`echo -DNO_IPV6 | ../bld/pkg-wrapper pkg-config --cflags
dbus-1`"  \
 DBUS_LIBS="  `echo -DNO_IPV6 | ../bld/pkg-wrapper pkg-config --libs
dbus-1`"  \
 SUNOS_LIBS=" `if uname | grep SunOS 2>&1 >/dev/null; then echo -lsocket
-lnsl -lposix4; fi `" \
 SUNOS_VER="  `if uname | grep SunOS 2>&1 >/dev/null; then uname -r | nawk
-F . -- '{ print \"-DSUNOS_VER=\"$2 }'; fi`" \
 -f ../bld/Makefile dnsmasq 
/bin/sh: line 1: nawk: command not found

Don't you have nawk installed? On my system, nawk is a link to gawk.

Seems like we don't currently check for awk in dependencies.sh, will fix 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-14-08 17:01  KHAksnes       New Issue                                    
06-14-08 17:01  KHAksnes       Status                   new => assigned     
06-14-08 17:01  KHAksnes       Assigned To               => buildroot       
06-15-08 13:40  jacmet         Note Added: 0008264                          
06-15-08 14:07  KHAksnes       Note Added: 0008274                          
06-15-08 14:08  KHAksnes       File Added: compilelog                       
06-18-08 06:06  jacmet         Note Added: 0008384                          
======================================================================
