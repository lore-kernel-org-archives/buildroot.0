From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 1 Jun 2008 11:55:52 -0700
Subject: [Buildroot] [buildroot 0003544]: Installation of tftp-hpa fails
Message-ID: <fbe2ec75cf627b7e8bc913232af68521@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3544 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3544
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-01-2008 11:55 PDT
Last Modified:              06-01-2008 11:55 PDT
====================================================================== 
Summary:                    Installation of tftp-hpa fails
Description: 
in.tftpd isn't always installed correctly. The following rule fragment from
package/tftpd/tftpd.mk looks suspect as ! binds tighter than -o at least in
the shells I have been testing.

 @if [ ! -f $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) -o $(TARGET_DIR)/$(TFTP_HP
A_TARGET_BINARY) \
        -ot $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) ]; then \
            set -x; \
            rm -f $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); \
            cp -a $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY)
$(TARGET_DIR)/$(TFTP_HPA_TA
RGET_BINARY); fi

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-01-08 11:55  KHAksnes       New Issue                                    
06-01-08 11:55  KHAksnes       Status                   new => assigned     
06-01-08 11:55  KHAksnes       Assigned To               => buildroot       
======================================================================
