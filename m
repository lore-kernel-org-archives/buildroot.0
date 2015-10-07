From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 08 Oct 2015 00:04:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Add node.js v4.1.2
In-Reply-To: <87612jnl7c.fsf@dell.be.48ers.dk>
References: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
 <87612jnl7c.fsf@dell.be.48ers.dk>
Message-ID: <1444255455.5183.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mi, 2015-10-07 at 10:20 +0200, Peter Korsgaard wrote:
> > > > > > "Jaap" == Jaap Crezee <jaap@jcz.nl> writes:
> 
>  > Signed-off-by: Jaap Crezee <jaap@jcz.nl>
>  > ---
>  >  ...01-Remove-dependency-on-Python-bz2-module.patch | 31
> ++++++++++++++++++++++
>  >  package/nodejs/Config.in                           |  5 ++++
>  >  package/nodejs/nodejs.hash                         |  3 +++
>  >  3 files changed, 39 insertions(+)
>  >  create mode 100644 package/nodejs/4.1.2/0001-Remove-dependency-on
> -Python-bz2-module.patch
> 
>  > +++ b/package/nodejs/Config.in
>  > @@ -40,12 +40,17 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
>  >  	bool "v0.12.7"
>  >  	depends on !BR2_ARM_CPU_ARMV5
>  
>  > +config BR2_BR2_PACKAGE_NODEJS_4_1_X
>  > +	bool "v4.1.2"
>  > +	depends on !BR2_ARM_CPU_ARMV5
>  > +
>  >  endchoice
>  
>  >  config BR2_PACKAGE_NODEJS_VERSION_STRING
>  >  	string
>  >  	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
>  >  	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
>  > +	default "4.1.2"     if BR2_BR2_PACKAGE_NODEJS_4_1_X
> 
> Is there a need to keep both 0.12.x and 4.1.x? The only reason we
> have a
> version selection is afaik that <ARMv7 is only supported in the old
> 0.10.x version.
> 

Yes, there is! Node.js applications written for Node.js 0.12.x are not
necessarily compatible with Node.js 4.x.

Best regards
J?rg Krause
