From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:44:31 +0200
Subject: [Buildroot] [PATCH] strongswan: add upstream security patches
In-Reply-To: <20170530130324.28875-1-peter@korsgaard.com>
References: <20170530130324.28875-1-peter@korsgaard.com>
Message-ID: <20170530234431.27357464@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 15:03:24 +0200, Peter Korsgaard wrote:
> Fixes:
> 
> CVE-2017-9022 - RSA public keys passed to the gmp plugin aren't
> validated sufficiently before attempting signature verification, so that
> invalid input might lead to a floating point exception and crash of the
> process.  A certificate with an appropriately prepared public key sent by a
> peer could be used for a denial-of-service attack.
> 
> https://www.strongswan.org/blog/2017/05/30/strongswan-vulnerability-%28cve-2017-9022%29.html
> 
> CVE-2017-9023 - ASN.1 CHOICE types are not correctly handled by the ASN.1
> parser when parsing X.509 certificates with extensions that use such types.
> This could lead to infinite looping of the thread parsing a specifically
> crafted certificate.
> 
> https://www.strongswan.org/blog/2017/05/30/strongswan-vulnerability-%28cve-2017-9023%29.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/strongswan/strongswan.hash | 3 +++
>  package/strongswan/strongswan.mk   | 3 +++
>  2 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
