From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Jul 2014 17:32:33 +0300
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
In-Reply-To: <CAFRxoJnfkQ1xZDd_Q5h_qzWXkrsJCdUTBv6APB6VvFFH1ad20g@mail.gmail.com>
References: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
 <20140703092010.GO9025@tarshish> <20140703092420.GP9025@tarshish>
 <20140703113316.3100783a@free-electrons.com>
 <CAFRxoJnfkQ1xZDd_Q5h_qzWXkrsJCdUTBv6APB6VvFFH1ad20g@mail.gmail.com>
Message-ID: <20140703143233.GR9025@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Thu, Jul 03, 2014 at 04:27:14PM +0200, Marco Pastorelli wrote:
> Thanks guys for the valuable help!
> 
> here's the output:
> 
> $ echo 'int main(void) {}' |
> ./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc -x c -o
> /dev/null -
> /mnt/ocz-vector/projects/bb-buildroot-2014.05/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/4.8.3/cc1:
> error while loading shared libraries: libz.so.1: cannot open shared object
> file: No such file or directory

I guess your host lacks a 32bit version of libz. Try installing the ia32-libs 
package.

baruch

> 2014-07-03 11:33 GMT+02:00 Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com>:
> > On Thu, 3 Jul 2014 12:24:20 +0300, Baruch Siach wrote:
> >
> > > > What is the output of:
> > > >
> > > > echo 'int main(void) {}' | arm-linux-gnueabihf-gcc -x c -o /dev/null
> > > >
> > > > on the problematic machine?
> > >
> > > Forgot a dash. The command should be:
> > >
> > > echo 'int main(void) {}' | arm-linux-gnueabihf-gcc -x c -o /dev/null -
> >
> > You should maybe indicate that this has to be done with the
> > arm-linux-gnueabihf-gcc compiler downloaded and installed by Buildroot,
> > so:
> >
> >         ./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
