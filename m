From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 11:53:21 +0200
Subject: [Buildroot] [PATCH] core: do not attempt downloads with no
 _VERSION set
In-Reply-To: <20160124223345.GA31752@vostro>
References: <20160124223345.GA31752@vostro>
Message-ID: <20160703115321.33abb9be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jan 2016 00:33:45 +0200, Alex Suykov wrote:
> Currently, when the package defines no _SOURCE and no _VERSION
> variables, we end up trying to download <PACKAGE>-undefined.tar.gz.
> 
> This is utterly pointless.
> 
> Change the logic to not attempt a download when neither _SOURCE
> nor _VERSION is set:
>   - do not set an undefined _VERSION to "undefined"
>   - do not append an empty (or "undefined") version to the package
>     rawname
>   - use the package rawname in the MESSAGE macro
> 
> Consequently, for packages that have no _VERSION, the build
> directory will be just the package name (which to some may look
> nicer than the current "package-undefined").
> 
> Furthermore, the message trace is also a bit leaner (to the same
> people that find "package" nicer than "package-undefined").
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for this patch! I just sent a patch series that includes your
patch, plus several follow-up patches to clean up existing patches that
needlessly define _SOURCE to the empty value.

See http://lists.busybox.net/pipermail/buildroot/2016-July/166270.html
and following e-mails.

Consequently, I've marked your patch as "Changes Requested" in
patchwork. Of course, the new iteration preserves your authorship.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
