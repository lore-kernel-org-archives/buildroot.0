From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 14:51:16 +0200
Subject: [Buildroot] [PATCH 0/3] core: remove lkegacy BR2_STRIP_none
Message-ID: <cover.1498913468.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This is a legacy option that dates back to when we had support for three
different kond of stripping: none, strip and sstrip.

We now have only strip or none, which is semantically just a boolean,
rather than a choice.

But choices are not randomised, so having the stripping option a real
boolean rather than a choice will allow us to test it in the
autobuilders.


Regards,
Yann E. MORIN.


The following changes since commit 967ef5af9e570419145849a50915ac4c2573b31b

  boot/syslinux: drop patch 0008, not needed after gnu-efi update (2017-06-30 23:55:39 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 02528111029d67c8e42a098a1f836806e05c4a49

  core: change the stipr command from a choice to a boolean (2017-07-01 14:47:02 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      core: use positive logic for unstripped files/dirs
      core: simplify the condition to set the strip command
      core: change the stipr command from a choice to a boolean

 Config.in              | 17 ++++-------------
 Config.in.legacy       |  8 ++++++++
 boot/grub2/grub2.mk    |  2 +-
 package/Makefile.in    |  3 +--
 package/kexec/kexec.mk |  2 +-
 5 files changed, 15 insertions(+), 17 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
