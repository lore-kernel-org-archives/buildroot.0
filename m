From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Thu, 17 Mar 2011 15:42:58 -0400
Subject: [Buildroot] Buildroot in use
In-Reply-To: <4D82421C.9020704@gmail.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<4D81FB3E.7060307@carallon.com>
	<1D6034426110564DA0DEA9EE9793B3835815B51A9B@NBE-MBX01.americas.swk.pri>
	<4D82421C.9020704@gmail.com>
Message-ID: <1D6034426110564DA0DEA9EE9793B3835815BCC604@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makes sense.

Another thing I have noticed that is frustrating is that a 'make clean' acts more like 'make distclean' and therefore you lose any configuration changes you have previously made. 

As a work around, can I copy the relevant .configs before the 'make clean' and add them back once the rebuild is complete (assumed that I need to delete the .stamp_compiled files as well)?

/carl h. 

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Steve Calfee
> Sent: March 17, 2011 1:17 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Buildroot in use
> 
> On 03/17/11 06:53, Heyendal, Carl wrote:
> > If starting from scratch, downloading and building 2 Buildroots (one
> for the toolchain, and the other for the rest of the stuff) sounds
> reasonable. But refining the notion a bit more, if you have already
> built the entire Buildroot tree like I have done already, is it
> possible to break off the toolchain leg of the tree and move it
> somewhere else. Then of course configure the external toolchain option
> after that.
> >
> > /carl
> >
> 
> I believe that the gcc that you have built has a few built-in paths, so
> you cannot just move the compiler stuff to another file tree.
> 
> What you can do is the second part of my suggestion, just create
> another
> buildroot tree and point its external toolchain to the one you now have
> built. It will leave some garbage in the original tree, but disk space
> is pretty cheap. In the new tree you will have faster make clean;
> make.... cycles since the external toolchain will not be deleted.
> 
> Regards, Steve
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
