From: Sam Lancia <sam@gpsm.co.uk>
Date: Sun, 8 Sep 2019 10:12:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/lrzip: new package
In-Reply-To: <20190907223530.3d63480f@windsurf>
References: <20190907201115.22793-1-sam@gpsm.co.uk>
 <20190907223530.3d63480f@windsurf>
Message-ID: <CAGDkrv5Gs5Eq42hLKh_yXRMxu=2_0bLrnoxr-keFf4ZeV+vH6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the help Thomas.

Have updated the patch. No other changes seem to be required, the bswap
issues appear to be warnings. utils/test-pkg passes

On Sat, 7 Sep 2019 at 21:35, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> Thanks for this new version. When sending a new version for a patch, it
> is customary to use:
>
>  [PATCH v2]
>
> as the patch prefix, which you can do using "git format-patch -v2".
>
> And also, to include a changelog of the changes between the v1 and v2,
> below the "---", i.e...
>
> On Sat,  7 Sep 2019 21:11:15 +0100
> sam at gpsm.co.uk wrote:
>
> > From: Sam Lancia <sam@gpsm.co.uk>
> >
> > lrzip is a compression utility that excels at compressing
> > large files (usually > 10-50 MB)
> >
> > Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
> > ---
>
> ... here.
>
>
> > diff --git a/package/lrzip/0001-missing-stdarg.patch
> b/package/lrzip/0001-missing-stdarg.patch
> > new file mode 100644
> > index 0000000000..7a19bc2834
> > --- /dev/null
> > +++ b/package/lrzip/0001-missing-stdarg.patch
> > @@ -0,0 +1,15 @@
> > +Lrzip.h: add missing header for va_list on some platforms
> > +
> > +Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
>
> We would like patches for projects that are hosted on Git to be
> generated using git format-patch. So, grab the Git repo of the upstream
> project, and make a proper commit. This way, you can also easily send a
> pull request to the upstream lrzip project.
>
> However, was this sufficient to fix all build issues ? Indeed stdarg.h
> was missing, but there were also some bswap related problems.
>
> > +comment "lrzip needs a toolchain w/ wchar"
> > +     depends on BR2_USE_MMU
> > +     depends on !BR2_USE_WCHAR
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
>
> No, that's not the proper way. It should be:
>
> comment "lrzip needs a toolchain w/ wchar, threads"
>         depends on BR2_USE_MMU
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190908/f20c11c5/attachment-0001.html>
