From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:55:37 +0200
Subject: [Buildroot] [PATCH] package/apitrace: fix apitrace microblaze
 build failure
In-Reply-To: <20200610161601.290420-1-giulio.benetti@benettiengineering.com>
References: <20200610161601.290420-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200622225537.2d4764be@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Jun 2020 18:16:01 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Apitrace is affected by Gcc Bug 68485 that has already been worked
> around, but after version bumping, CMakeLists.txt adds -O2 to
> CMAKE_C_FLAGS_RELWITHDEBINFO that is in order appended to CMAKE_C_FLAGS,
> making -O0 end appending to fail. To prevent this we need to avoid
> CMAKE_C_FLAGS_RELWITHDEBINFO to be appended to CMAKE_C_FLAGS, so let's
> do the same as flare-engine package that set CMAKE_BUILD_TYPE to a fake
> build type called "buildroot", this way -O2 won't be appended after -O0
> and work around restart to work as expected.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2e3/2e31abd7b115d4c29117ca82007fd4f87f853ff7/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/apitrace/apitrace.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks. I am wondering when this bug will be fixed
in upstream gcc...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
