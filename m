From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Sat, 11 Jun 2011 01:03:52 +0700
Subject: [Buildroot] Generic serial port disappear after udev started
In-Reply-To: <20110610171936.GA26750@sakrah.homelinux.org>
References: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
	<20110610171936.GA26750@sakrah.homelinux.org>
Message-ID: <BANLkTik6X-rrh72cOFo+fqs4crmjxRJqMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 11, 2011 at 12:19 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On (10/06/11 23:41), Dwi Sasongko Supriyadi wrote:
> > Hello List,
> >
> > Normally i put getty on serial port which is /dev/ttySAC0 and so far
> there
> > is no issue with it, but after udev installed and started, the system
> > complains that it can not find /dev/ttySAC0.
>
> Do you have ttySAC0 listed in /etc/securetty and /etc/inittab ?
>

I do, but it does not help.

Anyway I have tried to solve it by adding this line inside "start)" section:

mknod -m 0666 /dev/ttySAC0 c 204 64

This is quiet dirty trick, but for the moment I have no more idea how to
solve it.

Can anyone suggest a better solution, please?

Thanks in advance,
DWI
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110611/15d9ad14/attachment.html>
