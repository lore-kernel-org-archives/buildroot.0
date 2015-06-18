From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 18:08:13 +0200
Subject: [Buildroot] Busybox build fails on raspberrypi defconfig
In-Reply-To: <20150618110211.2bc21e04@free-electrons.com>
References: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
 <CAJtjsKa9Osr3VjF6jBysCFPEKhh4c8HAHVP7FfVj07_N_B1FMQ@mail.gmail.com>
 <20150617164134.01411faf@free-electrons.com>
 <CAJtjsKaR=yJDgzzC0JupB7DJYvuxvOwvU2Ziv_6eU1-a8fhyFg@mail.gmail.com>
 <20150618110211.2bc21e04@free-electrons.com>
Message-ID: <5582ECED.8030205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/15 11:02, Thomas Petazzoni wrote:
[snip]
> I told you in my previous e-mail, but maybe it wasn't clear. It's due
> to a kconfig limitation/bug. Basically, here is the scenario:
> 
>  * You start from a fresh configuration.
> 
>  * You select uClibc 0.9.33, and exit menuconfig.
> 
>  * Automatically, the file package/uclibc/uClibc-0.9.33.config is used
>    as the uclibc configuration file (option BR2_UCLIBC_CONFIG)
> 
>  * Now, you go back to menuconfig, and you decide to switch to
>    uClibc-ng.
> 
> -> And now, instead of automatically switching to
> package/uclibc/uClibc-ng.config, package/uclibc/uClibc-0.9.33.config is
> kept as the value of BR2_UCLIBC_CONFIG. This is the limitation of
> kconfig I'm talking about above.
[snip]
> One way we could get around this problem is by making the
> BR2_UCLIBC_CONFIG option visible only if the user selects another
> option like "Use a custom uClibc configuration file".

 Or let the default be empty, and choose a default from the .mk file when it's
empty. But we've discussed that before and some people didn't like it.

 Note: this applies for all string options for which we have multiple defaults:
BR2_TARGET_GRUB2_BUILTIN_MODULES, BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
