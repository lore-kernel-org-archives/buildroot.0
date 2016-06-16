From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 19:30:16 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160616115627.6760c0dd@free-electrons.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <CAAXf6LVu1+p1mQrWvrUFyPzbDJeZGyFZLNeTCYQ-XrQR1SsjCw@mail.gmail.com>
 <20160616093209.739fbc03@free-electrons.com>
 <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
 <20160616115627.6760c0dd@free-electrons.com>
Message-ID: <20160616173016.GD3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2016-06-16 11:56 +0200, Thomas Petazzoni spake thusly:
> On Thu, 16 Jun 2016 11:52:29 +0200, Thomas De Schampheleire wrote:
> > > I am not sure what is the best solution between:
> > >
> > >  - Defining <foo>_SITE to undefined when no value is specified by the
> > >    package (which is your proposal)
> > >
> > >  - Do not add to <pkg>_ALL_DOWNLOADS the files for which there is
> > >    no :// in the URL, and <pkg>_SITE is empty. This was the proposal
> > >    made by Yann in
> > >    http://lists.busybox.net/pipermail/buildroot/2016-February/153999.html.  
> > 
> > This does not give the intended result. It was in the thread but in
> > March, so mailman fails to link it (meh...)
> > http://lists.busybox.net/pipermail/buildroot/2016-March/156416.html
> 
> Ah, yes. Stupid mailman.
> 
> In any case, for such situations, it is good if a new patch gets sent,
> which summarizes the problem, the different approaches, and why the
> proposed approach was chosen.
> 
> It is really hard to remember all the details of this discussion that
> happened months ago.
> 
> > >  - Error out when both <pkg>_SITE is empty and <pkg>_SOURCE is
> > >    non-empty.  
> > 
> > I guess this could also work. If you prefer this I can cook up a real patch.
> > Input from others is welcome too, of course.
> 
> Let's wait a bit for others to speak up.

Well, I prefer Thomas P. proposal: bail out if <pkg>_SITE is empty and
<pkg>_SOURCE is not.

> What I find a bit with with the "undefined" idea, is that people will
> get download failure due to http://undefined/foo not being available.
> To me, it seems to make more sense to error out when _SITE is empty, we
> will provide an even clearer error than a weird download failure on
> http://undefined/foo.

Yes, this is definitely not user-friendly. Maybe:

    http://you-forgot-to-set-<pkg>_SITE/pkg-version-blabla

Just kidding. ;-]

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
