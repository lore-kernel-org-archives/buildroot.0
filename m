From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 17 Jul 2021 02:40:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix linker assert on
 OpenRisc
In-Reply-To: <A7256F99-4EF5-4E00-8B1D-C84EB88179B7@benettiengineering.com>
References: <A7256F99-4EF5-4E00-8B1D-C84EB88179B7@benettiengineering.com>
Message-ID: <DEB60194-F30F-49D1-880F-D2CDD8154C74@benettiengineering.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210717004048.-VReBy65KE_9l8k0PiCasJc9czKsOd4DmqqFGMQWzSE@z>

Ah, last thing,

> Il giorno 17 lug 2021, alle ore 02:28, Giulio Benetti <giulio.benetti@benettiengineering.com> ha scritto:
> 
> ?
> 
> Inviato da iPhone
> 
>> Il giorno 17 lug 2021, alle ore 02:27, Giulio Benetti <giulio.benetti@benettiengineering.com> ha scritto:
>> 
>> ?
>>>> Il giorno 16 lug 2021, alle ore 22:53, Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha scritto:
>>> 
>>> ?On Mon, 12 Jul 2021 12:45:01 +0200
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>> 
>>>> When building openal we were seeing the assert failure:
>>>> 
>>>> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
>>>> pc-relative relocation against dynamic symbol alSourcePausev
>>>> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
>>>> pc-relative relocation against dynamic symbol alSourceStopv
>>>> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
>>>> pc-relative relocation against dynamic symbol alSourceRewindv
>>>> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
>>>> pc-relative relocation against dynamic symbol alSourcePlayv
>>>> collect2: error: ld returned 1 exit status
>>>> 
>>>> So add patches to fix this binutils assert link failure on OpenRisc.
>>>> It's been suggested upstream and it's pending here:
>>>> https://sourceware.org/pipermail/binutils/2021-July/117334.html
>>>> 
>>>> Fixes:
>>>> http://autobuild.buildroot.net/results/c96/c96f2600f227d6c76114b9fbc41f74a57e40415a/
>>>> 
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> ---
>>>> ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
>>>> ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
>>>> ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
>>>> ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
>>>> 4 files changed, 236 insertions(+)
>>>> create mode 100644 package/binutils/2.32/0015-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
>>>> create mode 100644 package/binutils/2.34/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
>>>> create mode 100644 package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
>>>> create mode 100644 package/binutils/2.36.1/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
>>> 
>>> Wow, thanks a lot for this work! Really amazing that you've been able
>>> to push this through!

Probably you know, but for having all OpenRiac toolchain bug free we need this patch applied:

https://patchwork.ozlabs.org/project/buildroot/patch/20210609162753.1138390-1-giulio.benetti at benettiengineering.com/

Best regards

Giulio

>> 
>> I?m very happy about this. Fortunately I?ve
> 
> *been* suggested
> 
>> suggested what to do on binutils otherwise it could take months :-) 
>> 
>> Giulio
>> 
>>> 
>>> Applied to master, of course!
>>> 
>>> Thanks again,
>>> 
>>> Thomas
>>> -- 
>>> Thomas Petazzoni, CTO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210717/b3f9c734/attachment-0002.html>
