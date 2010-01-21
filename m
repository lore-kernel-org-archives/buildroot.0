From: Tony Mozi <spooflinux@hotmail.fr>
Date: Thu, 21 Jan 2010 09:51:26 +0100
Subject: [Buildroot] Install arm-linux-uclibc-gcc
In-Reply-To: <201001201530.30880.minimod@morethan.org>
References: <SNT129-W60A03F402C379AFC99F668B9640@phx.gbl>,
	<201001200714.07217.minimod@morethan.org>,
	<SNT129-W413EBC85CE8FC09D2F29E0B9640@phx.gbl>,
	<201001201530.30880.minimod@morethan.org>
Message-ID: <SNT129-W24A90F4FEE300B56CC3808B9630@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Thank you for your answer.
In fact, it's seems very simple! 

In the buildroot's file, I type 'make menuconfig'.
Then I select the Architecture and his variant, uclibc and gcc.
I save the config.
I exit.
I type 'make'.

Then I add two PATH (export .../staging_dir/usr/bin and export CROSS_COMPILE='arm-linux-uclibc-')

It's ok?

BR




> From: minimod at morethan.org
> To: buildroot at busybox.net
> Date: Wed, 20 Jan 2010 15:30:28 -0600
> Subject: Re: [Buildroot] Install arm-linux-uclibc-gcc
> 
> On Wed January 20 2010, Tony Mozi wrote:
> > 
> > Hi,
> > I'm sorry, I'm not very clear.
> > In fact, I want to cross compil a linux-2.6.22.2 for an ARM.
> 
> In the root directory of your buildroot installation;
> type: make menuconfig (or make xconfig or make help)
> 
> Select ARM plus whatever else you need;
> exit
> type: make
> 
> The first thing the build system will do is create the cross-compiler toolchain.
> __Then__ you will have an 'arm-linux-uclibc-gcc' (and uclibc and binutils and ...)
> 
> Mike
> > In order to cross compil, I need the 'arm-linux-uclibc-gcc'.
> > Because when I make a 'make' (make ARCH=arm, or make ARCH=arm CROSS_COMPILE=arm-linux-uclibc-), I have an error which says 'arm-linux-uclibc-gcc' : command not found; it's an error like this.
> > In the buildroot, there are a lot things like gcc, uclibc, ...
> > I wonder if this famous 'arm-linux-uclibc-gcc' is available in the buildroot. In fact, I didn't find it and I want a confirmation that it is not available or that I must go to an optician :-)
> > If some points are not clear, don't hesitate to tell me.
> > 
> > BR
> > 
> > 
> > 
> > 
> > > From: minimod at morethan.org
> > > To: buildroot at busybox.net
> > > Date: Wed, 20 Jan 2010 07:14:03 -0600
> > > Subject: Re: [Buildroot] Install arm-linux-uclibc-gcc
> > > 
> > > On Wed January 20 2010, Tony Mozi wrote:
> > > > 
> > > > Hi all,
> > > > Before using a buildroot, I need to install 'arm-linux-uclibc-gcc', where can I find it?
> > > > BR
> > > >
> > > 
> > > Buildroot will build it for you if it is not present.  Just type "make" and watch.
> > > 
> > > If your question meant: "I need to install a vendor supplied..."
> > > Then follow the directions for using an "External toolchain"
> > > 
> > > If your question meant: "Where do I find a vendor supplied..."
> > > I guess you would have to ask the vendor.  ;)
> > > 
> > > Or maybe your question just did not survive the translation -
> > > Try Google Translate on the question (in your language) that you want to ask.
> > > 
> > > Mike
> > > 
> > > >  		 	   		  
> > > > _________________________________________________________________
> > > > Nouveau ! Tout Windows Live d?barque dans votre t?l?phone. Voir les Windows phone
> > > > http://clk.atdmt.com/FRM/go/175819071/direct/01/
> > > 
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >  		 	   		  
> > Avec Internet Explorer, surfez en toute discr?tion sur internet Cliquez ici ! 		 	   		  
> > _________________________________________________________________
> > D?couvrez Windows 7 en 7 secondes !
> > http://clk.atdmt.com/FRM/go/181574577/direct/01/
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
 		 	   		  
_________________________________________________________________
T?l?chargez Internet Explorer 8 et surfez sans laisser de trace !
http://clk.atdmt.com/FRM/go/182932252/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100121/e57660e7/attachment.htm>
