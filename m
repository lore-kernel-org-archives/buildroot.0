From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 11 Jan 2012 12:09:44 +0100
Subject: [Buildroot] [PATCH v3] Add pygame package
In-Reply-To: <87fwfmbm3i.fsf@macbook.be.48ers.dk>
References: <1326266671-9161-1-git-send-email-julien.boibessot@free.fr>
 <87sjjmbpva.fsf@macbook.be.48ers.dk> <4F0D5742.7060803@free.fr>
 <87fwfmbm3i.fsf@macbook.be.48ers.dk>
Message-ID: <4F0D6DF8.2050602@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/2012 10:54 AM, Peter Korsgaard wrote:
>   Julien>  You have the same problem (include added) in python-mad package. Does
>   Julien>  it compile on your Host ?
>
> It does compile here. Presumably because of the --include-dirs, even
> though it ends up adding both an -I for host-python and target-python
> (but target is first, so used) which isn't really nice:
>
> building 'madmodule' extension
> creating build
> creating build/temp.linux-x86_64-2.7
> creating build/temp.linux-x86_64-2.7/src
> /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -pipe -Os -fPIC -DVERSION_MAJOR=0 -DVERSION_MINOR=6 -DVERSION="0.6" -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/python2.7 -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -c src/madmodule.c -o build/temp.linux-x86_64-2.7/src/madmodule.o
>

can you try my v4 patch version please ? I used Thomas distutils 
cross-compilation modifications to prevent Host include usage.

Regards,
Julien
