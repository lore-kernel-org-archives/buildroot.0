From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 3 Oct 2008 00:29:49 -0700
Subject: [Buildroot] [buildroot 0005214]: make uclibc-config fails,
	as sed does not exist.
Message-ID: <2641c2c2a78f0190d16e752ca679f8dc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5214 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5214
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-02-2008 22:11 PDT
Last Modified:              10-03-2008 00:29 PDT
====================================================================== 
Summary:                    make uclibc-config fails, as sed does not exist.
Description: 
I am getting the following failure from a fresh checkout of buildroot:

<yada yada>
/home/mjd/wrk/buildroot-sym-1/toolchain_build_arm/bin/sed -i -e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/home/mjd/wrk/buildroot-sym-1/build_arm/staging_dir/usr/bin/arm-linux-uclibc-",g'
\
                -e 's,# TARGET_arm is not set,TARGET_arm=y,g' \
                -e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"arm\",g' \
                -e
's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/home/mjd/wrk/buildroot-sym-1/toolchain_build_arm/linux\",g'
\
                -e
's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"/home/mjd/wrk/buildroot-sym-1/toolchain_build_arm/linux/include\",g'
\
                -e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
                -e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
                -e
's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
               
/home/mjd/wrk/buildroot-sym-1/toolchain_build_arm/uClibc-0.9.29/.oldconfig
make: /home/mjd/wrk/buildroot-sym-1/toolchain_build_arm/bin/sed: Command
not found

How to reproduce:

tar -xjf ../dl/buildroot-svn-snapshot.tar.bz2
cd buildroot
cp target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig .config
make menuconfig
# Immediately exit and save without changing any values
make uclibc-config
====================================================================== 

---------------------------------------------------------------------- 
 mjd - 10-02-08 23:00  
---------------------------------------------------------------------- 
The above patch to buildroot fixes the problem for me. 

---------------------------------------------------------------------- 
 egtvedt - 10-03-08 00:29  
---------------------------------------------------------------------- 
Is this patch allways correct? The rule seems a bit weird for me, I would
assume something like sed-host-installed or something similar.

Does Buildroot build sed if the host is missing it? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-02-08 22:11  mjd            New Issue                                    
10-02-08 22:11  mjd            Status                   new => assigned     
10-02-08 22:11  mjd            Assigned To               => buildroot       
10-02-08 22:12  mjd            Issue Monitored: mjd                         
10-02-08 22:59  mjd            File Added: uclibc-sed-1.diff                    
10-02-08 23:00  mjd            Note Added: 0012594                          
10-03-08 00:29  egtvedt        Note Added: 0012624                          
======================================================================
