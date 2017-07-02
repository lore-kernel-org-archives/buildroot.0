From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:51:51 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.1-P2
In-Reply-To: <20170702150148.22879-1-peter@korsgaard.com>
References: <20170702150148.22879-1-peter@korsgaard.com>
Message-ID: <20170702235151.45147ef2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Jul 2017 17:01:48 +0200, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2017-3142: An error in TSIG authentication can permit unauthorized zone
> transfers
> 
> An attacker who is able to send and receive messages to an authoritative DNS
> server and who has knowledge of a valid TSIG key name may be able to
> circumvent TSIG authentication of AXFR requests via a carefully constructed
> request packet. A server that relies solely on TSIG keys for protection with
> no other ACL protection could be manipulated into:
> 
> * providing an AXFR of a zone to an unauthorized recipient
> * accepting bogus NOTIFY packets
> 
> https://kb.isc.org/article/AA-01504/74/CVE-2017-3142
> 
> CVE-2017-3041: An error in TSIG authentication can permit unauthorized dynamic
> updates
> 
> An attacker who is able to send and receive messages to an authoritative DNS
> server and who has knowledge of a valid TSIG key name for the zone and service
> being targeted may be able to manipulate BIND into accepting an unauthorized
> dynamic update.
> 
> https://kb.isc.org/article/AA-01503/74/CVE-2017-3143
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
