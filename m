From: hartleys <hartleys@visionengravers.com>
Date: Fri, 14 Nov 2008 11:42:45 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20081113163256.D28F83C8A1@busybox.net>
References: <20081113163256.D28F83C8A1@busybox.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909D3E78E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, November 13, 2008 9:33 AM, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-11-13 08:32:56 -0800 (Thu, 13 Nov 2008) New Revision: 24031
> 
> Log:
> busybox: add 1.13.x, mark older as deprecated
> 
> Added:
>    trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch
>    trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch
>    trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch
> 
> Modified:
>    trunk/buildroot/package/busybox/Config.in

With revision 24042 of buildroot I get an error building busybox. During
the build I get:

...
  CC      coreutils/id.o
coreutils/id.c: In function 'get_groups':
coreutils/id.c:81: warning: implicit declaration of function
'getgrouplist'
...

Then at the final link:

...
coreutils/lib.a(id.o): In function `get_groups':
id.c:(.text.get_groups+0x10): undefined reference to `getgrouplist'
collect2: ld returned 1 exit status
make[1]: *** [busybox_unstripped] Error 1
...

Any ideas?

Thanks,
Hartley
