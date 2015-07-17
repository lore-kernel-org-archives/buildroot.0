From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2015 19:41:28 +0200
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <20150717163442.GA6466@fox>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
 <55A926DC.9010803@mentor.com> <20150717163442.GA6466@fox>
Message-ID: <20150717194128.7c22974b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 17 Jul 2015 13:34:42 -0300, Guido Mart?nez wrote:

> On Fri, Jul 17, 2015 at 09:01:32AM -0700, Hollis Blanchard wrote:
> > Hi Guido, I just ran across this discussion
> > <http://patchwork.ozlabs.org/patch/394002/> in patchwork, and wanted
> > to say I hit the same thing this week (and spent a few hours figuring
> > out what had gone wrong). Has there been any activity on the problem
> > recently?
> No, not really. We thought of changing quite a bit of the linux.mk file
> to avoid this problem but I never got around to it :(.
> 
> I'll try to work on it in the following days, however feel free to do so
> before me and send the patch :).


Due to the inactivity on this patch, it was on our TODO list of things
to tackle during the past Hackaton, but in the end we got busy with
other topics so we didn't get around to working on this.

One thing that we should do is to generalize this appended DTB
mechanism to make it possible to generate several appended images.
Currently, since we append to the zImage directly, we cannot generate
several images, each using a different DTB. By generating to
zImage.<dtb-name>, we can generate multiple images (and also avoid the
overwriting problem).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
