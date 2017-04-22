From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:59:38 +0200
Subject: [Buildroot] [PATCH v2] syslog-ng: disable mongodb
In-Reply-To: <2882577850f3a9d14d85f8dbbf7ceaef7916be41.1492786513.git.baruch@tkos.co.il>
References: <2882577850f3a9d14d85f8dbbf7ceaef7916be41.1492786513.git.baruch@tkos.co.il>
Message-ID: <20170422155938.04623524@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 17:55:13 +0300, Baruch Siach wrote:
> libbson is a dependency of the mongo-c-driver that syslog-ng uses. Buildroot
> doesn't package mongo-c-driver so syslog-ng uses the bundled one. The bundled
> mongo-c-driver in turn may optionally use a bundled libbson. When Buildroot
> builds libbson mongo-c-driver detects that and does not configure its bundled
> libbson. This breaks the build of the syslog-ng mongodb module because it adds
> the bundled libbson to the headers search path.
> 
> Disable the mongodb module to avoid this issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/843/84331e9a168d8bdf2cceca8e9e1480611c1ecaed/
> http://autobuild.buildroot.net/results/b5b/b5bad64abbf5764faf2a7129a1a25ad75c34980b/
> http://autobuild.buildroot.net/results/3c3/3c32f4eb7436da06f3fb59f928363959df2a5e86/
> 
> Cc: Chris Packham <judge.packham@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Don't use bundled mongo-c-driver and libbson, just disable mongodb (Thomas P)
> ---
>  package/syslog-ng/syslog-ng.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
