From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2011 08:42:56 +0100
Subject: [Buildroot] glibc vs uclibc
In-Reply-To: <AANLkTinGzTxniNjkHfkpGLngJ_Y7ie+B4PiFUcrLDc-u@mail.gmail.com>
References: <AANLkTinGzTxniNjkHfkpGLngJ_Y7ie+B4PiFUcrLDc-u@mail.gmail.com>
Message-ID: <20110319084256.76c4be97@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Thu, 17 Mar 2011 07:37:20 -0700
Charles Krinke <charles.krinke@gmail.com> wrote:

> I have a request to provide our MPC8323E build with both uclibc and
> glibc support  in seperate builds so this leads to a question or at
> least an education of my naivety.
> 
> Can we build glibc as well as uclibc with buildroot? If so, how is it
> done? I *did* go looking for this switch and did not find it, so this
> is the opportunity for someone to say "its right there in file x,
> Charles"

In Buildroot, there are three ways to handle the toolchain "problem" :

 * Let Buildroot generate a toolchain. This has been the traditional
   and default Buildroot configuration for years, but is limited to
   uClibc based toolchains.

 * Let Buildroot use an external toolchain. In that case, Buildroot
   does not build the toolchain, it relies on an already existing one.
   You can get existing pre-built external toolchains from CodeSourcery
   for example, but you can also build your own with Yann E. Morin's
   Crosstool-NG project. Since Buildroot is no longer responsible for
   the toolchain, it's up to the existing toolchain to be glibc or
   uclibc based. CodeSourcery toolchains are generally glibc-based, but
   Crosstool-NG allows to build glibc, eglibc or uclibc based
   toolchains.

 * Let Buildroot use Crosstool-NG as a backend to compile the
   toolchain. In that case Buildroot will build the toolchain and not
   rely on an existing one, but instead of using internal code to do
   so, it uses Crosstool-NG to do the work. As Crosstool-NG is used,
   you can also build glibc, eglibc or uclibc based toolchains here.

To sum up: with the two last options, yes, you can produce and use
glibc and uclibc based toolchains. I am regularly using both.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
