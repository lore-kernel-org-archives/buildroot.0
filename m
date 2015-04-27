From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:46:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libical: bump version to
 v1.0.1
In-Reply-To: <1430074039-15578-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430074039-15578-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150427234654.059a23ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 20:47:19 +0200, Bernd Kuhls wrote:

> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0  libical-0.48.tar.gz
> +sha256	7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c	libical-v1.0.1.tar.gz

A hash with a $(call github,...) <pkg>_SITE seems wrong.

Also, from the manual:

"""
If the package you wish to add does have a release section on GitHub,
the maintainer may have uploaded a release tarball, or the release may
just point to the automatically generated tarball from the git tag. If
there is a release tarball uploaded by the maintainer, we prefer to use
that since it may be slightly different (e.g. it contains a configure
script so we don?t need to do AUTORECONF).

You can see on the release page if it?s an uploaded tarball or a git
tag:

* If there is a green download button, like mongrel2, then it was
  uploaded by the maintainer and you should use the link of that button
  to specify FOO_SITE, and not use the github helper.

* If there is grey download button, like xbmc, then it?s an
  automatically generated tarball and you should use the github helper function.
"""

libical seems to be inthe first case, i.e we should be able to have a
hash file, but we shouldn't use the github function.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
