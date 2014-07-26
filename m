From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 08:59:36 +0200
Subject: [Buildroot] tzdata when using a custom seleton
In-Reply-To: <CANxTyt6Kew54xGwwRxQnHaeZ-CH4-SbKoMgkwSMKytRX9Z-mmA@mail.gmail.com>
References: <CANxTyt6Kew54xGwwRxQnHaeZ-CH4-SbKoMgkwSMKytRX9Z-mmA@mail.gmail.com>
Message-ID: <20140726085936.1e16d537@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Fri, 25 Jul 2014 18:34:10 -0400, Danomi Manchego wrote:

> I think that this comes from commit
> d6a37917dde1293f6e25d87801283e098c22d580, "system: make the zoneinfo
> list a system option", when the timezone list moved from
> tzdata/Config.in to system/Config.in, changing names along the way.
> 
> Is it intentional that configurations using custom skeletons can no
> longer install time zone files?  Or is it just a side effect of where
> the moved settings are in system/Config.in?

I believe this is just an unwanted side-effect. Some of the options in
system/Config.in don't really make much sense when using a custom
skeleton (such as customizing the root password, the getty port, etc.).
However, the timezone installation/configuration certainly makes sense.

Yann ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
