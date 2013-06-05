From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 15:08:55 +0200
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130605150855.289fe5bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 5 Jun 2013 13:56:16 +0100, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> Several object files are shared between the libbz2.so shared library
> and the libbz2.a static one. MIPS will refuce to build a relocatable
> object when creating a new shared library with the following error:
> 
> blocksort.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used
> when making a shared object; recompile with -fPIC
> 
> This is because these files are build without -fPIC when creating the
> static library and later on they are used to build the shared one.
> 
> This is easily fixed if we add the shared library build rule before
> creating the static library so object files are always compiled with
> -fPIC.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

This seems to make sense to me, so:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
