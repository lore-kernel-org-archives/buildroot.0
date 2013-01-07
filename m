From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 7 Jan 2013 23:25:30 +0100
Subject: [Buildroot] [PATCH v2 6/6] udisks: new package
In-Reply-To: <20130107231821.428885d0@skate>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-7-git-send-email-marek.belisko@open-nandra.com>
 <20130107224730.0b135a42@skate>
 <CAAfyv34HwgoO7dEW6edbqaczPOh+zuM-sHw5_5ZUs_bmyw6RiQ@mail.gmail.com>
 <20130107231821.428885d0@skate>
Message-ID: <CAAfyv35587HVKu5+-3dCS9MDDjSCH8YNqO4hiJn6dOM3=SS5SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 7, 2013 at 11:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Belisko Marek,
>
> On Mon, 7 Jan 2013 23:03:10 +0100, Belisko Marek wrote:
>> >> +     select BR2_PACKAGE_PARTED #select BR2_PACKAGE_LVM2
>> >> +     select BR2_PACKAGE_LVM2_DMSETUP_ONLY #devmapper library
>> >
>> > If you select BR2_PACKAGE_LVM2_DMSETUP_ONLY, then you also have to
>> > select BR2_PACKAGE_LVM2.
>> This is selected conditionally when LVM2 support if selected.
>
> This is not what your patch does:
>
> +config BR2_PACKAGE_UDISKS
> +       bool "udisks"
> +       depends on BR2_PACKAGE_UDEV
> +       depends on BR2_PACKAGE_DBUS
> +       select BR2_PACKAGE_SG3_UTILS
> +       select BR2_PACKAGE_UDEV_ALL_EXTRAS
> +       select BR2_PACKAGE_DBUS_GLIB
> +       select BR2_PACKAGE_POLKIT
> +       select BR2_PACKAGE_PARTED #select BR2_PACKAGE_LVM2
> +       select BR2_PACKAGE_LVM2_DMSETUP_ONLY #devmapper library
> +       select BR2_PACKAGE_LIBATASMART
>
> The select of BR2_PACKAGE_LVM2 is commented.
No this is comment that BR2_PACKAGE_PARTED select also BR2_PACKAGE_LVM2.
Maybe this is wrong approach but it works :).
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
