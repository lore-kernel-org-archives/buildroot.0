From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Nov 2010 14:45:10 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day,
 29th October 2010
In-Reply-To: <AANLkTi=A4sufp9mSKrBzHtPE87WsLPw4k6+jti6hM0He@mail.gmail.com>
References: <20101123221417.0d6867c6@surf>
	<AANLkTi=A4sufp9mSKrBzHtPE87WsLPw4k6+jti6hM0He@mail.gmail.com>
Message-ID: <20101126144510.5e6504fd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Nov 2010 13:16:45 +0100
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> What about allowing components to be located in a separate location,
> outside of buildroot?
> 
> For example, I currently have a custom linux kernel, that I would like
> to use in buildroot. I selected the 'custom' kernel options, and
> placed the .tar.bz2 file containing the custom kernel in the 'dl'
> directory of buildroot. This works.
> 
> Unfortunately, since the custom kernel is under development, I
> regularly need to make changes to it. My current approach forces me to
> create a new .tar.bz2 archive every time I want to create a build with
> the changed kernel.
> 
> Another solution would be to create patches each time I create a
> build, and specify the patches in buildroot (using one of the proposed
> improvements above), but still it requires me to do manual work.
> 
> It would be interesting to have a feature that allows one to specify a
> path to an (unpacked) kernel. Buildroot would then directly use this
> path as the source base, but would place the output files elsewhere
> (in the output directory of buildroot).
> Each time I modify the sources, buildroot should automatically (and
> this is the hard part) determine it should rebuild them, but I don't
> need to manually create an archive or patches.

Actually Mike Frysinger has recently proposed a patch that does exactly
this for the Linux kernel, so you may want to have a look at it and see
if it works for you.

I completely agree with this feature, but before including Mike's
patch, I'd like to see if it's possible to make it more generic. This
problem is not only true for the kernel, it is also true for the
user-space packages as well. It'd be nice if for some packages, it was
possible to point Buildroot to a source tree, to make it easy to work
on those packages (like when you're developing/fixing bugs in an
application or library).

The topic was shortly raised this morning on the IRC channel, but no
clear solution was found yet. Input, feedback and ideas on the matter
are definitely appreciated.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
