From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 11:56:27 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <CAAXf6LVu1+p1mQrWvrUFyPzbDJeZGyFZLNeTCYQ-XrQR1SsjCw@mail.gmail.com>
 <20160616093209.739fbc03@free-electrons.com>
 <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
Message-ID: <20160616115627.6760c0dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 11:52:29 +0200, Thomas De Schampheleire wrote:

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

Ah, yes. Stupid mailman.

In any case, for such situations, it is good if a new patch gets sent,
which summarizes the problem, the different approaches, and why the
proposed approach was chosen.

It is really hard to remember all the details of this discussion that
happened months ago.

> >  - Error out when both <pkg>_SITE is empty and <pkg>_SOURCE is
> >    non-empty.  
> 
> I guess this could also work. If you prefer this I can cook up a real patch.
> Input from others is welcome too, of course.

Let's wait a bit for others to speak up.

What I find a bit with with the "undefined" idea, is that people will
get download failure due to http://undefined/foo not being available.
To me, it seems to make more sense to error out when _SITE is empty, we
will provide an even clearer error than a weird download failure on
http://undefined/foo.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
