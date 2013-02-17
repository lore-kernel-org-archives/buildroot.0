From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 17 Feb 2013 18:06:14 -0300
Subject: [Buildroot] bump libnl to 3.2.21 before release
In-Reply-To: <5121441D.5040506@siganos.org>
References: <51212637.6020406@siganos.org> <512127BC.9050004@zacarias.com.ar>
 <5121441D.5040506@siganos.org>
Message-ID: <51214646.5080304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/17/2013 05:57 PM, Dimitrios Siganos wrote:

> There is no problem that I can't work around but it is an inconvenience
> that can be avoided.
> 
> How am I affected? We do binary releases of our software applications
> and 3.2.18 doesn't work for us and we'd have to release a special
> version for that or create a patch for buildroot.

Binary releases as in a sepparate/propietary app that's only shipped as
a binary? (not built with buildroot and/or not able to share the source).
I'm not asking because of any licensing crazyiness, it's perfectly
valid, just want to understand the scenario.

> The important thing to note here is that version 3.2.18 broke backwards
> compatibility and version 3.2.20 restored it. For example, v3.2.16 is
> compatible with 3.2.21 but 3.2.18 isn't compatible with either of them.
> 
> If there is no specific reason to stay at 3.2.18 then why not go to
> 3.2.21 and spare some buildroot users (the ones that operate in mixed
> open/closed source) from that unnecessary libnl hassle?

Well the binary compatibility isn't an issue for typical buildroot
scenarios, that's why i'm asking what i asked.
The changelog entry is a typical linux distribution issue where you just
upgrade individual components when necessary.
That's usually not what buildroot is about, you're building a root
filesystem (in simplified terms) so your upgrade path is usually a
complete image upgrade, call it firmware, flash or disk image.
Hence ABI compatibility doesn't matter.
Understand i'm hesitant to bump libnl this close to the release unless
there's a really pressing issue - libnl bumps usually break packages
subtly and this requires testing.
And it also breaks every other release with varying linux headers when
new features are introduced (like CAN support).
Regards.
