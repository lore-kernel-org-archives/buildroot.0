From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Fri, 20 Nov 2015 12:35:34 -0700
Subject: [Buildroot] Using openssl functions in another package
Message-ID: <564F7606.4020309@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a custom package (source in C) that uses some of OpenSSL's SHA 
functions to perform hashing.  I can build successfully outside of the 
buildroot tree by both including the SHA header file in the C source with:

#include <openssl/sha.h>

and then adding the crypto library in the CC command:

$(CC) -lcrypto -o prog prog.c

However, when I try to build the package in buildroot, using the same CC 
command in the Makefile, I get the following error:

prog.c: fatal error: openssl/sha.h: No such file or directory

I have enabled the openssl package in my buildroot configuration, and 
set up my custom package's Config.in to depend on it:

depends on BR2_PACKAGE_OPENSSL

My target is a MicroBlaze (little endian, single core) processor.  What 
else might I need to do to use the OpenSSL SHA functions correctly and 
avoid this error?

-- 
Thanks,
David
