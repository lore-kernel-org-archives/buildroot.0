From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 11 Sep 2020 09:59:05 +0000
Subject: [Buildroot] [arc-buildroot] Toolchain issues on multiple
 architectures
In-Reply-To: <20200911102813.7dc2153f@windsurf.hq.k.grp>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <BN8PR12MB3330260C7D57EE97065A5DC0A1270@BN8PR12MB3330.namprd12.prod.outlook.com>,
 <20200911102813.7dc2153f@windsurf.hq.k.grp>
Message-ID: <BN8PR12MB3330402F1023A1A6A823AF15A1240@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> On Thu, 10 Sep 2020 16:39:18 +0000
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> 
> > > Issue is caused by the recent version of gdb, where gdbserver has been
> > > moved from gdb/gdbserver/ to gdbserver/. However, the story is not so
> > > simple: you can't simply go in gdbserver/ and run ./configure from it,
> > > that doesn't work anymore. ?
> > 
> > But in your exercise mentioned above do you really need only gdbserver?
> > I understand that full GDB might be quite an overkill for a tiny target but
> > it might not be installed onto the target rootfs, right?
> 
> I'm building cross-compilation toolchains, in which we only want
> gdbserver for the target, not the full gdb.
> 
> > So what if for GDB 10+ we'll add an installation quirk which will remove
> > full GDB from "output/target" if we only want gdbsever?
> 
> Building the full blown gdb would also require building its
> dependencies, i.e ncurses and possibly libiconv. Building only
> gdbserver allows to avoid that.
> 
> I've got some feedback from upstream though, they pointed to:
> ? https://github.com/bminor/binutils-gdb/blob/master/gdbserver/README#L86 
> 
> which explains what is the supported way of building just gdbserver.
> We'll have to test this, and see if it works not only with recent GDB,
> but also older GDB versions that we still support.

That's an interesting finding indeed.
So do you need any further help with that from our side now?

BTW I was eagerly waiting for the next official GDB release
(v10, which was supposed to happen a while ago according to
https://www.gnu.org/software/gdb/schedule/) so that we may come-up with a more
generic solution rather than just ARC quirk but the reality is there's no release
and no ETAs I'm aware of so most probably we'll need to come-up with a custom
quirk for now :(

-Alexey
