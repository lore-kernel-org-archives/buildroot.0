From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 30 Jun 2015 11:57:05 +0200
Subject: [Buildroot] [PATCH] perl-cross: bump to version 0.9.7
In-Reply-To: <20150629220128.2cdc5b25@free-electrons.com>
References: <1435561397-27221-1-git-send-email-francois.perrad@gadz.org>
 <20150629220128.2cdc5b25@free-electrons.com>
Message-ID: <CAB0FRst5vQG3G2+6n5Hc3nyCF+vWdqvcFYtEmf29U9TVzHPcew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-29 22:01 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Mon, 29 Jun 2015 09:03:17 +0200, Francois Perrad wrote:
>> fix some build failures,
>> see https://github.com/arsv/perl-cross/issues/17
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/perl/perl.hash | 2 +-
>>  package/perl/perl.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Applied, thanks.
>
> However, speaking of perl-cross, there is something that annoys me a
> bit: the fact that we are patching the target variant of perl by
> applying perl-cross, but not the host variant. I am currently working
> on using per-package out of tree build. This means having a single
> source tree for both the host and target variant of a given package: it
> would no longer be allowed to patch the target variant in a given way,
> and the host variant in another way.
>
> Do you think it is possible to patch both the host and target perl in
> the same way, and only depending on the configure options (or make
> variables, or whatever), do the right thing?
>

Dear Thomas,

perl-cross is not a serie of patches which fixes a broken configure script.
perl-cross is an add-on which adds an alternate configure script for
cross-compilation.
Currently, perl-cross is not extracted in the host-perl build tree,
because it is useless.
But if perl-cross is extracted, the original configure script works
fine for building a host-perl.

Alex Suykov could correct me or give more details.

Another point for perl, could you take to look to
http://patchwork.ozlabs.org/patch/477361/ ?

Fran?ois.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
