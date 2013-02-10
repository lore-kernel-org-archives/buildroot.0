From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 10 Feb 2013 09:54:54 -0800
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with
	threads support
In-Reply-To: <87wqugebb8.fsf@dell.be.48ers.dk>
References: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
 <87wqugebb8.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2zcpjXBk7hUpue3AfqWsc3ijAgb99dV4EQ9DmuF2YWXCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good point.
Will fix and resend.
Gilles.

2013/2/10 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:
>
>  Gilles> Fixes:
>  Gilles>
> http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f
>
>  Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>  Gilles> ---
>  Gilles>  package/libtirpc/Config.in |    4 ++++
>  Gilles>  1 file changed, 4 insertions(+)
>
>  Gilles> diff --git a/package/libtirpc/Config.in
> b/package/libtirpc/Config.in
>  Gilles> index 7e891b4..f2a6f83 100644
>  Gilles> --- a/package/libtirpc/Config.in
>  Gilles> +++ b/package/libtirpc/Config.in
>  Gilles> @@ -1,7 +1,11 @@
>  Gilles>  config BR2_PACKAGE_LIBTIRPC
>  Gilles>        bool "libtirpc"
>  Gilles> +      depends on BR2_TOOLCHAIN_HAS_THREADS
>
> Thanks, but you also need to propagate this dependency to libtirpc's
> reverse dependencies:
>
> git grep -l 'select BR2_PACKAGE_LIBTIRPC'
> package/conntrack-tools/Config.in
> package/lmbench/Config.in
> package/nfs-utils/Config.in
> package/quota/Config.in
> package/rpcbind/Config.in
>
> Care to fix that up and resend?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130210/50a1720c/attachment-0001.html>
