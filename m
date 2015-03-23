From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2015 19:37:05 +0100
Subject: [Buildroot] [PATCH 4/7 v3] support/download: return different
 exit codes for different failures
In-Reply-To: <CAHXCMMKsdKNtBrDcbXSEOCiBt_NzdcGAC_=G=ROppmJo5y8fCw@mail.gmail.com>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <b74adb73680d401a14a0841f4e09aa8a0b888116.1427037564.git.yann.morin.1998@free.fr>
 <CAHXCMMKsdKNtBrDcbXSEOCiBt_NzdcGAC_=G=ROppmJo5y8fCw@mail.gmail.com>
Message-ID: <20150323183705.GB4214@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-03-23 14:03 +0100, Samuel Martin spake thusly:
> On Sun, Mar 22, 2015 at 4:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > diff --git a/support/download/check-hash b/support/download/check-hash
> > index d0a4ab9..0234ab0 100755
> > --- a/support/download/check-hash
> > +++ b/support/download/check-hash
> > @@ -9,6 +9,15 @@ set -e
> >  #   $3: the final basename of the file, to which it will be ultimately
> >  #       saved as, to be able to match it to the corresponding hashes
> >  #       in the .hash file
> > +#
> > +# Exit codes:
> > +#   0:  the hash file exists and the file to check matches all its hashes,
> > +#       or the hash file does not exist
> > +#   1:  unknown command-line option
> > +#   2:  the hash file exists and the file to check does not match at least
> > +#       of its hashes
> maybe s/of its hashes/one of its hashes/

Yes, good catch! I'll fix before resubmitting.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
