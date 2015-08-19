From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 21:08:30 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
 is set
In-Reply-To: <20150819190534.GA13372@free.fr>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr>
Message-ID: <20150819210830.6c52ebed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 19 Aug 2015 21:05:34 +0200, Yann E. MORIN wrote:

> I think the plan I'll be goign with is to add a hidden Kconfig knob that
> packages that want to build a kernel module will have to select.
> 
> Then, if that option is set, we can force-on support for modules in
> linux.mk. Note: if the option is not set, we would *not* disable support
> for modules, and let it as set in the user-provided (def)config file.
> 
> So, all in all, that would solve the xtables-addons issue, because we
> would be handling CONFIG_MODULE explicitly.

Sounds good to me.

> Now, there are two questions:
> 
>   - will we need to _check_ for any arbitrary kernel option to be set,
>     and offer packages a simple mean to do so?
> 
>   - will we need to _force_ (on or off) any other kernel option, and
>     offer packages a simple mean to do so?

We already do your second item.

In general, I'd like to keep the handling of the kernel configuration
to be as minimal as possible. Otherwise, we'll quickly enter a
situation where we need to enable different kernel options depending on
the kernel version. It can quickly become a real nightmare. Buildroot
has always been about the user knowing what (s)he is doing, including
in terms of making sure that the kernel configuration matches what is
done in userspace.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
