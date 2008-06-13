From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 13 Jun 2008 19:58:01 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
In-Reply-To: <48522AB7.9000501@gmail.com>
References: <20080613055326.B817D3C7CA@busybox.net>
	<20080613062509.GA27054@cloud.net.au> <48522AB7.9000501@gmail.com>
Message-ID: <20080613095801.GA31077@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2008 at 08:07:19PM +1200, Matthew Dombroski wrote:
>
>> And now we're back to the original problem where libusb gets built over
>> and over again. Oh how I love autotools & our autotools packages..

I've got a fix, which I'll check in anyway.

> I have rewritten libusb.mk. I sent it to the buildroot mailing list  
> about 2 weeks ago but never heard anything.

Sorry about that.. I don't remember seeing it.

> This time I'm sending a proper patch (although its bigger than the  
> resulting libusb.mk).
> Can someone confirm that it works?

It looks ok, I will test it later (maybe Monday).

> -$(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
> -	(cd $(LIBUSB_DIR); rm -rf config.cache; \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(TARGET_CONFIGURE_ARGS) \
> -		ac_cv_header_regex_h=no \

It looked to me like something important was lost in your patch (it
doesn't mention ac_cv_header_regex_h anywhere after patching), but
looking at libusb's configure script it doesn't seem to be used anyway.

> +$(LIBUSB_TARGET_INSTALL_TARGET): $(LIBUSB_TARGET_INSTALL_STAGING)
> +	$(call MESSAGE,"Installing to target")

> -libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
> +$(LIBUSB_TARGET_UNINSTALL):
> +	$(call MESSAGE,"Uninstalling")

Why the messages? Is this standard among our autotools-using packages?

thanks!
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
