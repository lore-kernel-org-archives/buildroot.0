From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 9 Jun 2011 13:21:08 +0200
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
References: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
Message-ID: <BANLkTinru5S__aEQQwWJgjfycAb3af7Pwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/8 Alper Y?ld?r?m <yildirimalper@gmail.com>:
> Hello,
>
> A feature i want to see in buildroot is to have a post build script to
> run after image creation process, in other words just before "make"
> returns to console. This way i can put my post build commands inside
> this script. It will definitely ease my buildroot usage.
>
> Some examples to put in this script are:
>
> - Printing some king of a "build completed" message,
> - Printing build time,
> - Nfs directory creation from rootfs.tar file,
> - Copying necessary images to some other locations,
> - Playing some sound when build is completed.
>
> Also, it will be nice to pass a build failed/completed parameter to
> this script, so different actions could be taken, (i.e. different
> sounds could be played)

I do this on the command line:

make && echo Buildroot success || echo Buildroot error

You can easily extend this by creating a small script, e.g. build.sh:

----8<----
#!/bin/sh

handle_success()
{
  echo Buildroot built successfully
  # ...
}

handle_failure()
{
  echo Buildroot failed
  # ...
}

make && handle_success || handle_failure
----8<----

Best regards,
Bj?rn Forsman
