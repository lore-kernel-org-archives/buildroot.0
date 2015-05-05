From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 5 May 2015 17:52:23 +0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150505095952.4ddfd5b4@free-electrons.com>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
Message-ID: <CAMo8Bf+-SNfs8zMsF1_KoY9=C4mMz90KjN+rMXaDXzYLY2vfhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 5, 2015 at 10:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>>       xtensa |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/31115fe8d88f52d77ed0f2da769eb8896a1b34a2/
>
> kvs40xx.h:265:2: error: #error __BYTE_ORDER not defined
>  #error __BYTE_ORDER not defined
>
> Max, can you have a look?

Apparently sane-backends configure script cannot correctly detect target system
endianness without hints. It gets a hint in form of
ac_cv_c_bigendian=yes/no, that
is set in accordance to BR2_ENDIAN.
But for xtensa we don't have BR2_ENDIAN and endianness comes from the
configuration overlay. Do you think we need to provide BR2_ENDIAN setting
for xtensa?

-- 
Thanks.
-- Max
