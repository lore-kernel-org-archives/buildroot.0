From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 19:06:34 +0200
Subject: [Buildroot] [PATCH v2 0/2] Add support for AXFS filesystem type
In-Reply-To: <561E7D5A.1010600@vanguardiasur.com.ar>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <20151013231428.2e611e06@free-electrons.com>
 <561E7D5A.1010600@vanguardiasur.com.ar>
Message-ID: <20151014190634.40a649a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Oct 2015 13:05:46 -0300, Ariel D'Alessandro wrote:

> > You received some feedback on both patches. Could you address this
> > feedback, and submit a new version of the patches?
> 
> Yes, right away.

Excellent, thanks!

> Moreover, "mkfs.axfs tool can receive an additional argument using the
> -i flag which points to a user-created file in the XML format; it
> indicates which pages the user desires to have marked for XIP within the
> file system image." [1]

So probably a Config.in option to specify the path to this file should
be added.

> > I remember there was even a tool to
> > run on the target to "measure" the filesystem accesses, and give some
> > hints on which pages of data should be stored uncompressed vs. which
> > pages should be stored compressed. Is this actually implemented in
> > AXFS ? 
> 
> Yes. The CONFIG_AXFS_PROFILING option is added in order to enable the
> profiling tool. Then simply running on the target platform, the AXFS
> profiler will collect data and write the information it could gather to
> /proc/axfs/volume0. See [1] for more information.

Good. This sort of into can be added in the help text of the Config.in
option.

> > If so, do you plan to add support for such functionality ?
> 
> Yes, it would be nice to add support for this functionality in order to
> explode the entire AXFS capability. I'll do this as a set of follow-up
> patches if that's OK, and let the -a flag (XIP all) for now.

Sounds like a very good plan.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
