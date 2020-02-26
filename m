From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:14:21 +0100
Subject: [Buildroot] external, how to achieve our needs?
In-Reply-To: <20200226132916.5umjrlej5to4shtl@M43218.corp.atmel.com> (Ludovic
 Desroches's message of "Wed, 26 Feb 2020 14:29:16 +0100")
References: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
 <VI1PR02MB3920FE7EF8D9CDDC656EAB49DCEA0@VI1PR02MB3920.eurprd02.prod.outlook.com>
 <20200226132916.5umjrlej5to4shtl@M43218.corp.atmel.com>
Message-ID: <875zft8joy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@microchip.com> writes:

 > Hi Mircea,
 > On Wed, Feb 26, 2020 at 12:11:36PM +0000, Mircea GLIGA wrote:
 >> Hi Ludovic,
 >> 
 >> I also have this kind of problems when implementing our external,
 >> sometimes is useful to 'override' or append to a recipe (Yocto
 >> style).
 >> 
 >> * I ended up "duplicating" recipes in our layer, e.g. bd-tcpdump
 >> in order to build the package differently

 > From the top of my head, I tried this and I got an error when duplicating
 > the recipes in the external. Did you use other tricks?

Buildrot uses a global namespace, so you have to rename the package (and
the makefile/kconfig symbols) for it to work.

It naturally only works for packages without any reverse dependencies as
those packages doesn't know about your custom 'foo' package.

-- 
Bye, Peter Korsgaard
