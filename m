From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sat, 8 Sep 2012 08:54:40 -0400
Subject: [Buildroot] Fixing linux-pam build failures
In-Reply-To: <504B2BD3.5080205@petroprogram.com>
References: <CADiAo4L2eUCF-2dEBWEJbw1V9z7uaQ-1=AA6z9SE4FA9v529+Q@mail.gmail.com>
 <504B2BD3.5080205@petroprogram.com>
Message-ID: <CADiAo4KAOhh3DDxn+kPGoqrOOZx4iw9s2A6mdft2619ofhZHtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Sat, Sep 8, 2012 at 7:28 AM, Stefan Fr?berg
<stefan.froberg@petroprogram.com> wrote:
> Hi Dmitry!
>
> Your work on this pam support looks good.
>
> I have attached in this message my very quick, unpolished & very very
> very dirty pam (version 1.1.5) hack
> (it doesn't bother to even check for if pam is enabled in busybox and it
> assumes that pam.d stuff is already in fs/skeleton/etc )

Thanks. However I'd rather let finalize the 1.1.4 integration (the
patches I just submitted will do) and then to upgrade to 1.1.5.

Another thing in your patch, and I was asked not to do so, is PAM
configs in the fs skeleton. I moved them to the Buildroot package
area, and honestly I would not provide any more configs with Buildroot
itself. For example, in my project PAM config for login does not
resemble the standard one at all, etc. these configs are just for
compatibility with PAM-less setup.

>
> If you find something usefull for your work then by all means salvage
> what you need from it.

Sure, once 1.1.4 is done.

> Your work for v86d ( http://patchwork.ozlabs.org/patch/157286/ )
> is working wonderfully in my distro !

Thanks for testing. The patchwork entry you mentioned also captures
the discussion we had regarding non-standard use of C flags: the way
Makefile is written in v86d does not capture them from the build
environment, and they have to be pushed harder down via redefinition
of $(CC) rather than via an environment variable.

I thnk eventually I'll try to reintroduce the v86d patch: may I take
your e-mail as a supporting vote? ;)

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
