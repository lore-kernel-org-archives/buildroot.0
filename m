From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 14 Jan 2008 15:11:48 -0200
Subject: [Buildroot] error messages
In-Reply-To: <01f101c856c9$be8ff5e0$6e00a8c0@JONATHAN>
References: <00b501c853c9$4fc21330$6e00a8c0@JONATHAN>
	<00a601c85644$796a65c0$020514ac@atmel.com>
	<01f101c856c9$be8ff5e0$6e00a8c0@JONATHAN>
Message-ID: <d6cda7730801140911x5b866f6ew44f96f7f93084f49@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jonathan,

  Sorry for the intromission. Well, you would have to patch each file
that references bzero, since that's not a standard function name (one
can enable it with a deprecated something flag in uClibc config).

So, the best approach would be to cd to
/buildroot/buildroot/build_arm_wchar/mDNSResponder-107.6 then grep for
bzero and replace it. Then create a patch and place it in the
package/mDNSResponder folder. (Also, please submit here for inclusion
and to mDNSResponder maintainer).

Kind Regards,
   Thiago A. Correa

On Jan 14, 2008 2:23 PM, Jonathan Dumaresq <jdumaresq@cimeq.qc.ca> wrote:
>
> Hi Ulf,
>
> I'm not sure to what to do with your answer.
>
> On which file I should apply this patch ?
>
> Regards
>
> Jonathan
>
> -----Message d'origine-----
> De: Ulf Samuelsson [mailto:ulf at atmel.com]
> Envoy?: 12 janvier 2008 12:10
> ?: Jonathan Dumaresq; buildroot at uclibc.org
> Objet: Re: [Buildroot] error messages
>
>
> > Hi all,
> >
> >
> >
> > I just use the defconfig of the rm9200 to setup a build process.
> > I go the error that you can find in the attached file.
> > Regards
> >
> > Jonathan
>
> Apply diffs when bzero is found.
>
> -    bzero(msg, *len);
> +    memset(msg, '\0', *len);Best Regards
> Ulf Samuelsson
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
