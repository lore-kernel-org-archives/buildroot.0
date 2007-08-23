From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 23 Aug 2007 17:40:25 +0100
Subject: [Buildroot] Struggling with undefined reference to
	`__fgetc_unlocked'
In-Reply-To: <d6cda7730708230939p7b126fe1mbe28768aa4413bb4@mail.gmail.com>
References: <d6cda7730708230925x19bc0901v9a6dd1f18ee325ec@mail.gmail.com>
	<46CDB759.709@st.com>
	<d6cda7730708230939p7b126fe1mbe28768aa4413bb4@mail.gmail.com>
Message-ID: <d6cda7730708230940p4b7c319dqc23a9083699a7167@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PS: Sorry, forgot to add the list in the reply. *g*.

Hi Carmelo,

   That command returned
gentoo-vm buildroot # readelf -s /lib/libc.so.6 | grep fgetc_unlocked
  1868: 0005e040    40 FUNC    WEAK   DEFAULT   11 fgetc_unlocked@@GLIBC_2.1
gentoo-vm buildroot #

   I'm guessing the prepended underscores are due to mangling, but
could be wrong.

On 8/23/07, Carmelo AMOROSO <carmelo.amoroso@st.com> wrote:
> Thiago A. Corr?a wrote:
> > Hi,
> >
> >    I'm struggling with qtopia. During the link of rcc (which is a host
> > tool, natively compiled) I get:
> >
> > I googled for the error, but could only find ppl complaining about
> > this when linking against uClibc, when this should be linking against
> > the system glibc. Does anyone has an idea of what I could try?
> >
> > Regards,
> >     Thiago A. Correa
> >
> Which glibc version have you installed on your host?
> For example, on my RHEL 3 there is glibc-2.3.4 which doesn't contain the
> __fgetc_unlocked
> symbol, while fgetc_unlocked (no underscore prepending)...
> so just check your glibc by running 'readelf -s /lib/libc.so.6 | grep
> fgetc_unlocked'
> and see what it returns.
>
> Regards,
> Carmelo
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> >
>
>
