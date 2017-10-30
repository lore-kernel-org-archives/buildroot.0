From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 30 Oct 2017 09:21:35 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/libssh2: Add selectable
	crypto libraries
In-Reply-To: <20171028141649.GE3280@scaer>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171028141649.GE3280@scaer>
Message-ID: <CAH=K+6nJTQnPGAVHf_FfUXasApxCPNhURTqgF7gH6H4BtiGADA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

(sorry for repeat Yann, miss clicked reply instead of all).

On Sat, Oct 28, 2017 at 9:16 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Sam, All,
>
> On 2017-10-26 16:43 -0500, Sam Voss spake thusly:
[..]
>> +
>> +choice
>> +     prompt "Crypto Library"
>> +     default BR2_PACKAGE_LIBSSH2_MBEDTLS if BR2_PACKAGE_MBEDTLS
>> +     default BR2_PACKAGE_LIBSSH2_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
>> +     default BR2_PACKAGE_OPENSSL
>
> All those 'default' lines are useless. A choice always defaults to the
> first option which dependencies are fulfilled.

Interesting, I didn't know that. Great, saves some redundancy, I'll
get those removed.

>> +comment "mbedtls not selected"
>> +     depends on !BR2_PACKAGE_MBEDTLS
>
> Don't add those comments.

I had done this based off of other packages doing something similar
when requirements aren't met (to show availability). Do we only show
comments on main packages, and not sub choices? Just so I know next
time.

>>> +config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
>> +     depends on BR2_PACKAGE_LIBGCRYPT
>> +     bool "gcrypt"
>> +
>> +comment "libgcrypt not selected"
>> +     depends on !BR2_PACKAGE_LIBGCRYPT
>
> So this patch does two things:
>  1- make the backend selectable;
>  2- add libgcrypt as a backend.
>
> This should be two patches.

Libgcrypt was always an available crypto, and was not added in this patchset.
