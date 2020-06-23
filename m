From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2020 08:19:25 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.79
In-Reply-To: <20200622105151.rrcjmjdqxiy5pcgp@falbala.internal.home.lespocky.de>
 (Alexander Dahl's message of "Mon, 22 Jun 2020 12:51:52 +0200")
References: <20200622073933.236001-1-francois.perrad@gadz.org>
 <87eeq78o4n.fsf@dell.be.48ers.dk>
 <20200622105151.rrcjmjdqxiy5pcgp@falbala.internal.home.lespocky.de>
Message-ID: <875zbi8fte.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Hei hei,
 > On Mon, Jun 22, 2020 at 11:07:36AM +0200, Peter Korsgaard wrote:
 >> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> 
 >> > CBC ciphers, 3DES and hmac-sha1-96 are now disabled by default.
 >> 
 >> Do we expect that to cause compatibility issues?

 > I just looked in package/dropbear/dropbear.mk and those options are
 > explicitly disabled if DROPBEAR_DISABLE_LEGACY_CRYPTO is set. From a

You mean NOT set (ifndef).

 > quick glance I would say now there's no possibility to activate those
 > anymore.

Indeed. Presumably we need to handle the case where the option is set to
ensure you end up with the configuration as described in the help text:

          Enable legacy and possibly insecure algorithms:
            3DES encryption
            SHA1-96 message integrity
            CBC encryption mode
            DSA public keys
            Diffie-Hellman Group1 key exchange

-- 
Bye, Peter Korsgaard
