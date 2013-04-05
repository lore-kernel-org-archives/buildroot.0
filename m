From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Apr 2013 14:41:03 +0200
Subject: [Buildroot] Quick analysis of the last build failures
In-Reply-To: <CAG2jQ8g8Tp2T5buE9TCfhXWW86jWhs-L6vLanLHctGsW1zBQVQ@mail.gmail.com>
References: <20130405141247.67149ee7@skate>
 <CAG2jQ8iCYNPGcT=frmjx-zJtkFyKceCWi9csbEtj8BQk1_3Nqg@mail.gmail.com>
 <20130405142249.4c97e61f@skate>
 <CAG2jQ8g8Tp2T5buE9TCfhXWW86jWhs-L6vLanLHctGsW1zBQVQ@mail.gmail.com>
Message-ID: <20130405144103.55b8605c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Fri, 5 Apr 2013 13:36:01 +0100, Markos Chandras wrote:

> > And in the Config.in:
> >
> >         select BR2_PACKAGE_ATTR if BR2_PACKAGE_LIBCAP
> >
> > We would have two cases:
> >
> >  * libcap not enabled, it uses cap_set_file() from the C library.
> >    Correct?
> 
> No. I don't think these symbols are part of libc. They only exist in
> libc. If HAVE_LIBCAP (ie libcap was not detected) is not defined in
> LTP, these particular tests are not compiled.

Ah, ok, makes sense.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
