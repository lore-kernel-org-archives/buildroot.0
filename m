From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 09:20:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-07-17
In-Reply-To: <20180718201855.GC21354@australia>
References: <20180718060040.E770E208FF@mail.bootlin.com>
 <20180718201855.GC21354@australia>
Message-ID: <20180719092038.3aac3f6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jul 2018 22:18:55 +0200, Thomas De Schampheleire wrote:

> Problem here is the configuration of libssh2 with a non-openssl backend, which I
> had not tested.

So libssh2 doesn't fully "abstract" the specific crypto backend being
used ?

> The log seems to offer a suggestion on how to allow gcrypt as backend, which I
> have yet to try. And for mbedtls there is no suggestion, so likely not
> supported.
> 
> I need some more time to investigate this and propose a fix. Personally I'm only
> interested in the openssl backend, so another approach is to restrict it to
> that.

I'm fine with that approach.

> In that case I wonder how to achieve it: should I select both LIBSSH2 and
> LIBSSH2_OPENSSL and OPENSSL itself?

You can't select LIBSSH2_OPENSSL, because it is part of a choice. I'm
afraid you don't have any other solution but to "depends on
BR2_PACKAGE_LIBSSH2_OPENSSL". It is not ideal because it's clearly not
obvious for the user, but well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
