From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 16 May 2019 11:52:48 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-14
In-Reply-To: <20190516083353.5cd7ae04@windsurf>
References: <20190515060039.F045C22920@silver.osuosl.org>
 <20190515221703.GC32757@momiji> <20190516083353.5cd7ae04@windsurf>
Message-ID: <20190516115248.GB25918@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 May 2019 08:33:53 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Adrian,
> 
> On Wed, 15 May 2019 22:17:03 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > >          arm |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/645be27edc31037a9b1bb7ce0dc85440949b0846 |       
> > 
> > 
> > This build failure of of the wpewebkit package is kind of odd: it looks like
> > with assertions enabled (as in: doing a debug build) uses some variables which
> > do not exist, and I wonder why we haven't seen this before?when working on
> > WebKit we routinely do debug builds ?\_(?)_/? 
> 
> This build has BR2_ENABLE_DEBUG=y, and when BR2_ENABLE_DEBUG=y, the
> CMake package infrastructure passes -DCMAKE_BUILD_TYPE=Debug. I assume
> that's under this condition that assertions become enabled.

On a related note: for debug builds done by packagers we usually recommend
building with ?-DCMAKE_BUILD_TYPE=RelWithDebInfo? because using the ?Debug?
produces excruciatingly slow WebKit binaries. To give you an idea: loading
some simple static HTML page over the network can take a couple of minutes.
Typically full ?Debug? builds are only ever used by WebKit developers.

> > I think it is more worth it to push the update to WPE WebKit 2.24.x forward,
> > and this build failure would just go away.
> 
> Except that the build issue you're seeing is in master, and we're past
> -rc1 (even -rc2 now), and therefore we generally don't take version
> bumps in master, as we're too close to the release. Especially a
> version bump on a complex package like wpewebkit, and for which the
> version bump requires bumping the versions of a number of other
> packages as well.

Good point, I was forgetting about the upcoming release. Let's fix this.
Do you think it would be enough to make Buildroot use ?RelWithDebInfo? for
debug builds? I see that other packages (like flare-engine, for example) do
that already.

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190516/054655ff/attachment.asc>
