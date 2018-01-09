From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 9 Jan 2018 11:39:17 -0600
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2018.01
In-Reply-To: <20180109085831.620-2-joerg.krause@embedded.rocks>
References: <20180109085831.620-1-joerg.krause@embedded.rocks>
 <20180109085831.620-2-joerg.krause@embedded.rocks>
Message-ID: <CANQCQpapbUANTGy_35v_EXVhu-qQ=dMmDCHURkidyXCXGHR0UQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jorg,

On Tue, Jan 9, 2018 at 2:58 AM, J?rg Krause <joerg.krause@embedded.rocks> wrote:
>
> Drop patch 0004-uboot-tools-disable-pylibfdt.patch. The issue addressed by
> this patch has been fixed in upstream commit
> 15b97f5c5e6d88e0560c6928f3acd01c999a494d.
>

I've ran it through test-pkg on my builder that had the issue
requiring the patch.
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
Plus a variant with Python enabled as this was a corner case where it
was detecting executables before and then enabling python/swig.
BR2_PACKAGE_PYTHON=y

This one takes a bit to build so I just tested armv5/7 and aarch64 at
this point.  I'll let it run through them all in the background.

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
