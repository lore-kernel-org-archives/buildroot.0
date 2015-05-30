From: Oli Vogt <oli.vogt.pub01@gmail.com>
Date: Sat, 30 May 2015 14:00:07 +1200
Subject: [Buildroot] Are these packages already present or easy to add?
In-Reply-To: <20150529090352.7c288297@free-electrons.com>
References: <CA+BV=GWq-a_Jvma7X9DBpbYUPyPhRkU=L3+BJ9yffWQV3iT8dg@mail.gmail.com>
 <5567963E.3070900@mind.be>
 <CAAwwcmS_2j38iU3kK+6rYdrmgJid8cxd4+-b8KH=oWBCQhMHwA@mail.gmail.com>
 <20150529090352.7c288297@free-electrons.com>
Message-ID: <CAAwwcmQPWJgRr2bx+5myKSHgioez08Tk1w8O8_5k9ciEG0DWmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for taking the time to explain.

Regards, oli

On 29 May 2015 at 19:03, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Oli Vogt,
>
> On Fri, 29 May 2015 10:48:58 +1200, Oli Vogt wrote:
>
> > There is a patch for python-smbus and as far as I know it is not
> committed
> > yet. <
> http://lists.busybox.net/pipermail/buildroot/2015-March/122280.html>
> >
> > I'm to busy to test it myself. All I have done is compile it
> successfully.
>
> The patch you're pointing to is no longer needed. As Arnout said,
> python-smbus is installed by the i2c-tools package, but the source code
> of python-smbus is in i2c-tools.
>
> The issue with the patch you're pointing to is that it was sharing
> variables between python-smbus.mk and i2c-tools.mk, which is not
> correct (relies on the assumption that i2c-tools.mk gets included
> before python-smbus.mk, which is true because alphabetically they are
> ordered properly, but the same strategy wouldn't work in the opposite
> way).
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150530/47ec2649/attachment.html>
