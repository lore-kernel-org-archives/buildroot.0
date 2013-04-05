From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 5 Apr 2013 13:36:01 +0100
Subject: [Buildroot] Quick analysis of the last build failures
In-Reply-To: <20130405142249.4c97e61f@skate>
References: <20130405141247.67149ee7@skate>
 <CAG2jQ8iCYNPGcT=frmjx-zJtkFyKceCWi9csbEtj8BQk1_3Nqg@mail.gmail.com>
 <20130405142249.4c97e61f@skate>
Message-ID: <CAG2jQ8g8Tp2T5buE9TCfhXWW86jWhs-L6vLanLHctGsW1zBQVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 April 2013 13:22, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> So, if I understand correctly, it should be something like:
>
> ifeq ($(BR2_PACKAGE_LIBCAP),y)
> LTP_TESTSUITE_DEPENDENCIES += libcap attr
> endif
>

Correct

> And in the Config.in:
>
>         select BR2_PACKAGE_ATTR if BR2_PACKAGE_LIBCAP
>
> We would have two cases:
>
>  * libcap not enabled, it uses cap_set_file() from the C library.
>    Correct?

No. I don't think these symbols are part of libc. They only exist in
libc. If HAVE_LIBCAP (ie libcap was not detected) is not defined in
LTP, these particular tests are not compiled.

>
>  * libcap is enabled, we add the dependency on attr so that libcap
>    exposes cap_set_file().

Correct.

--
Regards,
Markos Chandras
