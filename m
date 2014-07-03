From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 11:33:16 +0200
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
In-Reply-To: <20140703092420.GP9025@tarshish>
References: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
 <20140703092010.GO9025@tarshish> <20140703092420.GP9025@tarshish>
Message-ID: <20140703113316.3100783a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 3 Jul 2014 12:24:20 +0300, Baruch Siach wrote:

> > What is the output of:
> > 
> > echo 'int main(void) {}' | arm-linux-gnueabihf-gcc -x c -o /dev/null
> >
> > on the problematic machine?
> 
> Forgot a dash. The command should be:
> 
> echo 'int main(void) {}' | arm-linux-gnueabihf-gcc -x c -o /dev/null -

You should maybe indicate that this has to be done with the
arm-linux-gnueabihf-gcc compiler downloaded and installed by Buildroot,
so:

	./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
