From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 23 Feb 2016 17:56:59 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1 v2] sphinxbase: new package
In-Reply-To: <CAGm1_ktWxhn10OZf2S2x=yRvjfJE2N5Qu+50c-5kWdzXiuX9cw@mail.gmail.com>
References: <1453134708-17909-1-git-send-email-yba@tkos.co.il>
 <CAGm1_ktWxhn10OZf2S2x=yRvjfJE2N5Qu+50c-5kWdzXiuX9cw@mail.gmail.com>
Message-ID: <alpine.DEB.2.11.1602231756070.5198@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,
Thanks for the test. I'll do a re-spin.

  - yba


On Mon, 22 Feb 2016, Yegor Yefremov wrote:

> Date: Mon, 22 Feb 2016 16:00:56 +0100
> From: Yegor Yefremov <yegorslists@googlemail.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: "buildroot at busybox.net" <buildroot@busybox.net>
> Subject: Re: [Buildroot] [PATCH 1/1 v2] sphinxbase: new package
> 
> Hi Jonathan,
>
> On Mon, Jan 18, 2016 at 5:31 PM, Jonathan Ben-Avraham <yba@tkos.co.il> wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> CMUSphinx toolkit is a speech recognition toolkit with various tools
>> used to build speech applications. CMU Sphinx toolkit has a number of
>> packages for different tasks and applications. The toolkit is designed
>> for use on mobile platforms.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>> Changes v1 -> v2:
>>  1. Applied all review comments by Arnout Vandecappelle:
>>   a. Removed comments regarding github repo
>>   b. Added comment regarding missing license file upstream bug report
>>   c. Added example source file as license file
>>   d. Removed redundant source specification
>>
>>  2. Tested patch application with git apply --check
>>
>>  package/Config.in                  |    1 +
>>  package/sphinxbase/Config.in       |   13 +++++++++++++
>>  package/sphinxbase/sphinxbase.hash |    2 ++
>>  package/sphinxbase/sphinxbase.mk   |   18 ++++++++++++++++++
>>  4 files changed, 34 insertions(+)
>>  create mode 100644 package/sphinxbase/Config.in
>>  create mode 100644 package/sphinxbase/sphinxbase.hash
>>  create mode 100644 package/sphinxbase/sphinxbase.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 89b23db..b555808 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1213,6 +1213,7 @@ endif
>>         source "package/protobuf-c/Config.in"
>>         source "package/qhull/Config.in"
>>         source "package/qlibc/Config.in"
>> +       source "package/sphinxbase/Config.in"
>>         source "package/startup-notification/Config.in"
>>         source "package/tz/Config.in"
>>         source "package/tzdata/Config.in"
>> diff --git a/package/sphinxbase/Config.in b/package/sphinxbase/Config.in
>> new file mode 100644
>> index 0000000..ee9ca31
>> --- /dev/null
>> +++ b/package/sphinxbase/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_SPHINXBASE
>> +       bool "sphinxbase"
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +       help
>> +         CMUSphinx toolkit is a leading speech recognition toolkit with
>> +         various tools used to build speech applications. CMU Sphinx
>> +         toolkit has a number of packages for different tasks and
>> +         applications.
>> +
>> +         http://cmusphinx.sourceforge.net/
>> +
>> +comment "sphinxbase needs a toolchain with threads"
>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
>> new file mode 100644
>> index 0000000..483fda3
>> --- /dev/null
>> +++ b/package/sphinxbase/sphinxbase.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed
>> +sha256 b8b19a207d1a285753a93ed67c36aacba0ebdc0892471fd3be6f6ffaba776f88 sphinxbase-5prealpha.tar.gz
>
> sha256 seems to be wrong
>
>> diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
>> new file mode 100644
>> index 0000000..9397997
>> --- /dev/null
>> +++ b/package/sphinxbase/sphinxbase.mk
>> @@ -0,0 +1,17 @@
>> +################################################################################
>> +#
>> +# sphinxbase
>> +#
>> +################################################################################
>> +
>> +SPHINXBASE_VERSION = 5prealpha
>> +SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase
>
> I could download the file only with this URL:
>
> SPHINXBASE_SITE =
> http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha
>
>> +SPHINXBASE_AUTORECONF = YES
>
> Why do you need autoreconf?
>
> Yegor
>
>> +SPHINXBASE_LICENSE = MIT
>> +# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
>> +# 5prealpha tarballs". The license is contained in the copyright notice at the
>> +# top of each source file. For example:
>> +SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
>> +SPHINXBASE_CONF_OPTS = --without-python
>> +
>> +$(eval $(autotools-package))
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
