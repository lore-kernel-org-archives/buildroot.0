From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2011 15:07:04 +0200
Subject: [Buildroot] [PATCH v2] New package: parted
In-Reply-To: <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
References: <4E9FC67B.7030109@visionsystems.de>
 <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
Message-ID: <20111020150704.29bc1398@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 20 Oct 2011 14:49:26 +0200,
"Dechesne, Nicolas" <n-dechesne@ti.com> a ?crit :

> > +$(eval $(call AUTOTARGETS))
> 
> why this instead of
> 
> $(eval $(call AUTOTARGETS,package,parted))

In the new Git version, it is sufficient to write:

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
$(eval $(call GENTARGETS))
$(eval $(call GENTARGETS,host))

And the package infrastructure will figure out automatically the
package name and the package directory.

Next week, I'll be in Prague, where I will physically meet Peter. And I
intend to use this opportunity to use whatever method happens to be
necessary to have him merge the asciidoc documentation patches so that
we can work on improving the documentation! :-))

Or maybe I should start a fund-raising campaign from Buildroot
contributors to buy enough beers to Peter so that he gets drunk enough
to blindly merge all our patches. Who's contributing ? :-)

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
