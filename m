From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Wed, 19 Nov 2014 16:24:29 +0100
Subject: [Buildroot] Update linux staging dir
Message-ID: <0DCDA0A0437F82429223C2824D85F5370F4F4B242F@SERVER7-RVEER.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,

For a custom (CAN) driver, I wanted to add a header file which should be included from user-space (for some ioctl defines). I therefore added this header in the include/uapi/linux/can directory and updated the Kbuild file here to add this header file to the list to be copied.

I would have expected that by forcing a build for the kernel, the contents of the staging/usr/include/linux/can would be updated. The 1st attempt was by a make linux after removing the .stamp files (except for the .stamp_configured), the 2nd after a make linux-clean. Both without success. Also if I remove an existing file from the staging dir, it does not come back after a forced build. I now removed the complete staging/usr/include/linux dir, but even then this directory is not re-generated on a build.

Tried a "make linux-install-staging", but the result is  "Nothing to be done".

So in short my question: how can I force regenerating/updating the staging/usr/include/linux directory from the buildroot environment?

Kernel version is 3.10.x (following the LTS), Buildroot version is 2013.02.

Regards,

Ruud
