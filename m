From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:52:52 +0200
Subject: [Buildroot] [PATCH] swig: enable support for Node.js >= 7.x
In-Reply-To: <1506686356-4509-1-git-send-email-yegorslists@googlemail.com>
References: <1506686356-4509-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20171008155252.5f08f349@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Sep 2017 13:59:16 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Recent Node.js versions have removed some depreciated API calls,
> that swig still relies on. Patches taken from this PR [1] fix
> this issue.
> 
> [1] https://github.com/swig/swig/pull/968
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../0001-Add-Node-7.x-aka-V8-5.2-support.patch     | 328 +++++++++++++++++++++
>  ...e-warnings-on-Node-6.x-aka-V8-5.0-and-5.1.patch | 222 ++++++++++++++

Applied to master.

To be honest, I hesitated a bit, those patches are a bit big and
invasive, and have not been merged upstream yet. I've merged anyway,
but we might need to drop them at the next swig bump if they haven't
been merged upstream.

Also, how do you in practice build swig with nodejs support? There is
no dependency between host-swig and host-nodejs.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
