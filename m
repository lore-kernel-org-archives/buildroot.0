From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Apr 2020 18:23:03 +0200
Subject: [Buildroot] [PATCH v3 0/8] Bump of SElinux related libs/tools
 to 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414182303.250cc38d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 10:25:20 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  - Switches to using the date (i.e. 20191204) abased release tagging
>    for better alignment with https://release-monitoring.org/project/01717/
> 
>  - Added selinux-python which was missed in the v2 of this bump by
>    Adam (http://patchwork.ozlabs.org/project/buildroot/list/?series=156673)

I am not sure I like the change to using the single big tarball with
everything included, and then have each individual package build its
own sub-directory. They ship individual tarballs, it seems a lot better
to use that.

Is the only benefit of that change the fact that it will match with
what release monitoring says ?

Even Fedora, who is the original project using release-monitoring uses
the real version numbers for SELinux:

$ rpm -qa | grep libselinux
libselinux-utils-2.9-5.fc31.x86_64
libselinux-2.9-5.fc31.i686
libselinux-devel-2.9-5.fc31.x86_64
libselinux-2.9-5.fc31.x86_64

So to me, it seems like we should instead change the versions reported
by release-monitoring.org instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
