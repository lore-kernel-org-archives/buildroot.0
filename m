From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 22:33:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/nettle: security bump to
 version 3.7.2
In-Reply-To: <20210418185114.3306357-1-fontaine.fabrice@gmail.com>
References: <20210418185114.3306357-1-fontaine.fabrice@gmail.com>
Message-ID: <20210420223308.766bea5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Apr 2021 20:51:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2021-20305: A flaw was found in Nettle in versions before 3.7.2,
> where several Nettle signature verification functions (GOST DSA, EDDSA &
> ECDSA) result in the Elliptic Curve Cryptography point (ECC) multiply
> function being called with out-of-range scalers, possibly resulting in
> incorrect results. This flaw allows an attacker to force an invalid
> signature, causing an assertion failure or possible validation. The
> highest threat to this vulnerability is to confidentiality, integrity,
> as well as system availability.
> 
> https://git.lysator.liu.se/nettle/nettle/-/blob/nettle_3.7.2_release_20210321/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nettle/nettle.hash | 4 ++--
>  package/nettle/nettle.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
