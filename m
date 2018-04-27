From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 27 Apr 2018 11:33:37 +0000
Subject: [Buildroot] [BUG] package host-ncurses cause display incorrect
 when 'make linux-menuconfig'
In-Reply-To: <CAFkzVZYME-faSz7vrbny4Nb9BSexWWJcJ4F8dyT_Uk_sz3-Dww@mail.gmail.com>
References: <CAFkzVZYME-faSz7vrbny4Nb9BSexWWJcJ4F8dyT_Uk_sz3-Dww@mail.gmail.com>
Message-ID: <CAFkzVZYkk-fH9OBr3PVgf84HofDuBeqt28v+GTOocfRKWNttHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnount,

I just found your patch
[Buildroot] [PATCH] package/ncurses: enable widechar for host build
sloved my question.

Thanks very much.

Scott Fan


On Fri, Apr 27, 2018 at 6:52 PM Scott Fan <fancp2007@gmail.com> wrote:

> Hi, all:
>
> I found when the BR2_PACKAGE_NCURSES config selected, AFTER building
> completed, if i run 'make linux-menuconfig', screen will show various
> unreadable char such as the attached.
>
> If  i remove the following two lines:
> NCURSES_DEPENDENCIES = host-ncurses
> $(eval $(host-autotools-package))
>
> then the display issue will not again. It is obvious that when building
> the host-ncurses, it has incorrect configuration.
>
> Any one can help me?
>
> Thanks very much.
>
> Scott Fan
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180427/fe9ebbe4/attachment.html>
