From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:29:20 +0200
Subject: [Buildroot] [PATCH] package/ipmitool: fix patch
In-Reply-To: <20200916174452.5730-1-heiko.thiery@gmail.com>
References: <20200916174452.5730-1-heiko.thiery@gmail.com>
Message-ID: <20200917222920.10afcdad@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 19:44:51 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The previous commit to this package
> (37c5e903a7e18f5b3847c11a40af5f74984d6c77) introduced a bunch of patches
> to fix a CVE. Unfortunatly only applying of the patches was tested but
> not building the package.
> 
> This commit replaces a define that was introduced in a previous patch
> upstream and caused the build failure.
> 
> Tested:
> 
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: SKIPPED
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3f7fe8ad181318153c459ba5e1afbbc8b49d541c/
>  - and more
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/ipmitool/0011-channel-Fix-buffer-overflow.patch | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
