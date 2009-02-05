From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Thu, 05 Feb 2009 16:25:21 +0100
Subject: [Buildroot] cannot compute suffix of object files
In-Reply-To: <498AC1E5.6080707@eclis.ch>
References: <498AC1E5.6080707@eclis.ch>
Message-ID: <498B04E1.9060002@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christian de Rivaz a ?crit :
> Hi,
> 
> I try to install buildroot by testing the default configuration. I do a 
> "make menuconfig" and I exit it without touching any setting. After I do 
> a "make". I that correct ?
> 
> The problem is that the build failed on the 2009.02-RC3 and on the 
> Subversion revision 25244. The error is alway the same:
> 
> checking for suffix of object files... configure: error: cannot compute 
> suffix of object files: cannot compile
> 
> More details on the attached files. The host is a Debian Etch x86_64.
> 
> Please help

I have found that this command work after the simple "make" failed:

LD_LIBRARY_PATH=\
`pwd -P`/`ls -1d toolchain_build_*`/mpfr/lib:\
`pwd -P`/`ls -1d toolchain_build_*`/gmp/lib\
  make

Sound like something is missing in a gcc-4.3.2-initial related Makefile.

-- 
Jean-Christian de Rivaz
