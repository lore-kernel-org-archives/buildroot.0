From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Mon, 20 Jul 2015 10:17:03 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] New package dawgdic - directed acyclic
 word graphs
In-Reply-To: <CAGduivzV1OW4UCCSh=arNpX+W=HXg-n0A2dJDr+xvXdh0bkyvg@mail.gmail.com>
References: <1437370681-12567-1-git-send-email-yba@tkos.co.il>
 <CAGduivzV1OW4UCCSh=arNpX+W=HXg-n0A2dJDr+xvXdh0bkyvg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1507201016090.22367@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,
Thanks. I will send a v2.

  - yba


On Mon, 20 Jul 2015, Maxime Hadjinlian wrote:

> Date: Mon, 20 Jul 2015 09:03:25 +0200
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot <buildroot@busybox.net>
> Subject: Re: [Buildroot] [PATCH 1/1] New package dawgdic - directed acyclic
>     word graphs
> 
> Hi Jonathan, all
>
> On Mon, Jul 20, 2015 at 7:38 AM, Jonathan Ben-Avraham <yba@tkos.co.il> wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> This package provides utilties and object files for building and accessing
>> directed acyclic word graphs (DAWG) dictionaries. See
>> https://code.google.com/p/dawgdic/
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  package/Config.in          |    1 +
>>  package/dawgdic/Config.in  |   12 ++++++++++++
>>  package/dawgdic/dawgdic.mk |   16 ++++++++++++++++
>>  3 files changed, 29 insertions(+)
>>  create mode 100644 package/dawgdic/Config.in
>>  create mode 100644 package/dawgdic/dawgdic.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index d9b0794..222004a 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1018,6 +1018,7 @@ menu "Other"
>>         source "package/clapack/Config.in"
>>         source "package/classpath/Config.in"
>>         source "package/cppcms/Config.in"
>> +       source "package/dawgdic/Config.in"
>>         source "package/ding-libs/Config.in"
>>         source "package/eigen/Config.in"
>>         source "package/elfutils/Config.in"
>> diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
>> new file mode 100644
>> index 0000000..e015d31
>> --- /dev/null
>> +++ b/package/dawgdic/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_DAWGDIC
>> +       bool "dawgdic"
>> +       help
>> +         dawgdic provides a library for building and accessing
>> +         dictionaries implemented with directed acyclic word graphs
>> +         (DAWG). A dawg is constructed by minimizing a trie as a
>> +         deterministic finite automaton (DFA), and thus the dawg has
>> +         an advantage in memory usage. In addition, dawgdic uses a
>> +         double-array as a base data structure, so its retrieval
>> +         speed is as fast as that of Darts, a library for building
>> +         and accessing double-array tries. See
> Insert a new line here (end previous sentence at the '.')
>> +         https://code.google.com/p/dawgdic/
>> diff --git a/package/dawgdic/dawgdic.mk b/package/dawgdic/dawgdic.mk
>> new file mode 100644
>> index 0000000..697602c
>> --- /dev/null
>> +++ b/package/dawgdic/dawgdic.mk
>> @@ -0,0 +1,16 @@
>> +################################################################################
>> +#
>> +# dawgdic
>> +#
>> +################################################################################
>> +
>> +DAWGDIC_SITE = http://dawgdic.googlecode.com/svn/trunk
>> +DAWGDIC_SITE_METHOD = svn
>> +DAWGDIC_VERSION = 63
> I am bit worried here, this package is hosted on the closing
> google-code, and there has been no sign of life since November 2012...
> I saw some people that exported the code to Github.
> What should we do in such a case ?
>> +DAWGDIC_LICENSE = BSD-3c
>> +DAWGDIC_LICENSE_FILES = COPYING
>> +
>> +DAWGDIC_AUTORECONF = YES
>> +DAWGDIC_INSTALL_STAGING = YES
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
