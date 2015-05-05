From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 17:06:46 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAMo8Bf+-SNfs8zMsF1_KoY9=C4mMz90KjN+rMXaDXzYLY2vfhg@mail.gmail.com>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <CAMo8Bf+-SNfs8zMsF1_KoY9=C4mMz90KjN+rMXaDXzYLY2vfhg@mail.gmail.com>
Message-ID: <20150505170646.30939063@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 5 May 2015 17:52:23 +0300, Max Filippov wrote:

> Apparently sane-backends configure script cannot correctly detect target system
> endianness without hints. It gets a hint in form of
> ac_cv_c_bigendian=yes/no, that
> is set in accordance to BR2_ENDIAN.
> But for xtensa we don't have BR2_ENDIAN and endianness comes from the
> configuration overlay. Do you think we need to provide BR2_ENDIAN setting
> for xtensa?

Yes, we should have BR2_ENDIAN defined for Xtensa. Precisely to avoid
such issues :)

Thanks for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
