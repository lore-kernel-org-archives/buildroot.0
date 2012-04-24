From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 24 Apr 2012 12:46:55 +0200
Subject: [Buildroot] [PATCH] Add new package apr-util
In-Reply-To: <4F9683A9.6010903@visionsystems.de>
References: <1335262938-31434-1-git-send-email-bachmann@tofwerk.com>
 <op.wc9l1e10705kjs@rico> <4F9683A9.6010903@visionsystems.de>
Message-ID: <CAGm1_ksW2Rj=yQViE118DYWJd3+NUm3Uo0uvP9amk421N6QxXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 24, 2012 at 12:42 PM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
> Am 24.04.2012 12:28, schrieb Rico Bachmann:
>> Am 24.04.2012, 12:22 Uhr, schrieb Rico Bachmann <bachmann@tofwerk.com>:
>>
>>> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
>>> ---
>>> v1: Add package apr-util
>>> ? ? Add patch to remove check for apr
>>> ? ? because check for apr search for ./apr and not for defined folder
>>>
>>> change spaces to tab
>>>
>>> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
>>> ---
>>> v2: change spaces in *.mk to tab
>>> ---
>>> ?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 +
>>> ?package/apr-util/Config.in ? ? ? ? ? ? ? ? ? ? ? ? | ? ?7 +++++++
>>> ?.../apr-util/apr-util-1.4.1-remove-checkapr.patch ?| ? 12 ++++++++++++
>>> ?package/apr-util/apr-util.mk ? ? ? ? ? ? ? ? ? ? ? | ? 14 ++++++++++++++
>>> ?4 files changed, 34 insertions(+), 0 deletions(-)
>>> ?create mode 100644 package/apr-util/Config.in
>>> ?create mode 100644 package/apr-util/apr-util-1.4.1-remove-checkapr.patch
>>> ?create mode 100644 package/apr-util/apr-util.mk
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 5ae1c81..805f56a 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -375,6 +375,7 @@ endmenu
>>> menu "Other"
>>> ?source "package/apr/Config.in"
>>> +source "package/apr-util/Config.in"
>>> ?source "package/fftw/Config.in"
>>> ?source "package/libargtable2/Config.in"
>>> ?source "package/argp-standalone/Config.in"
>>> diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
>>> new file mode 100644
>>> index 0000000..a4411ba
>>> --- /dev/null
>>> +++ b/package/apr-util/Config.in
>>> @@ -0,0 +1,7 @@
>>> +config BR2_PACKAGE_APR_UTIL
>>> + ? ?bool "apr-util"
>>> + ? ?select BR2_PACKAGE_APR
>>> + ? ?help
>>> + ? ? ?The utility library for the apache runtime project
>>> +
>>> + ? ? ?http://apr.apache.org/
>>> diff --git a/package/apr-util/apr-util-1.4.1-remove-checkapr.patch b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
>>> new file mode 100644
>>> index 0000000..46cc595
>>> --- /dev/null
>>> +++ b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
>>> @@ -0,0 +1,12 @@
>>> +diff -rupN apr-util-1.4.1/configure.in apr-util-1.4.1-fix/configure.in
>>> +--- apr-util-1.4.1/configure.in ? ?2009-12-17 20:15:19.000000000 +0100
>>> ++++ apr-util-1.4.1-fix/configure.in ? ?2012-04-24 10:10:32.000000000 +0200
>>> +@@ -99,7 +99,7 @@ fi
>>> + dnl
>>> + dnl Find the APR includes directory and (possibly) the source (base) dir.
>>> + dnl
>>> +-APU_FIND_APR
>>> ++dnl APU_FIND_APR
>>> +
>>> + dnl
>>> + dnl even though we use apr_rules.mk for building apr-util, we need
>>> diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
>>> new file mode 100644
>>> index 0000000..f5f4d80
>>> --- /dev/null
>>> +++ b/package/apr-util/apr-util.mk
>>> @@ -0,0 +1,14 @@
>>> +#############################################################
>>> +#
>>> +# apr-util
>>> +#
>>> +#############################################################
>>> +APR_UTIL_VERSION = 1.4.1
>>> +APR_UTIL_SITE = http://archive.apache.org/dist/apr
>>> +APR_UTIL_INSTALL_STAGING = YES
>>> +APR_UTIL_DEPENDENCIES = apr
>>> +APR_UTIL_CONF_OPT = \
>>> + ? ?--prefix=/usr \
>>> + ? ?--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION)
>>> +
>>> +$(eval $(call AUTOTARGETS))
>>
>> hmmm... I sent this mail with the --subject-prefix='PATCH v2' option.
>> Can anyone tell me why I can't see this prefix in the Subject?
>
> I do it this way: http://libbits.wordpress.com/2011/12/27/managing-patch-series-with-git/

Have you removed the previous patch? Execute git format-patch and
examine the new patch file to check if everything is correct.

Yegor
