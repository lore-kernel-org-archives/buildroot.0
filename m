From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Dec 2019 19:29:02 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libfreeimage: bump version
 to 3.18.0
References: <20190831140614.16535-1-bernd.kuhls@t-online.de>
 <a0739047-1060-f748-735e-9d48af314243@benettiengineering.com>
Message-ID: <eggvcgxq94.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 20 Dec 2019 17:09:43 +0100 schrieb Giulio Benetti:

> Can you please rebase against master branch and send a v2? Because I
> can't apply this patch anymore and I was going to review it.

Hi Giulio,

the patch still applies to master, no rebase needed. The problem you are 
seeing results from the DOS linebreaks present in the patch files removed 
by my patch. These DOS linebreaks are present in the patch created by git 
format-patch but are lost when sent to patchworks.

When applying my patch you need to remove the libfreeimage patches 
manually:

$ wget http://patchwork.ozlabs.org/patch/1156184/mbox/ -O - | git am

$ git rm package/libfreeimage/0003-LibWebP-fix-compilation-issue-with-
GCC-5.x-C-11.patch package/libfreeimage/0004-fix-gcc-6.patch package/
libfreeimage/0005-Manage-powf64-with-glibc.patch

$ git am --continue
Applying: package/libfreeimage: bump version to 3.18.0

Regards, Bernd
