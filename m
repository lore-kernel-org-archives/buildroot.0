From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 07:57:22 +0200
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for
 cross-building
In-Reply-To: <20160922205817.GC3179@free.fr>
References: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
 <20160922205817.GC3179@free.fr>
Message-ID: <20160923075722.3dbee0a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 22:58:17 +0200, Yann E. MORIN wrote:

> I have not paid much attention to the previous discussion on the topic.
> 
> However, I think disabling use of pkg-config is wrong. That is qmake
> that is at fault here because, from what I understood from the previous
> discussion, it emits -isystem where it should not.
> 
> So qmake needs to be fixed to not emit -isystem in those conditions.
> 
> Removing the use of pkg-config is just papering over the real problem.
> 
> Usually, using pkg-config solves more issues than not using it.
> 
> So, I am not very happy with this patch, to say the least... :-(

I entirely agree with Yann. Disabling pkg-config is clearly not the
solution we want to use.

Alexey, have you tried the other approaches I outlined in the thread
where the initial discussion took place?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
