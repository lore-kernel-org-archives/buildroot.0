From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Mar 2011 07:51:54 +0200
Subject: [Buildroot] build without linux, busybox,
 - just buildroot internal toolchain
In-Reply-To: <4D882702.9000807@gmail.com>
References: <201103202325.39993.tmohr@s.netic.de>
	<AANLkTi=t3L2WbrJXY0QRejbZTVKfNPbeSLjBazO3+E8T@mail.gmail.com>
	<201103212243.38429.tmohr@s.netic.de> <4D882702.9000807@gmail.com>
Message-ID: <20110322055154.GA1996@nataf.siach.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Mon, Mar 21, 2011 at 09:35:14PM -0700, Steve Calfee wrote:
> I am trying buildroot partitioned into systems. In my toolchain only
> tree, I disable both kernel, busybox, and all packages. This works,
> but for some reason the entire linux kernel is unpacked in the
> output/toolchain/linux-2.6.37.2. I am not clear on why the toolchain
> needs linux headers,

Any toolchain that generates binaries running under Linux needs header files 
from the Linux kernel. These headers define the kernel ABI (Application Binary 
Interface), such as system call numbers, structs, etc. Userspace programs 
include these headers either directly (from the linux/ directory), or 
indirectly via you libc of choice.

> but ok, why does it need the full source?

The Linux headers are not supplied in a separate package. You need to generate 
them from the Linux source.

Hope this helps.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
