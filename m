From: Doha Ehab <dohaehab@gmail.com>
Date: Sat, 21 May 2016 22:25:04 +0200
Subject: [Buildroot] building opencv-2.4 using buildroot
In-Reply-To: <CAHXCMML9juH57AmACV3ezg_6Zn88SuiBnz_HCA-jPK=So5ESRw@mail.gmail.com>
References: <CAEjFr-YHkDmrwrx9cx2Bx7R=CVkivKzS8qDpUZpjH7SWWEHE1w@mail.gmail.com>
 <CAHXCMML9juH57AmACV3ezg_6Zn88SuiBnz_HCA-jPK=So5ESRw@mail.gmail.com>
Message-ID: <CAEjFr-aVdz0MsHekRfLQtqXKoHJjp2rxU0v+j4iKz6i7OOrSgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 I downloaded the while buildroot zip from here :
https://github.com/buildroot/buildroot.git
after 'make'  then using the same command it didn't work , same error. is
there is something i am missing  ?

Regards
Doha

On Sat, May 21, 2016 at 8:54 AM, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi,
>
> On Sat, May 21, 2016 at 3:26 AM, Doha Ehab <dohaehab@gmail.com> wrote:
> > Hello
> >  I am trying to build opencv-2.4 for arm using buildroot-2015.08.01 from
> > build options ->libraries I have chosen static libraries only . when I
> try
> > to compile opencv code using the following command :
> > " buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> > -static ocv.c -o ocvccode "
> >
> > I got this error
> >
> buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> > cannot find -ldl
> > collect2: error: ld returned 1 exit status
> >
> > how can I solve this linking issue?
>
> Some OpenCV modules cannot be built in a static-lib-only configuration.
>
> A patch [1] fixing this issue has been merged recently on master.
>
> [1]
> https://github.com/buildroot/buildroot/commit/07144093d4fd0d5c6f59006a0e58fd5074da0f92
>
> Regards,
>
> --
> Samuel
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160521/3735ad56/attachment.html>
