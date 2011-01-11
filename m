From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jan 2011 14:45:03 +0100
Subject: [Buildroot] Illegal instruction when running some of the cross
 compiled binaries
In-Reply-To: <AANLkTi=0q8wUTjBSdVUv2KTVyxYc9NTSumE_+MrN4faf@mail.gmail.com>
References: <AANLkTi=0q8wUTjBSdVUv2KTVyxYc9NTSumE_+MrN4faf@mail.gmail.com>
Message-ID: <20110111144503.3bdf7fa4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Divick,

On Tue, 11 Jan 2011 17:55:15 +0530
Divick Kishore <divick.kishore@gmail.com> wrote:

>     I have built a custom root filesystem using build root, but
> certain binaries (built with the packages selected during menuconfig)
> when run give "Illegal Instruction".
> 
> # sshd
> Illegal instruction
> 
> Having looked at the logs, the compiler flags used to build the binary
> seems fine (-mtune=arm920t -march=armv4t -mabi=aapcs-linux
> -msoft-float ) i.e. right for my H/W (ATMEL AT91RM9200).

During compilation yes, but at the link stage of sshd, the
-march=armv4t flag is missing. Therefore, some ARMv5-only code gets
added to the binary. Maybe we need to add -march=armv4t to the
TARGET_LDFLAGS, or some other trick. I haven't tested anything for the
moment, so feel free to experiment.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
