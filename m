From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 14:34:37 +0100
Subject: [Buildroot] [PATCH 1/2] legal-info: fix detection of "override"
 packages
In-Reply-To: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
References: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160306143437.6fc0ce20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat,  5 Mar 2016 00:39:12 +0100, Luca Ceresoli wrote:
> The ifneq ($$($(2)_SITE_METHOD),override) test will always match
> because SITE_METHOD is never set to "override". The result is that
> some packages are downloaded and extracted unnecessarily, although
> they are (correctly) not saved in output/legal-info/.
> 
> Fix by simply testing $(2)_OVERRIDE_SRCDIR instead: when empty, it
> indicates that the packages is neither a "local" site-method package
> nor a package that has its source directory overridden.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
