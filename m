From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:16:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 4.11
In-Reply-To: <20200506201541.347759-1-fontaine.fabrice@gmail.com>
References: <20200506201541.347759-1-fontaine.fabrice@gmail.com>
Message-ID: <20200507231613.3baa0444@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 May 2020 22:15:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-11945: An issue was discovered in Squid before 5.0.2. A
> remote attacker can replay a sniffed Digest Authentication nonce to gain
> access to resources that are otherwise forbidden. This occurs because
> the attacker can overflow the nonce reference counter (a short integer).
> Remote code execution may occur if the pooled token credentials are
> freed (instead of replayed as valid credentials).
> 
> http://www.squid-cache.org/Advisories/SQUID-2020_4.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/squid/squid.hash | 8 ++++----
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
