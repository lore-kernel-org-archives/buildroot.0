From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 09:52:37 +0100
Subject: [Buildroot] [PATCH] ethtool: Allow enabling/disabling pretty
 printing
In-Reply-To: <20171106012906.22000-1-f.fainelli@gmail.com> (Florian Fainelli's
 message of "Sun, 5 Nov 2017 17:29:06 -0800")
References: <20171106012906.22000-1-f.fainelli@gmail.com>
Message-ID: <87zi7zyeju.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

 > Ethtool has a configure script option allowing the enabling or disabling of
 > pretty printing for drivers, SFP modules etc which can save a significant
 > amount of bytes on the root filesystem. Allow selecting that, and turn it on by
 > default (like ethtool's configure script).

 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 > ---
 >  package/ethtool/Config.in  | 10 ++++++++++
 >  package/ethtool/ethtool.mk |  2 ++
 >  2 files changed, 12 insertions(+)

 > diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
 > index 09704979e864..77795a838971 100644
 > --- a/package/ethtool/Config.in
 > +++ b/package/ethtool/Config.in
 > @@ -5,3 +5,13 @@ config BR2_PACKAGE_ETHTOOL
 >  	  ethernet-based network interface.
 
 >  	  https://www.kernel.org/pub/software/network/ethtool/
 > +
 > +if BR2_PACKAGE_ETHTOOL
 > +
 > +	config BR2_PACKAGE_ETHTOOL_PRETTY_PRINT
 > +		bool "enable pretty printing"
 > +		default y
 > +		help
 > +		  Enables ethtool's pretty printing for drivers
 > +		  and SFP modules.
 > +endif

We don't indent sub options in Config.in, and normally don't do the if
BR2_PACKAGE_FOO ... endif unless there are several sub options - so I've
fixed that and committed, thanks.

Consider running utils/check-package on your patches before sending as
it would have complained about this.

-- 
Bye, Peter Korsgaard
