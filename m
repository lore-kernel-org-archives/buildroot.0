From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 6 Oct 2014 19:37:08 +0200
Subject: [Buildroot] [UNSURE]Re: [PATCH 5/6] intltool: refactor with
	host-perl
In-Reply-To: <20141006173746.19e1109d@free-electrons.com>
References: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
 <1408471638-4551-5-git-send-email-francois.perrad@gadz.org>
 <20140820142128.62163ff9@free-electrons.com>
 <CAB0FRsskEMr08iL9=Fcmmi=StVdCPk84jQcJC1V044tUi7hY2Q@mail.gmail.com>
 <20141006173746.19e1109d@free-electrons.com>
Message-ID: <CAB0FRssiatra-bT6RTGCN0=TTnwYb5tOVVVU+v_msRhzc+q=-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-10-06 17:37 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Fran?ois Perrad,
>
> On Wed, 20 Aug 2014 18:45:07 +0200, Fran?ois Perrad wrote:
>
>> host-intltool depends on host-perl-xml-parser,
>> and now, host-perl-xml-parser depends on host-perl.
>>
>> A host-perl-foo-module cannot depend on host-perl OR system-perl.
>> All host-perl-foo-module must depend on host-perl.
>
> Sorry, but it's not acceptable to have host-intltool depend on
> host-perl. It's bringing a huge dependency (host-perl) in a large
> number of configurations, since host-intltool is used by so many
> packages.
>
> I had a discussion with Gustavo about this not long ago, and here is
> our proposal: change host-perl-xml-parser to *not* use the perl package
> infrastructure, as an exception. This way, it will not depend on
> host-perl, and we'll be happy. Of course, it's a bit ugly because we
> have a Perl package not handled by the package infrastructure, but
> that's a reasonable solution for this problem.
>

Ok, I'll experiment this proposal.

Fran?ois

> Another approach would be to make host-intltool not depend on
> XML::Parser. It seems like it's possible to get rid of the XML::Parser
> dependency by passing no-xml as the second argument of the
> IT_PROG_INTLTOOL macro. But this needs to be done in each and every
> package using intltool. All of the packages that are not using XML
> based translation files could pass no-xml, and we would get rid of the
> dependency on host-perl-xml-parser for those packages. That could be
> one option.
>
> Since the vast majority of projects seem to be using "ini style"
> translation files, we could probably use no-xml on many of them and get
> rid of the problem.
>
> Thoughts?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
