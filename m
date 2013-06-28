From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jun 2013 11:50:54 +0200
Subject: [Buildroot] qt5: No SOURCES in qmake created Makefiles
In-Reply-To: <51CC44C0.8020509@andin.de>
References: <51BF198C.2040405@andin.de> <20130617162213.1fdc7d97@skate>
 <CALo-6+jQ-qjc9HfFwTSUh1x6JQnTtH1XUOo0oX8f4nApVH=L7w@mail.gmail.com>
 <51C07EB6.4080003@andin.de> <20130618190656.228e7658@skate>
 <51CC44C0.8020509@andin.de>
Message-ID: <20130628115054.745027af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Thu, 27 Jun 2013 15:57:20 +0200, Andreas Naumann wrote:

> am a little sorry for the fuzz. This worked out to be a non-issue. Seems 
> when using examples from another qt tree, even though absolutely clean 
> within the directory, still build options from the folders above get 
> picked up.
> When I copied it away, in my case to /tmp/analogclock/, compiling with 
> buildroots qmake from 5.0.2 works just fine.

I do reproduce your problem now: when building an example from within
the Qt source tree, it fails with "Nothing to do for target first",
when copying the source code of the example outside of Qt source tree,
the building goes on nicely.

We still should fix this, examples are supposed to build from within
the Qt source tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
