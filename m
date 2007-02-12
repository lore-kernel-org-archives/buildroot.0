From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:27 -0800
Subject: [Buildroot] [buildroot 0000557]: syslogd-1.4.1 patch
Message-ID: <0d26a8f1f2ddb579e7b33f922374059e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=557 
====================================================================== 
Reported By:                frank sabella
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   557
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-23-2005 10:02 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    syslogd-1.4.1 patch
Description: 
Compiling syslogd-1.4.1 either with the buildroot environment or against
uClibc results in the build failing with the following error:

In file included from ksym_mod.c:97:
/router/apps/buildroot/build_i686/staging_dir/i686-linux-uclibc/sys-include/linux/module.h:41:
error: field `at
tr' has incomplete type
/router/apps/buildroot/build_i686/staging_dir/i686-linux-uclibc/sys-include/linux/module.h:49:
error: field `ko
bj' has incomplete type
ksym_mod.c:99: warning: `struct kernel_sym' declared inside parameter
list
ksym_mod.c:99: warning: its scope is only this definition or declaration,
which is probably not what you want
ksym_mod.c:139: error: field `module' has incomplete type
ksym_mod.c:141: error: field `module_info' has incomplete type
ksym_mod.c: In function `InitMsyms':
ksym_mod.c:210: warning: passing arg 1 of `get_kernel_syms' from
incompatible pointer type
ksym_mod.c:224: error: invalid application of `sizeof' to an incomplete
type
ksym_mod.c:232: warning: passing arg 1 of `get_kernel_syms' from
incompatible pointer type
ksym_mod.c:248: error: dereferencing pointer to incomplete type
ksym_mod.c:248: error: dereferencing pointer to incomplete type
ksym_mod.c:255: error: increment of pointer to unknown structure
ksym_mod.c:255: error: arithmetic on pointer to an incomplete type
ksym_mod.c: In function `AddModule':
ksym_mod.c:413: error: invalid application of `sizeof' to an incomplete
type
make[1]: *** [ksym_mod.o] Error 1
make[1]: Leaving directory
`/router/apps/buildroot/build_i686/sysklogd-1.4.1'
make: *** [/router/apps/buildroot/build_i686/sysklogd-1.4.1/klogd] Error
2


====================================================================== 

---------------------------------------------------------------------- 
 lord_apollyon - 11-30-05 04:04  
---------------------------------------------------------------------- 
Whoops, my apologies.  I thought my comment would be enclosed with the
patch.

I also didn't mean to subvert someone else's bug report.

To reiterate:

The first patch does not gate the replacement code for non-2.6 kernels,
which from my experience, is what breaks the sysklogd build.  My patch
uses substantially the same patch as the first, but also adds some gating
to the code in the .c file to use it only for kernels >= 2.5.0.

If the maintainers would prefer a different bug report be filed thusly,
I'm happy to oblige.  Feel free to undo what I've done here if that's the
case.

Cheers!
=Apollyon= 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-23-05 10:02  frank sabella  New Issue                                    
11-23-05 10:02  frank sabella  Status                   new => assigned     
11-23-05 10:02  frank sabella  Assigned To               => uClibc          
11-23-05 10:02  frank sabella  File Added: sysklogd-1.4.1-kernel_headers-1.patch
                   
11-30-05 04:00  lord_apollyon  File Added: sysklogd26fix.patch                  
 
11-30-05 04:04  lord_apollyon  Note Added: 0000715                          
01-24-06 07:55  prpplague      Status                   assigned => resolved
01-24-06 07:55  prpplague      Resolution               open => fixed       
01-24-06 07:55  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
