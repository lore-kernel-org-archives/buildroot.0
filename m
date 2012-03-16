From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 16 Mar 2012 15:52:53 +0100
Subject: [Buildroot] curl sagmentatation fault - > is openssl the culprit ?
Message-ID: <F4A167A0B310422C906F05845738AE17@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Things are not always what they seem:

It seems to me that when the configure script of curl runs it checks for openssh, if none is found
Then it is build without openssl.

uClibc 0.9.32 and openssl seems no problem.

I gonna do some more builds (may take some time.)
 
======================================
GCC 4.5.3 : uClibc 0.9.33 (binutils 2.22)
======================================
BR2_PACKAGE_OPENSSL=y
# curl
Segmentation fault
#

# BR2_PACKAGE_OPENSSL is not set
# curl --version
curl 7.24.0 (arm-unknown-linux-gnu) libcurl/7.24.0 zlib/1.2.5
Protocols: dict file ftp gopher http imap pop3 rtsp smtp telnet tftp
Features: Largefile libz
#




======================================
GCC 4.5.3 : uClibc 0.9.32 (binutils 2.22) <-- now uClibc 0.9.32
======================================
BR2_PACKAGE_OPENSSL=y

# notice the SSL support
# curl --version 
curl 7.24.0 (arm-unknown-linux-gnu) libcurl/7.24.0 OpenSSL/1.0.0g zlib/1.2.5
Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smtp
smtps telnet tftp
Features: Largefile NTLM NTLM_WB SSL libz
#


======================================
GCC 4.6.3 : uClibc 0.9.33 (binutils 2.22)
======================================
# curl --version
Segmentation fault
#

Gonna try some more, wished i had a 64 CPU machine with a total of 256 cores...

Sagaert Johan
