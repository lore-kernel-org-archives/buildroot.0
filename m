From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 5 Nov 2018 13:25:00 -0800
Subject: [Buildroot] ELFCLASS issue on building Perl module Term::ReadKey
In-Reply-To: <CAAnJVhCshyo-nHCVo303qLJiXJd8c7xh91-mDHgFsDn4VyYoVw@mail.gmail.com>
References: <CAAnJVhCshyo-nHCVo303qLJiXJd8c7xh91-mDHgFsDn4VyYoVw@mail.gmail.com>
Message-ID: <CALURroQDySKs3+paup7i8sz_6qZN4Gi63v1G=yEH1o70y2qEeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On phone so sorry for top posting. I was able to get an error, but I don't
know why yet (worked fine last time I tried it). Will look at it again
tomorrow.

On Wed, Oct 31, 2018, 1:53 PM Nuno Mota <nrmmota@gmail.com> wrote:

> Hi,
> I'm using buildroot for a project and so far so good. I've added a lot of
> perl modules, but a new one just failed. I have no clue how to fix this.
> I simply cloned this git project to use swupdate
> https://github.com/Trellis-Logic/buildroot-external/tree/swupdate
>
> >>> perl-termreadkey 2.37 Building
> cd
> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/build/perl-termreadkey-2.37/
> && if [ -f Build.PL ] && [ MB != "EUMM" ] ; then PERL5LIB=
> PERL_USE_UNSAFE_INC=1
> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/bin/perl Build
> build; else /usr/bin/make -j1
> PERL_INC=/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/perl5/5.26.2/i686-linux/CORE
> FIXIN=:  pure_all; fi
> "/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/bin/perl"
> -MExtUtils::Command::MM -e 'cp_nonempty' -- ReadKey.bs
> blib/arch/auto/Term/ReadKey/ReadKey.bs 644
> "/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/bin/perl"
> "-Iblib/arch" "-Iblib/lib" ReadKey_pm.PL ReadKey.pm
> Creating ReadKey.pm
> Can't load 'blib/arch/auto/Term/ReadKey/ReadKey.so' for module
> Term::ReadKey: blib/arch/auto/Term/ReadKey/ReadKey.so: wrong ELF class:
> ELFCLASS32 at
> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/lib/perl5/5.26.2/x86_64-linux/DynaLoader.pm
> line 193.
>  at
> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/lib/perl5/5.26.2/x86_64-linux/DynaLoader.pm
> line 95.
> DynaLoader::croak("Can't load 'blib/arch/auto/Term/ReadKey/ReadKey.so' for
> modul"...) called at
> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/lib/perl5/5.26.2/x86_64-linux/DynaLoader.pm
> line 193
> DynaLoader::bootstrap("Term::ReadKey") called at ReadKey_pm.PL line 515
> Bootstrapping the XS for blockoptions: make[2]: *** [ReadKey.pm] Error 255
> make[1]: ***
> [/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/build/perl-termreadkey-2.37/.stamp_built]
> Error 2
> make: *** [_all] Error 2
> make: Leaving directory `/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot'
>
> This is now my external config:
> BR2_x86_nocona=y
> BR2_KERNEL_HEADERS_4_15=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_PTHREAD_DEBUG=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TARGET_GENERIC_HOSTNAME="gsgateway"
> BR2_TARGET_GENERIC_ISSUE="Welcome"
> BR2_TARGET_GENERIC_PASSWD_SHA512=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> BR2_ROOTFS_USERS_TABLES="../base_external/configs/users.config"
> BR2_ROOTFS_OVERLAY="../base_external/rootfs-overlay"
> BR2_ROOTFS_POST_BUILD_SCRIPT="../base_external/scripts/pre-image.sh"
> BR2_ROOTFS_POST_IMAGE_SCRIPT="../base_external/scripts/post-image.sh"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="../base_external/configs/linux_kernel_defconfig"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> BR2_PACKAGE_BUSYBOX_CONFIG="../base_external/configs/busybox.config"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_VLC=y
> BR2_PACKAGE_DMIDECODE=y
> BR2_PACKAGE_PERL=y
> BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION=y
> BR2_PACKAGE_EVENTLOG=y
> BR2_PACKAGE_LINUX_PAM=y
> BR2_PACKAGE_PCRE_UCP=y
> BR2_PACKAGE_BWM_NG=y
> BR2_PACKAGE_IFTOP=y
> BR2_PACKAGE_IFUPDOWN=y
> BR2_PACKAGE_IPTABLES=y
> BR2_PACKAGE_NGINX=y
> BR2_PACKAGE_NGINX_HTTP_CACHE=y
> BR2_PACKAGE_NGINX_HTTP_SSL_MODULE=y
> BR2_PACKAGE_NGINX_HTTP_V2_MODULE=y
> BR2_PACKAGE_OPENSSH=y
> BR2_PACKAGE_OPENVPN=y
> BR2_PACKAGE_TCPDUMP=y
> BR2_PACKAGE_TRACEROUTE=y
> BR2_PACKAGE_VSFTPD=y
> BR2_PACKAGE_FILE=y
> BR2_PACKAGE_LOGROTATE=y
> BR2_PACKAGE_SUDO=y
> BR2_PACKAGE_HTOP=y
> BR2_PACKAGE_SWUPDATE=y
> BR2_PACKAGE_SWUPDATE_CONFIG="../base_external/configs/swupdate.config"
> # BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE is not set
> BR2_PACKAGE_UTIL_LINUX_FSCK=y
> BR2_PACKAGE_UTIL_LINUX_KILL=y
> BR2_PACKAGE_UTIL_LINUX_LAST=y
> BR2_PACKAGE_UTIL_LINUX_LOGGER=y
> BR2_PACKAGE_UTIL_LINUX_MORE=y
> BR2_PACKAGE_UTIL_LINUX_MOUNT=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_GRUB2=y
> BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos
> part_gpt normal biosdisk loadenv search"
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_PERL_SWITCH=y
> BR2_PACKAGE_PERL_DATA_VALIDATE_IP=y
> BR2_PACKAGE_PERL_AUTHEN_PAM=y
> BR2_PACKAGE_PERL_TERMREADKEY=y
>
> Thank you,
> NRM
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181105/88461a09/attachment.html>
