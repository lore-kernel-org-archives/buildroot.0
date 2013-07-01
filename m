From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Jul 2013 12:03:17 +0200
Subject: [Buildroot] Sample configurations / test suite ?
In-Reply-To: <20130701091925.6c67a6c7@skate> (Thomas Petazzoni's message of
 "Mon, 1 Jul 2013 09:19:25 +0200")
References: <20130627004309.6f15cf53@skate> <51D11AE2.5050707@mind.be>
 <20130701091925.6c67a6c7@skate>
Message-ID: <8738ryvbq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> For both use cases, it makes the most sense if these defconfigs are 
 >> part of the buildroot tree.

 Thomas> In order to keep those configurations consistent with the rest of
 Thomas> Buildroot, I agree that having them in the Buildroot tree is probably
 Thomas> the easiest option. However, I'm worried about the size of it: I was
 Thomas> not only thinking of defconfigs, but potentially additional artifacts
 Thomas> needed to make the build work.

Yes, I also think they need to be in tree to really be useful.


 >> The risk is that the configs/ directory becomes too large and unwieldy 
 >> (people will have to browse it to find the defconfig they want). So 
 >> perhaps this calls for changing it into a tree.y
 >> 
 >> Personally, I think it makes sense to move the defconfigs into the 
 >> board/ directory. Many defconfigs already refer into there for kernel 
 >> configs or specific patches, so it makes sense to put the defconfig in 
 >> the same place.

 Thomas> Funnily enough, the defconfigs *used* to be in the board/ directory
 Thomas> (which at the time was target/device). We had a discussion back in the
 Thomas> days on whether the defconfigs should remain with their board, or
 Thomas> grouped in the top-level configs/ directory.

 Thomas> See
 Thomas> http://lists.busybox.net/pipermail/buildroot/2009-October/029556.html
 Thomas> and my complaint
 Thomas> http://lists.busybox.net/pipermail/buildroot/2009-October/029559.html.

Gah, 2009 ;)

I do still think having the available configs listed together (like
linux/barebox arch/$ARCH/configs, or u-boot's boards.cfg) is nice for
users.

 Thomas> That said, after several years, I feel that configs/ was a pretty good
 Thomas> choice, I don't really feel the need of moving things back to board/,
 Thomas> especially considering the change it will cause to all users.

 Thomas> Moreover, I am not sure that those test suite / demos
 Thomas> configurations should be located in the same place as the minimal
 Thomas> defconfigs we have in configs/.

 >> And while I'm on this subject, I think the structure of the board 
 >> directory is not very clear. It would make sense to me to switch to the 
 >> layout that U-Boot uses: board/<arch>/<soc>/<boardname>/ (although the 
 >> <soc> level may be optional for us). You can expect people to know what 
 >> the basic architecture of the processor is, but not always who the vendor 
 >> is (which is probably why raspberrypi, beaglebone and gnublin don't have 
 >> a vendor directory). Or sometimes there are multiple vendors for the same 
 >> board (e.g. Beagleboard and SabreLite).

U-boot actually nowadays normally use board/<vendor>/<boardname>, which
is in line with what we do.

-- 
Bye, Peter Korsgaard
