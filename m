From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 18 Apr 2020 22:48:53 +0300
Subject: [Buildroot] Finding the linux kernel headers version of a gcc
 cross toolchain
In-Reply-To: <CAPm8-H4pjFOoCq4xX36wA7vRN2utKtxs3G3Gdbf07T29jPgL5g@mail.gmail.com>
References: <CAPm8-H4pjFOoCq4xX36wA7vRN2utKtxs3G3Gdbf07T29jPgL5g@mail.gmail.com>
Message-ID: <87mu78d17e.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi L-C,

On Fri, Apr 17 2020, Laurentiu-Cristian Duca wrote:
> Hello buildroot community,
>
>   When choosing an external toolchain for Buildroot
> we must specify the kernel headers version used to build the
> corresponding toolchain.
> Can you please tell me how to detect the kernel headers version of the
> external toolchain?

Look for the linux/version.h header file from your toolchain. Use the
LINUX_VERSION_CODE and KERNEL_VERSION macros that this file defines to
find the kernel headers version.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
