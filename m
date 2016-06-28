From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 08:14:39 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <CAFSsvmq4=Rjj=E8Bbvfj4AThYW7iG0fhSxcyAU4umpqO-4p8GA@mail.gmail.com>
 (Adam Duskett's message of "Mon, 27 Jun 2016 21:51:52 -0400")
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <CAFSsvmq4=Rjj=E8Bbvfj4AThYW7iG0fhSxcyAU4umpqO-4p8GA@mail.gmail.com>
Message-ID: <87por1q1ps.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

Hi,

 >> If your concern is to be able to use a local source during development,
 >> we have the override-srcdir mechanism just for that. See in the
 >> menuconfig, in the "Build options" sub-menu:
 >> 
 >> ($(CONFIG_DIR)/local.mk) location of a package override file
 >> 
 > Interesting!  However I was not aware of this feature and I would suspect
 > most users won't know about it because it's not in menuconfig.  For local
 > development why would this be a bad thing?

I agree that it isn't an obvious feature and that it is easy to miss. As
Yann said, systems like Buildroot are really about reproducability, so
referring to something local on the developers machine doesn't match
very well.


 >> With those, Buildroot will conclude that it should download the affected
 >> package, and just use the sources it finds in the specified directory.
 >> Note that Buildroot will not apply any patches in this case; you are
 >> responsbile for propagating whatever patch you need. Buildroot jsut use
 >> the sources as-is.
 >> 
 > Again, while this is good; I believe it isn't advertised well in the
 > documentation. I had to go hunt it.  Perhaps a revision to the online
 > documentation to inform users of this feature other than putting it in the
 > "using buildroot for development" section?  Perhaps just a subsection in
 > that section?

Yes, can you please send a patch? It is always very nice if "new" people
can help us improve the documentation. Once you have used Buildroot for
years it becomes hard to know what is missing from the documentation. 

Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
