From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:28:04 +0100
Subject: [Buildroot] [PATCH next] trinity: bump version to fix a build
 failure using Linux 3.19 headers
In-Reply-To: <1424640573-5274-1-git-send-email-fabio.porcedda@gmail.com>
References: <1424640573-5274-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150223122804.17dcca08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 22 Feb 2015 22:29:33 +0100, Fabio Porcedda wrote:
> bump to the following trinity repository commit:
> 
> kvm: Add ifdef around IA64 ioctls.
> Fix build error.
> 
>   CC	ioctls/kvm.o
> In file included from ioctls/kvm.c:8:0:
> ioctls/kvm.c:115:8: error: ?KVM_IA64_VCPU_GET_STACK? undeclared here (not in a function)
>   IOCTL(KVM_IA64_VCPU_GET_STACK),
>         ^
> include/ioctls.h:53:15: note: in definition of macro ?IOCTL?
>   { .request = _request, .name = #_request, }
>                ^
> ioctls/kvm.c:116:8: error: ?KVM_IA64_VCPU_SET_STACK? undeclared here (not in a function)
>   IOCTL(KVM_IA64_VCPU_SET_STACK),
>         ^
> include/ioctls.h:53:15: note: in definition of macro ?IOCTL?
>   { .request = _request, .name = #_request, }
> 
> IA64 ioctls were removed in Linux 3.19.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied to next, thanks.

I initially wondered if we shouldn't apply this to master, but since it
happens only with 3.19 kernel headers, and such option has only been
added in next, I indeed decided to apply this patch only to the next
branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
