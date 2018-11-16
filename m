From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Nov 2018 08:06:11 -0600
Subject: [Buildroot] [PATCH 1/3] package/xen: tools/libxc fix strncpy
 size
In-Reply-To: <b9b7ae47-7166-514f-58ec-5e0aef529eb9@mind.be>
References: <1542303868-39761-1-git-send-email-matthew.weber@rockwellcollins.com>
 <b9b7ae47-7166-514f-58ec-5e0aef529eb9@mind.be>
Message-ID: <CANQCQpbeH57W-a88azDOAp0y416ojzKGTQkHJxK40=KtdTQbbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


On Fri, Nov 16, 2018 at 8:05 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
> On 15/11/2018 18:44, Matt Weber wrote:
> > gcc-8 errs on possible truncation of trailing '\0'
> >
> > Resolves:
> > http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6/
> >
> > Upstream Commit:
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=fa7789ef18bd2e716997937af71b2e4b5b00a159
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  .../xen/0003-tools-libxc-fix-strncpy-size.patch    | 47 ++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 package/xen/0003-tools-libxc-fix-strncpy-size.patch
> >
> > diff --git a/package/xen/0003-tools-libxc-fix-strncpy-size.patch b/package/xen/0003-tools-libxc-fix-strncpy-size.patch
> > new file mode 100644
> > index 0000000..19f4711
> > --- /dev/null
> > +++ b/package/xen/0003-tools-libxc-fix-strncpy-size.patch
> > @@ -0,0 +1,47 @@
> > +From fa7789ef18bd2e716997937af71b2e4b5b00a159 Mon Sep 17 00:00:00 2001
> > +From: =?utf8?q?Marek=20Marczykowski-G=C3=B3recki?=
> > + <marmarek@invisiblethingslab.com>
> > +Date: Thu, 5 Apr 2018 03:50:49 +0200
> > +Subject: [PATCH] tools/libxc: fix strncpy size
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=utf8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +gcc-8 warns about possible truncation of trailing '\0'.
> > +Final character is overridden by '\0' anyway, so don't bother to copy
> > +it.
> > +
> > +This fixes compile failure:
> > +
> > +    xc_pm.c: In function 'xc_set_cpufreq_gov':
> > +    xc_pm.c:308:5: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]
> > +         strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
> > +         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +    cc1: all warnings being treated as errors
> > +
> > +Signed-off-by: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
> > +Acked-by: Wei Liu <wei.liu2@citrix.com>
> > +Release-Acked-by: Juergen Gross <jgross@suse.com>
> > +
> > +Upstream:
> > +https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=fa7789ef18bd2e716997937af71b2e4b5b00a159
>
>  You SoB is missing in this and the following patches. It's easier if you rebase
> the patches on a git clone and re-generate them with git-format-patch, because
> git-am will add the SoB for you.
>

Fair, will do.

Matt
