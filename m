From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 23:07:26 +0100
Subject: [Buildroot] [PATCHv5 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <1386183373-17611-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386183373-17611-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131204220726.GD3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-04 19:56 +0100, Thomas Petazzoni spake thusly:
> This commit allows the BR2_EXTERNAL directory to contain Config.in and
> Makefile code, which gets integrated into the Buildroot build logic:
> 
>  - Buildroot automatically includes the $BR2_EXTERNAL/Config.in in the
>    top-level configuration menu.
> 
>  - Buildroot automatically includes the BR2_EXTERNAL/external.mk in
>    the build logic, so it can for example be used to include other .mk
>    files that define package recipes.
> 
> This is typically intended to be used to create target packages in the
> BR2_EXTERNAL directory, but can also be used for bootloaders, host
> packages, or other custom make logic.
> 
> We also add a dummy Config.in file in support/dummy-external/ to
> ensure that the source "$BR2_EXTERNAL/Config.in" line will point to an
> existing file even when BR2_EXTERNAL is not used by the user.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
