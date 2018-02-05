From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 5 Feb 2018 22:16:19 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180205210150.ok3hhfucmxu3uz3l@tarshish>
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
Message-ID: <4663bf7a-cc67-d090-0b19-43d707161287@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 05/02/2018 ? 22:01, Baruch Siach a ?crit?:
> Hi Romain,
> 
> On Mon, Feb 05, 2018 at 09:57:16PM +0100, Romain Naour wrote:
>> See: https://sourceware.org/ml/libc-announce/2018/msg00000.html
>> https://sourceware.org/glibc/wiki/Release/2.27
> 
> Note that this is a security bump fixing CVE-2017-1000408, CVE-2017-1000409, 
> CVE-2017-16997, CVE-2018-1000001, and CVE-2018-6485.

Ok thanks, I'll add them.

> 
>> Add hash files
> 
> You mean license files hash, right?

Yes Indeed.

Best regards,
Romain

> 
> baruch
> 
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/glibc/glibc.hash | 6 +++++-
>>  package/glibc/glibc.mk   | 2 +-
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
>> index f3a6577d2a..86d3bb56dd 100644
>> --- a/package/glibc/glibc.hash
>> +++ b/package/glibc/glibc.hash
>> @@ -1,4 +1,8 @@
>>  # Locally calculated (fetched from Github)
>> -sha256  0766875391224153502c5542a71b6e46db53b44691078b3130e1a0df41586430     glibc-glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40.tar.gz
>> +sha256  a74489d14f4017bee6a6c6fe76f1de0dbf7d66c8695116de5aadd141c4757892     glibc-glibc-2.27.tar.gz
>>  # Locally calculated (fetched from Github)
>>  sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
>> +
>> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
>> +sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
>> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
>> index cf4bdec065..b674191b22 100644
>> --- a/package/glibc/glibc.mk
>> +++ b/package/glibc/glibc.mk
>> @@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
>>  else
>>  # Generate version string using:
>>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
>> -GLIBC_VERSION = glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40
>> +GLIBC_VERSION = glibc-2.27
>>  # Upstream doesn't officially provide an https download link.
>>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>>  # sometimes the connection times out. So use an unofficial github mirror.
> 
