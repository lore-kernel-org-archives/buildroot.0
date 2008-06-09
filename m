From: Olivier Singla <olivier.singla@gmail.com>
Date: Mon, 9 Jun 2008 13:56:03 -0400
Subject: [Buildroot] floating point I/O issue (ARM, AT91SAM9260)
In-Reply-To: <506410170806072023g51592040s533a307e7736bc1e@mail.gmail.com>
References: <506410170806072023g51592040s533a307e7736bc1e@mail.gmail.com>
Message-ID: <506410170806091056g7e2cc6a2oaaca42f26e9ae34c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually I found what the issue was.
The problem happens only when enabling locale support.

On Sat, Jun 7, 2008 at 11:23 PM, Olivier Singla
<olivier.singla@gmail.com> wrote:
> Hi,
>
> I have a strange issue with buildroot for the Atmel AT91SAM9260, which
> is related to floating point I/O.
> For instance if I have a floating value of 1.961, printf will display
> it as 1961000.
> Value 1234.567890123 will be displayed as 1234567871.
> I also have issue with scanf, when trying to read a floating point.
> I built the kernel with floating point emulation.
> I suspect the problem is in the C library.
> Any idea what's going on ?
>
> Thanks
> ~Olivier
>
