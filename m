From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:36:24 +0200
Subject: [Buildroot] [PATCH v2] freerdp: Add support for uClibc
In-Reply-To: <1412153961-16071-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1412153961-16071-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141001193624.1f984191@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 1 Oct 2014 09:59:21 +0100, Vicente Olivert Riera wrote:
> The stable-1.1 branch of freerdp fails to build when using a uClibc
> toolchain because it's using functions which are not implemented in
> uClibc, like eventfd_read, eventfd_write and futimes. That is causing
> build failures like these ones:
> 
> ../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
> `eventfd_read'
> ../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
> `eventfd_write'
> 
> ../../common/libfreerdp-client.so.1.1.0: undefined reference to
> `futimes'
> 
> Backport upstream patch, with non-applicable parts (new files from
> master, but not in the stable-1.1 branch) trimmed down.
> 
> Upstream patch:
>   https://github.com/FreeRDP/FreeRDP/commit/5f9c36da5d5cd3c5dce49f7b32fe011cb293f9ec/
> 
> Fixes:
>   http://autobuild.buildroot.net/results/a66/a66e1ab18cd12904a64afcbf54116ceef889e966/build-end.log
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/freerdp/Config.in                          |    5 -
>  .../freerdp-0001-add-support-for-uclibc.patch      |   93 ++++++++++++++++++++
>  2 files changed, 93 insertions(+), 5 deletions(-)
>  create mode 100644 package/freerdp/freerdp-0001-add-support-for-uclibc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
