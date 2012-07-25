From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 09:49:35 +0100
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <20120725102242.77a06eca@skate>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
 <20120725102242.77a06eca@skate>
Message-ID: <CAHt8ZCPHv7MR=WAvPRL5PxiTp=NsgDkhWKFusCEYgxiBtZPWXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25 July 2012 09:22, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This is the Python support of gpsd, correct? Was it building before my
> patches?
>
> Because if you look closely:
>
>> /opt/tfx/arch/arm/usr/bin/ccache /usr/lib/ccache/gcc -pthread -o
>
> It is building with the native compiler gcc and not the cross-compiler,
> so obviously it cannot work.

Yes, you're right. It was using the native compiler before your
patches, but somehow managed to get through the build without falling
over. Another problem then.

Simon.
