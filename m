From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:14:51 +0100
Subject: [Buildroot] [PATCH 04/21 RFC] core/legal-info: allow ignoring
 packages from the legal-info
In-Reply-To: <20151117192802.GA3703@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <5d993adab02ed57f67d14652247fbd31aaae87bc.1447713615.git.yann.morin.1998@free.fr>
 <20151117122226.0cbd8042@free-electrons.com>
 <564B655C.5060105@lucaceresoli.net> <20151117192802.GA3703@free.fr>
Message-ID: <20151117211451.7ad6f80f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, 17 Nov 2015 20:28:02 +0100, Yann E. MORIN wrote:

> Well, I don't really care whether we call it IGNORE or NOTHING or
> whatever makes more sense. I'm also fine with deprecating YES and NO
> to replace them with more meaningful values.
> 
> What I care about is having the ability to mark a package for the
> following conditions:
> 
>   - redistribute "source" archive, list in the manifest and save
>     licensing files,
> 
>   - list in the manifest and save licensing files,
> 
>   - completely omit the package from legal-info.

Right, understood.

> As Luca explained, there are packages for which we should not
> redistribute the "source" archive, but which we must list in the
> manifest. Luca talked about imx-vpu, I was thinking about
> nvidia-driver.

Seen the examples, it is more convincing now.

> The new possibility that I would want is to completely ignore the
> package from the legal-info output, as there might be legal reasons that
> the mere existence of that package should not be disclosed.

So, I understand the need. Now, I am wondering whether we should have
one single variable with "special" values as Luca/you suggest, or two
clearly separated boolean variables that control each aspects
(distribute the source, include in legal-info). Example:

<pkg>_GENERATE_LEGAL_INFO = YES/NO
<pkg>_REDISTRIBUTE_SOURCE = YES/NO

Of course, if <pkg>_GENERATE_LEGAL_INFO = NO, <pkg>_REDISTRIBUTE_SOURCE
is ignored.

This is just a proposal, I'm totally open to better names for the
variables.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
