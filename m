From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 22:19:31 +0200
Subject: [Buildroot] [PATCH 3/8 RFC] package/pkg-generic.mk: allow
 custom extract directory
In-Reply-To: <1454369465-4804-4-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
 <1454369465-4804-4-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <20160601221931.39666d27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Feb 2016 00:31:00 +0100, Ludovic Guegan wrote:
> Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt |  3 +++
>  package/pkg-generic.mk                  | 12 ++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)

Do we need to allow a custom extract directory? The problem I see is
that with this change, the stamp files are no longer with the package
source code, which is a bit annoying.

Geoff and Christian instead create symlink to ensure that the Go
package source code appears at the right place in the "Go workspace". I
think it's a better approach (at least that's my feeling at the moment,
we'll see down the road if it causes problems or not).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
