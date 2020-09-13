From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:27:46 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <20200609224116.13607-2-nolange79@gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
Message-ID: <20200913152746.162379db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Jun 2020 00:41:15 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Drop default dependencies, haveged needs nothing but
> local sockets and /dev/random.
> 
> The service file now mostly matches the upstream fedora file,
> except alot of isolation options have been dropped.
> The benefit for a completely controlled system is small,
> and those option would pull in dependencies, delaying
> entropy being filled up.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/haveged/haveged.service | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)

The consensus on this patch was not huge, but after reading the
comments from the different parties, it seems like the opposition was
not very strong. So I applied this patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
