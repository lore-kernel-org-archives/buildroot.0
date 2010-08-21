From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 00:01:59 +0200
Subject: [Buildroot] Stuff for the next release (2010.11)
In-Reply-To: <20100821173633.GA27302@merkur.ravnborg.org>
References: <20100821184657.6f49a80f@surf>
	<20100821173633.GA27302@merkur.ravnborg.org>
Message-ID: <20100822000159.04f432dc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Sat, 21 Aug 2010 19:36:33 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> For the record we are working on making the integration
> easier for non-kernel projects utilizing kconfig.

Yes, I've followed parts of the discussion about this, and that's very
good news. I think other projects, such as Crosstool-NG, Busybox,
PTXdist, uClibc and all users of kconfig will greatly benefit from this.

> In headlines that is:
> - Make CONFIG_ prefix configurable at buildtime
>   Basically adding -DCONFIG_=BR2_ will do the trick
> 
> - Use mainmenu entry as headline in the frontends
> 
> - Drop "kernel" from all help texts
>   So there is no longer any "kernel" texts hardcoded
> 
> I guess a few other nits I forgot.
> 
> I hope this is merged in next merge window - but no promises.

Ok. I'll try to update our package/config stuff against the mainline
kernel regularly, so that we can take advantage from this work.

FWIW, we also have other patches to scripts/kconfig besides
s/kernel/Buildroot/ and the change of the prefix. We have some stuff to
support the fact that the .config file and all related generated files
must be in the output directory in the case of an out-of-tree build. I
haven't look at those changes in detail, they were implemented by Peter.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
