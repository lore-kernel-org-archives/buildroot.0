From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 27 Jan 2013 12:24:37 +0100
Subject: [Buildroot] rebuilding a project on older commits
In-Reply-To: <20130127113309.4623b949@skate>
References: <51041908.1030803@googlemail.com> <20130127093035.5537b93f@skate>
 <5104EF52.3010608@googlemail.com> <20130127113309.4623b949@skate>
Message-ID: <51050E75.7020304@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.01.2013 11:33, schrieb Thomas Petazzoni:
> Dear Carsten Schoenert,
>
> On Sun, 27 Jan 2013 10:11:46 +0100, Carsten Schoenert wrote:
>
>> Yes, this is the solution. Right now I build the toolchain with ct-ng
>> inside buildroot.
>> Is it possible to move this existing toolchain outside buildroot or
>> should I rebuild from scratch?
> You should build it once with Crosstool-NG outside of Buildroot,
> install it somewhere, and tell Buildroot to use it as an external
> toolchain.
>
>> For the first two points I can answer with yes, but your tip with the
>> /lib folder is the right one. This folder is empty, and this also in
>> the output/target directory so it must be empty in the rootfs.tar too.
>>
>> So the libraries in the /lib folder are missing there must be
>> something wrong with the config of the ct-ng? Any suggestions where I
>> have to look to?
> That sounds really odd. Maybe we have a bug in the ct-ng backend, and
> it doesn't copy the libraries? I would have to do a test build, but I'm
> on the battery in the train for now, so I can't do heavy builds for now.
>
> If someone could do a quick test build of a minimal system that uses
> the ct-ng backend, and verify that $(O)/target/lib contains the right
> libraries, that would be nice.
I just tried (took beaglebone-defconfig and only changed toolchain to
ct-ng) and output/target/lib/ seems o.k.
> $ ls output/target/lib/
> ld-uClibc-0.9.33.2.so  libcrypt.so.0      libdl.so.0       
> libm.so.0           libpthread-0.9.33.2.so  libresolv.so.0    
> libuClibc-0.9.33.2.so
> ld-uClibc.so.0         libc.so.0          libgcc_s.so.1    
> libnsl-0.9.33.2.so  libpthread.so.0         librt-0.9.33.2.so 
> libutil-0.9.33.2.so
> libcrypt-0.9.33.2.so   libdl-0.9.33.2.so  libm-0.9.33.2.so 
> libnsl.so.0         libresolv-0.9.33.2.so   librt.so.0        
> libutil.so.0
Kind regards

Stephan
>
> Best regards,
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
