From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 20 Aug 2014 13:33:11 +0200
Subject: [Buildroot] [PATCH 1/1] bandwidthd: Version bump to fix
 autobuilder errors
In-Reply-To: <1408523544-31401-1-git-send-email-nroach44@gmail.com>
References: <1408523544-31401-1-git-send-email-nroach44@gmail.com>
Message-ID: <53F48777.6010004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

Le 20/08/2014 10:32, Nathaniel Roach a ?crit :
> Thanks to Romain Naor, we've found that certain tests

Naour

> in configure fail if their dependencies aren't tested for
> beforehand.
> 
> libpng has been added as a dependency just to make sure it
> gets built.
> 
> In upstream the changes to fix this issue are:
>  - Test for libusb-1.0 purely to ensure that variables are set
> 	(it's only needed if libpcap was built with it).
>  - Test for libz and continue/fail because it's actually needed by libpng
> 	and it's probably more meaningful to fail on libz rather than
> 	libpng if libz is the issue.
> 
> Also, the X.Org tests have been removed from the configure script
> and therefore we don't need --without-x to be defined anymore.
> 
> Additional upstream changes:
>  - Handle the postgres/sqlite flags better (should not effect BR).
>  - Other general configure.ac cleanups.
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

Could you add the autobuilder reference to the commit log:

http://autobuild.buildroot.net/results/37a/37a94e0f2d3faa0aec9c488e987cfff706fc9f3b/build-end.log

This helps maintainers to know if the patch must be commited to master or next.

Best regards,
Romain
