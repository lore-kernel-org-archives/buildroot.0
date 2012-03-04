From: PHilip RUshik <prushik@gmail.com>
Date: Sun, 4 Mar 2012 20:14:54 +0900
Subject: [Buildroot] Buildroot shared uclibc native compiler only links
	statically
In-Reply-To: <CAGmOteMekR4JRMpYBrP2MVxScDwjkRaNU8KuXkXrDH-T3Cy8oA@mail.gmail.com>
References: <CAGmOteOykAc56k3F1w9Km+6FJ5wzM9WKTvyGWSxRCb7yZv2cew@mail.gmail.com>
 <201203041200.21575.arnout@mind.be>
 <CAGmOteMekR4JRMpYBrP2MVxScDwjkRaNU8KuXkXrDH-T3Cy8oA@mail.gmail.com>
Message-ID: <CAGmOteOw011Jzmc5WwWW8r1sEbeBhyb_=95+vxNJ3wySM0-7yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 4, 2012 at 8:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On Sunday 04 March 2012 09:03:58 PHilip RUshik wrote:
> > Hello,
> > If I build a buildroot system with uClibc as a shared library and with a
> > native compiler, the resulting native compiler works great most of the
> > time, but it always links with the static libc.a instead of the shared
> > library. Why does this happen, anybody know how to fix that?
>
>  This has just been solved on the list (but no patch is committed yet).
> Basically, the problem is that the symlink of /usr/lib/libc.so to
> /lib/libc.so.0 isn't included in the target directory.
>
>  As a workaround, you can create that link manually:
> ln -s /lib/libc.so.0 target/usr/lib/libc.so
>
>
>  Regards,
>  Arnout
>
>
Ok, awesome, I was hoping for something easy like that.
I tried to make a symlink in /usr/lib before, but I called it libc.so.0
like the one in /lib. Oops.
Thank you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120304/5e2b33d6/attachment.html>
