From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:36:13 +0200
Subject: [Buildroot] [PATCH 2/2] bmon: remove hash file for GitHub
 helper package
In-Reply-To: <1427917740-17656-2-git-send-email-yegorslists@googlemail.com>
References: <1427917740-17656-1-git-send-email-yegorslists@googlemail.com>
 <1427917740-17656-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150401223613.49f8b01c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed,  1 Apr 2015 21:49:00 +0200, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/bmon/bmon.hash | 2 --
>  1 file changed, 2 deletions(-)
>  delete mode 100644 package/bmon/bmon.hash

This patch is not correct. There is a subtle thing about github
downloads. Quoting the Buildroot manual:

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
  automatically generated tarball and you should use the github helper
  function.
"""

So if we're with a "green" button case, it is perfectly fine to have a
tarball hash, because the taball is not automatically generated. And
this is the case we're in for bmon:
https://github.com/tgraf/bmon/releases. There is a green button. And
the BMON_SITE variable does not use the github helper.

So I marked this patch as rejected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
