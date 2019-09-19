From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:46:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix building on older
 distributions
In-Reply-To: <20190918170329.108034-1-aduskett@gmail.com>
References: <20190918170329.108034-1-aduskett@gmail.com>
Message-ID: <20190919224616.14d9d8e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Sep 2019 10:03:29 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> When updating to libglib2 2.62.0, the file 0002-add-option-to-build-tests.patch
> had to be refactored to work with the new build_tests checks. In the process of
> refactoring, a missing check was overlooked in glib/meson.build causing
> distributions with older versions of objcopy to fail because the older version
> does not contain the --add-symbol argument.
> 
> Adding the check for the build_tests argument fixes the issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dcc2352a036aba9650eae8abaaa23819fc67332d
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  .../0002-add-option-to-build-tests.patch      | 29 ++++++++++++++-----
>  1 file changed, 22 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
