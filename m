From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 11:18:34 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <87y4bm2d42.fsf@dell.be.48ers.dk>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <87y4bn6y5s.fsf@dell.be.48ers.dk>
 <20160118214704.GA3380@free.fr>
 <20160118230345.52b8f054@free-electrons.com>
 <877fj64jhn.fsf@dell.be.48ers.dk>
 <20160118232457.472dc051@free-electrons.com>
 <87y4bm2d42.fsf@dell.be.48ers.dk>
Message-ID: <20160119111834.797ea6d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, 19 Jan 2016 09:21:49 +0100, Peter Korsgaard wrote:

>  > But it does seem weird to many users that the "linux" package provides
>  > some many possibilities for fetching/patching the kernel, and still the
>  > linux-headers package downloads a completely different kernel version,
>  > with less possibilities of using a custom version.
> 
> So perhaps we need an option to use the linux source for our kernel
> headers? It does mean that people need to jump back and forth between
> the toolchain and linux menus.

Adding the option is not the problem. The problem is that from
package/linux-headers/linux-headers.mk, you can't use variables defined
from linux/linux.mk. So all you can do in
package/linux-headers/linux-headers.mk is duplicate the logic from
linux/linux.mk that will calculate LINUX_HEADERS_{VERSION,SITE,SOURCE}
and apply the custom patches from the BR2_LINUX_KERNEL_* Config.in
values.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
