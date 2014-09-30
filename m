From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 30 Sep 2014 12:11:06 +0200
Subject: [Buildroot] Reducing buildroot compile times by reusing
	toolchain?
In-Reply-To: <CAAXf6LUZ1V=DrB_4XvLOZ3eieZGkEdZayWYfTZisgckdPNeY0Q@mail.gmail.com>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
 <CAAXf6LUZ1V=DrB_4XvLOZ3eieZGkEdZayWYfTZisgckdPNeY0Q@mail.gmail.com>
Message-ID: <CABbD_XD+9cF=o8bMXv14i0AhCud+Yez=xgcu6ZxJgGrrX9Z8tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


> On top of Thomas Petazzoni's answer, I would like to add that using a
> Buildroot toolchain as external toolchain is not hard at all.
> Basically you have to create a tarball from the output/host/usr
> directory, then specify that tarball as external toolchain and set
> some options.
> It seems this info is not yet in our manual, but we should add that.
>
>
I use the very same method for recompiling BR with the same internal
toolchain.
I have a .config file for preparing the toolchain with a custom
BR2_HOST_DIR. After running the
"make toolchain" target, I tar the custom host dir and clean up buildroot
with a simple "make clean". This
of course delete the custom host (toolchain) directory too.
The second .config can simply use the re-extracted toolchain
as BR2_TOOLCHAIN_EXTERNAL_PATH.

-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/8934c263/attachment.html>
