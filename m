From: David Owens <david.owens@rockwellcollins.com>
Date: Fri, 20 Jul 2018 08:47:08 -0500
Subject: [Buildroot] [PATCH 1/1] mtd: Allow holes in volume ID table
In-Reply-To: <CANQCQpau5i6tyvhvy5Fh=2m8NMWFDVqKpR_fnAiQYBnN9WP_Ew@mail.gmail.com>
References: <1532089807-97597-1-git-send-email-david.owens@rockwellcollins.com>
 <CANQCQpau5i6tyvhvy5Fh=2m8NMWFDVqKpR_fnAiQYBnN9WP_Ew@mail.gmail.com>
Message-ID: <CAOWP8LcOcKKyber_j0cjbh-hzF2QH5X1UaRo9R78OuZXvQ1CbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 20, 2018 at 7:40 AM, Matthew Weber <
matthew.weber@rockwellcollins.com> wrote:

> David,
>
> On Fri, Jul 20, 2018 at 7:30 AM, David Owens
> <david.owens@rockwellcollins.com> wrote:
> > A regression in the mtd package prevents non-consecutive ubi volume IDs
> > from working properly.  This change reverts the commit [0].  The issue
> > was originally described on the mtd mailing list:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html
> >
> > [0] http://git.infradead.org/mtd-utils.git/commitdiff/
> dede98ffb706676309488d7cc660f569548d5930
> >
>
> Are you thinking this patch would be for the LTS and then separately a
> patchset to bump the MTD version would be better for master?
>
> Matt
>

I think the patch should be applied to LTS at a minimum but it also might
make
sense to apply to master.  The latest MTD version (2.0.2) has the same
problem
so simply bumping the MTD versions won't help until a new release is
available.

-Dave
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180720/36b3910c/attachment.html>
