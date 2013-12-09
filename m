From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Dec 2013 09:19:21 +0100
Subject: [Buildroot] wpa_supplicant doesn't compile
In-Reply-To: <CALADVSNmgocixipUwij+HS-bari8Toi-q_micsA44YwwRr9mUQ@mail.gmail.com>
 (Javier Alejandro Saenz Leguizamon's message of "Sun, 8 Dec 2013
 18:39:08 -0500")
References: <CALADVSNmgocixipUwij+HS-bari8Toi-q_micsA44YwwRr9mUQ@mail.gmail.com>
Message-ID: <87ppp68mie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Javier" == Javier Alejandro Saenz Leguizamon <jasaenzl@unal.edu.co> writes:

 > Good day.

 > I'm having trouble when try to compile the wpa_supplicant package, I
 > always get this error, can anyone please help me with this. I will
 > attach the .config I'm using.

 > jasaenzl at Killer-Laptop:~/develop/test/thesis_dev_repo/buildroot-2013.08.1$ make

Notice that 2013.11 has been released, so consider moving to it.

 > ../src/drivers/driver_wext.c: In function 'wpa_driver_wext_set_key_ext':
 > ../src/drivers/driver_wext.c:1703: error: 'IW_ENCODE_ALG_AES_CMAC' undeclared
 > (first use in this function)
 > ../src/drivers/driver_wext.c:1703: error: (Each undeclared identifier is
 > reported only once
 > ../src/drivers/driver_wext.c:1703: error: for each function it appears in.)
 > ../src/drivers/driver_wext.c: In function 'wpa_driver_wext_associate':
 > ../src/drivers/driver_wext.c:2130: error: 'IW_AUTH_MFP_DISABLED' undeclared
 > (first use in this function)
 > ../src/drivers/driver_wext.c:2133: error: 'IW_AUTH_MFP_OPTIONAL' undeclared
 > (first use in this function)
 > ../src/drivers/driver_wext.c:2136: error: 'IW_AUTH_MFP_REQUIRED' undeclared
 > (first use in this function)
 > ../src/drivers/driver_wext.c:2139: error: 'IW_AUTH_MFP' undeclared (first use
 > in this function)

Those defines come from the kernel headers, and have existed for quite
some time (2.6.29 or so). What kernel headers / toolchain are you using?

-- 
Bye, Peter Korsgaard
