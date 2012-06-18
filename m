From: Attila Kinali <attila@kinali.ch>
Date: Mon, 18 Jun 2012 15:21:38 +0200
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <4FDF24E2.6020603@free-electrons.com>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
 <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
 <4FDF24E2.6020603@free-electrons.com>
Message-ID: <20120618152138.056695e303d6688dd90bba87@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jun 2012 14:53:54 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Le 18/06/2012 14:46, Dmitry Golubovsky a ?crit :
> > Maxime: do you use an alternative toolchain with systemd?
> 
> After a bit of testing, it seems indeed that the bug is uclibc-only, and
> didn't encountered it as I do most of my testing using glibc.

Actually no: The bug is in systemd.
The m modifier is a gnu extension of the scanf format and is not
in the C99 standard. Because systemd silently assume that you are building
in a gnu environment (ie with glibc gcc etc) it fails at this point.

			Attila Kinali
-- 
Why does it take years to find the answers to
the questions one should have asked long ago?
