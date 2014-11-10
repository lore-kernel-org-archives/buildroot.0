From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 19:31:07 +0100
Subject: [Buildroot] [PATCH v2 3/4] elfutils: adapt patches to the new
 version
In-Reply-To: <1415637521-57583-4-git-send-email-Vincent.Riera@imgtec.com>
References: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415637521-57583-4-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141110193107.32b39449@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 10 Nov 2014 16:38:40 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/elfutils/0001-disable-progs.patch |   54 +++++++-------
>  package/elfutils/0002-argp-support.patch  |  120 ++++++++++++++--------------
>  package/elfutils/0003-memcpy-def.patch    |   15 ++--
>  package/elfutils/0004-fts.patch           |   69 ++++++++---------
>  package/elfutils/0005-disable-po.patch    |   25 +++---
>  5 files changed, 141 insertions(+), 142 deletions(-)

You still don't seem to understand what "bisectability" means. It means
that your series should *work* at each point of the series.

Here, if we apply patches 1 and 2 of your series, but leave patches 3
and 4 unapplied, the build will break, because patch 2 has changed the
version of elfutils being used, but changes of patch 3 are not present,
so the patches of elfutils will not apply.

Do the test yourself: apply just your patches 1 and 2, and test the
build of elfutils.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
