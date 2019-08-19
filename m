From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Aug 2019 16:03:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: security bump to
 version 1.9.0
In-Reply-To: <CANxTyt5bQBnX_CG0WdhN3j5WGD1B-4LTrGNrWpEn8G7L1tjq+g@mail.gmail.com>
References: <20190817193050.28205-1-fontaine.fabrice@gmail.com>
 <CANxTyt5bQBnX_CG0WdhN3j5WGD1B-4LTrGNrWpEn8G7L1tjq+g@mail.gmail.com>
Message-ID: <CAPi7W828KQDoxEGAFp7d1q7q76JknC2bOXBdvdO=maef057YUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le lun. 19 ao?t 2019 ? 15:52, Danomi Manchego
<danomimanchego123@gmail.com> a ?crit :
>
> Fabrice,
>
> On Saturday, August 17, 2019, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>> Fix CVE-2019-13115: In libssh2 before 1.9.0,
>> kex_method_diffie_hellman_group_exchange_sha256_key_exchange in kex.c
>> has an integer overflow that could lead to an out-of-bounds read in the
>> way packets are read from the server. A remote attacker who compromises
>> a SSH server may be able to disclose sensitive information or cause a
>> denial of service condition on the client system when a user connects to
>> the server. This is related to an _libssh2_check_length mistake, and is
>> different from the various issues fixed in 1.8.1, such as CVE-2019-3855.
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/libssh2/libssh2.hash | 2 +-
>>  package/libssh2/libssh2.mk   | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
>> index c4732a2c07..58aba4ad71 100644
>> --- a/package/libssh2/libssh2.hash
>> +++ b/package/libssh2/libssh2.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>> -sha256 468e7a81a8121c06cb099eef2e17106b0b8c2e1d890b1c0e34e1951f182babb1  libssh2-1b3cbaff518f32e5b70650d4b7b52361b1410d37.tar.gz
>> +sha256 db257d41754b16518c3bd0c3b8dd08940ccbee5fc44cef7bfb052d930bcbbda3  libssh2-1.9.0.tar.gz
>>  sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
>> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
>> index abee1f8c77..824e208033 100644
>> --- a/package/libssh2/libssh2.mk
>> +++ b/package/libssh2/libssh2.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>
>> -LIBSSH2_VERSION = 1b3cbaff518f32e5b70650d4b7b52361b1410d37
>> -LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
>> +LIBSSH2_VERSION = 1.9.0
>> +LIBSSH2_SITE = $(call github,libssh2,libssh2,libssh2-$(LIBSSH2_VERSION))
>
>
> The archive that I get with this recipe has a different hash and contents than the 1.9.0 tarball on the libssh2 website: http://www.libssh2.org/download/libssh2-1.9.0.tar.gz
>
> The one from the libssh2 website has LIBSSH2_VERSION set to ?1.9.0?.  The one from git hub says ?1.9.0_DEV?. (Amongst other differences.)
OK, I'll send a patch to move from github to libssh2.org.
>
> Danomi -
>
>
>>
>>  LIBSSH2_LICENSE = BSD
>>  LIBSSH2_LICENSE_FILES = COPYING
>>  LIBSSH2_INSTALL_STAGING = YES
>> --
>> 2.20.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
Best Regards,

Fabrice
