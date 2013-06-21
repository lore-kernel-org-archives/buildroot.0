From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 21 Jun 2013 11:33:07 +0100
Subject: [Buildroot] [PATCH] gvfs: Select and depend on libgcrypt
In-Reply-To: <20130621123123.1219b3a5@skate>
References: <1371810011-13339-1-git-send-email-markos.chandras@gmail.com>
 <20130621123123.1219b3a5@skate>
Message-ID: <CAG2jQ8jYuF-NH=m=05p8SRTxUMQNLt9g-CA8tg9kUf0dseap9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 June 2013 11:31, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Fri, 21 Jun 2013 11:20:11 +0100, Markos Chandras wrote:
>
>> Fixes the following build problem when building gvfs
>> without having libgcrypt installed.
>>
>> gvfsbackendafpbrowse.c:31:20: fatal error: gcrypt.h: No such file or directory
>
> This seems strange because:
>
> #ifdef HAVE_GCRYPT
> #include <gcrypt.h>
> #endif
>
> in gvfsbackendafpbrowse.c.
>
> Maybe there's a mis-detection of the gcrypt on your host and we need to
> make sure gvfs doesn't try to detect gcrypt when it is not part of the
> enabled packages. I am quite sure I did a build of gvfs 1.16.2 without
> gcrypt support, but the machine didn't had the gcrypt development files
> installed in the distribution.

Hi Thomas,

I will have a look in the build files. I have libgcrypt installed on
the host so maybe it detects this one and fails.

--
Regards,
Markos Chandras
