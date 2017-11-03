From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 03 Nov 2017 03:00:29 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/1=5D_package/dtc=3A_qemu_s?=
 =?iso-8859-1?q?ystem_build_need_libfdt=2E?=
In-Reply-To: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
References: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <09523a7a-0125-4c10-bb29-e15cfa00165f@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change breaks U-Boot 2017.09 because now U-Boot finds a copy of libfdt 
installed by host-dtc. Yes, it's probably a bug in U-Boot that it includes 
these files via <system-path>.

Here's how U-Boot build dies for me now:

tools/fdtgrep.c:228:21: error: array type has incomplete element type
   struct fdt_region region[], int count)
                     ^

Cheers,
Jan
