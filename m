From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 08:57:53 +0200
Subject: [Buildroot] pkg-stats support for external tree?
In-Reply-To: <HE1PR03MB298830C6E778223631A2A08AF0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
References: <HE1PR03MB298830C6E778223631A2A08AF0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
Message-ID: <20201015085753.33f3b15e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Magnus,

On Thu, 15 Oct 2020 04:31:11 +0000
Magnus Armholt <magnus.armholt@wapice.com> wrote:

> We are using a setup with an external tree holding our specific packages (br2_external).
> The renewed pkg-stats is a nice tool and we would like to cover also our specific packages in br2_external.
> Is this possible?
> 
> I tried running the pkg-stats from our base directory (parent of
> buildroot) but this fails due to how the utils/getdeveloperlib is
> included.

Indeed, there is no support for BR2_EXTERNAL in pkg-stats. In fact,
pkg-stats is more a tool for the Buildroot community to keep an eye on
all packages that are in the official Buildroot.

A Buildroot user (or a company using Buildroot) would I guess be more
interested in pkg-stats-like results, but limited to their package
selection.

Recently, we've added support/scripts/cve-checker which output a HTML
page looking like the pkg-stats output, but with just your package +
the CVEs that affect them (if any). However, it does not output all the
same information as pkg-stats.

Which specific information of pkg-stats do you find useful ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
