From: Andreas Hilse <andreas.hilse@ipcomm.de>
Date: Thu, 18 Jun 2020 19:35:48 +0200 (CEST)
Subject: [Buildroot] iproute2 binaries getting linked against libelf,
 which is not available in target
Message-ID: <021201d64596$e75979a0$b60c6ce0$@ipcomm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found an issue with buildroot 2020.02.x concerning iproute2 binaries
being linked against libelf.

According to iproute2.mk it should only link against libelf if
BR2_PACKAGE_ELFUTILS is selected.
But it also links against libelf without that option selected and thus
renders the created binaries unusable in the target system.

After digging further I found that this is due to the iproute2 configure
script detecting libelf being available in the used toolchain
(crosstool-ng companion library).

After finding out I can work around this issue.
I thought this might be a thing to be addressed in buildroot, but I'm not
sure how to approach it.

Best regards
Andreas Hilse
