From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 Sep 2018 23:52:48 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with gcc <= 4.7
In-Reply-To: <20180920235038.1cb70d40@windsurf>
References: <20180917165547.30222-1-fontaine.fabrice@gmail.com>
 <20180920235038.1cb70d40@windsurf>
Message-ID: <CAPi7W81qKeF0JmMK06e0QaHJycGbLT_LvPMdd61ykwq51eKSBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le jeu. 20 sept. 2018 ? 23:50, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> Hello,
>
> On Mon, 17 Sep 2018 18:55:47 +0200, Fabrice Fontaine wrote:
> > sleep_for is not always defined with gcc <= 4.7, see
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680
> >
> > To fix this issue, add -D_GLIBCXX_USE_NANOSLEEP if gcc version is lower
> > than 4.8
>
> First comment in the bug report says:
>
> """
> Don't define that manually,  you should configure gcc with
> --enable-libstdccxx-time instead.
> """
>
> So I'm not sure enthusiastic with going in this direction. What about
> making domoticz depend on gcc >= 4.8 ?
>
OK, I will send a new patch with this dependency.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180920/3e9a99cb/attachment.html>
