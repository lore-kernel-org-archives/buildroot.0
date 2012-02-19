From: Sri Ram Vemulpali <sri.ram.gmu06@gmail.com>
Date: Sun, 19 Feb 2012 16:17:12 -0500
Subject: [Buildroot] buildroot libnl error
In-Reply-To: <CALyraeNF1d0BsRu1h+F5L=YBVB8Gt2JgXGu2ebarR1vRrMnkeg@mail.gmail.com>
References: <CALyraeNF1d0BsRu1h+F5L=YBVB8Gt2JgXGu2ebarR1vRrMnkeg@mail.gmail.com>
Message-ID: <CALyraeOVWZ=KDRehS=RC6Wq5Z+4W_yaT3T=ROEMinTNxFOmafw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found solution by doing this.

I added following lines of code in
libnl-3.0/lib/route/pktloc_grammer.h

#ifndef YY_BUF_SIZE
#define YY_BUF_SIZE 16384
#endif

#ifndef YY_STATE_BUF_SIZE
#define YY_STATE_BUF_SIZE ((YY_BUF_SIZE + 2) * sizeof(yy_state_type))
#endif

Thanks,
Sri


On 2/19/12, Sri Ram Vemulpali <sri.ram.gmu06@gmail.com> wrote:
> Hello All,
>
> I am new to BuildRoot e-mail list. I am using BuildRoot to compile my
> embedded linux image and tool-chain.
>
> In the intermediate compilation step I encountered the following error.
>
> make[2]: Entering directory
> `/home/sriram/buildroot/buildroot-2011.11/output/build/libnl-3.0/lib'
> /usr/bin/make  all-am
> make[3]: Entering directory
> `/home/sriram/buildroot/buildroot-2011.11/output/build/libnl-3.0/lib'
>   CC     route/pktloc.lo
> route/pktloc.c: In function ?read_pktlocs?:
> route/pktloc.c:127:34: error: ?YY_BUF_SIZE? undeclared (first use in
> this function)
> route/pktloc.c:127:34: note: each undeclared identifier is reported
> only once for each function it appears in
> make[3]: *** [route/pktloc.lo] Error 1
> make[3]: Leaving directory
> `/home/sriram/buildroot/buildroot-2011.11/output/build/libnl-3.0/lib'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory
> `/home/sriram/buildroot/buildroot-2011.11/output/build/libnl-3.0/lib'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> `/home/sriram/buildroot/buildroot-2011.11/output/build/libnl-3.0'
> make: ***
> [/home/sriram/buildroot/buildroot-2011.11/output/build/libnl-3.0/.stamp_built]
> Error 2
>
>
> Can anyone point me what this error and what is the resolution. Is
> this related to not including right header files.
> Also, how can I enable sysroot option pointing to buildroot output/staging
>
> Thanks in advance
>
> --
> Regards,
> Sri.
>


-- 
Regards,
Sri.
