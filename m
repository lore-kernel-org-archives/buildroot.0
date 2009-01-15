From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 21:37:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <87hc408geh.fsf@macbook.be.48ers.dk>
References: <20090114221114.73CB776C8E@busybox.osuosl.org>
	<20090115083621.GA15748@zelow.no>
	<1232050700.4757.22.camel@aeglos.sweden.atmel.com>
	<87hc408geh.fsf@macbook.be.48ers.dk>
Message-ID: <1232051841.4757.30.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 21:26 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  >> So what is wrong with PATH and makes this hack a necessity?
> 
>  Ulf> It looks like the configure script for gtk is totally screwed up.
>  Ulf> I have HOST_GLIB = /opt/gnome/bin on OpenSuSE in the path,
>  Ulf> but configure does not look at the path, and decides
>  Ulf> /usr/bin is where glib-genmarshal is.
>  Ulf> There is also an ac_cv_path variable set in
>  Ulf> the buildroot script, which is ignored.
> 
> So with other words your commit doesn't fix anything and should be
> reverted?
> 

No, I am overriding the Makefile in this case.
It still does not build, but at least it finds glib-genmarshal.


> Haven't we been through this glib-genmarshal stuff before?
> 

Yes, there are a number of packages where the location of
glib-genmarshal is set using ac_cv_path_...
It is done in libgtk2 as well - but ignored.
I have tried to check for spelling errors, but I can't find any.


-- 
Ulf Samuelsson
