From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jun 2012 21:36:42 +0200
Subject: [Buildroot] [PATCH 2/3] debug: provide an option to copy the
 gdbserver to the target
In-Reply-To: <CAAXf6LXCk=P8o--c9u8Usq4U6Gz9Rmnr9yzh20c3d-3LJj+g1A@mail.gmail.com>
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LXCk=P8o--c9u8Usq4U6Gz9Rmnr9yzh20c3d-3LJj+g1A@mail.gmail.com>
Message-ID: <20120606213642.062a0bab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 6 Jun 2012 12:16:54 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> With this change, buildroot will no longer present the option of
> building gdbserver itself. If you have an external toolchain, it is
> now mandatory for it to contain gdbserver (if you want it of course).

Correct.

> I'm not sure if we can always expect this.

I would say it is the case for most external toolchains that exist
today, so it sounds like (at least to me) like a reasonable solution.

> In my case, gdb was built by the toolchain, and gdbserver by
> buildroot. For me it makes sense to follow your strategy and have
> gdbserver built by crosstool-ng instead (and use that as custom
> external toolchain).

Building gdb and gdbserver separately is, IMO, a recipe for disaster.
Even though the gdb remote protocol is supposed to be stable, my
experience is that using a different version for gdb and gdbserver
often causes problems.

> But maybe there are cases where custom external toolchains do not
> contain gdbserver already, and the user would like buildroot to build
> it? In that case, we could consider changing the depend line to:
> depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM || !BR2_TOOLCHAIN_EXTERNAL
> 
> What do you think? Should we cater for this?

Do you have a practical usage for this?

Generally speaking, I'd prefer if we handle really useful use cases,
and to not complexify Buildroot with hypothetic and complex use cases.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
