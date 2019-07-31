From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 31 Jul 2019 22:11:17 +0200
Subject: [Buildroot] [RFC PATCH v4 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190731160059.GJ3194@scaer>
References: <20190730213846.7488-1-petr.vorel@gmail.com>
 <20190730213846.7488-2-petr.vorel@gmail.com>
 <20190731160059.GJ3194@scaer>
Message-ID: <20190731201116.GD10819@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> So, now we set the capabilities to those exectuables, do they still need
> to be setuid?

> But then, if one really does not want xattr, setuid is still required.

> So, we have no way to express that a file should have either setuid or
> xattrs, except as a big if-block like:

>     ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
>     define IPUTILS_PERMISSIONS
>         /usr/bin/clockdiff    f 0755 0 0 - - - - -
>         |xattr cap_net_raw+p
>     endef
>     else
>     define IPUTILS_PERMISSIONS
>         /usr/bin/clockdiff    f 4755 0 0 - - - - -
>     endef
>     endif

> ... which is what we were trying to avoid in the firstplace...

> We could write something like:

>     /usr/bin/clockdiff    f $(MAYBE_SUID)755 0 0 - - - - -
>     |xattr cap_net_raw+p

> Where MAYBE_SUID would be set as:

>     MAYBE_SUID = $(if $(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),0,4)
Good point, I fixed it in v5 (with whitespace).

> But it is starting to be a bit more complex than what you initially
> envisionned, I guess.
Yep :(. But your solution is good enough, thank you!


Kind regards,
Petr
