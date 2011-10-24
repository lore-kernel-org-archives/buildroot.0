From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 24 Oct 2011 23:54:42 +0100
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111024173815.2277c6dd@skate>
References: <20111024173815.2277c6dd@skate>
Message-ID: <CAAu5YTaZHudEQ+1vZoYA0v-RRVZ_tVm07ykR389vH9iaqMgNKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar 24 DF?mh 2011 ag 16:38, scr?obh "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com>:
>
>  * Tracking of files installed by packages. Do we care ? Is this an
>   important feature of Buildroot ? Won't the added complexity make
>   Buildroot more complicated to understand ?
>
>   Which solution ? Two solutions:
>
>    - Change the installation steps of packages so that each package
>      installs in a different directory.
>
>      Pros:
>
>        seems to be the cleanest solution.
>
>        allows to easily detect packages overriding files installed by
>        other packages.
>
>      Cons:
>
>        requires modifications of all gentargets packages to use
>        $$(STAGING_DIR) and $$(TARGET_DIR) instead of $(STAGING_DIR)
>        and $(TARGET_DIR).
>

Hello all,
A few months back I posted a patch set that provided a primitive, but
functional, first attempt at this feature (as a separate target install
stage in addition to the existing method) after being prompted to share by
Yann. I don't think I saw any response but I do remember ThomasP saying on
IRC that it was too simplistic and that he would comment in detail on the
list but it seems to have fallen off his (long) list of tasks.
I might take this opportunity to ask for comment again. One thing is that it
needed no extra $ on TARGET_DIR for gen-/auto-targets. The value of
TARGET_DIR is simply overridden to be "output/package/$package".

The reason I "care" about this kind of thing is to allow packaging of the
build components for separate download to the target. I doubt I'm the only
one with such a need - never mind the possibility of package uninstall and
other as yet unconsidered purposes.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111024/44a3f729/attachment.html>
