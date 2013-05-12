From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 21:38:34 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130512172916.GC2976@free.fr> (Yann E. MORIN's message of "Sun, 
 12 May 2013 19:29:16 +0200")
References: <20130510175133.13d3fc6f@skate> <20130510165356.GA19822@free.fr>
 <20130510225844.4f750b00@skate> <20130510222739.GB19822@free.fr>
 <20130511123144.1d18b9e5@skate> <20130512172916.GC2976@free.fr>
Message-ID: <87hai8xa2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> Yes, I know. But currently, those packages are already broken, since
 Yann> they point to /usr/var which might be read-only.

 Yann> So I wonder what the best situation would be to fully solve the issue. I
 Yann> can see at least two options:
 Yann>   - package provides an init script (or systemd unit) that creates the
 Yann>     required dirs/files at startup;
 Yann>   - infra creates a tarball of everyting in /tmp and install a startup
 Yann>     script that extracts that tarball at startup.

 Yann> Needless to say that I prefer the first solution, although it
 Yann> will require a bit more work (eg. currently, cups bundles and
 Yann> installs its startup script (which BTW is largely more complex
 Yann> than it needs to be), so we'd have to replace that startup script
 Yann> with our own, which is not really trivial).

Yes, I believe we do something similar for some of the packages in the
gtk stack (gdk-pixbuf or pango or so).

-- 
Bye, Peter Korsgaard
