From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 19:21:37 +0200
Subject: [Buildroot] [PATCH 07/24 v2] system: provide no default for
 custom skeleton path
In-Reply-To: <19c2e8c7-fae7-b828-8aff-8653ec5d705b@gmail.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <fc45f1eb2c78908429ed2dd0551097a3df653ccf.1466622379.git.yann.morin.1998@free.fr>
 <19c2e8c7-fae7-b828-8aff-8653ec5d705b@gmail.com>
Message-ID: <20160704172137.GI3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-03 10:42 +0200, Romain Naour spake thusly:
> Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> > Being custom means that our default one is not suitable to start with.
> > 
> > So there is no reson to offer it as the default path.
> > 
> > Add a separating empty line, for good measure, too.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  system/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/system/Config.in b/system/Config.in
> > index 4f9f270..04b886b 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -179,9 +179,9 @@ config BR2_ROOTFS_SKELETON_CUSTOM
> >  endchoice
> >  
> >  if BR2_ROOTFS_SKELETON_CUSTOM
> > +
> >  config BR2_ROOTFS_SKELETON_CUSTOM_PATH
> >  	string "custom target skeleton path"
> > -	default "system/skeleton"
> 
> Then, I think we should add a check in skeleton.mk if
> BR2_ROOTFS_SKELETON_CUSTOM_PATH is not empty and print an explicit error message.

ACK.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> 
> >  	help
> >  	  Path to custom target skeleton.
> >  
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
