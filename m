From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:14:53 +0100
Subject: [Buildroot] [git commit branch/next] package/lz4: bump version
	to r131
In-Reply-To: <87oaaznps3.fsf@dell.be.48ers.dk>
References: <20160229213908.F0B11802AC@busybox.osuosl.org>
 <87oaaznps3.fsf@dell.be.48ers.dk>
Message-ID: <20160229231453.6930fcb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 29 Feb 2016 22:57:16 +0100, Peter Korsgaard wrote:

>  >  define HOST_LZ4_INSTALL_CMDS
>  > -	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
>  > +	$(MAKE) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) \
>  > +		PREFIX=/usr install -C $(@D)
> 
> Hmm, why are we passing DESTDIR + PREFIX=/usr, instead of
> PREFIX=$(HOST_DIR)/usr for host installation?

Good point. I guess I got confused by the fact that we were already
passing DESTDIR=$(HOST_DIR). We should indeed be passing
PREFIX=$(HOST_DIR)/usr.

Let me fire up a test build and see if that works as expected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
