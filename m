From: Christian Gagneraud <cgagneraud@techworks.ie>
Date: Wed, 23 Jan 2008 00:41:21 +0000
Subject: [Buildroot] Another ARM kernel build problem (this time with
 2.6.22.10 kernel)
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E609BFDDAB@mtsexchange.dc.multitech.prv>
References: <1CD05B980C94AC408B37C82BBABAA3E609BFDDAB@mtsexchange.dc.multitech.prv>
Message-ID: <47968D31.6060002@techworks.ie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tim Barr wrote:
> While waiting for an answer on my 2.6.22.1 kernel build problems, I made
> a new config file using the 2.6.22.10 linux kernel. After solving a web
> access issue, I come up with the following error:
>
> Can't exec "aclocal": No such file or directory at /usr/bin/autoreconf
> line 182.
> Use of uninitialized value in pattern match (m//) at /usr/bin/autoreconf
> line 182.
> Can't exec "automake": No such file or directory at /usr/bin/autoreconf
> line 183.
> Use of uninitialized value in pattern match (m//) at /usr/bin/autoreconf
> line 183.
> Can't exec "aclocal": No such file or directory at
> /usr/share/autoconf/Autom4te/FileUtils.pm line 290.
> autoreconf: failed to run aclocal: No such file or directory
> /bin/sh: ./configure: not found
> make: ***
> [/home/falingtrea/buildroot/build_arm_wchar/tslib-1.0/.configured] Error
> 127
>   
Seems you have installed autoconf but not automake...strange...
you should install autoconf, automake and libtool.

>
> There is a script file called 'autoreconf' located in the /usr/bin
> directory that has an 'aclocal' section to it, but no file named
> 'aclocal' and no directory named 'autoreconf'. So what am I doing wrong
> this time??
>
>
> Timothy Barr
> Hardware Development Engineer
> for Multi-Tech Systems, Inc.
> tbarr at multitech.com
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>   
