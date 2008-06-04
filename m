From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2008 23:10:26 +0200
Subject: [Buildroot] How does an offline build work?
In-Reply-To: <326f33790806041344p65f55e31i3e9a507ef1176a72@mail.gmail.com>
	(Arun Reddy's message of "Wed\, 4 Jun 2008 13\:44\:56 -0700")
References: <326f33790806041344p65f55e31i3e9a507ef1176a72@mail.gmail.com>
Message-ID: <87iqwoq531.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arun" == Arun Reddy <reddyac@gmail.com> writes:

Hi,

 Arun> I was curious as to how an offline build works.  When I first
 Arun> starting using Buildroot, I downloaded a snapshot for that
 Arun> day. As I used that same snapshot for about a month, I would
 Arun> run into different Buildroot issues, which came up whenever new
 Arun> changes were implemented. I assumed that whenever I typed
 Arun> "make" Buildroot is automatically being updated with those
 Arun> changes which could be affecting certain things.

Buildroot itself never gets updated by running make.

 Arun> I am now using Subversion access so I can update the source
 Arun> tree whenever I want, but if I were to go back to using the
 Arun> Buildroot snapshot image, will doing an offline build "make
 Arun> source" allow me to do a build without Buildroot being updated?
 Arun> Or is it just a way for all the files, packages, etc, to be
 Arun> downloaded first so that I can continue the build in a place
 Arun> where I do not have network access?

make source downloads the tarballs (E.G. source code) of all the
enabled packages into the download directory (dl by default). It is
indeed meant for offline use, E.G. you connect to the internet and run
make source, and once it is completed you will have all the needed
tarballs in your download directory and you can do the build without
network access.

-- 
Bye, Peter Korsgaard
