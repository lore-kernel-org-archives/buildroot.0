From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 21:50:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/openrc: install sysv-rcs file
In-Reply-To: <20191219214429.757aff57@windsurf>
References: <20191219190135.7013-1-aduskett@gmail.com>
 <20191219214429.757aff57@windsurf>
Message-ID: <20191219205036.GO26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Adam, All,

On 2019-12-19 21:44 +0100, Thomas Petazzoni spake thusly:
> On Thu, 19 Dec 2019 11:01:35 -0800
> aduskett at gmail.com wrote:
> 
> > From: Adam Duskett <aduskett@greenlots.com>
> > 
> > package/openrc has the file sysv-rcs which starts sysvinit services
> > not written for openrc. However, currently it is not installed to
> > the target.
> > 
> > Install this file to $(TARGET_DIR)/etc/init.d during the
> > target_install step.
> > 
> > Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> 
> Michal had what seems like a more elaborate solution:
> 
>   http://patchwork.ozlabs.org/patch/1098590/
> 
> Michal, could you comment ?

We already have 162044407b (package/skeleton-init-openrc: add support
for starting sysv scripts) which was edited by me, but I missed the fact
that the script was not installed.

Adam, care to investigate what is different between our script, and the
one from the package itself?

I am all in favour of dropping our script, if upstream has a functional
one.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
