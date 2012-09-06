From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Thu, 6 Sep 2012 13:39:21 +0100
Subject: [Buildroot] Google breakpad patch status?
In-Reply-To: <CAHXCMMKqz5sKtXUZbokBiH03zfkwkpZ5DcE+UdmXAHCEf2mx2A@mail.gmail.com>
References: <CAJkQPO=cmNHbx088d+7TL+8DQaW64qS9ZhFxFOy=pgSVzWEwEg@mail.gmail.com>
 <CAHXCMMKqz5sKtXUZbokBiH03zfkwkpZ5DcE+UdmXAHCEf2mx2A@mail.gmail.com>
Message-ID: <CAJkQPO=P2eJzsY_Kdfch1sQDzsHzbheNQMXfSfB-myghJJMXMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 September 2012 16:17, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Aras, all,
>
> 2012/9/5 Aras Vaichas <aras.vaichas@gmail.com>:
>> Hi, I was checking to see if Buildroot had Google breakpad. It
>> doesn't, but there was a patch for it some months ago:
>>
>> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/34282
>>
>> ref: http://code.google.com/p/google-breakpad/
> Does it provide cross-tools?
> Last time I played with it, I could not dump symbol from x86 (32 bits)
> binaries using breakpad tools built on x86_64 system. :-/

It doesn't appear to provide cross-tools, but I've compiled it with a
crosscompiler anyway.

$./configure CC=/opt/br/output/host/usr/bin/i486-unknown-linux-gnu-gcc
CXX=/opt/br/output/host/usr/bin/i486-unknown-linux-gnu-g++
--host=i486-unknown-linux-gnu
$ make

I am having similar problems. My build PC is i686, and my host is i486
microcontroller.

I can cross-compile the Breakpad library for i486, and use it to build
a test app to run on my build PC (i686), then it works perfectly. So
the cross-compiled Breakpad library is functional.

If I take that same library and use it to build my app for my
target/host (i486) it partially works with the following observations:

* A non-threaded test app will create a usable minidump,
* A multi-threaded app will create a minidump that appears to be
incomplete and is not usable. The results are predictable and
reproducible.

I'm currently investigating why it doesn't work with threads on my
target, but this is off-topic.


regards,

Aras Vaichas
