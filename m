From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 16:42:06 +0200
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
In-Reply-To: <CAFRxoJnfkQ1xZDd_Q5h_qzWXkrsJCdUTBv6APB6VvFFH1ad20g@mail.gmail.com>
References: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
 <20140703092010.GO9025@tarshish> <20140703092420.GP9025@tarshish>
 <20140703113316.3100783a@free-electrons.com>
 <CAFRxoJnfkQ1xZDd_Q5h_qzWXkrsJCdUTBv6APB6VvFFH1ad20g@mail.gmail.com>
Message-ID: <20140703164206.40a17ed0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Pastorelli,

On Thu, 3 Jul 2014 16:27:14 +0200, Marco Pastorelli wrote:

> here's the output:
> 
> $ echo 'int main(void) {}' |
> ./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc -x c -o
> /dev/null -
> /mnt/ocz-vector/projects/bb-buildroot-2014.05/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/4.8.3/cc1:
> error while loading shared libraries: libz.so.1: cannot open shared object
> file: No such file or directory

apt-get install zlib1g:i386

is what you need.

I think we need to add a check for this to tell the user in a clearer
way.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
