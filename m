From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 21:18:20 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <20090115083621.GA15748@zelow.no>
References: <20090114221114.73CB776C8E@busybox.osuosl.org>
	<20090115083621.GA15748@zelow.no>
Message-ID: <1232050700.4757.22.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 09:36 +0100 skrev Thomas Lundquist:
> On Wed, Jan 14, 2009 at 10:11:14PM +0000, ulf at uclibc.org wrote:
> > 
> > Log:
> > Force use of HOST_GLIB instead of /usr/bin for libgtk2
> > 
> > Modified:
> >    trunk/buildroot/package/libgtk2/libgtk2.mk
> 
> I'll repeat myself, please answer.
> 
> Any reason we do this instead of using good old PATH? 
> Using PATH and having STAGING_DIR/BIN first in it will give the user an option 
> to choose wether he wants to use the host provided or his own.
> 
> So what is wrong with PATH and makes this hack a necessity?

It looks like the configure script for gtk is totally screwed up.
I have HOST_GLIB = /opt/gnome/bin on OpenSuSE in the path,
but configure does not look at the path, and decides
/usr/bin is where glib-genmarshal is.
There is also an ac_cv_path variable set in
the buildroot script, which is ignored.

BR
Ulf Samuelsson


> 
> 
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
