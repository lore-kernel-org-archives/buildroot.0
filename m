From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 28 May 2009 01:59:40 -0300
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <56ea0bb80905272132n34933d3fh925bd0e765eb6f5d@mail.gmail.com>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272132n34933d3fh925bd0e765eb6f5d@mail.gmail.com>
Message-ID: <d6cda7730905272159h1ecf88efx84d2ae055961c74e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I Paul,

   I tried to fix the ubifs too a while back, but other things got in
the way. I was mainly interested in seeing if it compresses better
than jffs2.
   Anyway. I think the correct approach would be mimmic jffs2.mk,
don't download anything and let mdtutils build mkfs.ubifs for the
host.

Kind Regards,
    Thiago A. Correa

On Thu, May 28, 2009 at 1:32 AM, Paul Archer <ptarcher@gmail.com> wrote:
> On Thu, May 28, 2009 at 5:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Peter> And report any issues found here or in the bugtracker.
> I have been trying to build buildroot with a ubifs image. I haven't
> quite got there yet, but there are some bugs associated with this
> version.
>
> target/ubifs/ubifsroot.mk
> $(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
>
> This should be a WGET, not a DOWNLOAD.
>
> I have been trying to update the UBIFS support as this is now included
> in the mtd-utils package under the mkfs.ubifs.
> ubifs also depends on e2fsprogs as there is uuid support needed in
> mkfs.ubifs. I have at least gotten ubifs to compile with a few changes
> here and there (mainly a change in mtd-utils makefiles to build
> mkfs.ubifs), but I haven't had time to get an image made yet.
>
> --
> ----
> Regards
> Paul Archer
> ptarcher at gmail.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
