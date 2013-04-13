From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 20:17:06 +0200
Subject: [Buildroot] [PATCH] libfuse: not available for static builds
In-Reply-To: <1361873801-8672-1-git-send-email-gustavo@zacarias.com.ar>
References: <1361873801-8672-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130413201706.7c7460ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, 26 Feb 2013 07:16:41 -0300, Gustavo Zacarias wrote:
> Unfortunately libfuse uses dl functions exclusively so it can't be
> used for static builds so exclude it so.
> Fixes:
> http://autobuild.buildroot.net/results/a1c3d2b9c436023675c363d9d3b365c95ade0329/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I think we should apply this one. As Gustavo explained in a followup
email in this thread, libfuse doesn't support static link properly. The
build failure happened again today.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
