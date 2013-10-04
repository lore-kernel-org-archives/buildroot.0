From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Oct 2013 23:55:48 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump relevant config versions
In-Reply-To: <1380890978-13158-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 Oct 2013 09:49:38 -0300")
References: <1380890978-13158-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqlsituj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> arm_nuri needs some DT fixups to switch to the 3.11.x series
 Gustavo> since it's now default for that kernel defconfig.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  board/qemu/arm-nuri/readme.txt                                    | 2 +-
 Gustavo>  board/qemu/arm-versatile/{linux-3.10.config => linux-3.11.config} | 0
 Gustavo>  board/qemu/arm-versatile/readme.txt                               | 2 +-
 Gustavo>  board/qemu/arm-vexpress/readme.txt                                | 2 +-
 Gustavo>  .../microblazebe-mmu/{linux-3.10.config => linux-3.11.config}     | 0
 Gustavo>  board/qemu/microblazebe-mmu/readme.txt                            | 2 +-
 Gustavo>  .../microblazeel-mmu/{linux-3.10.config => linux-3.11.config}     | 0
 Gustavo>  board/qemu/microblazeel-mmu/readme.txt                            | 2 +-
 Gustavo>  board/qemu/mips-malta/{linux-3.10.config => linux-3.11.config}    | 0
 Gustavo>  board/qemu/mips-malta/readme.txt                                  | 2 +-
 Gustavo>  board/qemu/mips64-malta/{linux-3.10.config => linux-3.11.config}  | 0
 Gustavo>  board/qemu/mips64-malta/readme.txt                                | 2 +-
 Gustavo>  board/qemu/mipsel-malta/{linux-3.10.config => linux-3.11.config}  | 0
 Gustavo>  board/qemu/mipsel-malta/readme.txt                                | 2 +-
 Gustavo>  .../qemu/powerpc-g3beige/{linux-3.10.config => linux-3.11.config} | 0
 Gustavo>  board/qemu/powerpc-g3beige/readme.txt                             | 4 ++--
 Gustavo>  board/qemu/powerpc-mpc8544ds/readme.txt                           | 2 +-
 Gustavo>  board/qemu/powerpc-virtex-ml507/readme.txt                        | 2 +-
 Gustavo>  board/qemu/sh4-r2d/readme.txt                                     | 2 +-
 Gustavo>  board/qemu/sparc-ss10/readme.txt                                  | 2 +-
 Gustavo>  board/qemu/x86/{linux-3.10.config => linux-3.11.config}           | 0
 Gustavo>  board/qemu/x86/readme.txt                                         | 2 +-
 Gustavo>  board/qemu/x86_64/{linux-3.10.config => linux-3.11.config}        | 0
 Gustavo>  board/qemu/x86_64/readme.txt                                      | 2 +-
 Gustavo>  configs/qemu_mips64_malta_defconfig                               | 8 ++++----
 Gustavo>  configs/qemu_sparc_ss10_defconfig                                 | 4 ++--

I'm not sure what went wrong here. You renamed a bunch of Linux
configuration files, but you didn't update the defconfigs to match.

I tested arm versatile with 3.11 and it didn't boot for me, so I've
changed the Linux configuration file names back to 3.10 rather than
adjusting the defconfigs.

-- 
Bye, Peter Korsgaard
