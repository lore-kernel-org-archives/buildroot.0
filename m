From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 09:16:38 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <20160828214805.GE5758@free.fr>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
 <87twe4aav2.fsf@dell.be.48ers.dk> <20160828214805.GE5758@free.fr>
Message-ID: <20160829091638.1236158a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 23:48:05 +0200, Yann E. MORIN wrote:

> There are *always* users of any option we deprecate or remove.
> 
> All we can do is make it easy for them to upgrade. Override-srcdir has
> been available for ages now (5 years in September), so it's not as if
> it were something new or complex to use.

The only major difference being that "override source dir" is meant to
be a "local" override, i.e something that developers do on their own
machine, for their own development. While the existing
BR2_LINUX_KERNEL_CUSTOM_LOCAL is really about having it as part of the
Buildroot configuration.

But nothing prevents people from having a version-controlled local.mk,
which makes it not-local anymore.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
