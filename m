From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Wed, 26 Feb 2020 13:30:41 +0000
Subject: [Buildroot] external, how to achieve our needs?
In-Reply-To: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
References: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
Message-ID: <VI1PR02MB3920D1C482E67913A582C1D1DCEA0@VI1PR02MB3920.eurprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

I also have this kind of problems when implementing our external, 
sometimes is useful to 'override' or append to a recipe (Yocto style).

* I ended up "duplicating" recipes in our layer, e.g. bd-tcpdump in order 
to build the package differently 
* Where it was possible, I manipulated the original package variables, 
from a .mk file in the external layer: e.g modify the *_CONF_OPTS or 
*_CONF_ENV for some package

I'm also not that pleased with this 'unofficial' solution.

BR
Mircea
