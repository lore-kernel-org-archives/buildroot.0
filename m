From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 May 2011 17:33:08 +0200
Subject: [Buildroot] [PATCH 02/10] dhcpdump: move as a proper package,
	bump version
In-Reply-To: <5397d444fc4c7aacb229d2c103171c9a8ad97e61.1305713253.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 18 May 2011 12:08:20 +0200")
References: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
	<cover.1305713253.git.thomas.petazzoni@free-electrons.com>
	<5397d444fc4c7aacb229d2c103171c9a8ad97e61.1305713253.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739kcvxaj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> dhcpdump 1.7 required tcpdump, but version 1.8 now uses libpcap
 Thomas> instead. Also version 1.8 is no longer autotools based, but just a
 Thomas> simple Makefile.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                                  |    1 +
 Thomas>  package/dhcpdump/Config.in                         |    5 ++
 Thomas>  .../dhcpdump-1.8-use-non-bsd-structures.patch      |   21 +++++++
 Thomas>  package/dhcpdump/dhcpdump.mk                       |   21 +++++++
 Thomas>  package/tcpdump/Config.in                          |    6 --
 Thomas>  package/tcpdump/dhcpdump.mk                        |   62 --------------------

 Thomas> diff --git a/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch b/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..15a3508
 Thomas> --- /dev/null
 Thomas> +++ b/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
 Thomas> @@ -0,0 +1,21 @@
 Thomas> +The udphdr structure has uh_* fields when _FAVOR_BSD is
 Thomas> +defined. Otherwise, the fields are just named source, dest, len and
 Thomas> +check. See <netinet/udp.h>.
 Thomas> +

Where does this patch come from?

-- 
Bye, Peter Korsgaard
