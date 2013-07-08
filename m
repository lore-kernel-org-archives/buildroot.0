From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 8 Jul 2013 18:49:40 +0200
Subject: [Buildroot] where is 'ldd'?
In-Reply-To: <20130708142743.GB11258@zuhnb712>
References: <20130708135640.GA7070@zuhnb712> <51DAC94D.2030706@gmail.com>
 <20130708142743.GB11258@zuhnb712>
Message-ID: <CAAXf6LU3ShNk9JdG-eVv7Lt3OLopP5butkPK-8Mb4L+3gmRzxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jul 8, 2013 at 4:27 PM, Woody Wu <narkewoody@gmail.com> wrote:
> On Mon, Jul 08, 2013 at 04:14:37PM +0200, Zoltan Gyarmati wrote:
>> On 07/08/2013 03:56 PM, Woody Wu wrote:
>> > Hi,
>> >
>> > I just cann't find what is the menu item in buildroot to enable building
>> > of 'ldd' for my target.  Does anyone know it?
>> >
>> > Thanks in advance.
>> >
>> Sure you don't have it already on your system? What toolchain / libc
>> are you using?
>
> I also feel strange, but its sure. I am using Code Sorucery, downloaded
> it's lite version (arm linux eabi version, 2013-05-24). It comes with an
> installer, which created a seperated directory in my home. I searched
> through its installation directory (via 'find'), sure not have anything
> like "*ldd".

You really don't need a special ldd.
ldd is just a script. In its most basic usage (ldd <executable>), it just runs:
# LD_TRACE_LOADED_OBJECTS=1 <executable>

For example on busybox:
# LD_TRACE_LOADED_OBJECTS=1 /bin/busybox
        linux-vdso32.so.1 =>  (0x00100000)
        libc.so.6 => /lib/libc.so.6 (0x0fe70000)
        /lib/ld.so.1 (0x48000000

So for sporadic usage, an ldd script isn't even needed.

See 'man ld.so' for information on this LD_TRACE_LOADED_OBJECTS
variable (and several other useful variables that change the behavior
of the executable.

See also: http://www.catonmat.net/blog/ldd-arbitrary-code-execution/

Best regards,
Thomas
