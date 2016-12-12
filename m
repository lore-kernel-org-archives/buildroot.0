From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 18:52:11 +0100
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <20161212173527.GC3509@free.fr>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
 <87twe4aav2.fsf@dell.be.48ers.dk> <20160828214805.GE5758@free.fr>
 <20160829091638.1236158a@free-electrons.com>
 <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
 <20161212173527.GC3509@free.fr>
Message-ID: <20161212185211.41d61776@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 18:35:27 +0100, Yann E. MORIN wrote:

> But what I want is to be able to use local sources fior Qt5 that I
> prepare for my board; so I'll want to add the same feature for Qt5.
> Then Thomas will want to use local sources for barebox; so he'll want to
> add the same feature for barebox. Then Peter will need it for whatever,
> so he'll want to add it for that as well...

One could however say (with good reason) that the Linux kernel, and a
few other HW-related packages (bootloaders) are special.

And indeed, for those packages (Linux, U-Boot, Barebox, etc.), we do
support fetching from custom Git/Mercurial/etc. repositories. But we
would never do that for *all* packages.

So Linux is already special compared to other packages in that respect,
and this argument could be used (and in fact was used) to add a feature
like BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH.

But as I said, I don't really feel very strongly about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
