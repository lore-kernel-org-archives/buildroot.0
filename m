From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:22:19 +0200
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: add option to enable
 NLS support
In-Reply-To: <20190723172336.24010-1-vadim4j@gmail.com>
References: <20190723172336.24010-1-vadim4j@gmail.com>
Message-ID: <20190803102219.7a9184a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Jul 2019 20:23:36 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Sometimes the package or specific configuration should be build with and
> without NLS support which requires additionally append NLS related
> config options or to have separate config file or use additional shell
> script.
> 
> So add helper command line option which appends config file with NLS
> options to the final config file which is now always stored in temporary
> file before merge it with the default configuration (even only -c was
> specified).
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  utils/test-pkg | 34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)

So, I discussed this patch with Yann and Peter, and we all agree that
we don't want to go down this route. Indeed, after checking NLS, we'll
have to check hardening options, debugging options, optimization
options, and more. This makes it unpractical.

The role of test-pkg is not to ensure that absolutely no failure will
be found by the autobuilders. By default, test-pkg only tests 6-7
toolchains, and not the whole set of toolchains/configurations that the
autobuilders are testing. The point of test-pkg is just to do some
basic sanity checking, and iron out the most basic issues. For
everything else, we rely on the autobuilders to detect the remaining
problems, including NLS enabled issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
