From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 10:46:03 +0200
Subject: [Buildroot] including full external-toolchain
In-Reply-To: <CAE0kWpANCLgJ_wrw6C0KaEzMEvJoMHa_WkGpNAv29xjB+CFZVw@mail.gmail.com>
References: <CAE0kWpANCLgJ_wrw6C0KaEzMEvJoMHa_WkGpNAv29xjB+CFZVw@mail.gmail.com>
Message-ID: <20200725104603.667a9bd0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jul 2020 08:38:18 -0400
kyle nahrgang <kyle.nahrgang@gmail.com> wrote:

> In an effort to reduce my build time, I've switched to building an external
> toolchain separately from my other projects. When I import this toolchain,
> I notice that only the cross compilation tools get linked, and all other
> host utilities are rebuilt.
> 
> Is there a reason that buildroot doesn't import all of the host utilities?
> Or skip host dependencies that are already installed in the host output?

Buildroot today does not have the logic to detect which host tools are
already provided, and when they are provided, if they have the right
version. So we're not re-using any host tools, with a few exceptions
(cmake for example).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
