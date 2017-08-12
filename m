From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 12 Aug 2017 11:46:51 -0400
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <8c8fd01f-12eb-f91f-2316-294286a2f5aa@mind.be>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner>
 <20170811223048.0c445573@windsurf>
 <20170812094839.70a0c4b1@tux.kirchner>
 <20170812095737.58da25f5@windsurf>
 <20170812150813.ondf3yfcsjcg5443@gportay>
 <8c8fd01f-12eb-f91f-2316-294286a2f5aa@mind.be>
Message-ID: <20170812154651.riivua2uz4gfsybf@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 12, 2017 at 05:12:37PM +0200, Arnout Vandecappelle wrote:
> 
> On 12-08-17 17:08, Ga?l PORTAY wrote:
> [snip]
> > BTW, it seems this bug is quite new in Qt; it appeared since QtWebengine 5.9 [2]
> > and [3].
> > 
> > I will check if it requirement to build Qt WebEngine.
> 
>  Since adding Qt WebEngine to Buildroot is long overdue, I propose to apply it
> with the BR2_HOSTARCH_NEEDS_IA32_COMPILER work-around and resolve this issue later.
> 

After a quick look to QtWE requirements, there is no mention about this.

It seems that host-bison, host-flex and host-pkgconf are missing dependencies.
I will add them in v7.

Concerning dbus and fontconfig packages. They are selected through qt5base
configs (BR2_PACKAGE_QT5BASE_FONTCONFIG and BR2_PACKAGE_QT5BASE_DBUS).

Do they also be a part of QT5WEBENGINE_DEPENDENCIES? or adding qt5base is safe.

Regards,
Gael
