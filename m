From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 09:19:29 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump  version to 1.6
In-Reply-To: <57-5f9bc680-3-4a87f08@125885651>
References: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
 <57-5f9bc680-3-4a87f08@125885651>
Message-ID: <20201030091929.18f77130@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Oct 2020 08:53:18 +0100
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> Will 1.4.x still work with 5.10 kernels? I guess the old API will
> just be deprecated for a while?
> 
> So I guess we have two possibilities going forward: 
> 
> - Use the version switch I proposed and even extend it when 2.0 and
> headers 5.10 are released or
> - Stay on the 1.4.x branch until linux 5.5 is the oldest supported
> version (if this is possible).

What worries a bit with supporting both 1.4 and 1.6, and in the future
say 1.4, 1.6 and 2.0 is that newer versions are likely to introduce new
APIs. Applications may rely on such new APIs. When the kernel headers
are recent enough, a recent version of libgpiod will be used, and such
applications will build properly. But as soon as soon builds a system
with older kernel headers, libgpiod will downgrade to an older version,
providing potentially less APIs, and therefore breaking any application
using them.

This strategy of not supporting older kernels in newer versions of
libgpiod also means that libgpiod should not introduce any new public
API... Otherwise the maintenance burden that libgpiod avoids by not
supporting older kernels is a maintenance burden that will fall on the
shoulders of users of libgpiod, who will have to make conditional
switches depending on whether libgpiod 1.4, 1.6 or 2.0 is used.

I am still highly doubtful of the strategy chosen by upstream libgpiod
here.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
