From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jul 2014 16:06:59 +0200
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <53BE97D3.5090009@scalemp.com>
References: <53BD4395.5050306@scalemp.com> <20140709142242.GK3003@tarshish>
 <53BD5452.6030902@scalemp.com> <53BD55E2.7070507@zacarias.com.ar>
 <53BD576F.1060008@scalemp.com> <53BE83E8.2010906@scalemp.com>
 <20140710142322.188e88ed@free-electrons.com>
 <53BE887E.7070606@scalemp.com>
 <20140710145619.5925fa1b@free-electrons.com>
 <53BE8EF2.9000306@scalemp.com>
 <20140710153435.6b2ab536@free-electrons.com>
 <53BE97D3.5090009@scalemp.com>
Message-ID: <20140710160659.18c3af57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eial Czerwacki,

On Thu, 10 Jul 2014 16:40:35 +0300, Eial Czerwacki wrote:

> it seems that that file is missing but running LD_TRACE_LOADED_OBJECTS=1
> /bin/busybox doesn't shows libnss_dns.so.* is missing.

libnss_* files are dlopen()'ed by the glibc, so I'm not sure
LD_TRACE_LOADED_OBJECTS will show it.

It's clearly not normal that libnss_dns.so is missing. Here is a
Buildroot build using the internal toolchain backend with glibc that I
did a few days ago:

$ ls -l target/lib/libnss_*
-rwxr-xr-x 1 thomas thomas 17904 Jul  8 23:34 target/lib/libnss_dns-2.18.so
lrwxrwxrwx 1 thomas thomas    18 Jul  8 23:28 target/lib/libnss_dns.so.2 -> libnss_dns-2.18.so
-rwxr-xr-x 1 thomas thomas 46668 Jul  8 23:34 target/lib/libnss_files-2.18.so
lrwxrwxrwx 1 thomas thomas    20 Jul  8 23:28 target/lib/libnss_files.so.2 -> libnss_files-2.18.so

Could you please show:

 */ The output of 'ls -l output/target/lib'

 */ The version of Buildroot you're using

 */ The complete Buildroot configuration (.config file) you're using

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
