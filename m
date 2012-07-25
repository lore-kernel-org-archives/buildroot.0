From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:32:45 +0200
Subject: [Buildroot] [PATCH 07/11] ext-tool.mk: add fancy messages
In-Reply-To: <50101DF5.2030902@mind.be>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-8-git-send-email-s.martin49@gmail.com>
 <20120722162641.6bd3eeef@skate> <50101DF5.2030902@mind.be>
Message-ID: <20120725183245.464be66d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 18:25:25 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > And maybe the MESSAGE definition would have to be somewhere outside of
> > pkg-utils.mk since it's not package related anymore.
> 
>   In fact everything in pkg-* is not strictly package-related anymore, since
> it's also used by bootloaders and kernel, and download helpers are also used
> by the external toolchains.  So if we start moving stuff around, probably
> everything should just go into e.g. support/make/

Well, even though boot/ and linux/ are outside package/, they still use
the normal package infrastructures, so I am not terribly shocked to see
those things being called pkg-* in package/. However, I agree that the
download helpers now have a more wisdespread usage.

The thing with support/make/ is that it seems to me a little bit hidden
behind the scenes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
