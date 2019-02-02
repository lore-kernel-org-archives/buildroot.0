From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 2 Feb 2019 15:14:07 +0100
Subject: [Buildroot] [PATCHv2 1/1] package/pugixml: add support for a
 limited set of configuration options
In-Reply-To: <5166d507-189b-f139-f9a7-c0cac006f014@mind.be>
References: <20190131074019.19252-1-patrickdepinguin@gmail.com>
 <5166d507-189b-f139-f9a7-c0cac006f014@mind.be>
Message-ID: <CAAXf6LUZDh6Htqq6M+2T+XW-7bx+Ohww6VGD6Ycw-Ao-jsANEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 2, 2019, 14:37 Arnout Vandecappelle <arnout@mind.be wrote:

>
>
> On 31/01/2019 08:40, Thomas De Schampheleire wrote:
> > +config BR2_PACKAGE_PUGIXML_FORCE_ENABLE_LONG_LONG
> > +     bool "Force-enable long long support"
> > +     help
> > +       Force-enables support for long long type in pugixml.  Long
> > +       long support is automatically enabled if your platform is
> > +       known to have long long support (i.e. has C++11 support or
> > +       uses a reasonably modern version of a known compiler). If
> > +       pugixml does not recognize that your platform supports long
> > +       long but in fact it does, you can enable the define manually.
> > +endif
>
>  AFAIK gcc always supports long long, so shouldn't we just always enable
> this?
>

Gcc doc says:
https://gcc.gnu.org/onlinedocs/gcc/Long-Long.html
"ISO C99 and ISO C++11 support data types for integers that are at least 64
bits wide, and as an extension GCC supports them in C90 and C++98 modes.
Simply write long long int for a signed integer, or unsigned long long int
for an unsigned integer."

So it seems you are right.
I will send an update later...

Thanks
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190202/e1dd4bcb/attachment.html>
