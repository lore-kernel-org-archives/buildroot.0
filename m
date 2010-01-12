From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 12 Jan 2010 12:15:10 -0700
Subject: [Buildroot] [PATCH 3/9] Add support for multilib external
	toolchains
In-Reply-To: <20100112120603.6682e454@surf>
References: <20081016203220.15826.26173.stgit@localhost.localdomain> 
	<20081016203230.15826.93873.stgit@localhost.localdomain>
	<20100112120603.6682e454@surf>
Message-ID: <fa686aa41001121115i7f12f78fme3a8cf7bfde1446@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 12, 2010 at 4:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hi Grant,
>
> I've recently tried to work again on integrating CodeSourcery
> toolchains into Buildroot, but I'm facing issues related to multilib.
> I've summed up these issues in the following post:
>
> ?http://lists.busybox.net/pipermail/buildroot/2010-January/031421.html
>
> If you have any idea on how to solve the issues, don't hesitate to tell
> me.

I'm not a gcc expert so I don't know.  It would be ideal if gcc could
tell you the subdirectory for a given set of flags (instead of trying
to parse -print-multi-lib output) and then copy only those libraries.
Include files would need to be copied separately of course.  Then
you'd either need a symlink in the target directory so that gcc
doesn't get confused, or a flag to tell gcc to turn off multilib.

You might try asking Segher Boessenkool (cc'd).  He's quite adept at gcc-fu.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
