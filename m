From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 19:23:23 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <CAAXf6LVu1+p1mQrWvrUFyPzbDJeZGyFZLNeTCYQ-XrQR1SsjCw@mail.gmail.com>
 <20160616093209.739fbc03@free-electrons.com>
 <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
Message-ID: <20160616172323.GC3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2016-06-16 11:52 +0200, Thomas De Schampheleire spake thusly:
> On Thu, Jun 16, 2016 at 9:32 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Thomas,
> >
> > Thanks for giving some feedback!
> >
> > On Thu, 16 Jun 2016 09:18:37 +0200, Thomas De Schampheleire wrote:
> >
> >> [..]
> >> >  6. wget download: 'scheme missing' results in empty output file
> >> >     http://patchwork.ozlabs.org/patch/599387/
> >> >
> >>
> >> The mail thread where this patch originated from is at:
> >> http://lists.busybox.net/pipermail/buildroot/2016-February/153953.html
> >>
> >> There was no further response on this patch, but as far as I'm
> >> concerned the issue is still present and could use a fix.
> >>
> >> What do you think about the proposed solution?
> >
> > I am not sure what is the best solution between:
> >
> >  - Defining <foo>_SITE to undefined when no value is specified by the
> >    package (which is your proposal)
> >
> >  - Do not add to <pkg>_ALL_DOWNLOADS the files for which there is
> >    no :// in the URL, and <pkg>_SITE is empty. This was the proposal
> >    made by Yann in
> >    http://lists.busybox.net/pipermail/buildroot/2016-February/153999.html.
> 
> This does not give the intended result. It was in the thread but in
> March, so mailman fails to link it (meh...)
> http://lists.busybox.net/pipermail/buildroot/2016-March/156416.html

OK, now I remember this thread.

I just tried:

    $ wget /foo/bar
    /foo/bart: Scheme missing.
    $ echo $?
    1

So, what? My wget does exit in error...

    $ wget --version
    GNU Wget 1.17.1 built on linux-gnu.

What's yours?

Regards,
Yann E. MORIN.

> >
> >  - Error out when both <pkg>_SITE is empty and <pkg>_SOURCE is
> >    non-empty.
> 
> I guess this could also work. If you prefer this I can cook up a real patch.
> Input from others is welcome too, of course.
> 
> Thanks,
> Thomas

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
