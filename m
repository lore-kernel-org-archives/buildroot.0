From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 23 Feb 2020 17:26:54 +0100
Subject: [Buildroot] [PATCH v3 00/12] pkg-stats json output improvements
In-Reply-To: <20200222085715.23769-1-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
Message-ID: <0e7ad1bf-5b5e-583e-2812-2f99f577cefb@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

I tested your patchset, along with your buildroot-stat application, and 
overall this is great ! The generated HTML is nice and very comfortable 
to navigate.


I replied to individual patches, most of the time for cosmetic reasons:

* Using list/dict comprehensions in place of for-append loops
* Make use of Python properties
* if xxx == False >>> if not xxx

As this is mostly a matter of taste, if you (or others) don't agree with 
me, I will add a Reviewed-by anyway.


There are also a few required changes:

* You signed off with 2 distinct email addresses for 2 patches in the series
* Prefer to update the package status after entirely processing a status 
check (instead of updating at each change during a loop)
* Consistency in the generated status (warning vs. error), and improve 
the status messages

Best regards,

Titouan
On 2/22/20 9:57 AM, Heiko Thiery wrote:
> This patchset adds several improvements for the json output of the
> pkg-stats script.
> 
> - add developers information to the packages
> - add supported defconfigs to json
> - add license information to json
> - add more generic status field to the packages for easier post
>    processing
> 
> ---
> v2 -> v3:
> - keep variable latest_release but change format
> - add check for license file hashes
> - introduce a na status for the checks
> - add a list of all possible checks to the json output
> - add the cve check status
> 
> v1 -> v2:
> - cleanup and recreation of patches
> - remove pkg name from dumping to json
> - use patch_files instead of combine count and files in dict
> - include getdevelopers.py to reuse Developers class
> 
> ---
> Heiko Thiery (12):
>    support/scripts/pkg-stats: store latest version in a dict
>    support/scripts/pkg-stats: store patch files for the package
>    support/scripts/pkg-stats: set developers info
>    support/scripts/pkg-stats: store licences of package
>    support/scripts/pkg-stats: add package status
>    support/scripts/pkg-stats: add package count to stats
>    support/scripts/pkg-stats: store pkg dir path
>    support/scripts/pkg-stats: add defconfig support
>    support/scripts/pkg-stats: add support for license hash check
>    support/scripts/pkg-stats: set status to 'na' for virtual packages
>    support/scripts/pkg-stats: initialize all package status checks
>    support/scripts/pkg-stats: add status for cve check
> 
>   support/scripts/pkg-stats | 272 +++++++++++++++++++++++++++++---------
>   1 file changed, 212 insertions(+), 60 deletions(-)
> 
