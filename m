From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Nov 2019 14:43:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/safeclib: bump to version
 08112019
In-Reply-To: <20191108170742.29680-1-fontaine.fabrice@gmail.com>
References: <20191108170742.29680-1-fontaine.fabrice@gmail.com>
Message-ID: <20191109144302.6152ff10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Nov 2019 18:07:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Include a fix for musl on x86_64:
>   https://github.com/rurban/safeclib/commit/19e7154e9c5189b0dfb5594b94cb7b883f9b6dcf
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7923fe7e609a6b2638492350996cc96582cc9193
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Define-_GNU_SOURCE-when-needed.patch | 115 ------------------
>  package/safeclib/safeclib.hash                |   4 +-
>  package/safeclib/safeclib.mk                  |   4 +-
>  3 files changed, 4 insertions(+), 119 deletions(-)
>  delete mode 100644 package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch

We normally don't take version bumps in master. But this one fixes a
build issue, and safeclib doesn't have any reverse dependencies in
Buildroot, so the risk for issues is quite limited. So I've applied to
master.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
