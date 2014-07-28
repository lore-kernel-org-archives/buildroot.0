From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 28 Jul 2014 07:05:28 +0000
Subject: [Buildroot] [PATCH] gcc: explicitly use CFLAGS_FOR_TARGET
 instead of --enable-target-optspace
In-Reply-To: <1405351786-4445-1-git-send-email-abrodkin@synopsys.com>
References: <1405351786-4445-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1406531128.3364.1.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Mon, 2014-07-14 at 19:29 +0400, Alexey Brodkin wrote:
> Due to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=2222 it's impossible
> to specify custom CFLAGS_FOR_TARGET, it is alway gets overriden with values
> from "config/mt-ospace":
> ===========
>  CFLAGS_FOR_TARGET = -g -Os
>  CXXFLAGS_FOR_TARGET = -g -Os
> ===========
> 
> But in some situations it's required to pass custom flags on buildong of libgcc:
>  * Default flags "-g -Os" lead to build isses as with PowerPC on gcc 4.5
> (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810)
>  * Particular CPU requires specific instructions for HW support
>  * Deep optimizations

Any chance for this one to be commented/applied?

Regards,
Alexey
