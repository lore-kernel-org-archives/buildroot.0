From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Mar 2015 22:06:59 +0200
Subject: [Buildroot] clapack libraries missing?: buildroot-2014.11
In-Reply-To: <CADDnATcLG1SbgVZ8TB08J_yHU5vF7vKTPdwUZnFvcgewoUFdEg@mail.gmail.com>
References: <CADDnATcLG1SbgVZ8TB08J_yHU5vF7vKTPdwUZnFvcgewoUFdEg@mail.gmail.com>
Message-ID: <551AFE63.6050009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/15 16:51, Ernest Williams wrote:
> Hi,
> 
> I am using "buildroot-2014.11"
> I am using glibc and my target is INTEL x86_64
> Version of CLAPACK:
> CLAPACK_VERSION = 3.2.1
> 
> I would like to use clapack but missing the following libraries after the install:
> 
> ***********************
> (1) lapack_LINUX.a
> (2) blas_LINUX.a
> (3) libF77.a
> (4) libI77.a
> ************************
> 
> For includes I am also missing:
> *************************************
> "f2c.h"
> **************************************
> 
> 
> The only library, I see in the staging area is the following shared library:
> =============================
> liblapack.so
> =============================

 libblas.so should also be installed. And the header file is called clapack.h

 The f2c functionality is linked into these shared libraries, it shouldn't be
necessary to include or link with anything else.

 Regards,
 Arnout

> 
> 
> Cheers,
> Ernesto
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
