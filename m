From: D. Olsson <hi@senzilla.io>
Date: Sun, 10 Jan 2021 09:37:14 +0000
Subject: [Buildroot] [PATCH v3 02/11] boot/mv-ddr-marvell: Bump to HEAD
 as of 20201207
In-Reply-To: <X/mwVYvTNW+tGYiV@curiosity>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-3-hi@senzilla.io> <X/mwVYvTNW+tGYiV@curiosity>
Message-ID: <cGJJkB-og8Jn4-_QkIs51CQXDaGcbNU611Z7EItf9_VAvIcfmnDOq2ikgutqZVlNQXds65qfBwogvb6QZhYswMLsMeb-evjf_8NEAJsqVok=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Saturday, January 9, 2021 1:32 PM, Sergey Matyukevich <geomatsi@gmail.com> wrote:

> My apologies for the late feedback. This change breaks the
> build for MacchiatoBin board. I guess it also breaks the
> build for ClearFrog GT 8k board. The reason is straightforward: > both boards make use of Marvell ATF v18.12.x which is
> compatible with mv-ddr-marvell release devel-18.12.x.
> Your change bumps mv-ddr-marvell version, however the new
> version is not compatible with older Marvell ATF release since
> mv_ddr_topology_map structure has been changed.

I'm very sorry for breaking this! I thought I tested a build with the original MacchiatoBin defconfig, but clearly my testing was flawed!

> Could you please clarify the reason behind this change ? There
> are no users for mv-ddr-marvell other than Marvell ATF that is
> used only for MacchiatoBin and ClearFrog GT 8k boards. So on
> the first glance it looks like this change has been introduced
> as an accompanying update/cleanup during your work on adding
> EDK2 firmware.

Bumping to a later version of mv-ddr-marvell was required in
order to successfully built with mainline ATF, which in turn is
required in order to build well with the latest release of EDK2.
Based on my brief analysis, most of the patches in Marvell's ATF
has made it upstream to ATF v2.4 (or earlier). So I thought the
best and most secure approach would be to use mainline.

> If so, then I would suggest to revert this particular commit.
> Let me know if you have any objections for this change.

May I propose that we "roll-forward" instead, and update all
Marvell defconfigs to use mainline ATF instead? I believe this
would add the most value for Buildroot users, having access to
the latest and most stable fixes. What do you think?

I'll submit a patch for comments in the next day or so!


Cheers

Dick Olsson
PGP: 8204A8CD
