From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 09:18:06 +0200
Subject: [Buildroot] [PATCH 1/1 v2] qdecoder : new package
In-Reply-To: <78843C93FA8647B482C22C49E4C4DB0D@JohanW7>
References: <1398155122-6872-1-git-send-email-sagaert.johan@skynet.be>
 <20140422162711.7b4d0c17@skate>
 <18590DF726304B8A9132C34717060A98@JohanW7>
 <20140422234122.778f4392@skate>
 <78843C93FA8647B482C22C49E4C4DB0D@JohanW7>
Message-ID: <20140425091806.2bb5d65e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 24 Apr 2014 22:43:14 +0200, Sagaert Johan wrote:

> What should I do with the BR2_PREFER_STATIC_LIB ? 
> Is this a something I should add as depenency ?

Yes. You should add !BR2_PREFER_STATIC_LIB to the dependencies, and add
the corresponding comment (see the Buildroot manual for details).

> (I am not very familiar with libraries, I assume that qdecoder.a is a static library and the others (*.so.*) are shared)
> 
> What should I add to finalize this patch ?
> I added a comment line to the QDECODER_CONF_OPT line for my next version of the patch. 

You should get rid of the --prefix and --libdir options, by patching
the Makefile.in to add ${DESTDIR} in front of the installation paths in
the 'install' target. Then you can send this patch upstream :-)

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
