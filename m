From: Ralph Siemsen <ralphs@netwinder.org>
Date: Thu, 22 Aug 2013 15:13:03 -0400
Subject: [Buildroot] [PATCH] apply-patches: run patch in batch mode
In-Reply-To: <1377150255-4940-1-git-send-email-arnout@mind.be>
References: <1377150255-4940-1-git-send-email-arnout@mind.be>
Message-ID: <20130822191303.GC13096@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 22, 2013 at 07:44:15AM +0200, Arnout Vandecappelle (Essensium/Mind) wrote:

> If the file to be patched is missing, then `patch' will interactively
> ask for a file to be patched. This is annoying in e.g. the autobuilders
> because they have to wait for a timeout instead of failing.

Hi Arnout,

I believe you are seeing the same issue I reported recently.
My solution was to test for the patch existence explicitly:
http://patchwork.ozlabs.org/patch/266895/

-Ralph
