From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Oct 2013 17:56:07 +0200
Subject: [Buildroot] glib-networking when using gtlsconnection fails
In-Reply-To: <525eb564.c664cc0a.66a5.6cee@mx.google.com>
References: <525eb564.c664cc0a.66a5.6cee@mx.google.com>
Message-ID: <20131016175607.51b57e4b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernhard Schuster,

On Wed, 16 Oct 2013 15:50:51 +0002, Bernhard Schuster wrote:

> I am trying to cross compile a application which works just fine on my 
> x86_64 machine for a ARMv5TE "gadget". Unfortunately something really 
> weird happens: Altough having selected gnutls in order to use TLS with 
> glib-networking (GTlsConnection), I always get an error as soon as the 
> combined cert/key pem file is read (it exists, has proper permissions, 
> all tripple checked). The error always contains "TLS unsupported" or 
> "no TLS support" (can not recall, currently away from that machine) 
> altough the config.h of glib-networking says the opposite. The binary 
> is statically compiled (which worked fine so far).
> 
> I am puzzled on how to fix my issue, I already tried to fix it by 
> adding a couple of commandline opts explicitly (though they say that 
> they are enabled by default, thus - as expected - nothing changed).
> 
> Also note that I have a similar issue with pcre (required for GRegex), 
> where I pass --enable-utf8 but it still did not fix anything.
> 
> Any help, hint, tip is appreciated.
> 
> Buildroot 2013.08 is used together with the code sourcery 2011/2013 
> toolchain

Just to be sure: did you do a complete "make clean all" cycle after
adjusting your configuration to enable gnutls, or after adding
--enable-utf8 to pcre?

Remember that Buildroot does not automatically rebuild packages: if you
enable gnutls, it will build gnutls, but it will not rebuild
glib-networking automatically.

If you can provide a simple test case (or maybe even an existing test
application for glib-networking) to reproduce the problem, it would
definitely be helpful. Same for the pcre / GRegex problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
