From: YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn>
Date: Wed, 17 May 2017 08:48:08 +0000
Subject: [Buildroot] how to install package ltp-testsuite outside of
	target directory
In-Reply-To: <8760gz7u5a.fsf@dell.be.48ers.dk>
References: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02>
 <8760gz7u5a.fsf@dell.be.48ers.dk>
Message-ID: <8729016553E3654398EA69218DA29EEF15B9ADF2@cnshjmbx02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
> Korsgaard
> Sent: Wednesday, May 17, 2017 4:41 PM
> To: YUAN Linyu
> Cc: buildroot at busybox.net
> Subject: Re: how to install package ltp-testsuite outside of target directory
> 
> >>>>> "YUAN" == YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn> writes:
> 
>  > Hi,
>  > When I build ltp-testsuite into a ARM initramfs image, it's very big,
>  > so system can't load module which can load without ltp-testsuite built.
> 
>  > section 3 reloc 1 sym 'vmalloc_to_page': relocation 28 out of range
>  >  (0xbf000034 -> 0xc1a18f1c)
> 
>  > I try to build ltp-testsuite outside the target rootfs.,
>  > for example, $(BASE_DIR)/ ltp-testsuite,
>  > it need change below configuration in pkg-autotools.mk,
>  > and add one configuration item to enable user define a directory for install.
> 
>  > $(2)_INSTALL_TARGET_OPTS                ?=
> DESTDIR=$$(TARGET_DIR) install
>  > ==>
>  > $(2)_TARGET_DIR		?= $$(TARGET_DIR)
>  > $(2)_INSTALL_TARGET_OPTS                ?=
> DESTDIR=$$($(2)_TARGET_DIR) install
> 
>  > anyone have a better solution?
> 
> An alternative is to write a post-build script to remove these files
> from the rootfs and instead create a seperate filesystem with the ltp
> files.
Do you mean private post-build script, right? 
So buildroot will not provide an official solution to do such thing, right?
> 
> --
> Bye, Peter Korsgaard
