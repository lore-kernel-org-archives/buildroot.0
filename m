From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 23:12:27 +0200
Subject: [Buildroot] [PATCHv2] ebtables: new package
In-Reply-To: <4b82d4fbde55720d5d6e0a34b51e4b1b3f80e48d.1310394628.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 11 Jul 2011 17:33:31 +0300")
References: <4b82d4fbde55720d5d6e0a34b51e4b1b3f80e48d.1310394628.git.baruch@tkos.co.il>
Message-ID: <87mxgkjzd0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Baruch> ---

 Baruch> Changes in v2:
 Baruch> 	* Update to version 2.0.10-1
 Baruch> 	* Use target file name in $(INSTALL)
 Baruch> 	* Add uninstall

It needs ipv6 support in toolchain:

useful_functions.c: In function 'ebt_parse_ip6_address':
useful_functions.c:394: error: 'in6addr_any' undeclared (first use in this function)
useful_functions.c:394: error: (Each undeclared identifier is reported only once
useful_functions.c:394: error: for each function it appears in.)

I've added the dependency myself. Committed, thanks.

-- 
Bye, Peter Korsgaard
