From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 6 Jan 2015 11:05:42 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
	infrastructure
In-Reply-To: <20150106092438.1d427cc3@free-electrons.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
 <20150104222307.009f6e73@free-electrons.com>
 <20150104222038.GD31970@free.fr> <20150105103116.74bbc777@free-electrons.com>
 <20150105215956.GC5077@free.fr> <20150106092438.1d427cc3@free-electrons.com>
Message-ID: <CAJtjsKaKdePD-1DEKvSQyuPaLTkQ-n3L9+9ggCpzeiTXCPSDNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann, All,

On Tue, Jan 6, 2015 at 9:24 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 5 Jan 2015 22:59:56 +0100, Yann E. MORIN wrote:
>
>> In the end, I did not implement that because it is too much overkill.
>> Also, I kept _CONFIGURE because it is what people do expect: the package
>> needs to be configured before being built. But I am not completely
>> opposed to changing the variable name. _USE_AUTOTOOLS or _USE_AUTOCONF
>> is equally fit, I guess (although I'd still prefer _AUTOTOOLS, because
>> it matches the fact that we call back to the autotools infrastructure
>> underneath.
>
> Unfortunately, I disagree on this. "Configure" is a very vague term,
> which does not necessarily mean "run an autoconf generated ./configure
> script". We do have certain generic-package packages that do provide an
> implementation for the <pkg>_CONFIGURE_CMDS that aren't calling an
> autoconf generated ./configure script.
>
> Moreover, a non-autoconf using rebar package may want to implement its
> <pkg>_CONFIGURE_CMDS to do some stuff. But it would have to keep
> <pkg>_CONFIGURE set to NO. This is really confusing.
>
> Please, use <pkg>_USE_AUTOTOOLS, <pkg>_AUTOTOOLS or <pkg>_USE_AUTOCONF.
> I tend to prefer the latter, because this is really what the user is
> seeing: the package is using autoconf. You say you prefer _AUTOTOOLS
> because it matches the fact that we're using the autotools
> infrastructure underneath, but that's an implementation detail. It's
> much better to expose things that make sense for the package developer
> that things that relate to implementation details, IMO.

I tend to agree with Thomas on this point and not only because I've
already modified all erlang packages to the USE_AUTOCONF syntax ;-)
Actually, even though pkg-rebar uses the autotools infrastructure, it
does redefine the BUILD_CMDS. So automake is never called. Using the
term AUTOTOOLS might be confusing to the package developer as he would
expect its Makefile.am to be read.
I'm going to push a new version soon, so you can modify it if you want.
-- 
Johan
