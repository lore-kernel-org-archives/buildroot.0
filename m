From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 19:52:32 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090106183243.GA28479@zelow.no> (Thomas Lundquist's message of
	"Tue\, 6 Jan 2009 19\:32\:43 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no>
Message-ID: <873afwnu6n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

Hi,

 >> Maybe. I would just start with the rm .config; make menuconf, select
 >> arch, save; make

 Thomas> It's a start of course but is the resulting .config a good
 Thomas> config or just more or less random?

Hopefully good - It's the default config of everything, just like any
new user would see it. If anything is not sensible then we should
change the defaults.

 Thomas> (BTW; WCHAR and LOCALE OFF is NOT a special case, it should
 Thomas> be default.  In my view, also LARGEFILE.)
 >> 
 >> You mean default on? They currently default to off, simply because of
 >> their size impact.

 Thomas> Default OFF. I haven't messed with g++ lately but it had a tendency 
 Thomas> to not work without WCHAR ON. It may be back in 3.X days though.

It work for me here on PPC (gcc 4.2.x / 4.3.x).

 Thomas> LARGEFILE set to off is another option I'd like to have as a test 
 Thomas> case but I have a slight feeling that will hinder a release 
 Thomas> for quite some time..

WCHAR, LOCALE and LARGEFILE all defaults to off, so that's imho a
pretty well tested.

-- 
Bye, Peter Korsgaard
