From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 22:17:08 +0000
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111102160349.4afe5935@skate>
References: <20111102160349.4afe5935@skate>
Message-ID: <201111152217.08212.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 02 November 2011 15:03:49 Thomas Petazzoni wrote:
> On the feature that is often discussed on the Buildroot list, and
> which was on the agenda for this meeting was the general topic of
> "package management". To summarize, the idea would be to add some
> tracking of which Buildroot package installs what files, with the
> goals of :
> 
>  * Being able to remove files installed by a package when this package
>    gets unselected from the menuconfig ;

 I completely agree with the final conclusion that this is almost impossible to 
achieve in a simple, consistent and reliable way.  Something that would help a 
lot for that purpose, however, is to have a 'make clean-target' target.  This 
would wipe $(TARGET_DIR) and remove all .stamp_target_installed files.  The 
next build will re-copy the skeleton and reinstall all packages, which should 
be sufficient and shouldn't take very long.  clean-staging would also be nice 
but is probably a bit more difficult to implement because of the toolchain.


>  * Ultimately, be able to generate binary packages (ipk or other
>    format) that can be installed on the target without re-generating a
>    new root filesystem image.

 Now this, on the other hand, is still a useful addition.  At least, if it 
doesn't make the build system much more complicated to add it (you probably 
need at least a per-package staging dir).


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
