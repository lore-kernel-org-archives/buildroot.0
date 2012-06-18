From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 18 Jun 2012 09:32:55 -0400
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <20120618152138.056695e303d6688dd90bba87@kinali.ch>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
 <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
 <4FDF24E2.6020603@free-electrons.com>
 <20120618152138.056695e303d6688dd90bba87@kinali.ch>
Message-ID: <CADiAo4K46d1ztgeg-6k-mZaj7oohsT5MdPZLEfiQC++r6yC2dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jun 18, 2012 at 9:21 AM, Attila Kinali <attila@kinali.ch> wrote:

> Actually no: The bug is in systemd.
> The m modifier is a gnu extension of the scanf format and is not
> in the C99 standard. Because systemd silently assume that you are building
> in a gnu environment (ie with glibc gcc etc) it fails at this point.

From the portability standpoint, it is..

They likely did not provide testing and fallback for %ms support in
their autoconf scripts.

I'll try to look into their source tree as well to see if this has
been addressed there, and maybe will try to propose a fix for
upstream, however local patching might be a faster solution
(unfortunately).

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
