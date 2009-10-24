From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Oct 2009 20:36:16 +0200
Subject: [Buildroot] gtk-doc and autoreconfigured packages
In-Reply-To: <20091024182847.0644398e@surf> (Thomas Petazzoni's message of
	"Sat\, 24 Oct 2009 18\:28\:47 +0200")
References: <1256252030.25025.36.camel@coalu.atr>
	<20091024182847.0644398e@surf>
Message-ID: <87pr8czljz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Is this patch going to be integrated soon ? :
 >> 
 >> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=gtk-doc-m4-fix&id=b53a6096e4ea53517c7de5f711f381333bd6ac11
 >> 
 >> It solved problems I had with packages using gtk-doc.

 Thomas> I found it kind of hackish to include some gtk-specific stuff into the
 Thomas> automake package. But maybe it's the only way ?

It's certainly the easiest way. I agree that it isn't very pretty, but I
don't have a big problem with us doing "emulation" stuff if that makes
stuff easier and less error prone to handle.

It would be good to add a comment at the top of gtk-doc.m4, that
describes why we are doing it, and maybe it should get installed into
host/usr/share/aclocal as well to fix a similar issue with host
packages?

-- 
Bye, Peter Korsgaard
