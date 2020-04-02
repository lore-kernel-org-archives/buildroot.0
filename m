From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 20:56:29 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain/Config.in: move
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
In-Reply-To: <20200330182250.1515995-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 30 Mar 2020 20:22:48 +0200")
References: <20200330182250.1515995-1-bernd.kuhls@t-online.de>
Message-ID: <87blo9af8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Config option was placed at the wrong position.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

 > ---
 >  toolchain/Config.in | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/toolchain/Config.in b/toolchain/Config.in
 > index 24bb982e9b..a34436d16b 100644
 > --- a/toolchain/Config.in
 > +++ b/toolchain/Config.in
 > @@ -468,6 +468,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 >  config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 >  	bool
 >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 > +
 > +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 > +	bool
 > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 >  	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 >  # This should be selected by the latest version, above, to indicate that
 > @@ -477,10 +481,6 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 >  config BR2_TOOLCHAIN_HEADERS_LATEST
 >  	bool
 
 > -config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 > -	bool
 > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 > -
 >  # This order guarantees that the highest version is set, as kconfig
 >  # stops affecting a value on the first matching default.
 >  config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 > -- 
 > 2.25.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
