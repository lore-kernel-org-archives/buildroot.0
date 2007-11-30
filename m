From: saravanan chanemouganandam <saravanan_sprt@hotmail.com>
Date: Fri, 30 Nov 2007 20:16:06 +0530
Subject: [Buildroot] kernel header 2.6.12
In-Reply-To: <474FF4F1.2090004@gmail.com>
References: <BAY131-W15D44FED3FDE6342B12D24E2710@phx.gbl>
	<474FF4F1.2090004@gmail.com>
Message-ID: <BAY131-W16D88EF4B62D9973F267DAE2710@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
 
I have enabled "Show obsolete/deprecated features" and then set BR2_KERNEL_HEADER_2_6_12=y and BR2_KERNEL_none=y. But make throws the error  No rule to make target and stop (from the last two line) 
....
....
cp -dpRf package/config/buildroot-config /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/buildroot-configmkdir -p /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/etcecho "" > /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/etc/issueecho "" >> /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/etc/issueecho "Welcome to the Erik's uClibc development environment." >> /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/etc/issuemkdir -p /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/etcecho "uclibc" > /home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/etc/hostnamemake: *** Pas de r?gle pour fabriquer la cible ? /home/sara/BuildRoot/buildroot/dl/linux-2.6.12.tar.bz2 ?, n?cessaire pour ? /home/sara/BuildRoot/buildroot/toolchain_build_arm/linux-2.6.12/.unpacked ?. Arr?t.


 
whereas  #make LINUX_HEADERS_VERSION=2.6.16 command  starts building toolchain by downloading linux-libc-headers-2.6.12.0.tar.bz2 .
 
I wonder why it doesn't work with simple make? do I miss some other option to be enabled? 
 
Sara
 
 
> Date: Fri, 30 Nov 2007 12:33:05 +0100> From: zentrale.at.work at gmail.com> To: saravanan_sprt at hotmail.com> CC: buildroot at uclibc.org> Subject: Re: [Buildroot] kernel header 2.6.12> > You have to enable "Show obsolete/deprecated features".> > Greetz> > saravanan chanemouganandam schrieb:> > Hi all,> > > > I have downloaded the latest version of buildroot to build toolchain and small rootfs for my arm (armv5te) target pxa270. The board runs linux 2.6.16 version and I want to replace the existing glibc rootfs with a small uclibc rootfs. > > > > Buildroot's make menuconfig doesn't show kernel header version 2.6.12 to build toolchain. Can anybody tell me how can I choose kernel header version 2.6.12 in toolchain option to build correct toolchain? > > > > will doing make DEFAULT_KERNEL_HEADERS=2.6.12 correcty build the toolchain arm-linux-uclibc-*?> > > > Thanks> > sara> > > > > > > > _________________________________________________________________> > Tried the new MSN Messenger? It?s cool! Download now.> > http://messenger.msn.com/Download/Default.aspx?mkt=en-in> > > > > > ------------------------------------------------------------------------> > > > _______________________________________________> > buildroot mailing list> > buildroot at uclibc.org> > http://busybox.net/mailman/listinfo/buildroot> > > -- > Sepp "ZaP" Holzmayr> > please reply to:> zentrale.at.work at gmail.com> > watch out for:> www.rocksociety.de
_________________________________________________________________
Post free property ads on Yello Classifieds now! www.yello.in
http://ss1.richmedia.in/recurl.asp?pid=219
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071130/fe1afc27/attachment.htm 
