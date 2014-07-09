From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 09 Jul 2014 16:23:11 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix race condition
	when installing man pages, 2nd try
References: <1404569546-12346-1-git-send-email-bernd.kuhls@t-online.de>
 <87k37mu0i5.fsf@dell.be.48ers.dk>
Message-ID: <XnsA365A6B0A90EFberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in
news:87k37mu0i5.fsf at dell.be.48ers.dk: 

>>>>>> "Bernd" == Bernd Kuhls
>>>>>> <bernd.kuhls@t-online.de> writes: 
> 
> > This patch reverts my previous attempt to fix this hard-to-catch race
> > condition 
> > http://git.buildroot.net/buildroot/commit/package/x11r7/xserver_xorg-se
> > rver?id=e244eb12dfc50bb56167d5fdaef3aac52b0ff6a3 
> 
> ...
> 
> > @@ -54,7 +52,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES =      \
> >       xkeyboard-config          \
> >       pixman                     \
> >       mcookie                \
> > -     host-xfont_font-util          \
> >       host-pkgconf
> 
> 
> What does this have to do with $SUBJECT? If it isn't needed, then it
> should be removed in a seperate commit (with a proper description why).

Hi,

host-xfont_font-util was added with xserver_xorg-server-400-fix-man.patch 
because it was needed to autoreconf xserver_xorg-server, which is not 
necessary anymore, see the link I quoted above.

Regards, Bernd
