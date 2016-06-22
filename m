From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 22 Jun 2016 05:45:06 +0000
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <4209f432-0fbd-8d44-7194-c99829f66e2e@smile.fr>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <4209f432-0fbd-8d44-7194-c99829f66e2e@smile.fr>
Message-ID: <1466574249.3622.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, 2016-06-18 at 16:07 +0200, Romain Naour wrote:
> Hi Thomas, Alexey, Vlad, All,
> 
> Le 15/06/2016 ? 22:06, Thomas Petazzoni a ?crit :
> > 
> > Hello,
> > 
> > The previous patchwork cleanup period being over, it's time to start
> > the second period, with 10 other patches. We're on June 15th, so I'll
> > give people until June 30th to react on the following patches. If
> > there's no reaction, like no interest from either the original
> > submitter nor any other Buildroot developer, the patch will be marked
> > Rejected on June 30th.
> > 
> > If you are in To: of this e-mail, then one or several of the patches
> > below have been authored by you, so you should be interested :-)
> > 
> > Thanks,
> > 
> > Thomas
> > 
> > ?5. Fix for the makeinfo / missing issue, proposal from Romain
> > ????http://patchwork.ozlabs.org/patch/595041/
> > ????http://patchwork.ozlabs.org/patch/595042/
> > ????http://patchwork.ozlabs.org/patch/595043/
> > 
> > ????We need to take a decision on this one. The problem also occurs for
> > ????gdb and binutils on ARC, for which we've added a custom hack
> > ????recently.
> > 
> > ????I tried to play with timestamps by touch'ing the .info files before
> > ????the build, it worked with one of gdb or binutils, but failed for
> > ????the other.
> > 
> > ????So either we take Romain's approach, or we bite the bullet and add
> > ????a host-makeinfo package on which we depend when gdb/binutils are
> > ????fetched from Git.
> > 
> IHMO the real problem is that binutils/gdb doesn't support --disable-docs
> option. When present on the command line, this option must completely disable
> the documentation (man, info, pdf etc) and let the build continue.
> 
> It seems that this issue was already discussed back in 2007 [1].
> Last year I submitted a patch upstream to do that but it was not complete and
> not tested due to autoconf version mismatch [2].
> 
> If we want to autoreconf binutils/gdb in Buildroot we must downgrade autoconf to
> 2.64 and automake to 1.12.6.
> 
> Alexey, Vlad, I would suggest to rework your patch [3] and add --disable-docs
> option instead of testing missing 127 return value.
> If you succeed, we can reject my proposal from patchwork :)

Right, that's what we're looking at now.
Stay tuned and patch(es) will follow :)

-Alexey
