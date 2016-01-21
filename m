From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 15:34:01 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: document format specifying
 licenses
In-Reply-To: <1453361061-13226-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1453361061-13226-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160121153401.224d47e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul,

On Thu, 21 Jan 2016 12:54:21 +0530, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  docs/manual/adding-packages-generic.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Thanks for working on this!

> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 1c25c4e..460bb87 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -382,7 +382,15 @@ information is (assuming the package name is +libfoo+) :
>    Otherwise, describe the license in a precise and concise way, avoiding
>    ambiguous names such as +BSD+ which actually name a family of licenses.
>    This variable is optional. If it is not defined, +unknown+ will appear in
> -  the +license+ field of the manifest file for this package.
> +  the +license+ field of the manifest file for this package. +
> +  Format for specifying licenses is:

We normally use full sentences, so maybe:

The expected format for this variable must comply with the following
rules:

> +  ** If the package is released under multiple licenses, then +comma+ separate
> +  licenses (e.g. +`LIBFOO_LICENSE = GPLv2+, LGPLv2.1+`+). If there is clear
> +  distinction between which component is licensed under what license, then
> +  annotate the license with +libraries+ or +programs+ or +others+ keyword
> +  (e.g. +`LIBFOO_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)`+).

No: "libraries", "programs" are just examples. We have many more
possibilities here, like "docs", "tests" and so on. I don't think we
should standardize those categories. We need to standardize:

<foo>_LICENSE = L1 (A1), L2 (A2), L3 (A3)

And the possible values for L1, L2 and L3, but not the possible values
for A1, A2 or A3, which vary greatly depending on the packages.

> +  ** If the package is dual licensed, then separate licenses with +or+ keyword

with the +or+ keyword

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
