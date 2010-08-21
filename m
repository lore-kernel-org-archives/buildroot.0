From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 21 Aug 2010 19:36:33 +0200
Subject: [Buildroot] Stuff for the next release (2010.11)
In-Reply-To: <20100821184657.6f49a80f@surf>
References: <20100821184657.6f49a80f@surf>
Message-ID: <20100821173633.GA27302@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  * Updated the package/config to 2.6.36-rc1. I'll update it to the
>    final 2.6.36 when it's available.
> 
>    To do so, I've cleaned up the update process for package/config.
>    Instead of a single big kconfig-to-buildroot2.patch (which nobody
>    was keeping up-to-date anyway), I've created a Quilt stack of
>    patches. It allowed to ease the transition from 2.6.30 to 2.6.36-rc1.

For the record we are working on making the integration
easier for non-kernel projects utilizing kconfig.

In headlines that is:
- Make CONFIG_ prefix configurable at buildtime
  Basically adding -DCONFIG_=BR2_ will do the trick

- Use mainmenu entry as headline in the frontends

- Drop "kernel" from all help texts
  So there is no longer any "kernel" texts hardcoded

I guess a few other nits I forgot.

I hope this is merged in next merge window - but no promises.

The objective is that external users like buildroot no
longer need to carry any patched to use kconfig.
We will _not_ meet this objective at next merge window,
but I hope we will be rather close.

	Sam
