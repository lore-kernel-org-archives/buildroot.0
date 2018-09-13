From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 17:36:06 +0200
Subject: [Buildroot] [PATCH 1/3] ti-sgx-libgbm: new package
In-Reply-To: <f2kc1fxkra.ln2@ID-313208.user.individual.net>
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
 <f2kc1fxkra.ln2@ID-313208.user.individual.net>
Message-ID: <20180913173606.41ff9873@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Mon, 09 Jul 2018 19:53:51 +0200, Bernd Kuhls wrote:

> Back then Thomas wrote:
> "Is this libgbm a TI-specific implementation of the libgm available in
>  Mesa ? If that's the case, then it's going to be complicated to
>  package, as we would have two implementations of the same API."
> 
> Working on the next bump of Kodi to v18 I needed to build mesa3d with 
> libgbm only, no x11, no wayland. To do so I created a virtual package for 
> libgbm which could be used by your package as well to solve the problem 
> Thomas noted:

Did you made some progress with this libgbm work? We can't merge
ti-sgx-libgbm without this, otherwise we would have two packages
installing the same conflicting library.

So perhaps it would be nice to have a simple patch series adding a
libgbm virtual package, and adding mesa3d as a provider for it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
