From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 08:53:18 +0200
Subject: [Buildroot] [PATCH 3/3] qt5webkit: select leveldb package
In-Reply-To: <01e51af4-335b-7b8b-7c03-c8c00960eb20@mind.be>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
 <20180831202204.28093-4-gael.portay@savoirfairelinux.com>
 <01e51af4-335b-7b8b-7c03-c8c00960eb20@mind.be>
Message-ID: <20180905085318.4ae7a818@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Sep 2018 23:10:46 +0200, Arnout Vandecappelle wrote:
> On 31/08/2018 22:22, Ga?l PORTAY wrote:
> > +	depends on BR2_INSTALL_LIBSTDCPP # leveldb  
> 
>  I don't think we need to propagate this particular dependency - qt5webkit
> already depends on libstdcpp indirectly through Qt5.

I think we need at some point to define a real policy for this. When a
dependency is redundant, should we:

 (1) Avoid duplicating it, to simplify things, but with the risk that
     if we remove the dependency at a higher-level, we forget to re-add
     back to the sub-options.

 (2) Always duplicate them, even if they are useless right now, so
     that we don't forget them in the future if the higher-level option
     drops this dependency. Drawback of this solution is that such
     dependencies don't get "exercised" by autobuilder testing so they
     are often wrong.

I don't have a strong opinion, but we're doing (1) or (2) depending on
the package developer and/or situation, and this isn't really nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
