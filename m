From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 6 Jan 2012 08:25:57 -0600
Subject: [Buildroot] Buildroot and GPL compliance
In-Reply-To: <201201060210.03701.vapier@gentoo.org>
References: <CAAXf6LVHqHhTH_qADzZcu=zAZ=+9YYPfpfHwL4so2O_akNPGQQ@mail.gmail.com>
 <201201060210.03701.vapier@gentoo.org>
Message-ID: <201201060826.00086.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri January 6 2012, Mike Frysinger wrote:
> On Wednesday 14 December 2011 02:40:54 Thomas De Schampheleire wrote:
> > * What about the tarballs? Should the tarballs themselves be included
> > in the distribution, or would they be downloaded from the web by the
> > user running buildroot? I think it is safer to include the tarballs,
> > since you never know whether the official location will continue to
> > exist in the future (or be temporarily out-of-order, as with
> > kernel.org)
> 
> it would be simplest for people distributing binaries upon request, but if 
> they provide URLs and they're available, that should be satisfactory.
> 
> > * How to handle proprietary applications? Even though during
> > development these applications may be build from within buildroot
> > (when sources are available), one would typically not want to
> > distribute the sources to the end-user. Still, in order to be able to
> > regenerate the system, I think the user should have access to the
> > binary versions of these applications. How do we handle this, what isorg
> > the best practice?
> 
> there's no legal requirement that people distributing binaries make this easy.
>

I can't think of any that include the words: "practical' let alone "easy".
;-)
 
> > Other discussion points are welcome.
> 
> what might be cool is adding a target that produces a tarball of everything 
> that we expect would be required for license compliance.  should be somewhat 
> easy to automate.
>

I see this often in actual practice for the case of Media Player firmware.
These firmware packages are often a mix of open source and closed source.

The builders put a '.gnu' (or similar) tag file in each directory they want
included in their source reference tar-ball.
Some also write a manifest file listing open/closed status of each package.

Noticed only because at least some of these people doing the scripting do not
exclude the '.gnu' or '.gnulock' tag file from the tar-ball.  ;-)

Mike
> -mike
> 
