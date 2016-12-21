From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Date: Wed, 21 Dec 2016 17:12:23 +0100
Subject: [Buildroot] mtd-utils 2.0.0-rc2
In-Reply-To: <1481887885.31185.8.camel@embedded.rocks>
References: <c7590022-cf5a-f785-6a39-1a76a3054bda@sigma-star.at>
 <1481887885.31185.8.camel@embedded.rocks>
Message-ID: <f1c18477-c75b-7a5a-42f9-0ab930c37663@sigma-star.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

thanks for the feedback and thanks for testing!

On 12/16/2016 12:31 PM, J?rg Krause wrote:
> 1/ zlib is only required by mkfs.jffs2 and mkfs.ubifs
I looked into that and patched the configure script to allow disabling
those and not require their respective dependencies. The patch has been
sent to the linux-mtd mailing list a few minutes ago.

> 2/ Buildroot offers the possibility to install the "integck" tool on
> the target. This is not covered by mtd, yet.
By default, the integck tool, as well as  the other test binaries are
built along with the other programs, unless explicitly disabled.

If required, the tests can be installed by setting the configure
option --enable-install-tests.

However, as far as I can tell, the buildroot mtd package allows
micromanaging what binaries to install. If automake does not
generate individual install targets per executable, some
workaround will be required anyway.


Regards,

David
