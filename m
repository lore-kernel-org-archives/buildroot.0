From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 08 Nov 2013 19:35:39 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <87bo1vffvg.fsf@dell.be.48ers.dk>
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk> <20131106231048.67cf2d52@skate>
 <87k3gljh5d.fsf@dell.be.48ers.dk> <20131106225332.GB3482@free.fr>
 <8738n9jfim.fsf@dell.be.48ers.dk>
 <OFAD27391D.CFE95723-ON86257C1B.007F5691-86257C1B.007F8A75@rockwellcollins.com>
 <87txfphzyb.fsf@dell.be.48ers.dk> <87bo1vffvg.fsf@dell.be.48ers.dk>
Message-ID: <cc6d9da1-5657-4412-aa94-4e5b3d8b4eab@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
>Hi,
>
> > I personally dislike the patch as it's a bit of a hack, but if there's
> > really a need for something like this then perhaps - But wouldn't it
> > make more sense if we instead tried harder to ensure all the package
> > versions we support were available on our mirror?
>
>FYI, I've changed sources.buildroot.net to simply do:
>
>make -k \
> $(find package -name \*.mk|sed 's|.*/\([^/]*\)\.mk|\1-source host-\1-source|'
>
>E.G. foo-source + host-foo-source for all .mk files under package. It
>also doesn't cover everything (E.G. packages with version selection),
>but it gets the host packages and doesn't need any changes to buildroot
>itself.
>

You should probably add boot/ there as well.
