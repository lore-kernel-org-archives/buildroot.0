From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 12 Oct 2019 10:27:00 +0300
Subject: [Buildroot] [PATCH 1/3] package/hostapd: enable Linux ioctls
 for VLANs
In-Reply-To: <ff138079-d5e1-66d0-d480-7c68f7cd70ea@mind.be>
References: <20191001074451.ce5u4ogstnsbwxma@bars>
 <ff138079-d5e1-66d0-d480-7c68f7cd70ea@mind.be>
Message-ID: <CAFGfvX6t+hcOjSo-uRjdLBL6UvikkvwAg+i-gJgPhDKK9z-vVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

....

> >>  Indeed, since vlan_full.c includes linux_ioctl, it makes sense to enable that
> >> in drivers.mk. Could you send a patch doing that upstream?
> >
> > Sure, will do. But hostapd upstreaming is going to take some time.
> > As for Buildroot, I have two options for this patch then:
> > - to keep this fix until next hostapd version update
> > - drop this fix and add hostapd patch to packages/hostapd directory
>
>  I mulled over this for some time before finally applying the patch as is.
>
>  Please do send a proper fix to upstream hostapd. When the version is bumped we
> can remove the current fix again. And if we forget, it's not the end of the world.

Patch has been already sent to hostapd mailing list. When it is accepted,
I will replace current solution in hostapd package makefile with a separate
patch for hostapd. In this caseuild failure will not let us to forget about it
when we bump hostapd version next time.

Regards,
Sergey
