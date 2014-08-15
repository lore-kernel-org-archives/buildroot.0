From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 12:14:16 +0200
Subject: [Buildroot] [PATCH 1 of 5 v3 for 2014.08] Makefile:
 unconditionally include pkg-utils.mk
In-Reply-To: <9000c07087a57b11c709.1407957947@localhost>
References: <patchbomb.1407957946@localhost>
 <9000c07087a57b11c709.1407957947@localhost>
Message-ID: <CAHXCMMKL0OmckLCgxD8aDuO=6CSnovfRR5QvUcrqOjrdXSs8PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 13, 2014 at 9:25 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Currently, pkg-utils.mk (included via package/Makefile.in) is only included
> when a configuration file already exists. This means that none of the
> utilities it defines are available without .config.
>
> In particular:
> - the MESSAGE macro, causing pretty build output. Since some make targets
>   can be run even without .config, like 'make manual', not having this
>   pretty printing is odd.
>
> - pkgname, pkgdir: in a subsequent patch, these functions will be used for
>   the generation of the manual, and since this should work also without
>   .config, we need these functions to be available.
>
> This patch moves the include of pkg-utils.mk from package/Makefile.in to
> Makefile, outside of the check for .config.
>
> This is a quick fix. The full solution involves to minimize the amount of
> Makefile code that is guarded by a check on .config. This approach will be
> taken in the 2014.11 release cycle.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>


Reviewed-by: Samuel Martin <s.martin49@gmail.com>


Regards,

--
Samuel
