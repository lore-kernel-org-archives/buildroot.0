From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Feb 2014 17:26:03 +0100
Subject: [Buildroot] [PATCH 0/3 v2] linux: do not always depend on host-lzop
Message-ID: <cover.1391876537.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that makes Linux not always depend on host-lzop,
and also cleans up a little bit the linux.mk.


Changes v1 -> v2:
  - use simpler sed expression  (Peter)
  - don't use 'define' to define the function  (Arnout)
  - initrd and initramfs may also require lzo  (Peter)
  - move qstrip to the initial assignment  (Arnout)
  - check the linux config file exists  (Peter)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      packages infra: add function to get a Kconfig option
      linux: only depend on host-lzop if needed
      linux: check the configuration file exists

 linux/linux.mk       | 15 +++++++++++++--
 package/pkg-utils.mk |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
