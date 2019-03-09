From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 Mar 2019 21:38:55 +0100
Subject: [Buildroot] [PATCH v3] zbar: bump version to 0.22
In-Reply-To: <20190309142412.19af2ef5@windsurf>
References: <20190308221947.18548-1-ps.report@gmx.net>
 <20190309142412.19af2ef5@windsurf>
Message-ID: <20190309213855.7195b8a6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 9 Mar 2019 14:24:12 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> On Fri,  8 Mar 2019 23:19:47 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > - change from git download to official release and
> >   download site (drop need for autoreconf)
> > 
> > - drop dependency on kernel headers >= 3.17 (should be fixed with
> >   commit 'v4l2: make ZBar build and run on Kernels < 3.16' (see [1]),
> >   propagate removal to gst-plugins-bad
> > 
> > [1] https://git.linuxtv.org/zbar.git/commit/?id=fa5c48127ec1e3670e28540c2e6a03431ebac5b8
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> I didn't pay attention, but in fact this is still not correct.
> 
> zbar selects libv4l, and libv4l has a dependency on headers >= 3.0. So
> zbar should keep a dependency on >= 3.0, and so should the
> gst-plugins-bad zbar option. Otherwise, you can enable zbar on < 3.0
> headers, but libv4l is not selectable, violating the kconfig
> correctness of the configuration.
> 
> Conclusion: we need a headers >= 3.0 dependency on zbar and the
> gst-plugins-bad zbar option.

O.k.

> 
> Could you fix this and resend ?

Yes, updated patch will follow....

Regards,
Peter

> 
> Thanks a lot!
> 
> Thomas Petazzoni
