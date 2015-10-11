From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Oct 2015 22:20:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
 2.4.1
In-Reply-To: <20151011185819.GI2451@tarshish>
References: <1444589560-24258-1-git-send-email-joerg.krause@embedded.rocks>
 <20151011185819.GI2451@tarshish>
Message-ID: <20151011202050.GC24916@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, J?rg, All,

On 2015-10-11 21:58 +0300, Baruch Siach spake thusly:
> On Sun, Oct 11, 2015 at 08:52:40PM +0200, J?rg Krause wrote:
> > Remove applied upstream patch.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  package/shairport-sync/shairport-sync.mk | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> > index 36d5b82..bf1409b 100644
> > --- a/package/shairport-sync/shairport-sync.mk
> > +++ b/package/shairport-sync/shairport-sync.mk
> > @@ -4,13 +4,12 @@
> >  #
> >  ################################################################################
> >  
> > -SHAIRPORT_SYNC_VERSION = 2.4
> > +SHAIRPORT_SYNC_VERSION = 2.4.1
> >  SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
> >  
> >  SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
> >  SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
> >  SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
> > -SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/6ae067af1f695e615415cde69a506ad330dbc45b.patch
> >  
> >  # Touching configure.ac with the patches
> >  SHAIRPORT_SYNC_AUTORECONF = YES
> 
> Is this still needed, then? Maybe the comment just needs an update (git clone, 
> no configure)?

We do not have any bundled patch either, and that backported-from-upstream
patch was not touching configure.ac:

     mdns_dns_sd.c      | 2 +-
     mdns_tinysvcmdns.c | 2 +-
     2 files changed, 2 insertions(+), 2 deletions(-)

So it is not J?rg forgetting to update the comment; it was already
wrong.

But it should be fixed nonetheless, I agree.

J?rg, care to resend your patch which also updates the comment as
suggested by Baruch, please? I'm marking this patch as "Changes
Requested" on patchowrk.

Thanks!

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
