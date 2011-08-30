From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2011 18:13:53 +0200
Subject: [Buildroot] SVN, sources out of tree / VPATH... How?
In-Reply-To: <4E4EED59.30009@netscape.net>
References: <4E4EED59.30009@netscape.net>
Message-ID: <201108301813.55929.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Saturday 20 August 2011 01:10:17, Ulrich Prinz wrote:
> I want to do some development for a new platform with buildroot. But I
> work with SVN. The first steps with a plain buildroot look good, but now
> I want to make changes to some existing code in buildroot (u-boot,
> kernel). And I want to checkin these changes into my SVN.

 There are patches on the mailing list to support local directories as the 
source of a package.  With those patches, you can extract the package source 
somewhere outside the buildroot tree (under version control), and use this as 
the source instead of a downloaded tar.


> The trick is, that you replicate the original mainline kernel paths in
> the other two sources and then make follows the priority of user/linux
> then bsp/kernel-x.y.z and then kernel-x.y.z/

 That's actually an overlay.  I think OpenEmbedded uses something like that.  
Buildroot prefers to work with patches.

 As an approximation of an overlay, you can write a script that automatically 
generates patches out of your revision control system and dumps them in the 
package directory.  The package infrastructure will apply all patches that are 
named <package>-<version><description>.patch.

 quilt is a tool that helps to work with this approach.  It's not trivial to 
use, but not much more difficult than any other VCS.

 
 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110830/fc6b727e/attachment.html>
