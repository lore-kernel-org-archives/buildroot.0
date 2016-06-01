From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 15:33:23 +0200
Subject: [Buildroot] [PATCH 1/3] libamcodec: new Package
In-Reply-To: <574EE26C.8070302@imgtec.com>
References: <20160601102720.3929-1-daggs@gmx.com> <574EDABD.5010801@imgtec.com>
 <20160601152051.37e8128a@free-electrons.com>
 <574EE26C.8070302@imgtec.com>
Message-ID: <20160601153323.2e8e8b00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 14:26:04 +0100, Vicente Olivert Riera wrote:

> The fist time I saw the PREFIX stuff I thought that it was wrong,
> because that's something you use when you are going to install the
> package, like DESTDIR. But looking at the Makefiles I've seen this
> package uses the PREFIX (and M_PREFIX) vars to build the includes and
> library paths. So if we don't pass PREFIX and M_PREFIX then the Makefile
> will do "-L/usr/lib and -I/usr/include" instead of
> "-L/br/output/staging/usr/lib -I/br/output/staging/usr/include".

Alright, thanks for the explanation. It's indeed a non-standard use of
PREFIX, so it should simply be explained by a short comment above the
<pkg>_BUILD_CMDS variable.

Thanks again for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
