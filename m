From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Dec 2011 08:50:55 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
 <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
 <001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98>
 <000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98>
 <20111130170450.2f33e6c2@skate>
 <000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98>
 <20111130173327.069f46fb@skate>
 <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
 <000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LWSPgAR6C_+eqq5DZ5CCJkzJ22zpfyTzr7bNEGj-mOKYw@mail.gmail.com>
 <001101ccaf9a$cebe63b0$0400a8c0@dspcgrnzks9p98>
 <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeff,

On Thu, Dec 1, 2011 at 11:56 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
> The following is a message from yesterday. ?It was the closest I have gotten
> to both ethercat application and kernel modules being built. ?As can be seen
> from the last email I sent today, I can't build either one with the new .mk
> file. ?Something in that file only applies to buildroot-2011.11?
>
> Can someone help out with what I had going yesterday? ?The suggestions from
> Thomas De Schampheleire helped to build the kernel modules, but in so doing
> the application was no longer being built. ?I will show both .mk files. ?It
> would get REALLY appreciated if someone would merge these for me somehow.
>

I have the impression you are missing some basic skills, and I really
think it will help you if you took the time to learn about them. For
example:
* how does make work and how are Makefiles organized
* what is a patch, how do you apply a patch

There is some information on patching here:
http://www.linuxchix.org/content/courses/kernel_hacking/lesson9
but take into account that some of it is specific to the linux kernel.


Regarding ethercat: what Thomas Petazzoni has provided you with is a
patch for the entire thing, application + drivers. It is based on a
clean 2011.11 release. Here is a step-by-step guide of things I think
you should do:

1. Start from a clean 2011.11 buildroot tarball (unpack it)
2. Move to the buildroot directory with cd
3. Apply the patch of ThomasP by saving the e-mail in text file format) and run:
patch -p1 < saved-email
You should see output like:
patching file package/Config.in
patching file package/igh-ethercat/Config.in
patching file package/igh-ethercat/igh-ethercat.mk

4. Configure buildroot properly (using make menuconfig) and don't
forget to enable the new igh-ethercat package, which is present under
'Networking applications'

5. Run 'make'.

That should be it. Buildroot will do all the rest for you and when the
build is done, you can test ethercat to see if everything works.

Best regards,
Thomas
