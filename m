From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 7 Jan 2013 22:58:04 +0100
Subject: [Buildroot] [PATCH v2 5/6] lvm2: Compile and install
	application library.
In-Reply-To: <20130107223802.26215d46@skate>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-6-git-send-email-marek.belisko@open-nandra.com>
 <20130107223802.26215d46@skate>
Message-ID: <CAAfyv34ArN+YjJ08ikAC46dAXM-6PEusdAyew_f2StaOChnUdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 7, 2013 at 10:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marek Belisko,
>
> On Mon,  7 Jan 2013 21:43:18 +0100, Marek Belisko wrote:
>
>> +config BR2_PACKAGE_LVM2_APP_LIBRARY
>> +     bool "install application library"
>> +     depends on BR2_PACKAGE_LVM2
>> +     help
>> +       Install application library (liblvm2app2).
>> +
>
>> +ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
>> +LVM2_MAKE_OPT += liblvm
>> +LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
>> +LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
>> +endif
>
> I am not quite sure this is correct. Currently, the package works as
> follows (if I understand correctly):
>
>  * if BR2_PACKAGE_LVM2=y but BR2_PACKAGE_LVM2_DMSETUP_ONLY is not
>    enabled, then LVM2_MAKE_OPT is empty, so it just runs the default
>    make target, which presumably builds everything.
>
>  * if BR2_PACKAGE_LVM2=y and BR2_PACKAGE_LVM2_DMSETUP_ONLY=y, then
>    LVM2_MAKE_OPT is set to device-mapper, in which case it only builds
>    the device mapper code.
>
> So now, you add a third BR2_PACKAGE_LVM2_APP_LIBRARY option. But if I
> do BR2_PACKAGE_LVM2=y and BR2_PACKAGE_LVM2_APP_LIBRARY=y, it will only
> build the library and not the rest, which is not what we expect.
>
> I'd say that the DMSETUP_ONLY thing is a bad idea from the beginning,
> so I'm not sure what's the best way moving forward.
>
> Are you sure liblvm doesn't get build and installed by the default
> BR2_PACKAGE_LVM2=y configuration?
Nope and this was intention of this patch to add ability to build also library.
lvm app library is necessary as dependency for udisk (if enabled lvm2
support - disabled by default).
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Regards,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
