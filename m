From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 13:23:29 -0300
Subject: [Buildroot] [PATCH 1/7 v4] download/git: add warning not to use
 our git cache
References: <55853fb3c8873211025fb58cdc2777fb0fdaf25a.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <5ae5f181cd741_7b92af911f316e8881e6@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 28, 2018 at 04:34 PM, Yann E. MORIN wrote:

> We really want the user not to use our git cache manually, or their
> changes (committed or not) may eventually get lost.
> 
> So, add a warning file, not unlike the one we put in the target/
> directory, to warn the user not to use the git tree.
> 
> Ideally, we would have carried this file in support/misc/, but the git
> backend does not have acces to it: the working directory is somewhere

s/acces/access/

> unknown, and TOPDIR is not exported in the environment.
> 
> So, we have to carry it in-line in the backend instead.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[The typo in the commit log can be fixed while applying.]
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with only this patch applied: the warning file is correctly created/updated on
 dl/<package>/]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
