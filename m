From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 19:26:35 +0100
Subject: [Buildroot] [PATCH/next 30/31] package/vsxu: new package
In-Reply-To: <qfirqcxc1s.ln2@ID-313208.user.individual.net>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
 <20160305161552.36cc6677@free-electrons.com>
 <qfirqcxc1s.ln2@ID-313208.user.individual.net>
Message-ID: <20160305192635.259a28cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please Cc: me on your replies. Please, please! I've asked you already
several times. Just use "Reply-all" in your mailer whenever you reply
to a mail on the Buildroot mailing list.

On Sat, 05 Mar 2016 18:43:54 +0100, Bernd Kuhls wrote:

> > cal3d is a project of its own, available on its own website
> > (http://home.gna.org/cal3d/). I would very much prefer to create
> > package/cal3d/ with the upstream cal3d version rather than using this
> > submodule solution.
> 
> the first iteration of my patch series contained a pseudo cal3d package:
> http://patchwork.ozlabs.org/patch/541356/
> 
> The current code replacing this pseudo cal3d package which you quoted, 
> and rejected now, was written by you ;)
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/135191
> 
> I understand that there is no good solution for projects using git 
> submodules in buildroot atm but I would like to know which way of 
> handling them is prefered so I can send a proper patch ;)

Aaah, very good that you remember this. I had honestly forgotten that
we already had this discussion. I in fact don't contradict myself
completely, and I'll try to explain why.

Your original proposal for a cal3d package is a package that 1/ doesn't
use the upstream version of cal3d and 2/ doesn't do anything except
downloading the cal3d sources.

Instead, what I would ideally like to see is a cal3d package that works
on its own. cal3d is a separate open-source project, which might be
used outside of vsxu. So I'd like to have
http://download.gna.org/cal3d/sources/cal3d-0.11.0.tar.gz downloaded,
built and installed by a cal3d package. And then vsxu depend on it and
link against it.

Now, whether this is doable or not depends on:

 1/ Whether vsxu's version of cal3d is heavily patched or not.

 2/ Whether the changes needed in vsxu's build system to use the
    external cal3d library are very complicated or not.

But my strong preference is to avoid using bundled versions of the
libraries when possible.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
