From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 26 May 2017 10:22:25 -0500
Subject: [Buildroot] [PATCH next 2/2] parted: bump version to 3.2
In-Reply-To: <CANQCQpaimZEr4HFnup8DzNDW8BSYn-+3rx9fHa7aso6TYLgvFw@mail.gmail.com>
References: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
 <20170522134015.54040-2-Vincent.Riera@imgtec.com>
 <CANQCQpaimZEr4HFnup8DzNDW8BSYn-+3rx9fHa7aso6TYLgvFw@mail.gmail.com>
Message-ID: <CANQCQpZGJ4VBexk5NK61Foe0Y90dgYYJEfg1PJcwSRsMo6x4qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincente,

On Tue, May 23, 2017 at 9:11 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Vicente,
>
> On Mon, May 22, 2017 at 8:40 AM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
>> Patch 0001 already included in this release:
>>   http://git.savannah.gnu.org/cgit/parted.git/commit/?id=cc382c3753e1b430c00df46f0937b74db36ccb8a
>>
>> LVM2 dependency is necessary otherwise it will fail. See:
>>   https://lists.gnu.org/archive/html/bug-parted/2014-08/msg00001.html
>>
>> Due to the LVM2 dependency, the --enable-device-mapper option is
>> automatically enabled so there is no need to add it explicitly to the
>> LVM2_CONF_OPTS.
>>
>> --disable-device-mapper has been removed from HOST_LVM2_CONF_OPTS to
>> avoid a build failure.
>>
>
> Thanks for sending the bump.  Do you happen to know if this version is
> more compatible with never kernel headers?  We noticed a limitation
> where the toolchain kernel headers had to be older then ~3.13 for it
> to build correctly.
>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
>

test-pkg config used
+++++++++++++++++++++++++++++++++++++++++++++++++
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
BR2_PACKAGE_LVM2=y
BR2_PACKAGE_PARTED=y
BR2_USE_WCHAR=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_USE_MMU=y


Results
+++++++++++++++++++++++++++++++++++++++++++++++++
                armv5-ctng-linux-gnueabi [ 1/49]: OK
              armv7-ctng-linux-gnueabihf [ 2/49]: OK
                        br-aarch64-glibc [ 3/49]: OK
                           br-arcle-hs38 [ 4/49]: OK
                            br-arm-basic [ 5/49]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/49]: OK
                   br-arm-cortex-a9-musl [ 7/49]: SKIPPED
                   br-arm-cortex-m4-full [ 8/49]: SKIPPED
                             br-arm-full [ 9/49]: OK
                    br-arm-full-nothread [10/49]: SKIPPED
                      br-arm-full-static [11/49]: SKIPPED
                            br-bfin-full [12/49]: SKIPPED
                   br-i386-pentium4-full [13/49]: OK
                br-i386-pentium-mmx-musl [14/49]: SKIPPED
                       br-m68k-5208-full [15/49]: SKIPPED
                      br-m68k-68040-full [16/49]: OK
                    br-microblazeel-full [17/49]: OK
                 br-mips32r6-el-hf-glibc [18/49]: OK
                      br-mips64-n64-full [19/49]: OK
                 br-mips64r6-el-hf-glibc [20/49]: OK
                      br-mipsel-o32-full [21/49]: OK
                          br-nios2-glibc [22/49]: OK
                      br-openrisc-uclibc [23/49]: OK
               br-powerpc-603e-basic-cpp [24/49]: SKIPPED
             br-powerpc64le-power8-glibc [25/49]: OK


Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
