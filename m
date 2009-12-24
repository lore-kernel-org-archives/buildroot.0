From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 07:14:56 +0100
Subject: [Buildroot] [PATCH 0/5] package: add efl librairies
In-Reply-To: <e4b6ec780912231706re5a8e95hac91fbac1d34b7ce@mail.gmail.com>
References: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
	<e4b6ec780912231706re5a8e95hac91fbac1d34b7ce@mail.gmail.com>
Message-ID: <1261635296.5867.6.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 24 d?cembre 2009 ? 02:06 +0100, Stefan Schake a ?crit :
> Hey,
> 
> Love to see EFL in buildroot, thanks very much :)
> Just a small error in all of the packages:
> when you call AUTOTARGETS, you pass the path, but since you added a
> subdirectory, you have to add it in the call, too.
> For example,
> 
> $(eval $(call AUTOTARGETS,package,libedje))
> 
> becomes
> 
> $(eval $(call AUTOTARGETS,package/efl,libedje))

Thx, I missed that...

> 
> This might be important when there are patches to apply because of the
> way AUTOTARGETS searches for them.
> 
> Also you're missing a few configuration switches on ecore (ecore-job,
> ecore-con, ecore-ipc, ecore-txt). These all cleanly compile without
> any dependencies really, with one exception: ecore-con, which fails
> for uClibc. I've attached a patch that fixes the problem, but as I
> look at it, I think it can be done more cleanly. Anyway, still useful
> to highlight the problem.

Thx again. I just tested with glibc.
Adding such modules might complexify the dependencies a little bit but I
will do it.

By the way did you try with a directfb or x11 backend ?

> 
> Do you have any plans on integrating elementary? Since it is
> specifically targeting at embedded, it might be very useful for most
> of buildroot users. I might warn you however, elementary requires the
> host to have the edje installed since it's calling edjecc during the
> build, so we will need a host-package of edje for that.

Yes it's planned, thx for the tips.
I would like to go up to Enna ;)

> 
> Greetings
> 
> 2009/12/24  <llandwerlin@gmail.com>:
> > With the (not so) recent activity around e17 and the new snapshot
> > released earlier this month, people might get interested in the EFL
> > integration in buildroot.
> >
> > Currently compiled/tested on directfb. Any comment/fix/test is welcome.
> > The libedje package depends on another patch on lua :
> > http://lists.busybox.net/pipermail/buildroot/2009-December/031334.html
> >
> >  [PATCH 1/5] efl: added libeet package
> >  [PATCH 2/5] efl: added libevas package
> >  [PATCH 3/5] efl: added libecore package
> >  [PATCH 4/5] efl: added libembryo package
> >  [PATCH 5/5] efl: added libedje package
> >
> > Regards,
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
