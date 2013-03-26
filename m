From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Mar 2013 11:08:18 +0100
Subject: [Buildroot] [PATCH v3 2/2] buildroot: target: Add Blackfin
 architecture support.
In-Reply-To: <CAJxxZ0Nz4AuHuTToa4W=U9TE3jFD0JTXRAJV5oFHn4J66yuY3Q@mail.gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
 <20130322155400.410ec78e@skate>
 <CAJxxZ0NLV==GLHFP627kk_BiaDst+a8qp71k_gnv0y=Sqj5=qA@mail.gmail.com>
 <CAAXf6LUBQhxB60Tt9OsA0kW9JZs3vmZMc7_Qyr7SY1yQodzgzw@mail.gmail.com>
 <CAJxxZ0OOj=vi5xuCp79vU0_kX_KNx+UX+CSRkLkr4_xsfNtS2Q@mail.gmail.com>
 <20130326094102.094def3d@skate>
 <CAJxxZ0Nz4AuHuTToa4W=U9TE3jFD0JTXRAJV5oFHn4J66yuY3Q@mail.gmail.com>
Message-ID: <20130326110818.4e9f56fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Tue, 26 Mar 2013 17:36:24 +0800, Sonic Zhang wrote:

> > But the current external toolchain logic in
> > toolchain/toolchain-external/ext-tool.mk only extracts either the
> > bfin-uclinux sysroot *or* the bfin-linux-uclibc sysroot, so you in
> > practice don't have both at the same time, at least with the current
> > Buildroot. So presumably this would also need to be changed, right?
> 
> Yes, that's why the installation target copy library files from the
> original toolchain folder other than the sysroot.

That doesn't work: when bfin-linux-uclibc is used, then the
bfin-uclinux toolchain is *NOT* installed. Your current code makes the
assumption that this toolchain is installed system-wide, but that's not
what we want in a Buildroot context.

But ok, it's not an impossible problem: we can tune the external
toolchain logic so that it installs both sysroot when the user wants
both the FDPIC and FLAT stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
