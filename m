From: kyle nahrgang <kyle.nahrgang@gmail.com>
Date: Tue, 28 Jul 2020 09:38:29 -0400
Subject: [Buildroot] including full external-toolchain
In-Reply-To: <20200725104603.667a9bd0@windsurf.home>
References: <CAE0kWpANCLgJ_wrw6C0KaEzMEvJoMHa_WkGpNAv29xjB+CFZVw@mail.gmail.com>
 <20200725104603.667a9bd0@windsurf.home>
Message-ID: <CAE0kWpCc_-xCZKT6hjRdLWqk_+=qNeA-YdM4f2opxj-9+cO3rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a reason that there shouldn't maybe be an advanced option to just
accept all tools from the toolchain, and skip building any host items?

On Sat, Jul 25, 2020 at 4:46 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Fri, 24 Jul 2020 08:38:18 -0400
> kyle nahrgang <kyle.nahrgang@gmail.com> wrote:
>
> > In an effort to reduce my build time, I've switched to building an
> external
> > toolchain separately from my other projects. When I import this
> toolchain,
> > I notice that only the cross compilation tools get linked, and all other
> > host utilities are rebuilt.
> >
> > Is there a reason that buildroot doesn't import all of the host
> utilities?
> > Or skip host dependencies that are already installed in the host output?
>
> Buildroot today does not have the logic to detect which host tools are
> already provided, and when they are provided, if they have the right
> version. So we're not re-using any host tools, with a few exceptions
> (cmake for example).
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200728/ba79b3e7/attachment.html>
