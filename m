From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 12 Jun 2013 12:33:11 -0500
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
Message-ID: <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles,


> I believe including a kernel compile with this patch is a problem for
> several reasons.

There is no kernel compile in this patch.   Only the sgx kernel modules are
built.  The make KERNELDIR=path/to/sgx/dir modules only builds the modules
in the current directory.

> The first is that the TI defconfig for AM3517_evm never made it into
> the Linux kernel along with all the supporting changes, so the build
> fails.

You can use any kernel you would like and are not bound to mainline
kernels.  If the ti kernel has the needed patches, you may use it.  The
only requirement is that the kernel is specified in the kernel
configuration section.

> The second is that folks are using various versions of Graphics_SDK
> from 4_05_xx through 4_09_xx. These same folks generally build the
> Graphics_SDK once externally to buildroot to avoid carrying a 135MB
> file in the dl/ directory. This doesnt make sense for buildroot for
> two kernel .ko modules where 135MByte is larger then any other
> package.

It has to be downloaded anyways and as long as you don't distclean often;
it will only be downloaded once.  It may make sense to provide an option to
select which version of the gfx sdk but there's no need if they maintain
backwards compatibility.

> Perhaps you can consider making Graphics_SDK an external reference in
> your patch to make things go more smoothly?

IMHO. This would complicate the process.   The method presented would allow
people with no ti-gfx experience to quickly get up and running.

Thanks,

Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130612/d2a5ab3e/attachment.html>
