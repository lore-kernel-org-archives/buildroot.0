From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Aug 2012 09:12:30 +0200
Subject: [Buildroot] Busybox Mips
In-Reply-To: <CAN5RZzLe7V0Fi11tio+780D23P3NgNgoGWgHFjfWEsB_v9F7UA@mail.gmail.com>
 (Francisco Prado's message of "Sat, 25 Aug 2012 21:22:39 -0300")
References: <CAN5RZzLtbpQ30PAgpuNj_hGF6Eia42ZvxgH3Emh3AESHU-1C=g@mail.gmail.com>
 <CAN5RZz+SZeqpeZ6vBPT63Gj7k2sozQ9sCk5sogKBs+O-JA2ixA@mail.gmail.com>
 <CAJhJPsWaU1B_Cq=ZJZQrqUzaHt_JGq4khPj=kDpM37hVLT0YKg@mail.gmail.com>
 <CAN5RZzLr+vGuiVw4oRGF40bvvZ33gaxPt_LvSLBvauOmEK7PZw@mail.gmail.com>
 <CAJhJPsU3eUkJf=Yqr6E9tP9ZGRzY-L20XkaXa5Sk3k-QZ-804Q@mail.gmail.com>
 <876286rdlp.fsf@macbook.be.48ers.dk>
 <CAN5RZzLe7V0Fi11tio+780D23P3NgNgoGWgHFjfWEsB_v9F7UA@mail.gmail.com>
Message-ID: <871uiuqg81.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francisco" == Francisco Prado <panchopapadezoe@gmail.com> writes:

 Francisco> Thanks Peter Korsgaard!!

 Francisco> There's your version of buildroot 8.2011 containing the
 Francisco> proper Busybox. Already compiled. In the output folder /
 Francisco> build / busybox find two binaries: busybox and
 Francisco> busybox_unstripped. Which one should I use?

busybox, but buildroot already copies it to your target /bin/busybox so
you don't have to copy anything manually.

 Francisco> Which settings should I select for the binary function
 Francisco> properly in a custom Android ROM 4.0.3?  Very very thanks.

Wait, you cannot expect to take a (dynamically linked) binary from
buildroot and run it on Android. If you want to build busybox for
Android then I suggest you build it by hand using the Android cross
compiler.

You CAN do it with buildroot as well if you link statically (Build
options->prefer static libraries), but it's not really meant to be used
like that.

-- 
Bye, Peter Korsgaard
