From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:38:22 +0100
Subject: [Buildroot] [PATCH v4 next 1/5] support/download: silence git
 if it is a silent build
In-Reply-To: <20141126213534.GA4260@free.fr>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
 <1416837422-1977-2-git-send-email-fabio.porcedda@gmail.com>
 <20141126213534.GA4260@free.fr>
Message-ID: <20141126223822.6083acac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 26 Nov 2014 22:35:34 +0100, Yann E. MORIN wrote:

> I am not a big fan of this.
> 
> I would prefer we pass the quiet flag through the environment, something
> like this, for example:

On my side, I'm not a big fan of the environment, I find it a too
hidden way to pass things. However, I find it a bit clunky to have this
as a fifth optional argument. The solution I would find the cleanest
would be to use real arguments for the download helper scripts, using
getopt.

Like:

	git -o <output> -r <repo> -c <cset> -b <basename> [-q]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
