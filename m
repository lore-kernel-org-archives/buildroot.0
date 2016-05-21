From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 May 2016 19:20:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/ustr: Fix musl build by
 forcing	glibc detection to true
References: <1463848097-26113-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <qvh61dx254.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 21 May 2016 18:28:17 +0200 schrieb Bernd Kuhls:

> Fixes
> http://autobuild.buildroot.net/results/f51/
f5115516bd514afbb71a9460e82c889bcc18e7e2/

Hi,

please note that later on the build with this defconfig fails at 
libsemanage:

genhomedircon.lo: In function `semanage_genhomedircon':
genhomedircon.c:(.text+0x18b8): undefined reference to `getpwent_r'

This was never noticed before because libsemanage depends on ustr which 
was broken on musl until now.

Regards, Bernd
