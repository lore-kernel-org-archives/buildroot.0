From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Dec 2016 23:25:41 +0100
Subject: [Buildroot] [PATCH v3,3/3] soletta: new package
In-Reply-To: <20161219231208.46c66492@free-electrons.com>
References: <1482101300-9180-1-git-send-email-fabrice.fontaine@orange.com>
 <1482101300-9180-3-git-send-email-fabrice.fontaine@orange.com>
 <20161219231208.46c66492@free-electrons.com>
Message-ID: <CAPi7W839KFC4Y1QgGsfH0uCe8PTp-DQzLD2GDLqFO4s-RdoAdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

2016-12-19 23:12 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 18 Dec 2016 23:48:20 +0100, Fabrice Fontaine wrote:
> > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
>
> I'm sorry, but this still doesn't work with old make versions. I get:
>
> make[1]: Entering directory `/home/test/buildroot/output/build/soletta-v1'
> Makefile.smallos:35: "LDFLAGS not set. This is probably an error"
> Makefile.smallos:57: *** multiple target patterns.  Stop.
> make[1]: Leaving directory `/home/test/buildroot/output/build/soletta-v1'
>
> This is due to the := assignments in the target definitions. If I change:
>
> $(soletta_target): private export BOARD_NAME:=$(BOARD_NAME)
> $(soletta_config): private export BOARD_NAME:=$(BOARD_NAME)
>
> to
>
> $(soletta_target): private export BOARD_NAME=$(BOARD_NAME)
> $(soletta_config): private export BOARD_NAME=$(BOARD_NAME)
>
> then a different problem happens: the "private" keyword apparently
> didn't exist in make 3.81, and therefore is interpreted as being a
> target, and therefore:
>
> make[1]: Entering directory `/home/test/buildroot/output/build/soletta-v1'
> Makefile.smallos:35: "LDFLAGS not set. This is probably an error"
> make[1]: *** No rule to make target `private', needed by
> `/home/test/buildroot/output/build/soletta-v1/.config'.  Stop.
> make[1]: Leaving directory `/home/test/buildroot/output/build/soletta-v1'
>
> So, really, this package that requires a brand new version of make, and
> python3, is a bit annoying in terms of build process... Maybe this is
> something you can work out with upstream?
>
> In the mean time, we cannot apply this, as it will badly fail on our
> autobuilders, and for many of our users who run fairly old systems.
>
I perfectly understand your point, thanks a lot for the time you passed on
testing these patches.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161219/905acc71/attachment.html>
