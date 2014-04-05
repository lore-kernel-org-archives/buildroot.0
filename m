From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 18:39:32 +0200
Subject: [Buildroot] [PATCH] support/mkusers: fix warnings when adding a
 new user
In-Reply-To: <1396715083-20764-1-git-send-email-yann.morin.1998@free.fr>
References: <1396715083-20764-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140405183932.6fdb1b07@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  5 Apr 2014 18:24:43 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> When adding a new user (or a new group), we would get warnings, like:
>   [...]/support/scripts/mkusers: line 145: [: too many arguments
> 
> This is because we're checking if a UID (or a GID) is already defined,
> and/or is different from the requested one, both checks in the same
> test.
> 
> Of course, if a UID (or a GID) is not defined, it does not have a value,
> so we can not compare it to an integer.
> 
> Fix that by splitting the test in two, so the second is only executed if
> the first is sucessful.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/scripts/mkusers | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
