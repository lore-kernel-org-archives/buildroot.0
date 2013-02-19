From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2013 16:33:36 +0100
Subject: [Buildroot] [PATCH 2/4] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <87wqu4h5oh.fsf@dell.be.48ers.dk>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <1a995bdbc65141cf4e8a540c41cb56f4a43fba5f.1361142401.git.yann.morin.1998@free.fr>
 <512323E4.7000901@mind.be> <87wqu4h5oh.fsf@dell.be.48ers.dk>
Message-ID: <51239B50.4080702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/02/13 13:03, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>   >> if BR2_TARGET_ROOTFS_EXT2
>   >>
>   >> +choice
>   >> +	bool "ext generation"
>
>   Arnout>  Given the way it appears in menuconfig, I think this will be hard to
>   Arnout> understand for many users. Perhaps "ext generation (ext2, ext3 or
>   Arnout> ext4)".
>
> Or simply ext variant?
>
>   >> +	default BR2_TARGET_ROOTFS_EXT2_2
>
>   Arnout>  Although this matches the current default, doesn't it make
>   Arnout> more sense to "bump" to ext4?
>
> Possibly. It would break existing configs though.

  No it doesn't. It just _changes_ existing _defconfigs_. It is similar 
to (though a bit more invasive than) bumping the default kernel version.


>
>   >> +config BR2_TARGET_ROOTFS_EXT2_2
>   >> +	bool "ext2"
>   >> +
>   >> +config BR2_TARGET_ROOTFS_EXT2_3
>   >> +	bool "ext3"
>   >> +	select BR2_PACKAGE_HOST_E2FSPROGS
>
>   Arnout>  We don't usually select the host package. On the other hand, the
>   Arnout> support for user-selectable host packages is pretty recent, so we
>   Arnout> don't have a real tradition for this.
>
>   Arnout>  Peter?
>
> I would argue that we should keep kconfig and makefiles consistent when
> possible, so when we have a user selectable host package (kconfig
> symbol), we should select it.

  OK. We probably have quite a few violations of this convention, but we 
can look out for it when changes are made.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
