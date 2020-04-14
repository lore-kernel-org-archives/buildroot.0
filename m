From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 12:20:40 -0500
Subject: [Buildroot] [PATCH v3 0/8] Bump of SElinux related libs/tools
 to 3.0
In-Reply-To: <20200414182303.250cc38d@windsurf.home>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
 <20200414182303.250cc38d@windsurf.home>
Message-ID: <CANQCQpYUoZX=L7LMJ_Mkhvak0y_48RZuYaaHzx5MFAvwhQtArQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Tue, Apr 14, 2020 at 11:25 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 14 Apr 2020 10:25:20 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> >  - Switches to using the date (i.e. 20191204) abased release tagging
> >    for better alignment with https://release-monitoring.org/project/01717/
> >
> >  - Added selinux-python which was missed in the v2 of this bump by
> >    Adam (http://patchwork.ozlabs.org/project/buildroot/list/?series=156673)
>
> I am not sure I like the change to using the single big tarball with
> everything included, and then have each individual package build its
> own sub-directory. They ship individual tarballs, it seems a lot better
> to use that.
>
> Is the only benefit of that change the fact that it will match with
> what release monitoring says ?

Correct.  If we do stay with the x.y instead, I think it still makes
sense to use the $(LIBSELINUX_VERION) across all those packages as the
bumps should always be the same version for those 7 packages.

>
> Even Fedora, who is the original project using release-monitoring uses
> the real version numbers for SELinux:
>
> $ rpm -qa | grep libselinux
> libselinux-utils-2.9-5.fc31.x86_64
> libselinux-2.9-5.fc31.i686
> libselinux-devel-2.9-5.fc31.x86_64
> libselinux-2.9-5.fc31.x86_64
>
> So to me, it seems like we should instead change the versions reported
> by release-monitoring.org instead.

Is there a way to reorder the versions on release monitoring instead?
As it just happens the dates end up at the top of the list
https://release-monitoring.org/project/01717/

Matt
