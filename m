From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Fri, 17 Jun 2016 10:35:50 +0200
Subject: [Buildroot] [PATCH 3/5] pkg-download: allow ssh URLs
In-Reply-To: <20160616194125.GE3665@free.fr>
References: <20160614150412.GF3060@hermes.click-hack.org>
 <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465916712-29684-3-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160614201426.GF3759@free.fr>
 <20160615212947.GZ23680@hermes.click-hack.org>
 <20160615213711.GA3823@free.fr>
 <20160616193635.GE32532@hermes.click-hack.org>
 <20160616194125.GE3665@free.fr>
Message-ID: <20160617083550.GI32532@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 16, 2016 at 09:41:25PM +0200, Yann E. MORIN wrote:
> Gilles, All,
> 
> On 2016-06-16 21:36 +0200, Gilles Chanteperdrix spake thusly:
> > On Wed, Jun 15, 2016 at 11:37:11PM +0200, Yann E. MORIN wrote:
> > > Gilles, All,
> > > 
> > > On 2016-06-15 23:29 +0200, Gilles Chanteperdrix spake thusly:
> > > > On Tue, Jun 14, 2016 at 10:14:26PM +0200, Yann E. MORIN wrote:
> > > > > Gilles, All,
> > > > > 
> > > > > On 2016-06-14 17:05 +0200, Gilles Chanteperdrix spake thusly:
> > > > > > Use git when such an URL is met.
> > > > > 
> > > > > What about Hg URLs that can also start with 'ssh://' ?
> > > > > 
> > > > > I guess we should not try to be smart here, and let users specify the
> > > > > method with the _SITE_METHOD variable.
> > > > 
> > > > Yeah, well, my initial patch proposed git+ssh:// and I was told that
> > > > this was deprecated. The conversation lead to a dead-end with nobody
> > > > giving me a clear indication of what I should propose.
> > > > 
> > > > So, let us go back to my initial need: have a package compiled based
> > > > on a git over ssh URL. Now if you tell me that there is a way to do
> > > > this without patching pkg-download.mk, I am all ears. I did not find
> > > > any help on that in the documentation, do you have some pointers?
> > > 
> > > As far as I understand your requirements, you want to be able to write
> > > either of:
> > > 
> > >     FOO_SITE = user at machine:path/to/repo.git
> > > or
> > >     FOO_SITE = ssh://user at machine/path/to/rpo.git
> > > 
> > > You just have to add:
> > > 
> > >     FOO_SITE_METHOD = git
> > > 
> > > See the manual, search for _SITE_METHOD: ;-)
> > >     https://buildroot.org/downloads/manual/manual.html#generic-package-reference
> > 
> > Ok, thanks.
> 
> So, that fits your requirements? Should your patch be dropped, then?

I guess so. I have not tried, but I will take your word for it. Yes,
you can drop the patch.

Regards.

-- 
					    Gilles.
https://click-hack.org
