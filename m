From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 16 Oct 2014 14:38:12 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <20141011162152.GA4254@free.fr>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20141011162152.GA4254@free.fr>
Message-ID: <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Sat, Oct 11, 2014 at 6:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> We've been discussing this ejabberd patch during the current Developpers
> Day in D?sseldorf.
>
> Given the current issues that ewre noticed with building ejabberd, we
> decided to mark the patch as Rejected in patchwork.
>
> This means that we rejected that very specific patch, *not* that we
> decided not to have ejabberd. But before it gets included, all the
> issues must be fixed first, especially the build-time downloading of
> dependencies, as well as all the remarks that were made by Thomas and I.

Sure, it makes sense to me as well. As I said in a previous mail, I
did fix my patch to include your remarks, but two:
1. Fix ejabberd build system to not download dependencies at build time.
2. Avoid to use a fix UID and GID for ejabberd user.

I don't know if I should republish the patch before fixing these two issues.
I'd like your help on both of them.

** Fix ejabberd build system
** ===================
The only solution i see is to create a buildroot package for every
ejabberd dependency, listed in rebar.config.script :
esip, goldrush, lager, p1_cache_tab, p1_iconv, p1_stringprep, p1_stun,
p1_tls, p1_utils, p1_xml, p1_yaml, p1_zlib, xmlrpc
Then, modify ejabberd package to not use rebar at all, or at least to
not call rebar get-deps. Thus, if I remove deps from the `all'
makefile rule and deps/.build from the `src' rule dependency, it might
work.

Do you have a better idea?

** Avoid to use a fix UID and GID for ejabberd user
** ===================================

I still don't know how I could set the correct permissions to ejabberd
files in <PKG>_PERMISSIONS if I set -1 for UID and GID in <PKG>_USERS

Best regards,
-- 
Johan
