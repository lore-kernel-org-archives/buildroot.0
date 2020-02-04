From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 14:45:02 +0100
Subject: [Buildroot] [PATCH v3 3/8] package/mariadb: add sysroot path to
 mariadb_config
In-Reply-To: <20200204012200.7273-3-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:55 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-3-bluemrp9@gmail.com>
Message-ID: <87a75ylb4x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
 > mariadb_config incorrectly returns host paths for include paths and
 > library paths.

 > Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - remove extra slash between CMAKE_SYSROOT and CMAKE_INSTALL_PREFIX
 > Changes v1 -> v2:
 >   - no change
 > ---
 >  ...3-add-sysroot-path-to-mariadb_config.patch | 28 +++++++++++++++++++
 >  1 file changed, 28 insertions(+)
 >  create mode 100644 package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch

 > diff --git a/package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch
 > new file mode 100644
 > index 0000000000..a072b37e29
 > --- /dev/null
 > +++ b/package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch
 > @@ -0,0 +1,28 @@
 > +From 7e1b6aafeb9fe6558da7506b304c0efb5ea82281 Mon Sep 17 00:00:00 2001
 > +From: Ryan Coe <bluemrp9@gmail.com>
 > +Date: Fri, 13 Dec 2019 17:13:26 -0800
 > +Subject: [PATCH 1/1] add sysroot path to mariadb_config

Please use git format-patch -N when creating patches as pointed out by
check-package:

package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch:4: generate your patches with 'git format-patch -N'


It would be good with more sensible commit message (E.G. the toplevel
description).

What is the upstream status of this patch? Has it been submitted
upsteam?

-- 
Bye, Peter Korsgaard
