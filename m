From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:02:14 +0200
Subject: [Buildroot] [PATCH 8/8] package/mongodb: bump to version 4.2.4
In-Reply-To: <20200323104909.16765-8-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-8-yegorslists@googlemail.com>
Message-ID: <20200425140214.6c83e359@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 11:49:09 +0100
yegorslists at googlemail.com wrote:

> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> - Drop !BR2_PACKAGE_PYTHON3 dependency as SConstruct requires
>   host-python3 since version 4.1.10 and:
>   https://github.com/mongodb/mongo/commit/8dd6d4755734ed37c1b98dfdefce3ca6bc65f1f6
> - host-python-psutil is needed since 4.1.8 and
>   https://github.com/mongodb/mongo/commit/ff03811e31851984617d73739de8acc7640b19a2
> - Drop unneeded host-python-typing dependency
> - C++17 and so gcc 7 is required since 4.1.8 and
>   https://github.com/mongodb/mongo/commit/01d84b2565fc9ea9626a55dcf1f3f817968088f2
> - Set --disable-minimum-compiler-version-enforcement as mongodb enforces
>   gcc >= 8.2 since verson 4.1.8 and
>   https://github.com/mongodb/mongo/commit/9ac90b128ebeb1bb431ebe3fe9176cb6142818cb
> - Explictly disable ssl if needed as ssl is enabled by default
> - Add host-python-cheetah dependency if needed
> - Manage new http-client option added in version 4.1.2 and
>   https://github.com/mongodb/mongo/commit/4d7dcca91bc2bbde65843fe88c41fa040e0d1877
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [Titouan: Fix patch conflicts with master]
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/mongodb/Config.in    |  8 +++-----
>  package/mongodb/mongodb.hash |  2 +-
>  package/mongodb/mongodb.mk   | 27 ++++++++++++++++++---------
>  3 files changed, 22 insertions(+), 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
