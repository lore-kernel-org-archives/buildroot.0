From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 18 Jan 2017 17:20:52 -0200 (BRST)
Subject: [Buildroot] building a cross toolchain
In-Reply-To: <1067596533.8690266.1484760223268@mail.yahoo.com>
References: <1067596533.8690266.1484760223268.ref@mail.yahoo.com>
 <1067596533.8690266.1484760223268@mail.yahoo.com>
Message-ID: <1411007900.7634494.1484767252252.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Tal Lubko" <tallubko@yahoo.com>
> To: buildroot at busybox.net
> Sent: Wednesday, January 18, 2017 3:23:43 PM
> Subject: [Buildroot] building a cross toolchain

> Hi

> I wonder what is the best way to build cross compiler.

You can build a cross-compiler using either Buildroot or an external
tool like Crosstool-NG. You can also get a pre-built toolchain from
a third-party vendor. Please refer to the Buildroot documentaion for
deeper explanations:

    http://www.buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain

> I was told that the cross compiler should be located under /opt and
> that is > better that it is built into the same place where it will
> be placed afterwards.

That's not mandatory. Modern toolchains can be installed at arbitrary
paths. Moreover Buildroot provides a toolchain wrapper. Again, just
read the documentation.

> So what I do is
> 1) set the "Host dir" to "/opt/my_cross_compiler"

Remember thar in Buildroot lingo ?host dir? is the path where host
tools are installed at build time. If you have a pre-built toolchain
then Buildroot will install a wrapper under ?host dir? to invoke it.

> 2) build the compiler

You can build the compiler using Buildroot or an external tool like
crosstool-NG. In my company we use crosstool-NG to fine-tune the
compiler and to generate the GCC test suite. YMMV.

> 3) tar it and give it to other users and tell them to place it in
> the same location

We did this initially in our project but now we just put the toolchain
in an HTTP server and let buildroot download and install it. This makes
the developer lives easier and allows us to upgrade the toolchain just
changing BR2_TOOLCHAIN_EXTERNAL_URL.

> Is that the right thing to do?

It will probably work but there is no fixed ?right? way. You will need
to do some experimentation and find the best choice.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
