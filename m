From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 7 Apr 2019 00:24:14 +0300
Subject: [Buildroot] [PATCH 1/1] infra/Makefile.in: Fix format_arg
 issues after bump gettext-tiny to c6dcdcd
In-Reply-To: <20190406210516.GF2659@scaer>
References: <20190404224700.1346-1-vadim4j@gmail.com>
 <20190404230503.ohxfkac6extrghuv@vkochan-ThinkPad-T470p>
 <20190406205356.GE2659@scaer> <20190406210516.GF2659@scaer>
Message-ID: <20190406212414.35qlmmpgklgt4ohy@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All

On Sat, Apr 06, 2019 at 11:05:16PM +0200, Yann E. MORIN wrote:
> Vadim, All,
> 
> On 2019-04-06 22:53 +0200, Yann E. MORIN spake thusly:
> > On 2019-04-05 02:05 +0300, Vadim Kochan spake thusly:
> > > On Fri, Apr 05, 2019 at 01:47:00AM +0300, Vadim Kochan wrote:
> > > > After bump gettext-tiny to c6dcdcd there was change which enabled
> > > > gettext's macroses by default in:
> > > > 
> > > >     https://github.com/sabotage-linux/gettext-tiny/commit/58187329ad9f00eb8c39379e7ee0b608dd14bab8
> > > > 
> > > > it leads libglib2 to fail with format_arg issues. So fix it by disabling
> > > > these macroses and use rather external functions which requires linking.
> > > > 
> > > > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > > > ---
> > > > I dont feel like this is a good solution actually. I need to clearly understand
> > > > why just using gettext's macrosses does not work for libglib2. But anyway I am
> > > > sending this patch to show the possible solution.
> > [--SNIP--]
> > > I think that may be package/Makefile.in is not good place for this but
> > > better to add another patch which will disable these macrosses ?
> > 
> > Indeed, I don;t think this is th3e correct fix.
> > 
> > Instead, I suggest we use what upstream did apply very recently:
> >     https://github.com/sabotage-linux/gettext-tiny/commit/73fc3e7ef7e016a3874b632fd0475969d288f309
> 
> Besides my usual typoes, I wsa mislead by the title of that patch. It
> does not fix the actual issue we have.
> 
> Furthermore, we already have that patch in our tree anyway.
> 
> Forget what I said.
> 
> Regards,
> Yann E. MORIN.
> 
> > Oh, wait, that name rings a bell... ;-)
> > 
> > Can you send a bump to gettext-tiny, now? ;-)
> > 
> > Regards,
> > Yann E. MORIN.

Yes, today the sabotage maintainers applied my modified version of the
patch which is in buildroot tree, and yes this is a different issue.

But I am not sure if the package/Makefile.in is the righ place to fix
this new issue, may be better to add another patch into package/gettext-tiny
to disable these macrosses with simple '#if 0', because Makefile.in
should be more generic instead to keep package-specific fixes.

Regards,
Vadim Kochan
