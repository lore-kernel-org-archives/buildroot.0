From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Oct 2012 17:06:29 +0200
Subject: [Buildroot] [PATCH v2] wireshark: new package
In-Reply-To: <20121024144837.GA25255@sapphire.tkos.co.il>
References: <4b73cf9536d6cde485299c9afb9fc41affa909ae.1351087817.git.baruch@tkos.co.il>
 <20121024164059.10666049@skate>
 <20121024144837.GA25255@sapphire.tkos.co.il>
Message-ID: <20121024170629.40348273@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 24 Oct 2012 16:48:37 +0200, Baruch Siach wrote:

> Well, the ultimate solution would probably be to add a --disable-usr configure 
> option, like the existing --disable-usr-local. I see if I can find time to 
> work on this. I'm no autotools expert.

This really shouldn't be needed. No autotools-based package that I'm
aware of needs this. If the default include flags are not good, you
pass additional CFLAGS/CPPFLAGS, that's the way autoconf works.

So basically, the whole idea of adding /usr/include forcefully is
stupid and should be removed, IMO.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
