From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2011 07:44:46 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] Add Xenomai real-time framework
In-Reply-To: <patchbomb.1316004973@localhost6.localdomain6>
References: <patchbomb.1316004973@localhost6.localdomain6>
Message-ID: <201109150744.47121.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 14 September 2011 14:56:13, Thomas De Schampheleire wrote:
> Xenomai comes with a Linux Kernel and user-space part.
> I added a Linux extensions sub-menu (The first patch) which handles
> the kernel modification provided by Adeos/Xenomai. The advantage of
> this way is for maintenance purpose. (Xenomai do not provide a full
> kernel patch, but use a script called "prepare-kernel.sh")
> Also, this split the user-space from the kernel in a nice way instead
> of adding a serie of patches.

 I don't agree with this split.  When you're configuring Xenomai, I think you 
want the Adeos patch and the other Xenomai configuration in a single place, 
not spread over two separate menu items.  And the same reasoning goes for 
maintaining the buildroot parts of Xenomai.  

 There is only one advantage to this approach: the Adeos patch and the kernel 
version are intimately related, so if you change one you also want to change 
the other.  The same reasoning however goes for the relationship between 
kernel headers and kernel itself, which are currently miles apart in 
buildroot.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
