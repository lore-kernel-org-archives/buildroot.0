From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:39:32 +0200
Subject: [Buildroot] [PATCH 16/20] perl-http-entity-parser: new package
In-Reply-To: <CAB0FRss=pJyhxu8CsmcUkozPZkmHDnScRL2u++fMPiBehPeW=g@mail.gmail.com>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-17-francois.perrad@gadz.org>
 <20181008163901.3933d098@windsurf>
 <CAB0FRss=pJyhxu8CsmcUkozPZkmHDnScRL2u++fMPiBehPeW=g@mail.gmail.com>
Message-ID: <20181008213932.3dfa6bc8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Oct 2018 21:35:31 +0200, Fran?ois Perrad wrote:

> > This line should be split with backslashes. Perhaps scancpan could be
> > improved to do that automatically ?
> >
> Good idea, I'll do this easy improvement.

Thanks.

> Currently, scancpan uses the same list of dependency for Config.in and
> perl-foo.mk.
> So, yes, many dependencies are just run time dependency.
> Real build time dependencies are :
>   - host(-perl-foo) dependencies
>   - native libraries dependencies which cannot be handled by scancpan
> 
> A fix for that requires rethinking of the logic of scancpan and serious
> testing.

I think we really want to solve this problem. Having extra build-time
dependencies is not nice, especially with the (hopefully coming)
top-level parallel build, as it will prevent additional parallelization
of the overall build process.

Is this something you could have a look at ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
