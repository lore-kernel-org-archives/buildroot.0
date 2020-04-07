From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 21:20:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: add nistbeacon option
In-Reply-To: <20200404213653.1538752-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 4 Apr 2020 23:36:53 +0200")
References: <20200404213653.1538752-1-fontaine.fabrice@gmail.com>
Message-ID: <87d08jm7bw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add an option to enable nistbeacon which is available since version 6.1
 > and
 > https://github.com/nhorman/rng-tools/commit/aefe862e187a1ef608f9826b2b4a5bbabd5e9945

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/rng-tools/Config.in    | 17 +++++++++++++++++
 >  package/rng-tools/rng-tools.mk | 11 ++++++++---
 >  2 files changed, 25 insertions(+), 3 deletions(-)

 > diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
 > index a86fbb0f74..25b41f40d6 100644
 > --- a/package/rng-tools/Config.in
 > +++ b/package/rng-tools/Config.in
 > @@ -11,5 +11,22 @@ config BR2_PACKAGE_RNG_TOOLS
 
 >  	  http://sourceforge.net/projects/gkernel/
 
 > +if BR2_PACKAGE_RNG_TOOLS
 > +
 > +config BR2_PACKAGE_RNG_TOOLS_NISTBEACON
 > +	bool "NIST Entropy Beacon support"
 > +	select BR2_PACKAGE_JANSSON
 > +	select BR2_PACKAGE_LIBCURL
 > +	select BR2_PACKAGE_LIBXML2
 > +	help
 > +	  Enable NIST Entropy Beacon support.
 > +
 > +	  Entropy gathered from the NIST network entropy beacon. Note
 > +	  that this entropy source is disabled by default as it should
 > +	  never be used for cryptographic purposes, or any use case in
 > +	  which random data should be known only by a single entity.

Out of interest, what is the use case for this option?

-- 
Bye, Peter Korsgaard
