From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Wed, 29 Aug 2007 12:12:14 +0200
Subject: [Buildroot] Problem #including <string>
In-Reply-To: <46D54452.7080204@carallon.com>
References: <46D54452.7080204@carallon.com>
Message-ID: <46D5467E.5010802@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Wagner wrote:
> Hello,
>
> I have built buildroot with the attached config for x86, with support 
> for c++.
>
> However whenever I include <string> I get errors in my code because it 
> seems somewhere in <string> it is #defining index.
>
> If I attempt to compile the following code:
>
> #ifdef index
> #error foo
> #endif
>
> #include <string>
>
> #ifdef index
> #error bar
> #endif
>
> void do_nothing()
> {
> }
>
> Then I get the second error.
>
> I have tried searching through the headers to find where the #define 
> index is but I have been unable to find it. Can anyone suggest the 
> best way of locating where index is being erroneously defined?
>
> Many thanks,
>
> Will.
>
Probably you have uClibc built with SUSv3_MACRO defined (among these 
there is index )

Cheers,
Carmelo
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
