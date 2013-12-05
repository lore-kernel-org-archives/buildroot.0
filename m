From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 5 Dec 2013 20:43:53 +0100
Subject: [Buildroot] [PATCHv7 3/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <1386270673-16051-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386270673-16051-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJUKWyLJecm9H8VioZFxK=r+pD+m5RFp+5QZS0H8UXpJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

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
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
>
Tested-by: "Samuel Martin" <s.martin49@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/192d0d97/attachment-0001.html>
