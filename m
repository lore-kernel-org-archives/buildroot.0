From: Antoine Tenart <atenart@kernel.org>
Date: Thu, 11 Feb 2021 18:40:18 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: do not use the bare
 target in the configuration step
In-Reply-To: <20210211173118.GG1679218@scaer>
References: <20210210185158.1254415-1-atenart@kernel.org>
 <20210210204759.GD1679218@scaer>
 <161303350302.4159.3930376903227751717@kwain.local>
 <20210211173118.GG1679218@scaer>
Message-ID: <161306521801.4159.811417160322043325@kwain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Yann E. MORIN (2021-02-11 18:31:18)
> On 2021-02-11 09:51 +0100, Antoine Tenart spake thusly:
> 
> > I double checked and there's an issue with an use case; the list of
> > modules to compile is not updated if a module is deleted (if added,
> > yes...). While we shouldn't expect much when deleting something from a
> > package (as the installation step will not clean what was installed
> > before),
> 
> Well, it can happen if one is using on a custom policy and working on it
> with REFPOLICY_OVERRIDE_SRCDIR: the source files may change, appear, or
> disappear between two builds...

Depends on what the output of the build is :)

> > here, as we're explicitly using the monolithic build, removing
> > a module and reconfiguring should work. So let's be safe and keep this
> > as is.
> 
> So I've marked this patch as rejected in patchwork, then. Thanks for the
> prompt feedback!

Thanks!

Antoine
