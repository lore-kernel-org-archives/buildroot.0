From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 16:31:33 +0200
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <CA+wH296kBL8ZhhrHW7KCdrvFRuhB3-B=H2yJwZTyu75A8FhJyA@mail.gmail.com>
References: <20120731213729.49c4b3ee@skate>
 <CA+wH296kBL8ZhhrHW7KCdrvFRuhB3-B=H2yJwZTyu75A8FhJyA@mail.gmail.com>
Message-ID: <20120802163133.7c19d637@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 2 Aug 2012 15:19:15 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> It would be handy to add the current version for each package. More
> ambitiously, a variable defining a watch[1] line could be added to
> each Makefile, and used with the Debian scripts (such as uscan) to
> automatically detect new upstream versions.

Agreed. Funnily I was almost to the point of talking about this in my
announcement e-mail :-)

How exactly are those watch lines used? I.e, which tool is capable of
parsing them, and doing the necessary http/ftp requests to figure out
if a newer upstream version is available?

That said, showing the version of each package will slow down the
script quite a bit. For now, the script simply greps/seds through
the .mk file, which is reasonably fast. However, knowing the version
number is more complicated because sometimes the version number is
computed from other variables:

FOO_MAJOR_VERSION = 2
FOO_VERSION = $(FOO_MAJOR_VERSION).3

So to handle this properly, I would have to do 'make
<pkg>-show-version' for each package, which would be very slow
(but doable).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
