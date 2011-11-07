From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2011 13:39:02 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
References: <20111102160349.4afe5935@skate>
 <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
Message-ID: <20111107133902.416ccf35@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 7 Nov 2011 10:58:22 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > This report has been written by Thomas Petazzoni, with reviews and
> > comments of Yann E. Morin and Peter Korsgaard. It has been written
> > after the developer day based on memory and raw notes and may
> > therefore be slightly inaccurate in places.
> 
> Also from me, thanks a lot for writing this...

I hope that was useful. Unfortunately, not many Buildroot
users/developers could join, and I really want the community to be
involved in the various decisions, so I felt it was necessary to
provide an extensive report, including our discussions and arguments
for the various decisions.

> > We have therefore decided to make the crosstool-NG backend the
> > default toolchain build mechanism in 2012.02. This will be notified
> > in the 2011.11 release. For the moment, the internal build
> > mechanism will remain available.
> 
> One thing I really like about the internal build mechanism is that
> it's internal. If you want to modify something about it, you can
> directly patch the code and submit to the list.

Right. For crosstool-NG you can also patch the code and submit to the
crosstool-NG list. However I agree that some additional steps are
needed, but we think that the advantage of factorizing the toolchain
build problem in crosstool-NG is much stronger than the drawback you're
mentioning.

> This not only holds for the generation of the toolchain, but also for
> side-aspects like downloading the necessary tarballs and patching.
> Since crosstool-ng is treated as a package (at least currently it
> is), any change you want to make to it, has to be done by adding a
> patchfile to package/crosstool-ng/. This is much more cumbersome than
> modifying buildroot files.
> For example, I added scp support to buildroot some time ago, and use
> it for the primary download site. When switching to crosstool-ng, this
> no longer worked, I had to add scp support again.
> 
> I think it would be beneficial to buildroot if the integration of
> crosstool-ng could increase. For example, crosstool-ng using the
> download mechanisms of buildroot.

That could be discussed with Yann. I'm not sure how this could work
practically, though.

> > Next Buildroot Developer Day
> > ============================
> >
> > The next Buildroot Developer Day will take place on Friday, 3rd
> > February 2012 in Brussels, Belgium. The FOSDEM conference
> > <http://www.fosdem.org> will take place in Brusells on Saturday and
> > Sunday. All Buildroot developers and users are invited to join. The
> > exact location will be given later, but it will be a location in
> > Brussels center, accessible by metro.
> 
> Great, I hope to be able to join this time.

Great!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
