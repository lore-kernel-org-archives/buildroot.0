From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2018 23:46:32 +0100
Subject: [Buildroot] [PATCH 4/6 v2] fs: split devices and permissions
 tables
In-Reply-To: <84c91aa0b6b8503e5d9ece861f2215058b971082.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <84c91aa0b6b8503e5d9ece861f2215058b971082.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <dd2976be-2a89-9555-829a-429b18d8f618@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/11/2018 18:33, Yann E. MORIN wrote:
> Currently, we conflate device tables and permissions tables, on the
> premise they are both created and applied with the same tool, makedevs.
> 
> Split the two, in to their own final aggregated tables and their own
> call to makedevs.

 Sorry, I don't think there is a good reason to split them up. I don't think
this enables any other improvements either - the following two patches don't
depend on this, right? I also don't feel that this change makes the code easier
to understand (not more difficult either, but if it ain't broken, don't fix it).

 So nack from me.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  fs/common.mk | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
[snip]
