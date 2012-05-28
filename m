From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 28 May 2012 11:54:19 -0400
Subject: [Buildroot] [PATCH 1/4] Added the libassuan package.
In-Reply-To: <4FC39883.7010107@essensium.com>
References: <1337469304-27821-1-git-send-email-stijn.souffriau@essensium.com>
 <4FC39883.7010107@essensium.com>
Message-ID: <CANxTyt5VU9GYDpsbN10mXf5v8bXdAsiJo6zHNV7c9mX95=djsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment header in gnupg.mk is wrong ... it says "libgpg-error" ...


On Mon, May 28, 2012 at 11:23 AM, Stijn Souffriau <
stijn.souffriau@essensium.com> wrote:

> Hello all,
>
> Any feedback on the 4 patches I sent?
>
> Thanks,
>
> Stijn
>
> On 05/20/2012 01:15 AM, Stijn Souffriau wrote:
>
>> ---
>>  package/Config.in              |    1 +
>>  package/libassuan/Config.in    |    7 +++++++
>>  package/libassuan/libassuan.mk |   17 +++++++++++++++++
>>  3 files changed, 25 insertions(+), 0 deletions(-)
>>  create mode 100644 package/libassuan/Config.in
>>  create mode 100644 package/libassuan/libassuan.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index b25f31a..58c6624 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -276,6 +276,7 @@ endmenu
>>  menu "Crypto"
>>  source "package/beecrypt/Config.in"
>>  source "package/gnutls/Config.in"
>> +source "package/libassuan/Config.in"
>>  source "package/libgcrypt/Config.in"
>>  source "package/libgpg-error/Config.**in"
>>  source "package/libnss/Config.in"
>> diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
>> new file mode 100644
>> index 0000000..93ab49c
>> --- /dev/null
>> +++ b/package/libassuan/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_LIBASSUAN
>> +       bool "libassuan"
>> +       select BR2_PACKAGE_LIBGPG_ERROR
>> +       help
>> +         Libassuan is the IPC library used by some GnuPG related
>> software.
>> +
>> +         http://www.gnupg.org/
>> diff --git a/package/libassuan/libassuan.**mk <http://libassuan.mk>b/package/libassuan/
>> libassuan.**mk <http://libassuan.mk>
>> new file mode 100644
>> index 0000000..73c098e
>> --- /dev/null
>> +++ b/package/libassuan/libassuan.**mk <http://libassuan.mk>
>> @@ -0,0 +1,17 @@
>> +#############################**##############################**##
>> +#
>> +# libassuan
>> +#
>> +#############################**##############################**##
>> +
>> +LIBASSUAN_VERSION = 2.0.3
>> +LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION)**.tar.bz2
>> +LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/**libassuan/<ftp://ftp.gnupg.org/gcrypt/libassuan/>
>> +LIBASSUAN_INSTALL_STAGING = YES
>> +
>> +LIBASSUAN_CONF_OPT = \
>> +       --with-gpg-error-prefix=$(**STAGING_DIR)/usr
>> +
>> +LIBASSUAN_DEPENDENCIES = libgpg-error
>> +
>> +$(eval $(call AUTOTARGETS))
>>
>
>
> --
> Stijn Souffriau
> Embedded Software Developer - Mind Embedded Software Division
>
> ESSENSIUM nv
> Mind - Embedded Software Division
> Gaston Geenslaan 9 - B-3001 Leuven
> email : stijn.souffriau at essensium.com
> Web: www.essensium.com   /   www.mind.be
> BE 872 984 063 RPR Leuven
>
> ______________________________**_________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120528/ca3429fe/attachment-0001.html>
