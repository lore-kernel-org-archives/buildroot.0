From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Thu, 23 Aug 2007 18:35:37 +0200
Subject: [Buildroot] Struggling with undefined reference
	to	`__fgetc_unlocked'
In-Reply-To: <d6cda7730708230925x19bc0901v9a6dd1f18ee325ec@mail.gmail.com>
References: <d6cda7730708230925x19bc0901v9a6dd1f18ee325ec@mail.gmail.com>
Message-ID: <46CDB759.709@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a wrote:
> Hi,
>
>    I'm struggling with qtopia. During the link of rcc (which is a host
> tool, natively compiled) I get:
>
> I googled for the error, but could only find ppl complaining about
> this when linking against uClibc, when this should be linking against
> the system glibc. Does anyone has an idea of what I could try?
>
> Regards,
>     Thiago A. Correa
>   
Which glibc version have you installed on your host?
For example, on my RHEL 3 there is glibc-2.3.4 which doesn't contain the 
__fgetc_unlocked
symbol, while fgetc_unlocked (no underscore prepending)...
so just check your glibc by running 'readelf -s /lib/libc.so.6 | grep 
fgetc_unlocked'
and see what it returns.

Regards,
Carmelo

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
