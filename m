From: Magnus Armholt <magnus.armholt@wapice.com>
Date: Thu, 15 Oct 2020 07:49:30 +0000
Subject: [Buildroot] pkg-stats support for external tree?
In-Reply-To: <20201015085753.33f3b15e@windsurf>
References: <HE1PR03MB298830C6E778223631A2A08AF0020@HE1PR03MB2988.eurprd03.prod.outlook.com>,
 <20201015085753.33f3b15e@windsurf>
Message-ID: <HE1PR03MB29888EA331AFE5BEE506CD53F0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

The cve-checker sounds exactly what we are looking for.
We are still using the 2020.02.x release, so I havent notice it.
I need to check it out.

Actually, i was about to submit a patch for the pkg-stats which adds the functionality to parse the package list from the manifest file, but now there is no need to do that =)

The CVE listing in the pkg-stats output  is a very (if not the most) important feature.
The pkg-stats is also very useful as a reminder to update the packages (current version vs latest version).
This is the main reason why I was asking about the support for external tree, so we get a CI reminder to update our project specific packages when new versions are available.

Thanks for the input

BR,
Magnus
________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Thursday, October 15, 2020 09:57
To: Magnus Armholt <magnus.armholt@wapice.com>
Cc: buildroot at busybox.net <buildroot@busybox.net>
Subject: Re: [Buildroot] pkg-stats support for external tree?

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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201015/21866668/attachment.html>
