From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Jul 2012 23:07:02 +0200
Subject: [Buildroot] [PATCH v3] Make external toolchain relocatable
In-Reply-To: <1342350726-29970-1-git-send-email-arnout@mind.be>
References: <1342350726-29970-1-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMMJ8FRbEHGY-Aq8NifiFXaBTjNUP8+d=S0a2q2BNw-RAYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/15 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> The external toolchain wrapper sets sysroot etc. to an absolute path.
> By changing this to a relative path, it is possible to move the host
> directory to a different location and still have a working build
> system.
>
> This only works for a downloaded external toolchain.  For a pre-installed
> external toolchain, it is possible to move the host directory to a
> different location, but not the external toolchain directory (it does work
> if the external toolchain directory lies within the host directory).  For
> an internal or crosstool-ng toolchain, there is no wrapper so updating the
> sysroot path should be done in a different way.
>
> See http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html
> for information about others things to do to make the host directory
> relocatable.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Also tested.
