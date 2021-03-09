From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  9 Mar 2021 22:37:16 +0100
Subject: [Buildroot] [PATCH 0/2] package/libopenssl: fix build wrt 64-bit
 time-related structs (branch yem/openssl-riscv32)
Message-ID: <cover.1615325812.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series aims at fixing, once and for all, the many build
failures we've seen in the autobuilders, related to riscv32.

It turns out that those failures exposed a deeper issue in openssl, that
was just fixed upstream

Note: the first pach is a candidate for backporting to 2021.02.x, but
the second patch is not.

Thanks to Alistair for working promptly on the issue and coming up with
a fix! ;-)

Regards,
Yann E. MORIN.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      package/libopenssl: fix build wrt. 64-bit time-related syscalls & structs
      Revert "package/libopenssl does not support riscv32"

 package/hostapd/Config.in                          |  1 -
 package/ibm-sw-tpm2/Config.in                      |  2 -
 package/ima-evm-utils/Config.in                    |  2 -
 ...-support-for-io_pgetevents_time64-syscall.patch | 61 ++++++++++++++
 ...-support-for-io_pgetevents_time64-syscall.patch | 98 ++++++++++++++++++++++
 package/openssl/Config.in                          |  7 --
 package/softether/Config.in                        |  2 -
 package/tpm2-abrmd/Config.in                       |  2 -
 package/tpm2-pkcs11/Config.in                      |  2 -
 package/tpm2-tools/Config.in                       |  2 -
 package/tpm2-totp/Config.in                        |  2 -
 package/tpm2-tss/Config.in                         |  2 -
 package/wpa_supplicant/Config.in                   |  2 -
 13 files changed, 159 insertions(+), 26 deletions(-)
 create mode 100644 package/libopenssl/0006-Add-support-for-io_pgetevents_time64-syscall.patch
 create mode 100644 package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
