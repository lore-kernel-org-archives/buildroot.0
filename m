From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 6 Jan 2013 21:39:55 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <20130106212655.78c04f0d@skate>
References: <cover.1357426077.git.maxime.hadjinlian@gmail.com>
 <323f2db72c57aff2b31b2b7a5eb7f06d74775eda.1357426077.git.maxime.hadjinlian@gmail.com>
 <20130106212655.78c04f0d@skate>
Message-ID: <CAGduivwy0n=E6KqapcD1ie7i58mBTa6xU7gNBKmF35C9yb0N8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 6, 2013 at 9:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sat,  5 Jan 2013 23:55:14 +0100, Maxime Hadjinlian wrote:
>> diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
>> new file mode 100644
>> index 0000000..4872d1c
>> --- /dev/null
>> +++ b/package/libcofi/libcofi.mk
>> @@ -0,0 +1,17 @@
>> +#############################################################
>> +#
>> +# libcofi
>> +#
>> +#############################################################
>> +LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
>
> One new line between the first variable line and the #### line.
>
>> +LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
>
> LIBCOFI_LICENSE ?
There is absolutely no information whatsoever about license that I
could find, so I really did knew what to put there.
>
>> +define LIBCOFI_BUILD_CMDS
>> +    $(MAKE1) AS="$(TARGET_AS)" CC="$(TARGET_CC)" -C $(@D) libcofi_rpi.so
>> +endef
>
> Seeing the Makefile, I don't see any obvious dependency problem, so I
> guess you could use $(MAKE) instead of $(MAKE1).
>
> Also, please use $(TARGET_CONFIGURE_OPTS). And you don't need to
> specify the libcofi_rpi.so target since this is the first target of the
> Makefile (and hence the default one). So:
>
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>
>> +define LIBCOFI_INSTALL_TARGET_CMDS
>> +    $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so* $(TARGET_DIR)/usr/lib
>> +endef
>
> Only libcofi_rpi.so is built, so:
>
>         $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so $(TARGET_DIR)/usr/lib/libcofi_rpi.so
>
Ok
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
