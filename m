From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2016 11:34:11 +0100
Subject: [Buildroot] [PATCH 32/84 RFC] package/gstreamer: include
 plugins from gstreamer's real Config.in
In-Reply-To: <5687262A.3030300@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <14c33d26a86cb2bb6673d5f053fb871dbfe9b8c8.1451076704.git.yann.morin.1998@free.fr>
 <56847303.4040608@mind.be> <20151231172336.GD3495@free.fr>
 <5687262A.3030300@mind.be>
Message-ID: <20160102103411.GC3477@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-02 02:21 +0100, Arnout Vandecappelle spake thusly:
> On 31-12-15 18:23, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2015-12-31 01:12 +0100, Arnout Vandecappelle spake thusly:
> >> On 25-12-15 22:25, Yann E. MORIN wrote:
> >>> It is more logical to have a single if-clause, rather than repeat it in
> >>> another file, possiblty brealking indentation like it previously was.
> >>
> >>  I actually preferred the way it was indented before. Now there is no
> >> distinction anymore between the gstreamer options and the additional plugin
> >> packages.
> > 
> > Yes, that is on-purpose. The gstreamer plugins are really "sub-options"
> > (in the end-user experience) of gstreamer. That they are in fact
> > completely different packages is still irrelevant to him. ;-)
> 
>  Well, according to that reasoning the packages should not be shown and instead
> only the plug-in list should be there. I don't think we're going to do that.

No, especially since it is totally possible to use gstreamer even
without the base plugins, using only local (aka proprietary) plugins.

>  The reason I had less of a concern about gstreamer is because here most of them
> are in fact pieces of the same project (like kodi, xorg, matchbox, etc).

OK, I understand now.

But for Kodi, not all the addons are managed by the "Kodi project". For
example, most if not all the PVR addons are completely separately
developped.

> The
> others (python, php, ...) are really external plugins. Of course there are also
> some "external" plugins here, but even those tend to get absorbed by the
> superproject eventually (like what happened with gst-omx for instance).

I now see what was the difference for you, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
