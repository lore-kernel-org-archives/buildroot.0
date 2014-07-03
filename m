From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Jul 2014 12:20:10 +0300
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
In-Reply-To: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
References: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
Message-ID: <20140703092010.GO9025@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Thu, Jul 03, 2014 at 11:05:02AM +0200, Marco Pastorelli wrote:
> I'm using buildroot 2014.05 to compile a BSP for a beaglebone. I'm using
> linaro toolchain 2014.02
> 
> If I compile with ubuntu 12.04LTS everything works fine.
> When I compile exactly the same project with another PC running ubuntu
> 14.04LTS I run into this error:
> 
> >>> toolchain-external undefined Configuring
> Incorrect ABI setting: EABIhf selected, but toolchain is incompatible
> 
> Does anybody knows which could be the problem?

What is the output of:

echo 'int main(void) {}' | arm-linux-gnueabihf-gcc -x c -o /dev/null

on the problematic machine?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
