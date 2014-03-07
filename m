From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 7 Mar 2014 16:21:06 +0100
Subject: [Buildroot] Are deferred Initcalls possible with a Linux 2.6.39
 Kernel?
In-Reply-To: <5319D2C8020000460004B7A4@gwia2.rz.hs-offenburg.de>
References: <5319D2C8020000460004B7A4@gwia2.rz.hs-offenburg.de>
Message-ID: <20140307152105.GC2917@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/2014 at 14:08:08 +0100, Frank Ihle wrote :
> Hi everyone,
> 
> I want to load several modules not at boot time, but afterwards when system is ready to operate. There are the deferred initcalls, that do exactly what I want as  explained on http://elinux.org/Deferred_Initcalls. 
> 

deferred_initcall is not for modules but for driver statically compiled
in the kernel. Is that what you are looking for ?


> Now to use them I need to apply a patch. On the given page, there are patches for Linux 2.6.26, 2.6.27, 2.6.28 and 3.10, unfortunately I'm using a Linux 2.6.39 and non of those patches can be applied successfully (Patch fails and If I make an Image afterwards, the "/proc/deferred_initcall" is not included)
> 
> Does anyone know if there are further patches or is there a workaround for Linux 2.6.39?
> 

I would say that the patch is sufficiently small to be ported easily on
any kernel version.

My guess would be that the 3.10 one is the one you should start with.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
