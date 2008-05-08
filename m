From: John Voltz <john.voltz@gmail.com>
Date: Thu, 8 May 2008 06:35:44 -0400
Subject: [Buildroot] Ask help for linking on x86 issue
In-Reply-To: <838300.86304.qm@web72710.mail.tp2.yahoo.com>
References: <838300.86304.qm@web72710.mail.tp2.yahoo.com>
Message-ID: <46a136670805080335x69b887adr7314e3183bac3b1b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtool (ltmain.sh) is causing the problem. It will relink the library to
the build machine's libraries during the install phase. I thought I had it
fixed. Try the latest buildroot from svn or the last nightly snapshot.

John


On Wed, May 7, 2008 at 10:53 PM, ?d(R)v?? <osig0516@yahoo.com.tw> wrote:

> ?Dear John,
>
> I saw the x86 image that you released and seems you find out the solution
> for fixed linking on x86 problem.
> problem :
> I attempt to run anything gtk based on the target, it complains that it
> can't find libc.so.6, libm.so.6, libdl.so.2, etc. If I create the links,
> then I get "could not resolve __lxstat64 in libgtk-x11.so.2"
>
> Actually, I am facing this kind of issue on my project now.
> If it is possible, could you kindly share your experience to help me to
> know how to fixed this issue?
> Thank you in advance.
>
>
> Best Regards,
>
> Shih Wu
>
> ------------------------------
> Be a better friend, newshound, and know-it-all with Yahoo! Mobile. Try it
> now.<http://us.rd.yahoo.com/evt=51733/*http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080508/d84b58c9/attachment.htm 
