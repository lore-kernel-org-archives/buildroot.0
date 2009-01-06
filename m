From: Thomas Lundquist <lists@zelow.no>
Date: Tue, 6 Jan 2009 19:32:43 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87aba4pj4w.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no>
	<87aba4pj4w.fsf@macbook.be.48ers.dk>
Message-ID: <20090106183243.GA28479@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 06, 2009 at 04:08:15PM +0100, Peter Korsgaard wrote:
> 
>  Thomas> Should we have some arch_testconfig as we have defconfigs?
>  Thomas> First start with a simple config then add more.
> 
> Maybe. I would just start with the rm .config; make menuconf, select
> arch, save; make

It's a start of course but is the resulting .config a good config or just 
more or less random?

>  Thomas> This has to be handles by a defined set of test cases based
>  Thomas> on more or less generic HW, like evaluation kits.
> 
> Or qemu.

True.

>  Thomas> (BTW; WCHAR and LOCALE OFF is NOT a special case, it should
>  Thomas> be default.  In my view, also LARGEFILE.)
> 
> You mean default on? They currently default to off, simply because of
> their size impact.

Default OFF. I haven't messed with g++ lately but it had a tendency 
to not work without WCHAR ON. It may be back in 3.X days though.

LARGEFILE set to off is another option I'd like to have as a test 
case but I have a slight feeling that will hinder a release 
for quite some time..


Thomas.
