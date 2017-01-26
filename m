From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jan 2017 13:28:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <1485429244.1041.1.camel@embedded.rocks>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
 <20170126111125.f7snoblajixwt322@tarshish>
 <1485429244.1041.1.camel@embedded.rocks>
Message-ID: <20170126112815.fputxxyriyc4amba@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Thu, Jan 26, 2017 at 12:14:04PM +0100, J?rg Krause wrote:
> On Thu, 2017-01-26 at 13:11 +0200, Baruch Siach wrote:
> > On Thu, Jan 26, 2017 at 12:04:41PM +0100, Samuel Martin wrote:
> > > On Wed, Jan 25, 2017 at 10:15 PM, Baruch Siach <baruch@tkos.co.il>
> > > wrote:
> > > > On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> > > > > Unfortunately I cannot reproduce this issue. Is it a rpath
> > > > > issue? cmake
> > > > > links a test program with host zlib:
> > > 
> > > Note: I'm not able to reproduce the error either.
> > 
> > Do you have a 32bit libz.so.1 in /usr/lib on your host machine?
> 
> I do have:
> 
> ls -l /usr/lib??/libz.so.1
> lrwxrwxrwx 1 root root 14 15. Jan 20:46 /usr/lib32/libz.so.1 ->
> libz.so.1.2.11*
> lrwxrwxrwx 1 root root 14 15. Jan 20:43 /usr/lib64/libz.so.1 ->
> libz.so.1.2.11*

On a recent Debian Testing I have lib32z1 installed and:

ls -l /usr/lib32/libz.so.1 
lrwxrwxrwx 1 root root 13 Dec  7 17:43 /usr/lib32/libz.so.1 -> libz.so.1.2.8

I can reproduce this failure here.

The failed gcc invocation in CMakeError.log includes -Wl,-rpath,/usr/lib32, 
which is clearly incompatible with cross compiling.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
