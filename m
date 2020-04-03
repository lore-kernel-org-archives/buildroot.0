From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Apr 2020 11:50:50 +0200
Subject: [Buildroot] [Question] How do I build source code at source
 folder?
In-Reply-To: <1585904837068-0.post@n4.nabble.com>
References: <1585904837068-0.post@n4.nabble.com>
Message-ID: <CAEyMn7bt=wUY=RLDSE=QAD8F+ap5K4rRaB12Rs1SgjmOSeN_CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

Am Fr., 3. Apr. 2020 um 11:07 Uhr schrieb Eric Hsieh <psychesnet@gmail.com>:
>
> Hi everyone,
>
> Now, Im trying to create a special mode which can help me to build source
> code at source folder instead of output/build folder. I checked the makefile
> at package, looks like there is no directly way to be done.
> So, I would like to ask is it possible to be done? If yes, please give me
> some tips. Thanks.

If you want to build a package from an external source folder you can
specify the source directory by creating the  $(CONFIG_DIR)/local.mk
file and set the <pkg>_OVERRIDE_SRCDIR varialbe. But this will
copy/rsync your sources and build your package at output/build.

Please check "8.13.6. Using Buildroot during development" in the
buildroot user manual for more information about that.

-- 
Heiko
