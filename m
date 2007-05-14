From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 14 May 2007 07:21:25 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <20070511154059.GA4710@aon.at>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at>
Message-ID: <1179120085.21753.1.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2007-05-11 at 17:40 +0200, Bernhard Fischer wrote:
> On Fri, May 11, 2007 at 04:31:49PM +0200, Hans-Christian Egtvedt wrote:

<cut>

> >$(LINUX_HEADERS_UNPACK_DIR)/.patched:
> >$(LINUX_HEADERS_UNPACK_DIR)/.unpacked
> >        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
> >toolchain/kernel-headers \
> >                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
> >ifeq ($(BR2_PACKAGE_OPENSWAN),y)
> >        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
> >                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
> 
> which means that your shell just doesn't expand ba{r,z}

Weird, I tried zsh, bash and sh. I am building on Ubuntu 7.04.

> We use patterns also to specify targets we intend to strip, so either
> use a different shell or fix all occurances, i'd say.

Which shell on which distribution works?

-- 
Best regards
Hans-Christian Egtvedt
