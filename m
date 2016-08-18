From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 00:03:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: set program-prefix to
 default ("eu-")
In-Reply-To: <1471515467-21065-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1471515467-21065-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <20160819000330.491556c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 12:17:47 +0200, Marcin Nowakowski wrote:
> Elfutils program names collide with binutils' binaries. By default
> applications provided by elfutils are prefixed with "eu-", but in
> Buildroot that setting is overridden by pkg-autotools.
> The option in pkg-autotools rules was added to avoid including a target
> triple in some packages as a prefix, so restore elfutils default
> behaviour by adding a "eu-" program-prefix.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  package/elfutils/elfutils.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

As suggested by Arnout, I've added a comment in the .mk file that
explains why we're passing a custom program prefix. I've then applied
your patch to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
