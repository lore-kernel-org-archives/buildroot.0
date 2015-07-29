From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 29 Jul 2015 08:22:04 +0200
Subject: [Buildroot] Using buildroot generated toolchain as external
	toolchain issues
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local>
References: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local>
Message-ID: <1526636.mbSdBIvjiD@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matthew,

On Tuesday 28 July 2015 17:44:18 Matthew Starr wrote:
> I have several buildroot instances I use for different hardware.    To
> speed up
> compile time I am trying to take a compiled buildroot toolchain and
> reuse it
> as an external toolchain for all my instances of buildroot.  I did this
> by not
> selecting any packages, kernel, or u-boot and not to generate a rootfs.
> When building the toolchain I selected ARM and EABIhf for Cortex A8.
Until here, everything seems correct

> I then take the contents of the output/host/usr directory and put it in
> a tar
> file that is then used as the external toolchain in the other buildroot
> instances.  
Your problem come from this step. Buildroot toolchains are not "relocatable". 
It means they don't work if move them away from their original location 
(Samuel Martin sent a patch to fix this behavior).

Therefore, once you compiled your toolchain, use "Pre-installed toolchain" 
option in order to use it.

Note: while you compile you toolchain, you can change BR2_HOST_DIR in order to 
build it directly in directory of you choice (/opt/arm-buildroot-linux-
gnueabihf for example).

BR, 

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
