From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 19 Mar 2012 11:32:46 +0100
Subject: [Buildroot] [PATCH] vnstat: new package
In-Reply-To: <20120319112026.592985ee@skate>
References: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
 <20120319105120.7dcafd10@skate>
 <CAM+bi4tyqL-zYyb7AC7kRPgGvedUoHok=Vkn-xdHJuZbs-PyGw@mail.gmail.com>
 <20120319112026.592985ee@skate>
Message-ID: <CAM+bi4tg=4ywjQYrWDP7_zQ_fvUzCYFpySjz-siZKFhwNYJwVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah, that's better! The package I was looking at as reference is ezxml and
is much more repetitive.

Thank you!

2012/3/19 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Le Mon, 19 Mar 2012 11:10:55 +0100,
> Alvaro Gamez <alvaro.gamez@hazent.com> a ?crit :
>
> > I see, but then essentially I would have to copy, paste and reformat the
> > original Makefile into vnstat.mk Isn't that a bit redundant?
>
> No, no. You don't have to replicate the project Makefile. You would
> just to something like:
>
> define VNSTAT_BUILD_CMDS
>        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> endef
>
> define VNSTAT_INSTALL_TARGET_CMDS
>        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)
> install
> endef
>
> You can also see other examples in the Buildroot code.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120319/11f52a94/attachment-0001.html>
