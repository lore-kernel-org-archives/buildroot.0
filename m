From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 20:03:51 +0100
Subject: [Buildroot] [PATCH 1 of 3 v2] Add feature removal schedule for
 deprecated features
In-Reply-To: <2d840ca671f83571813d.1387787747@argentina>
References: <patchbomb.1387787746@argentina>
 <2d840ca671f83571813d.1387787747@argentina>
Message-ID: <20131227200351.6c5b2216@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 23 Dec 2013 09:35:47 +0100, Thomas De Schampheleire wrote:
> This patch adds a new file feature-removal-schedule.txt that lists the
> deprecated features in buildroot, and from when they can be removed.
> 
> The guideline used is that a deprecated feature will remain available for
> four buildroot releases before it can be removed. For example if a feature
> is deprecated in the context of 2013.05, it is still available in 2013.05,
> 2013.08, 2013.11 and 2014.02. It can then be removed from 2014.05 onwards.
> 
> When additional config options are deprecated (for example kernel headers,
> packages, ...) they should be added to the list. When deprecated items are
> removed, they should be removed from the list.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2: remove netkitbase/netkittelnet from list (removed by arnaud)
> 
>  docs/manual/appendix.txt     |   6 +++-
>  feature-removal-schedule.txt |  50 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 1 deletions(-)
> 
> 
> This guideline, and the initial list of deprecated features with the date
> they were deprecated, was taken from Arnout Vandecappelle's input in [1]
> (thanks!). The list was updated with the deprecated mips architectures.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2013-November/083024.html
> 
> diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
> --- a/docs/manual/appendix.txt
> +++ b/docs/manual/appendix.txt
> @@ -29,6 +29,10 @@ Deprecated features
>  -------------------
>  
>  The following features are marked as _deprecated_ in Buildroot due to
> -their status either too old or unmaintained.
> +them being either too old or unmaintained. They will be removed at
> +some point (no earlier than a year after deprecation) so you should
> +stop using them. Refer to file +feature-removal-schedule.txt+
> +in the Buildroot sources for an indication of when these features can
> +be removed.
>  
>  include::deprecated-list.txt[]
> diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
> new file mode 100644
> --- /dev/null
> +++ b/feature-removal-schedule.txt

I'm not a big fan of having this file in the top-level directory of
Buildroot. To me, this file is really meant for Buildroot developers to
keep track of things to remove, and when. I'm not sure making this file
highly visible to users by putting it in the top-level directory is
very useful.

Maybe in support/ ? docs/ would have been a good place, but it only
contains our web site, so it would be weird to mix things.

> @@ -0,0 +1,50 @@
> +This file contains a list of deprecated features/packages in buildroot, and when
> +they were deprecated. In general, deprecated features will remain available for
> +at least four buildroot releases (one year). After this time, no guarantees are
> +made.
> +
> +Note that several features/packages have been deprecated for a long time and
> +should have been removed right now. Expect this to be corrected soon.
> +
> +

One too many new line.

> +To be removed in 2011.05:
> +BR2_PACKAGE_SQUASHFS3
> +BR2_TARGET_ROOTFS_SQUASHFS3

Nitpicking, but even though this file is a plain text file, it would be
nice to use some bullet lists:

To be removed in 2011.05:
 * BR2_PACKAGE_<bleh>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
