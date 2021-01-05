From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:37:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/python3: add optional support
 for lib2to3
In-Reply-To: <20210103150306.1509091-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 3 Jan 2021 16:03:06 +0100")
References: <20210103150306.1509091-1-bernd.kuhls@t-online.de>
Message-ID: <87h7nv3t9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Kodi is in transition to support python3 instead of python2:
 > https://kodi.wiki/view/General_information_about_migration_to_Python_3

 > "For Kodi 18 (Leia), only addons that are compatible with both Python 2
 >  and 3 will be accepted to the official addon repository."

 > Some of these addons depend on the Kodi addon script.module.future to
 > provide support for both python versions.

 > The script.module.future addon contains python-future:
 > https://kodi.wiki/view/General_information_about_migration_to_Python_3#Future
 > which in turn needs lib2to3 to be included in the target build of
 > python3: http://python-future.org/automatic_conversion.html

 > Kodi addons depending on the script.module.future addon are crashing on
 > buildroot due to lib2to3 missing in the build.

 > LibreELEC added lib2to3 to python3 to fix the problem:
 > https://forum.libreelec.tv/thread/21239-lib2to3-pgen2-parse-missing/
 > https://github.com/LibreELEC/LibreELEC.tv/pull/4146

 > This patch provides the Config.in option to be used by Kodi 19.

Above you mention kodi 18, but here kodi 19? Is this only needed for
Kodi 19 or should it also be backported to 2020.02.x / 2020.11.x?

-- 
Bye, Peter Korsgaard
