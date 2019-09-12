From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 08:33:38 +0200
Subject: [Buildroot] [PATCH] package: qemu: Make dependency to nettle
 explicit
In-Reply-To: <20190911084039.16983-1-post@lespocky.de>
References: <20190911084039.16983-1-post@lespocky.de>
Message-ID: <20190912083338.1e2fdfd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Wed, 11 Sep 2019 10:40:39 +0200
Alexander Dahl <post@lespocky.de> wrote:

> For the fli4l router distribution we had problems building 'qemu', some
> builds failed complaining when checking dynamic linking of the package:
> 
> >>> qemu 2.12.1 Error: Library libnettle.so.6 referenced by usr/libexec/qemu-bridge-helper belongs to package nettle which is not a dependency of qemu  
> 
> https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-x86_64/495/console
> 
> Making the dependency explicit, by calling ./configure with
> --enable-nettle or --disable-nettle depending on the activation status
> of package nettle, solves the issue.
> 
> For fli4l the fix is still based on buildroot 2018.02.x, but the problem
> is the same in recent version of buildroot, and the fix works for master
> as well.
> 
> Cc: Florian Wolters <florian@florian-wolters.de>
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Thanks for the patch, which looks good. I have one question though:
what prints the message "Error: Library libnettle.so.6 referenced by
usr/libexec/qemu-bridge-helper belongs to package nettle which is not a
dependency of qemu". It seems like a check from Buildroot, but I can't
find it in our tree, and I don't remember we had such a check. Maybe
it's just because it's early and my eyes are not well opened and I'm
missing something obvious.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
