From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Dec 2015 13:51:23 -0300
Subject: [Buildroot] [PATCH] gettext: add dependency on host-libxml2 for
 host-gettext.
In-Reply-To: <55F6E339.90805@imgtec.com>
References: <20150220222933.5B92D817C4@busybox.osuosl.org>
 <1424696593-21361-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150223191721.573fdb19@free-electrons.com> <20150224222402.GD4783@free.fr>
 <55F6E339.90805@imgtec.com>
Message-ID: <5682BA0B.4010401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/09/15 12:09, Vicente Olivert Riera wrote:

> Given the following reasons:
>
> - The difference of build time caused by using host-libxml2 is not that
> much, as Yann said.
>
> - We normally prefer to rely on external libraries
>
> - Other packages could benefit on having host-libxml2 already built.
> Otherwise we could end up with building libxml2 twice, the one bundled
> in gettext and the external one.
>
> I vote for using the host-libxml2 package instead of the bundled libxml2.
>
> Regards,
>
> Vincent.

Hi All.
Given my recent bump to gettext 0.19.7 libxml2 is now required more than 
ever for the new ITS handling code.
The problem now is that older libxml2 versions might not be enough for 
host-gettext and result in build failure:
http://autobuild.buildroot.net/results/1b7/1b7b1244ccab111dbcdb6350525077d2a7157d91/build-end.log

It is silly that the configure script doesn't check for this, however we 
can't make conditionals for host packages (or better said, for things 
that may or may not be present in the distro), and i follow the same 
line of reasoning of avoiding bundled duplication - it's more a matter 
of build time than space for host packages, but still.

I'd vote for making it so as well.

Regards.
