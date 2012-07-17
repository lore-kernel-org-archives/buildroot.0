From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 10:11:46 +0200
Subject: [Buildroot] [PATCH] luajit: new package
In-Reply-To: <CAB0FRsv1Xq-rDK++oQJXOC-EUuh2b4_y-b=AbSTUsrSFx8wNQw@mail.gmail.com>
References: <20120715004755.4cc159e9@skate>
 <1342306252-19152-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAB0FRsv-bQnLUZvq_8xm4CkQsbxF3z6quUW5jwGhhbr0KK6nZQ@mail.gmail.com>
 <20120715200056.390b3d03@skate>
 <CAB0FRsv1Xq-rDK++oQJXOC-EUuh2b4_y-b=AbSTUsrSFx8wNQw@mail.gmail.com>
Message-ID: <20120717101146.596352c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 10:07:21 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> > No, using TARGET_CROSS directly doesn't work when ccache is enabled.
> > ccache is only used in TARGET_CC and TARGET_CXX, that's why I've done
> > this this way.
> >
> > Can you look at the bitness problem?
> 
> see http://www.freelists.org/post/luajit/crosscompiling-with-different-bitness

Ok, the reply is:
http://www.freelists.org/post/luajit/crosscompiling-with-different-bitness,1

Essentially the first sentence shows that Mike Pall has not seen that
we were talking about cross-compilation. It's not because you're
running under a x86 kernel that you cannot generate binaries for x86-64.

The second sentence shows that the cross-compilation support in luajit
is not really nice.

So the only solution that I see is to integrate the proposal of
Jean-Christophe Plagnol-Villard that allows to have a kconfig option
defining the host architecture, and then do some depends on magic to
only show the package when we have the right architecture combination.
Can you look into this?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
