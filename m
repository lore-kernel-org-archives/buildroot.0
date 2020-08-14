From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 14 Aug 2020 07:53:35 +0200
Subject: [Buildroot] Compiling the kernel via buildroot
In-Reply-To: <mailman.8310.1597343819.162353.buildroot@busybox.net>
References: <mailman.8310.1597343819.162353.buildroot@busybox.net>
Message-ID: <8eaf36d7b9ff5934c3f4145228c44738@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Isaac,

On 2020-08-13 20:36, buildroot-request at busybox.net wrote:

> I am new on this mailing list. Is this the email for questions
> regarding buildroot?

This mailing list mostly handles development related requests and bug 
reports.

> 1. When doing a change in the linux kernel, do i have to build the 
> kernel
> in the kernel tree and then call buildroot? Or will build root see the
> changes and build them automatically?

The Buildroot workflow will handle the kernel build for you. A single 
change inside a source tree is not detected by Buildroot, you have to 
manually start the kernel rebuild by invoking 'make linux-rebuild', see 
also https://buildroot.org/downloads/manual/manual.html#rebuild-pkg

> 2. Is this possible to rebuild a single module instead of all modules?

If the kernel module is inside the kernel source tree, you will probably 
need to rebuild the whole kernel (that means everything that is 
downstream of your change).

So if you just have a single additional module, consider creating a 
Buildroot package. For examples see one of the Realtek driver packages, 
e.g. package/rtl8188eu. You can find the documentation here: 
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules

Regards,
Andreas
