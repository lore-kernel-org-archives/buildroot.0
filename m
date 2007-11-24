From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Sat, 24 Nov 2007 16:12:09 +0100
Subject: [Buildroot] abi problem with arm [solves alsa-lib invalid ioctl]
In-Reply-To: <47482CD3.2070800@promwad.com>
References: <4745A3A7.2000301@studiofuga.com> <47482CD3.2070800@promwad.com>
Message-ID: <47483F49.7050008@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan Kuten ha scritto:
> Yes, I can confirm that adding
>
> CFLAGS="$(TARGET_CFLAGS) -mabi=aapcs-linux"
>
> to alsa_utils.mk and alsa-utils.mk indeed fixes a problem for ARM (tested on ARM920T Cirrus Logic CPU)
>
> >From my point of view this option should be added to alsa only, not whole uclibc&buildroot.
>
>   

I forgot to mention that I already did the test by adding 
-mabi=aapcs-linux to the "optimization flags" in the buildroot 
configuration, but this broke all the system: for example, a simple ls 
reported all the files in the filesystem to be 4096 bytes long.


> Regards,
> Ivan
>   

Regards

Federico
