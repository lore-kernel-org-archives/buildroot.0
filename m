From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 16:10:12 +0200
Subject: [Buildroot] [PATCHv5 1/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <55F03917.7080304@imgtec.com>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <55F02FEC.7080703@imgtec.com>
 <20150909154617.4c91d847@free-electrons.com>
 <55F03917.7080304@imgtec.com>
Message-ID: <20150909161012.5b030e73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Wed, 9 Sep 2015 14:50:15 +0100, Vicente Olivert Riera wrote:

> Ok, I was looking at the packages-file-list.txt file as a way to know
> which files are installed by each package (which is useful IMHO), and
> then I noticed that packages like busybox only had a few files when it
> actually installs lots of links. But, if this is only to calculate the
> size of the file system, then it's fine.

Yes, it's really only to calculate the size. We could decide to extend
the packages-file-list.txt to have all file types (normal files,
symlinks, directories), and then have a way of calculating the md5 only
for the normal files. But it was unnecessary to do this for the
size-stats feature. I am not sure it is worth the effort to do that,
but if people want me to add this, I can have a look.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
