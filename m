From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 5 Jun 2019 10:03:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: fix lzma
 detection
In-Reply-To: <CADHdJwCpXFQr_RgC3O-+oe51taxzaUPZZoQgK5ph501tVMP0WQ@mail.gmail.com>
References: <20190604210753.15731-1-fontaine.fabrice@gmail.com>
 <CADHdJwCqoc-iEtLy6m_k6HtK74TXThi5+jCK=rzFw3FM+ThvsQ@mail.gmail.com>
 <CAPi7W814HMZOEJshjpbgxMw2B4WBjTnY-LqgDo59fm7DYLsSmg@mail.gmail.com>
 <CADHdJwCpXFQr_RgC3O-+oe51taxzaUPZZoQgK5ph501tVMP0WQ@mail.gmail.com>
Message-ID: <CAPi7W81P8fke+2Sp-+D9kQCHrjG2G+gp+oP=csFa3rwVmD42aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 5 juin 2019 ? 09:58, Mirza Krak <mirza.krak@northern.tech> a ?crit :

> On Wed, Jun 5, 2019 at 9:47 AM Fabrice Fontaine <
> fontaine.fabrice at gmail.com> wrote:
>
>> Hello,
>>
>> Le mer. 5 juin 2019 ? 09:36, Mirza Krak <mirza.krak@northern.tech> a
>> ?crit :
>> >
>> > On Tue, Jun 4, 2019 at 11:08 PM Fabrice Fontaine
>> > <fontaine.fabrice@gmail.com> wrote:
>> > >
>> > > Use CGO_CFLAGS and CGO_LDFLAGS to help mender-artifact to find lzma.h
>> > > and link with liblzma (with a correct rpath)
>> > >
>> > > Fixes:
>> > >  -
>> http://autobuild.buildroot.org/results/b436d50a11687afa7021efc7eedd24fc337b0994
>> >
>> > I also sent a patch [1] trying to resolve these build errors, but my
>> > approach was to patch the pkg-golang.mk instead of mender-artifact.mk
>> > as I would expect this problem to exist for any golang host package
>> > that is using CGO, and is not isolated to mender-artifact.mk (though
>> > is is probably the only package in Buildroot that does use CGO in host
>> > environment).
>> I missed your patch, I think your approach is better and so I'll set
>> my patch as Not Applicable.
>> However, your patch will add HOST_{C,LD}FLAGS to CGO_{C,LD}FLAGS for
>> host but also for target packages. I think this modification should be
>> done only for host packages.
>
>
> It should not as GO_HOST_ENV is only used when building host package.
>
OK

>
>
>> Moreover, you didn't get any rpath
>> related errors?
>>
>
> Not when using HOST_LDFLAGS variable, which sets "-Wl,-rpath" correctly.
>
OK, then your patch is definitely better than mine :-)

>
> --
> Mirza Krak | Embedded Solutions Architect | https://mender.io
>
>  Northern.tech AS <https://northern.tech> | @northerntechHQ
> <https://twitter.com/northerntechhq>
>
Best Regards,

Fabrice

>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190605/8f7c8091/attachment.html>
