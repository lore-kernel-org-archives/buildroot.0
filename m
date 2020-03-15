From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:08:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/python: add optional support
 for lib2to3
In-Reply-To: <20200222185500.221018-1-bernd.kuhls@t-online.de>
References: <20200222185500.221018-1-bernd.kuhls@t-online.de>
Message-ID: <20200315160815.7d72f067@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Feb 2020 19:54:59 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Kodi is in transition to support python3 instead of python2:
> https://kodi.wiki/view/General_information_about_migration_to_Python_3
> 
> "For Kodi 18 (Leia), only addons that are compatible with both Python 2
>  and 3 will be accepted to the official addon repository."
> 
> Some of these addons depend on the Kodi addon script.module.future to
> provide support for both python versions.
> 
> The script.module.future addon contains python-future:
> https://kodi.wiki/view/General_information_about_migration_to_Python_3#Future
> which in turn needs lib2to3 to be included in the target build of
> python2: http://python-future.org/automatic_conversion.html
> 
> Kodi addons depending on the script.module.future addon are crashing on
> buildroot due to lib2to3 missing in the build.
> 
> LibreELEC added lib2to3 to python2 to fix the problem:
> https://forum.libreelec.tv/thread/21239-lib2to3-pgen2-parse-missing/
> https://github.com/LibreELEC/LibreELEC.tv/pull/4147
> 
> This patch provides the Config.in option to be used by Kodi.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python/Config.in | 5 +++++
>  package/python/python.mk | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
