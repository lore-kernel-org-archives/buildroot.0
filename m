From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 11:23:24 +0100
Subject: [Buildroot] [PATCH] iozone: disable for uClibc 0.9.31
In-Reply-To: <20131111100150.GN4581@tarshish>
References: <1384163348-17932-1-git-send-email-spdawson@gmail.com>
 <87siv36z7u.fsf@dell.be.48ers.dk> <20131111100150.GN4581@tarshish>
Message-ID: <20131111112324.002f280e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 11 Nov 2013 12:01:50 +0200, Baruch Siach wrote:

> > Committed, thanks. It sounds like it also needs to depend on
> > BR2_TOOLCHAIN_HAS_THREADS. Care to send a patch adding that dependency
> > and a comment line?
> 
> It also depends on BR2_PTHREADS_NATIVE. linuxthreads doesn't have 
> pthread_setaffinity_np.

It is not allowed to add a BR2_PTHREADS_NATIVE dependency to a package,
because this symbol is meaningless in the context of the external
toolchain backend.

We probably need to add something like
http://patchwork.ozlabs.org/patch/258723/, but updated, and with a
check in the external toolchain code to verify that the selection
matches the reality.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
