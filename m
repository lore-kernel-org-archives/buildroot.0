From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 May 2010 16:09:41 +0200
Subject: [Buildroot] building libglib2
In-Reply-To: <3D6F80E6910D4096A4905780E1A2E63E@apexjs> (Sagaert Johan's
	message of "Fri, 21 May 2010 15:43:56 +0200")
References: <3D6F80E6910D4096A4905780E1A2E63E@apexjs>
Message-ID: <87bpc9uz16.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> I checked the staging dir :
 
 Sagaert> in my 0.9.30.3 build there is a staging/lib/libresolv.so.0
 
 Sagaert> under my build with uclibc 0.9.31 there is no such library

No? Are you using
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config" in your
config?

libresolv is empty in 0.9.31 (functionality in libuClibc), but we are
building a stub libresolv since mid april:

4ab6883ac5aa07ea1c317d85c92495b155cf214a
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Wed Apr 14 11:17:47 2010 -0300

    uclibc: Enable libresolv and libnsl stubs by default for 0.9.31
    
    Closes #1555.
    
    Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
    Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Bye, Peter Korsgaard
