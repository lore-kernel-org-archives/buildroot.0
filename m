From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:52:07 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <CADYdroPBcpgMkNme2OP8jz3SX-+3J7eDqp0r8UbWXh_swvNkVQ@mail.gmail.com>
References: <20200629104749.46938-1-nolange79@gmail.com>
 <20200714151459.6ee4ca7a@windsurf.home>
 <CADYdroPBcpgMkNme2OP8jz3SX-+3J7eDqp0r8UbWXh_swvNkVQ@mail.gmail.com>
Message-ID: <20200714155207.08d6ffb1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 15:35:22 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > Also, was there any specific motivation/issue for this change, or just
> > make things "nicer" ?  
> 
> Removal of stuff like this:
> ifeq ($(BR2_INIT_SYSTEMD),y)
> LTTNG_LIBUST_CONF_OPTS += --with-lttng-system-rundir=/run/lttng
> endif

I'm confused, this snippet of code is for systemd configurations only,
and your patch doesn't change anything for systemd-based systems, where
/var/run was already a symlink to /run.

Could you clarify ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
