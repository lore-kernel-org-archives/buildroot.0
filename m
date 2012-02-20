From: J.C. Woltz <jwoltz@gmail.com>
Date: Mon, 20 Feb 2012 16:00:22 -0500
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <jhub5r$smv$1@dough.gmane.org>
References: <jhub5r$smv$1@dough.gmane.org>
Message-ID: <CAC78GpcJ8nZ0QrZ01a0sDgVxV7kN12ShRi27Cv8sGLg4-TKXgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 20, 2012 at 3:41 PM, Grant Edwards
<grant.b.edwards@gmail.com> wrote:
>
> I'm trying to use a post-build script to fix up the init.d/S59snmpd
> file, but I can't figure out what the post-build script path should
> be.

The post-build script can be where you want it :)
When you define the post build script to run, it is relative to the
buildroot main directory
Personally, I keep my post-build is a directory structure like:
board/manufacture/model/post-build.sh

Then I have a
board/manufacture/model/root-additions/
directory structure.
>
> It would be awfully nice if the help text for "path" config options
> explained what directory the path is relative to. Alternatively, it
> might be nice if there were some variables that could be used in
> user-configured paths to anchor the path to specific points in the
> build, output, or source tree.
>
> Putting an absolute path in a config file doesn't really seem like a
> workable option.

Agreed

Somewhere I saw some slides that had a recommended way to do this. It
also had a minimal post-build script to run. It is on the mailing list
somewhere.

J.C. Woltz
