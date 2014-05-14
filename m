From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 May 2014 15:52:17 +0200
Subject: [Buildroot] buildroot compilation error
In-Reply-To: <CAAnJALdkDY5m3LHWN5VFw13sireYo6hFT_dQ4Jw5e3CzZHAs3Q@mail.gmail.com>
References: <CAAnJALdkDY5m3LHWN5VFw13sireYo6hFT_dQ4Jw5e3CzZHAs3Q@mail.gmail.com>
Message-ID: <20140514155217.7e1e7c88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear rajesh gandla,

On Wed, 14 May 2014 17:52:29 +0530, rajesh gandla wrote:

>         When ever i am trying to make the build root finally i am
> getting the output like THIS IS NOT YOUR ROOT FILE SYSTEM.here i am
> attaching the screen shot.please go thriugh that and solve the
> problem.
>    i am using
>                        ubuntu 11.04 version host system
>                        buildroot 2014.02 version
>                        i want to crosscompile the kernel and xenomai
> for powerpc target board.
> 
> can u please tell me the procedure to do this.what are the things i
> have to select in makemenuconfig.

According to your screenshot, your build was successful.

The message about THIS_IS_NOT_YOUR_ROOT_FILESYSTEM is just in some
commands used to copy a file with this name in the output/target/
directory so that users are clearly aware that output/target/ is *not*
the root filesystem to be used directly on the target, and that they
should instead use a filesystem image, such as an UBIFS image, a
tarball, an ext3 filesystem, or any other filesystem image format
supported by Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
