From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 14 May 2007 09:11:31 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <1179120085.21753.1.camel@localhost.localdomain>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at>
	<1179120085.21753.1.camel@localhost.localdomain>
Message-ID: <20070514071131.GA11391@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 14, 2007 at 07:21:25AM +0200, Hans-Christian Egtvedt wrote:
>On Fri, 2007-05-11 at 17:40 +0200, Bernhard Fischer wrote:
>> On Fri, May 11, 2007 at 04:31:49PM +0200, Hans-Christian Egtvedt wrote:
>
><cut>
>
>> >$(LINUX_HEADERS_UNPACK_DIR)/.patched:
>> >$(LINUX_HEADERS_UNPACK_DIR)/.unpacked
>> >        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
>> >toolchain/kernel-headers \
>> >                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
>> >ifeq ($(BR2_PACKAGE_OPENSWAN),y)
>> >        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
>> >                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
>> 
>> which means that your shell just doesn't expand ba{r,z}
>
>Weird, I tried zsh, bash and sh. I am building on Ubuntu 7.04.

IIRC ubuntu defaults to dash as sh, so make sure that
a) SHELL points to /bin/bash (ash may work too)
or,
b) symlink sh to be bash

a) is of course the preferred solution, didn't look if there are direct
references to /bin/sh instead of $SHELL in the makefiles, though.
>
>> We use patterns also to specify targets we intend to strip, so either
>> use a different shell or fix all occurances, i'd say.
>
>Which shell on which distribution works?
