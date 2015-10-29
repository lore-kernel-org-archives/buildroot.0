From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 29 Oct 2015 11:08:50 +0100
Subject: [Buildroot] [PATCH] skeleton: add "operator" group
In-Reply-To: <877fm67hb0.fsf@dell.be.48ers.dk>
References: <1446048540-25164-1-git-send-email-jezz@sysmic.org>
 <877fm67hb0.fsf@dell.be.48ers.dk>
Message-ID: <1673086.6y1DTqGGku@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 28 October 2015 23:35:15 Peter Korsgaard wrote:
> >>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:
>  > gid 37 was referenced in /etc/passwd but not in /etc/group
>  > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>  > ---
>  > 
>  >  system/skeleton/etc/group | 1 +
>  >  1 file changed, 1 insertion(+)
>  > 
>  > diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
>  > index ba20e90..c813da2 100644
>  > --- a/system/skeleton/etc/group
>  > +++ b/system/skeleton/etc/group
>  > 
>  > @@ -16,6 +16,7 @@ video:x:28:
>  >  audio:x:29:
>  >  tape:x:32:
>  > 
>  >  www-data:x:33:
>  > +operator:x:37:
> Committed, thanks.
> 
> I guess this means it wasn't used anywhere? Perhaps we should better
> remove the user/group?

In fact, I think many users/groups are useless. According to [1] and 
after checked groups used by udev:

  - groups "wheel", "operator", "staff", "lock", "netdev" and users
    "operator", "sync" can been safely removed

  - I think users/groups "daemon", "bin" and "sys" are now obsolete and
    can also been removed

  - "mail" and "www-data" should only exist if an MTA/webserver is
    enabled.

  - udev use "input" group (currently "input" group exist only if
    systemd is enabled)

  - group of /etc/shadow should be "shadow"

In add, since skeleton is now a real package we may define users and 
groups using SKELETON_USERS variable instead of maintaining 
passwd/group/shadow.

I can do these changes if there is a consensus on it.

[1] 
http://wiki.gacq.com/index.php/Debian_default_system_groups_description

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
