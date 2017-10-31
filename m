From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 31 Oct 2017 12:13:05 -0500
Subject: [Buildroot] [PATCH v3 1/2] package/libssh2: Update to newest
	version
In-Reply-To: <20171031162909.64j2yytf4e6yfs7d@tarshish>
References: <1509465218-55386-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171031162909.64j2yytf4e6yfs7d@tarshish>
Message-ID: <CAH=K+6ks3T6CeCa2AnBNpo5mZ-Md2XN=bggoAv_Y9J_HetQXMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Tue, Oct 31, 2017 at 11:29 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>
> [...]
>
>> diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
>> index 6b1cced..f0df7a2 100644
>> --- a/package/libssh2/libssh2.hash
>> +++ b/package/libssh2/libssh2.hash
>> @@ -1,3 +1,2 @@
>>  # Locally calculated after checking pgp signature
>
> The pgp signature part is no longer true.

I'll remove this

>> -# https://www.libssh2.org/download/libssh2-1.8.0.tar.gz.asc
>> -sha256       39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4        libssh2-1.8.0.tar.gz
>> +sha256 e73d55cd512863aa6423c6e137039e3e1bcbf5ba87f130e7441132c2c78a5425 libssh2-616fd4d1b3e4a55de67c48819fefca83132126b5.tar.gz
>> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
>> index dedb890..84f2113 100644
>> --- a/package/libssh2/libssh2.mk
>> +++ b/package/libssh2/libssh2.mk
>> @@ -4,32 +4,33 @@
>>  #
>>  ################################################################################
>>
>> -LIBSSH2_VERSION = 1.8.0
>> -LIBSSH2_SITE = http://www.libssh2.org/download
>> +LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
>> +LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
>>  LIBSSH2_LICENSE = BSD
>>  LIBSSH2_LICENSE_FILES = COPYING
>>  LIBSSH2_INSTALL_STAGING = YES
>>  LIBSSH2_CONF_OPTS = --disable-examples-build
>>
>> +# autoreconf must be ran when building off git, as it has not been ran at hash
>> +LIBSSH2_AUTORECONF = YES
>> +
>>  # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
>> -# Config.in. Favour mbedtls.
>> +# Config.in.
>
> This change belongs to the next patch.

Missed this when flipping patches around, will fix in v4

Sam
