From: Marc Gauthier <marc@tensilica.com>
Date: Fri, 24 Jul 2009 06:51:59 -0700
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
In-Reply-To: <20090724153528.7103ad9d@surf>
References: <20090724055230.2080B77660@busybox.osuosl.org>
	<20090724110230.3f51597a@surf> <87zlauutcd.fsf@macbook.be.48ers.dk>
	<20090724153528.7103ad9d@surf>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D015DF9AD0A@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Ok, fair enough. Reading the patches again, they don't look too
> invasive after all.
>
> I'm concerned by the licensing of
> target/xtensa/xt-buildroot-overlay-install, since this file states:
>
> +# Copyright (c) 2003-2008 by Tensilica Inc. ALL RIGHTS RESERVED.
> +# These coded instructions, statements, and computer programs are the
> +# copyrighted works and confidential proprietary information
> of Tensilica Inc.
> +# They may not be modified, copied, reproduced, distributed,
> or disclosed to
> +# third parties in any manner, medium, or form, in whole or
> in part, without
> +# the prior written consent of Tensilica Inc.

Oops, that license is meant for internal/commercial things,
not for open source obviously.  The file started out outside
buildroot, and I didn't notice when putting it in.

You can certainly take it out other than the copyright line.
Do you want a patch for that?


> BTW, was Perl already a host dependency to run Buildroot ?

That script is not necessary to run buildroot.  It's only
useful when installing a new Xtensa processor configuration
into the buildroot sources.

Otherwise I don't think the Xtensa port has introduced any
perl dependency, although I can live with such a dependency
limited to the Xtensa arch.

Thanks!
-Marc
