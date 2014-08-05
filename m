From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 16:17:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-08-04
In-Reply-To: <53E0D610.3070603@imgtec.com>
References: <20140805063010.EAA98100F1D@stock.ovh.net>
 <53E0D610.3070603@imgtec.com>
Message-ID: <20140805161731.20ab266a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 5 Aug 2014 14:03:12 +0100, Vicente Olivert Riera wrote:
> On 08/05/2014 07:30 AM, Thomas Petazzoni wrote:
> > Build statistics for 2014-08-04
> > ===============================
> 
> >    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/31a9cf4152aca7ba7d5ab798eea3161a9e47e68d/
> 
> That build failure is caused because in that toolchain...
> 
>  
> http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.x
> 
> ...SYS_getdents64 is only defined for MIPS32 and MIPS64 n32, and NOT for 
> MIPS64 n64.
> 
> That has been fixed on newer versions of eglibc (which is the C library 
> that toolchain is using). For instance, in the Buildroot's default 
> eglibc version (2.18-svnr23787) it's already fixed.
> 
> So, please, could be possible to upgrade that toolchain.

Thanks for the investigation. In the mean time, I'll blacklist
configurations using this toolchain and having Python 3 enabled in the
autobuilder script.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
