From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:20:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/protozero: disable tests
In-Reply-To: <20210422182443.654635-1-fontaine.fabrice@gmail.com>
References: <20210422182443.654635-1-fontaine.fabrice@gmail.com>
Message-ID: <20210423232043.5527f583@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 20:24:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a patch to disable tests through the standard BUILD_TESTING variable
> which is already passed by cmake-package.
> 
> While at it, drop protobuf dependency which is only needed for tests
> 
> This will fix a build failure on toolchains without wchar, toolchains
> for sh4 (ICE) or toolchains where gcc is affected by bug 64735.
> 
> Upstream thinks that this is unecessary but no additional feedback was
> received on how we should handle those build failures
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1cd24b757d87b963c70bc7ff927c6d983d0b142a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...CMakeLists.txt-respect-BUILD_TESTING.patch | 47 +++++++++++++++++++
>  package/protozero/protozero.mk                |  4 --
>  2 files changed, 47 insertions(+), 4 deletions(-)
>  create mode 100644 package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
