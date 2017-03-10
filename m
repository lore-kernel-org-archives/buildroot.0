From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:54:34 +0100
Subject: [Buildroot] [PATCH] shairport-sync: bump to version 3.0
In-Reply-To: <20170310222245.2494cd18@free-electrons.com>
References: <20170310204105.29179-1-joerg.krause@embedded.rocks>
 <20170310222245.2494cd18@free-electrons.com>
Message-ID: <20170310225434.45202999@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 22:22:45 +0100, Thomas Petazzoni wrote:

> On Fri, 10 Mar 2017 21:41:05 +0100, J?rg Krause wrote:
> > Support for PolarSSL is deprecated and the usage of mbedTLS is
> > recommended, if not OpenSSL is used as crypto backend.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  package/shairport-sync/Config.in           | 2 +-
> >  package/shairport-sync/shairport-sync.hash | 2 +-
> >  package/shairport-sync/shairport-sync.mk   | 6 +++---
> >  3 files changed, 5 insertions(+), 5 deletions(-)  
> 
> Applied to master, thanks.

And I've reverted because it causes a Config.in circular dependency:

package/openssl/Config.in:1:error: recursive dependency detected!
package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_MBEDTLS
package/mbedtls/Config.in:1:	symbol BR2_PACKAGE_MBEDTLS is selected by BR2_PACKAGE_OPENSSL

Try out yourself: no such warning right before your patch at commit
cd8e5b819ff31c96dbc7ad94c28a5ad2eb838631. And at commit
7670dcc43e3b023b9bd613fa464533ecde7aca70, right after your patch is
applied, we have this Config.in warning.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
