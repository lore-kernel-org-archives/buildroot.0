From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 12:50:26 +0100
Subject: [Buildroot] [PATCH] scanpypi: get license names from SPDX
 database
In-Reply-To: <20171114105856.2077-1-yegorslists@googlemail.com>
References: <20171114105856.2077-1-yegorslists@googlemail.com>
Message-ID: <20180101125026.0c7d7722@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 11:58:56 +0100, yegorslists at googlemail.com wrote:

> +try:
> +    import spdx_lookup as liclookup
> +except ImportError:
> +    # spdx_lookup is not installed
> +    liclookup = None
> +

I understand the idea, but I find it a bit weird to have the script
behave differently depending on whether we have the SDPX Python package
installed or not. Indeed, it may return different license results.

Should we at the very least display a warning when the SDPX package is
not there? Or should we have an option to explicitly select if the SDPX
package should be used or not?

I don't have a strong opinion on this, so if you (and others) believe
that your proposal is good enough, then I'm fine with it.

>          filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
> -		     'COPYING', 'COPYING.TXT']
> +                     'COPYING', 'COPYING.TXT']

This is a spurious and not really related change :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
