From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 22:08:56 +0200
Subject: [Buildroot] [PATCH] intltool: fix build
In-Reply-To: <CAB0FRsv_6MEV1WuboQcWp9YpZgz4xvCTg9fr4t2cBy4ydfR6qg@mail.gmail.com>
References: <1413571681-27963-1-git-send-email-francois.perrad@gadz.org>
 <20141022180339.47298e90@free-electrons.com>
 <CAB0FRsv_6MEV1WuboQcWp9YpZgz4xvCTg9fr4t2cBy4ydfR6qg@mail.gmail.com>
Message-ID: <20141023220856.2bd3203d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Wed, 22 Oct 2014 19:15:36 +0200, Fran?ois Perrad wrote:

> > Can you cook an updated version of this patch that takes into account
> > the comment you have received? It would help us fix a number of Perl
> > related autobuilder issues.
> 
> When I try to do that you suggest, I only obtain no working result.
> 
> I think that comments from Arnout, come from a pure review but no from
> testing or experiment.
> 
> This patch doesn't try to fix the package host-intltool, it fixes the
> packages which depend on host-intltool.
> Currently, this kind of package is broken in the configure step
> because they can not find the correct perl.
> So, the variable INTLTOOL_PERL=$(PERL) in *_CONFIGURE_OPTS is mandatory.
> 
> When PATH=$(BR_PATH), `which perl` find the system perl when host-perl
> is not yet installed, after it find the host-perl.
> So, it is important to save the result of `which perl` with the
> original PATH (ie. without $(HOST_DIR)/usr/bin).
> 
> The current patch stay the best that I can do (the commit message can
> always be improved).

Hum, right, ok. I'm not a big fan of how we handle intltool, but I
admit that the main reason for this mess is me asking you to not make
intltool and libxml-parser-perl depend on host-perl.

I've applied your patch (after slightly rewording the commit log), it
indeed seems to fix the issue. We'll see how things go, but I'm not
very happy with our intltool handling :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
