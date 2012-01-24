From: Will Newton <will.newton@gmail.com>
Date: Tue, 24 Jan 2012 10:32:50 +0000
Subject: [Buildroot] [PATCH 14/14] libedbus: Add new package
In-Reply-To: <201201232351.35126.arnout@mind.be>
References: <CAFbHwiRMV41vA3FUVdekg6H123c-yyUV7n5qQQHObJ-yw0Qc=g@mail.gmail.com>
 <201201232351.35126.arnout@mind.be>
Message-ID: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 23, 2012 at 10:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 23 January 2012 17:36:27 Will Newton wrote:
>> Signed-off-by: Will Newton <will.newton@imgtec.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> [snip]
>> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
>> new file mode 100644
>> index 0000000..71e3b50
>> --- /dev/null
>> +++ b/package/efl/libedbus/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_LIBEDBUS
>> + ? ? bool "libedbus"
>> + ? ? select BR2_PACKAGE_LIBEINA
>> + ? ? select BR2_PACKAGE_DBUS
> ?DBUS depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2
> so you have to repeat that here.

Hmm, would it be better just to add a comment asking the user to
enable dbus rather than adding the select for the XML library? I'm not
sure what the best way to handle that is.

> ?BTW, it's advisable to compile-test your patches against a minimal
> uclibc-based 32-bit and 64-bit cross-toolchain. ?That helps detecting
> dependencies on USE_WCHAR and USE_LARGEFILE.

There is a top-level dependency on WCHAR for all of EFL, I'll test
with LARGEFILE enabled too.

>> + ? ? help
>> + ? ? ? E_Dbus is a set of wrappers around DBus APIs by third party, so
> ?I believe the official name is D-Bus.
>
>> + ? ? ? they can be easily used by EFL applications, automatically
>> + ? ? ? providing Ecore/main loop integration, as well as Eina data types.
>> diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
>> new file mode 100644
>> index 0000000..e2ac836
>> --- /dev/null
>> +++ b/package/efl/libedbus/libedbus.mk
>> @@ -0,0 +1,16 @@
>> +#############################################################
>> +#
>> +# libedbus
>> +#
>> +#############################################################
>> +
>> +LIBEDBUS_VERSION = 1.1.0
>> +LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
>> +LIBEDBUS_SITE = http://download.enlightenment.org/releases/
>> +LIBEDBUS_AUTORECONF = YES
>> +LIBEDBUS_LIBTOOL_PATCH = YES
> ?Libtool patching is enabled by default.

Thanks for the review, I'll fix these.
