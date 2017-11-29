From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 09:20:47 +0100
Subject: [Buildroot] [PATCH v4 2/3] board: Add Vyasa RK388 board support
In-Reply-To: <CAMty3ZBNPnaDxCN+0fmB_VLbNXxovXSyE618LB_5KA7kXt74Lw@mail.gmail.com>
References: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
 <1510997329-4111-2-git-send-email-jagan@amarulasolutions.com>
 <20171123224321.447ed853@windsurf.lan>
 <CAMty3ZBNPnaDxCN+0fmB_VLbNXxovXSyE618LB_5KA7kXt74Lw@mail.gmail.com>
Message-ID: <20171129092047.33e30f9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 12:37:05 +0530, Jagan Teki wrote:

> > Using linux-next doesn't work, as it gets rebased constantly. The
> > commit 7e8a1fd62911a59f1f95d4620e89603230fdd6f9 no longer exists. You
> > have to wait for the support for this board to land into the mainline
> > kernel, or point to a vendor-specific Git tree.  
> 
> Can't we use linux-next at all? you are with head commits which were
> always changes during rebase, but I've used the board specific commit
> in v5 and that will always unchanged.

No, you can't use linux-next, as commits are not stable.

Please try yourself: wait a few days, delete your Buildroot download
folder entirely, and try to build your defconfig: it will fail, because
the git commit no longer exists on the linux-next Git repository.

If the commit still exists, then it means that it's a commit that is
part of Linus tree, in which case there is no point in using linux-next.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
