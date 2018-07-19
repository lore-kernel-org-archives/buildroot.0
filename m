From: anisse at astier.eu <anisse@astier.eu>
Date: Thu, 19 Jul 2018 13:50:33 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <20180719100456.2146ce8b@windsurf>
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 <20180718171843.5ed5f10c@windsurf>
 <20180719075842.k3gxopajcat7f4dt@bifrost>
 <20180719100456.2146ce8b@windsurf>
Message-ID: <20180719115033.vchfjfwmewah2wjd@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 19, 2018 at 10:04:56AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> +Peter in Cc.
> 
> On Thu, 19 Jul 2018 09:58:42 +0200, Anisse Astier wrote:
> 
> > We just hit this issue with the buildroot-2018.02 branch. Is this is the
> > scope of LTS-backportable patches ?
> > 
> > Otherwise it's very easy to take the patch in an external, but I'm
> > guessing it might break other builds somewhere.
> 
> I think it definitely makes sense to have it in 2018.02.x, so I guess
> Peter will backport it there.
> 
> However, it would be nice if someone could try to push this
> upstream. The OE patch says it's not appropriate for upstream, but I
> disagree, the fact that the shebang can be too long is a real problem,
> and if both OE and Buildroot have to fix it, upstream should
> (hopefully) be interested in finding a solution.
> 

I opened an issue upstream:
https://gitlab.gnome.org/GNOME/glib/issues/1455

Upstream is already working on a solution, but it might only be fixed in
the meson build:
https://gitlab.gnome.org/GNOME/glib/merge_requests/187

Which will require moving the package from autotools to meson.

Regards,

Anisse
