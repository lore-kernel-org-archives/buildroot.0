From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Aug 2014 22:45:03 +0200
Subject: [Buildroot] github download helper question
In-Reply-To: <CAHXCMMLE8qpVZoUkUtRXL=+xOTnhsSa-y8CTnJXBMhZaH_q6GQ@mail.gmail.com>
References: <20140801120714.GH32743@waldemar-brodkorb.de>
 <CAHXCMMLE8qpVZoUkUtRXL=+xOTnhsSa-y8CTnJXBMhZaH_q6GQ@mail.gmail.com>
Message-ID: <20140801204503.GC3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, Samuel, All,

On 2014-08-01 16:59 +0200, Samuel Martin spake thusly:
> On Fri, Aug 1, 2014 at 2:07 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> > Hi Developers,
> >
> > for ARC C library testing I would like to use
> > a special branch of
> > https://github.com/foss-for-synopsys-dwc-arc-processors/gcc.
> > How I can do this with buildroot?
> 
> Just set the right sha1 as version, further details at [1].
[--SNIP--]
> [1] http://nightly.buildroot.org/manual.html#github-download-url

As Samuel said, the version can be a sha1. But as stated in the manual,
it can also be a tag.

So, you write something like:

    FOO_VERSION = v1.2.3
    FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))

And replace <user> and <package> with the approriate values.

For example, to use their gcc, you'd write something like this:

    GCC_VERSION = arc-2014.08-rc1
    GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
