From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 18 Jul 2011 11:30:54 +0200
Subject: [Buildroot] [RFC PATCH 0/2] Add the ability to rebuild packages.
In-Reply-To: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
Message-ID: <CAAXf6LU3_s_E03b2KzNusjvMsbcYUFZupr-DoP+SRT9F7y_99Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 18, 2011 at 11:15 AM, Quotient Remainder
<quotientvremainder@gmail.com> wrote:
> Sometimes it's necessary to fix something up in the source code of a package.
> Usually this requires deleting the stamp file and runinng "make" again.
> This patch set allows this sequence to be done by just issuing either a top-level
> "make rebuild" to rebuild all packages or a package-specific command, e.g.
> "make busybox-rebuild". ?The package-specific command will normally be followed by
> a "make" (*not* "make rebuild") command to sweep up and generate the RFS.
>
> There may be some subtle harmful effects from rebuilding packages unconditionally
> but I've been using this approach for some time and noticed nothing. ?The original
> patch was based on v2010.08 and I've made efforts to update but may have missed some
> things. ?It's mainly testing the water anyway as an RFC.
>
> This feature may be useful if Buildroot is extended to being used as a day-to-day
> development environment as opposed to a build-once tool.

We are currently using Buildroot in such a development mode, and
indeed face the problems you are solving with this patch. So: thumbs
up!

But it is not only 'rebuild' that is useful. The conditions under
which the configure command of a certain package originally ran, may
have changed. A similar thing is true for patches: you may have
updated the patchfile. In such cases, generic reconfigure and repatch
targets are very welcome, together with the rebuild target you already
made...

Thomas
