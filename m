From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 4 Dec 2019 09:02:36 +0100
Subject: [Buildroot] [PATCH] utils/scanpcan: follow Perl version
In-Reply-To: <a5c75b33-6dc6-d15a-25cb-3ecdd685a3b7@mind.be>
References: <20191203044608.4337-1-francois.perrad@gadz.org>
 <a5c75b33-6dc6-d15a-25cb-3ecdd685a3b7@mind.be>
Message-ID: <CAB0FRsu4YYGLoMynE4rT0yesZ7Vxe7hFh1n_b8UmFqbHopkc2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 3 d?c. 2019 ? 23:14, Arnout Vandecappelle <arnout@mind.be> a ?crit :

>
>
> On 03/12/2019 05:46, Francois Perrad wrote:
> > linked to
> https://git.busybox.net/buildroot/commit?id=01134ca99a2c83932aee42984c81e51cc0428425
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
>  Applied to master, thanks.
>
>  Maybe it would be good to add a comment to perl.mk to remember to update
> this
> as well.
>
>
This comment already exists, see
https://git.busybox.net/buildroot/tree/package/perl/perl.mk#n7

Fran?ois


>  Or, better yet, parse the version out of perl.mk. But that will be a bit
> more
> difficult I guess.
>
>  Regards,
>  Arnout
>
> > ---
> >  utils/scancpan | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/utils/scancpan b/utils/scancpan
> > index 16e495bda..ac5fd5159 100755
> > --- a/utils/scancpan
> > +++ b/utils/scancpan
> > @@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
> >  use Text::Wrap;
> >  $Text::Wrap::columns = 62;
> >
> > -# Below, 5.028 should be aligned with the version of perl actually
> > +# Below, 5.030 should be aligned with the version of perl actually
> >  # bundled in Buildroot:
> > -die <<"MSG" if $] < 5.028;
> > +die <<"MSG" if $] < 5.030;
> >  This script needs a host perl with the same major version as Buildroot
> target perl.
> >
> >  Your current host perl is:
> > @@ -498,7 +498,7 @@ Your current host perl is:
> >      version $]
> >
> >  You may install a local one by running:
> > -    perlbrew install perl-5.28.0
> > +    perlbrew install perl-5.30.0
> >  MSG
> >
> >  my ($help, $man, $quiet, $force, $recommend, $test, $host);
> > @@ -961,7 +961,7 @@ in order to work with the right CoreList data.
> >
> >  =head1 LICENSE
> >
> > -Copyright (C) 2013-2018 by Francois Perrad <francois.perrad@gadz.org>
> > +Copyright (C) 2013-2019 by Francois Perrad <francois.perrad@gadz.org>
> >
> >  This program is free software; you can redistribute it and/or modify
> >  it under the terms of the GNU General Public License as published by
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191204/8433fbf3/attachment.html>
