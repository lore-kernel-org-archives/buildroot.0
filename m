From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jul 2015 23:03:48 +0200
Subject: [Buildroot] systemd not working properly?
In-Reply-To: <CAGduivx-ZzNLFbvEkTGwEwDyucGKqL0UmLb7s3F5AAxno5_ECQ@mail.gmail.com>
References: <20141019124525.01fe9653@free-electrons.com>
 <CAGduivx-ZzNLFbvEkTGwEwDyucGKqL0UmLb7s3F5AAxno5_ECQ@mail.gmail.com>
Message-ID: <20150707230348.5c7ea316@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon, 20 Oct 2014 10:45:10 +0200, Maxime Hadjinlian wrote:

> > Then a *very* long delay because of dev-ttyAMA0.device., that finally
> > ends up with:
> >
> > [ TIME ] Timed out waiting for device dev-ttyAMA0.device.
> > [DEPEND] Dependency failed for Serial Getty on ttyAMA0.
> >
> > And finally, I get no getty at all.
> So this particular issues, is due to the fact that for some reason,
> systemd doesn't like the fact that ttyAMA0 is a serial-link. If you
> delete the link in /etc/systemd/system/multi-user.target.wants/ and
> recreate it to point to getty at .service instead of
> serial-getty at .service, it will boot up fine.
> I am still looking into why it doesn't work. I am exploring some idea.

I still see this issue today. Can we fix this to have something that
works properly out of the box?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
