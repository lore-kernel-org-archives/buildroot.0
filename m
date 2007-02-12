From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:07 -0800
Subject: [Buildroot] [buildroot 0000197]: libelf mess up lib directory
	permissions
Message-ID: <38ccc144af2b7d960c7a2cd5787fb894@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=197 
====================================================================== 
Reported By:                Oliv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   197
Category:                   Other
Reproducibility:            have not tried
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-30-2005 05:11 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    libelf mess up lib directory permissions
Description: 
if "make" fails and there's libelf already compiled, when I retry "make"
command, I get the following error:
make:
stat:/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62.0.0:
Permission denied
cp -dpf /data/LiveCD/buildroot/build_i386/staging_dir/lib/libjpeg.so*
/data/LiveCD/buildroot/build_i386/root/usr/lib/
cp: cannot stat
`/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so': Permission
denied
cp: cannot stat
`/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62': Permission
denied
cp: cannot stat
`/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62.0.0':
Permission denied
make: ***
[/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62.0.0] Error
1

I can disable it with the following command:  chmod u+x
build_i386/root/usr/lib/
but it will reappear:
[15:10][olivier at Olinux /data/LiveCD/buildroot]$make
/usr/bin/install -d -m 0644
/data/LiveCD/buildroot/build_i386/libelf-0.8.5/libelf.so.0.8.5
/data/LiveCD/buildroot/build_i386/root/usr/lib/
/usr/bin/install -d -m 0644
/data/LiveCD/buildroot/build_i386/libelf-0.8.5/libelf.so
/data/LiveCD/buildroot/build_i386/root/usr/lib/
make: stat:/data/LiveCD/buildroot/build_i386/root/usr/lib/libelf.so.0.8.5:
Permission denied
wget --passive-ftp -P /data/LiveCD/buildroot/dl
http://easynews.dl.sourceforge.net/sourceforge/mad//libmad-0.15.1b.tar.gz
--15:10:20-- 
http://easynews.dl.sourceforge.net/sourceforge/mad/libmad-0.15.1b.tar.gz
           => `/data/LiveCD/buildroot/dl/libmad-0.15.1b.tar.gz'
Resolving easynews.dl.sourceforge.net... failed: Host not found.
make: *** [/data/LiveCD/buildroot/dl/libmad-0.15.1b.tar.gz] Error 1
(network is disabled so this error is normal)
[15:10][olivier at Olinux /data/LiveCD/buildroot]$
[15:10][olivier at Olinux /data/LiveCD/buildroot]$make
make:
stat:/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62.0.0:
Permission denied
cp -dpf /data/LiveCD/buildroot/build_i386/staging_dir/lib/libjpeg.so*
/data/LiveCD/buildroot/build_i386/root/usr/lib/
cp: cannot stat
`/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so': Permission
denied
cp: cannot stat
`/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62': Permission
denied
cp: cannot stat
`/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62.0.0':
Permission denied
make: ***
[/data/LiveCD/buildroot/build_i386/root/usr/lib/libjpeg.so.62.0.0] Error
1

So it seems that this error is due to incorrect install permissions on
libelf (664 for a directory whereas it should be 755)... and
unfortunately, I'm unable to find where these permissions are set up (I've
probably not searched enough)
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-12-05 15:04  
---------------------------------------------------------------------- 
This should now be all fixed up 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-30-05 05:11  Oliv           New Issue                                    
04-12-05 15:04  andersen       Note Added: 0000144                          
04-12-05 15:04  andersen       Status                   assigned => closed  
04-12-05 15:04  andersen       Resolution               open => fixed       
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
