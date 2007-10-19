From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 23:42:58 +0300
Subject: [Buildroot] [buildroot 0001541]: NCFTP don't download
In-Reply-To: <4154625e08f3dec89f32fcb6ecc7d343@bugs.uclibc.org>
References: <4154625e08f3dec89f32fcb6ecc7d343@bugs.uclibc.org>
Message-ID: <471916D2.6050909@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bugs at busybox.net wrote:
> The following issue has been SUBMITTED. 
> ====================================================================== 
> http://busybox.net/bugs/view.php?id=1541 
> ====================================================================== 
> Reported By:                sushisan
> Assigned To:                buildroot
> ====================================================================== 
> Project:                    buildroot
> Issue ID:                   1541
> Category:                   Architecture Specific
> Reproducibility:            always
> Severity:                   crash
> Priority:                   normal
> Status:                     assigned
> ====================================================================== 
> Date Submitted:             10-18-2007 16:37 PDT
> Last Modified:              10-18-2007 16:37 PDT
> ====================================================================== 
> Summary:                    NCFTP don't download
> Description: 
> ncftp-3.2.0-src.tar.bz2 are not any more in the repo
> 
> ====================================================================== 
> 
> Issue History 
> Date Modified   Username       Field                    Change               
> ====================================================================== 
> 10-18-07 16:37  sushisan       New Issue                                    
> 10-18-07 16:37  sushisan       Status                   new => assigned     
> 10-18-07 16:37  sushisan       Assigned To               => buildroot       
> 10-18-07 16:37  sushisan       File Added: br2-ncftp.patch                    
> ======================================================================
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


Hi, I have applied your patch, but I have the following error when BR2_PACKAGE_NCFTP_UTILS=y selected:

make[1]: Leaving directory `/opt/buildroot/build_arm/ncftp-3.2.1'
/usr/bin/install -m 0755 /opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftp /opt/buildroot/project_build_arm/uclibc/root/usr/bin
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip --remove-section=.comment --remove-section=.note --strip-all /opt/buildroot/project_build_arm/uclibc/root/usr/bin/ncftp
/usr/bin/install -m 0755 /opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftpbatch /opt/buildroot/project_build_arm/uclibc/root/usr/bin
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip --remove-section=.comment --remove-section=.note --strip-all /opt/buildroot/project_build_arm/uclibc/root/usr/bin/ncftpbatch
/usr/bin/install -m 0755 /opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftpbookmarks /opt/buildroot/project_build_arm/uclibc/root/usr/bin
/usr/bin/install: cannot stat `/opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftpbookmarks': No such file or directory
make: *** [/opt/buildroot/project_build_arm/uclibc/root/usr/bin/ncftpbookmarks] Error 1

If selecting only BR2_PACKAGE_NCFTP=y , build is ok, however I did not verified it on the target.

Can you fix issue with BR2_PACKAGE_NCFTP_UTILS=y ?

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
