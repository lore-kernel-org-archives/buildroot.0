From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Mon, 9 Aug 2010 08:38:23 -0700
Subject: [Buildroot] crosstool/buildroot ldconfig failure in
	"target-finalize" during build using Fedora 13
In-Reply-To: <20100808051149.GA21128@jasper.tkos.co.il>
References: <D61182AC8012EA4EBC531B3AF23BE1099C859F@tranzeo-mail2.12stewart.tranzeo.com>
	<20100808051149.GA21128@jasper.tkos.co.il>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1099C85DF@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

I presently workaround this using a patch like the one on the referenced
archive.  The only problem with this is that it results in the
"ldconfig" directory really being created under /tmp since /var/cache is
a symlink.  Since /tmp is a mount point, the ldconfig (and anything
under it) will be masked away by the tmpfs mount.

So I think we will need to create the dir so we can run the utility, and
then clean it up afterwards (and either suppress generating the
aux-cache, or blow it away afterwards during cleanup).

Thanks for the link.


Regards,

Darcy


-----Original Message-----
From: Baruch Siach [mailto:baruch at tkos.co.il] 
--snip!--

Hi Darcy,

On Fri, Aug 06, 2010 at 08:49:39AM -0700, Darcy Watkins wrote:
> After upgrading my build machine from Fedora 10 to Fedora 13 it
appears
> that the host's "ldconfig" command is no longer usable for cross build
> application.  The build thus fails when it attempts to execute
> /sbin/ldconfig during the "target-finalize" stage.
> 
--snip!--

See http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/23058. I
have 
also encountered this problem after upgrading glibc on my Debian
machine.

baruch

-- 
                                                     ~. .~   Tk Open
Systems
=}------------------------------------------------ooO--U--Ooo-----------
-{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
