From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 18 May 2015 12:07:24 -0400
Subject: [Buildroot] [PATCH v2 1/2] libsodium: new package
In-Reply-To: <20150518153137.GM2845@tarshish>
References: <1431955144-31785-1-git-send-email-fhunleth@troodon-software.com>
 <20150518153137.GM2845@tarshish>
Message-ID: <CA+-urNRu=qpsQ_-O_y16-MVoYw-Vxqwc1myZw3mTqV=3aSDiOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 18, 2015 at 11:31 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Frank,
>
> On Mon, May 18, 2015 at 09:19:03AM -0400, Frank Hunleth wrote:
>> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
>> new file mode 100644
>> index 0000000..f58c324
>> --- /dev/null
>> +++ b/package/libsodium/libsodium.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# libsodium
>> +#
>> +################################################################################
>> +
>> +LIBSODIUM_VERSION = 1.0.3
>> +LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
>> +LIBSODIUM_LICENSE = ISC
>> +LIBSODIUM_LICENSE_FILES = LICENSE
>> +LIBSODIUM_INSTALL_STAGING = YES
>> +
>> +$(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
>
> The host package is still here. Please remove.

As I said in a previous email, I use the host package and asked for
guidance for including host packages or not. I didn't see a response.
While I certainly don't mind removing it, it would be nice to know why
host packages are such a problem. For me, it is very convenient that
Buildroot requires so little of the host Linux environment to work.
Libsodium, in particular, is annoying since you can't apt-get install
it in Ubuntu 12.04. I know that's old, but it's around. Anyway, that's
my 2 cents. It will be gone for v3...

Frank
