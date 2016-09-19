From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:47:29 +0200
Subject: [Buildroot] [PATCH 4/4 v2] manual: get rid of the lists of
 packages
In-Reply-To: <206a0e9bf7a1e99fa176fe1345d245881f14b858.1472943074.git.yann.morin.1998@free.fr>
References: <cover.1472943074.git.yann.morin.1998@free.fr>
 <206a0e9bf7a1e99fa176fe1345d245881f14b858.1472943074.git.yann.morin.1998@free.fr>
Message-ID: <20160919194729.607d2c8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Sep 2016 00:58:43 +0200, Yann E. MORIN wrote:
> We currently have four lists of packages in the manual:
>   - the non-virtual target packages,
>   - the virtual target packages,
>   - the host packages,
>   - the deprecated features.
> 
> Those list take more than half of the manual. They do not serve much
> purpose except to show off. The only one that is interesting is the list
> of virtual packages, the associated symbols and their providers.
> 
> After the recent discussion on the list [0], remove them, except the
> list of virtual packages.
> 
> Replace our biggish and complex generating script (and its companion
> library kconfiglib) with a much simpler script.
> 
> The drawback is that, when it is a sub-option of a provider that does
> provide the feature, we loose that information in the new list. We
> believe this is an acceptable drawback.
> 
> [0] http://lists.busybox.net/pipermail/buildroot/2016-September/171199.html
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/appendix.txt            |   32 +-
>  docs/manual/manual.mk               |   21 +-
>  support/scripts/gen-manual-lists    |   62 +
>  support/scripts/gen-manual-lists.py |  513 -----
>  support/scripts/kconfiglib.py       | 3541 -----------------------------------
>  support/scripts/readme.kconfiglib   |   30 -
>  6 files changed, 67 insertions(+), 4132 deletions(-)
>  create mode 100755 support/scripts/gen-manual-lists
>  delete mode 100644 support/scripts/gen-manual-lists.py
>  delete mode 100644 support/scripts/kconfiglib.py
>  delete mode 100644 support/scripts/readme.kconfiglib

Nobody really gave any opinion. I had some quick discussion with Peter
in private on IRC, and he seemed to be in favor of completely dropping
the list of packages from the manual.

So: patch applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
