From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 5 Oct 2018 14:18:21 +0200
Subject: [Buildroot] [PATCH 1/1] Add patches from the upstream
 ltp-testsuite github repository to compile correctly.
In-Reply-To: <20181005064311.28557-1-F.LaRoche@pilz.de>
References: <20181005064311.28557-1-F.LaRoche@pilz.de>
Message-ID: <20181005121819.GB31472@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Florian,

thanks for your patch.

> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---
>  package/ltp-testsuite/0002-execve05.patch | 44 +++++++++++++++++++++++
>  package/ltp-testsuite/0003-statx.patch    | 32 +++++++++++++++++
>  package/ltp-testsuite/0004-statx.patch    | 26 ++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 package/ltp-testsuite/0002-execve05.patch
>  create mode 100644 package/ltp-testsuite/0003-statx.patch
>  create mode 100644 package/ltp-testsuite/0004-statx.patch

IMHO it makes sense to add fix of execve05 in the runtest files (0004-statx.patch),
but in separate commit as it's not a compilation fix, just a runtime fix.

I'd prefer to drop 0003-statx.patch and use LTP_TESTSUITE_AUTORECONF = yes
But not sure what are buildroot convention for it.

Kind regards,
Petr
