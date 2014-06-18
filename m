From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 14:00:49 +0200
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.4.0
In-Reply-To: <1403042866-31998-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 17 Jun 2014 19:07:46 -0300")
References: <1403042866-31998-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvj25swe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Now with support for static builds.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

 > ---
 >  package/dhcpcd/Config.in | 9 +--------
 >  package/dhcpcd/dhcpcd.mk | 7 ++++++-
 >  2 files changed, 7 insertions(+), 9 deletions(-)

 > diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
 > index 68eac1c..79063ef 100644
 > --- a/package/dhcpcd/Config.in
 > +++ b/package/dhcpcd/Config.in
 > @@ -1,15 +1,8 @@
 >  config BR2_PACKAGE_DHCPCD
 >  	bool "dhcpcd"
 >  	# No support for AI_ADDRCONFIG
 > -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 > -		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 > -	depends on !BR2_PREFER_STATIC_LIB
 > +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2

Seems we have a bunch of the 2012R1 symbol still lingering around under
package/ - Will fix.

-- 
Bye, Peter Korsgaard
