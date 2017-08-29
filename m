From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Aug 2017 17:40:54 +0200
Subject: [Buildroot] Failed to build libexoxy with nvidia-driver
In-Reply-To: <d5446a67-383f-a813-58c2-2d51d6999181@mind.be>
References: <1503935622.673191.1087468320.18EAD29A@webmail.messagingengine.com>
 <d5446a67-383f-a813-58c2-2d51d6999181@mind.be>
Message-ID: <20170829154054.GA3338@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-08-28 22:57 +0200, Arnout Vandecappelle spake thusly:
> On 28-08-17 17:53, Alexandre Maumen? wrote:
> > Hi,
> > 
> > I'm trying to build libepoxy with nvidia-driver but it fails with this
> > error:
> > 
> > checking for EGL... no
> > configure: error: Package requirements (egl) were not met:
> > 
> > Package egl was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `egl.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'egl', required by 'world', not found
> 
>  Indeed, nvidia-driver selects BR2_PACKAGE_HAS_LIBEGL but doesn't install egl.pc
> (it does install gl.pc). And there's also no glesv2.pc. J?r?me, Yann, could you
> look into it?

I see Alexandre already reported sucess and explained the hack he did.
I'll look into submiting a proper patch soonish.

>  Perhaps we should add a check in the lib*gl* virtual packages that they install
> a .pc file...

Gut feelings only, but no. It is perfectly legit to be a provider of EGL
(or whatever other GL stuff) and not provide a .pc file with that.

However, I can see the benefit for consistency. But then, it puts some
burden on the packager which upstream do not provide a .pc file, to
write their own... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
