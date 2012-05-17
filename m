From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 May 2012 10:26:49 +0200
Subject: [Buildroot] connman requirement for resolver in toolchain
In-Reply-To: <1337223711.1915.3.camel@galileo.gfxmuse.org>
References: <1337223711.1915.3.camel@galileo.gfxmuse.org>
Message-ID: <20120517102649.6a6dc5ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Le Wed, 16 May 2012 21:01:51 -0600,
"Michael J. Hammel" <buildroot@graphics-muse.org> a ?crit :

> I'm looking at adding connman to my build. It appears that connman can't
> be enabled unless the toolchain includes resolver support.  
> 
> How does the config check for that?  I didn't see any Buildroot config
> options to specify that my external toolchain has that nor is there any
> option in Crosstool-NG (my toolchain) to enable it in the C library.
> 
> I'm using Buildroot 2012-02 and Crosstool-NG 1.13.4.

All packages in Buildroot assume that if uClibc is used, then the
uClibc configuration contains at least the options that Buildroot uses
to build uClibc when the internal backend is used. Those options are
listed in toolchain/uClibc/uClibc-0.9.xx.config.

If you are building your uClibc toolchain externally with Crosstool-NG,
then it is up to you to adjust the uClibc configuration. You can either:

 *) Choose to make it identical to the uClibc configuration that
    Buildroot uses for its internal backend, which gives you a good
    certainty that packages will build

 *) Choose to progressively adjust your uClibc configuration to match
    the particular requirements of the specific packages you're using.

But the overall answer is: if you're using an uClibc external
toolchain, Buildroot can't do anything to adjust the uClibc
configuration, so it's your job to do so :-)

Personally, for the Crosstool-NG toolchains I use for the autobuilds, I
have created samples that use the Buildroot uClibc configuration, so
that it matches what Buildroot expects.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
