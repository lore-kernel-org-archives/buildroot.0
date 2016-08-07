From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 7 Aug 2016 17:48:46 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160807112654.7b520594@free-electrons.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
Message-ID: <CAHXCMM+xOgCuMNHMSqj4tOP2jMGP7OPOLD1_x0_8HCgXb_h21g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Ben, all,

On Sun, Aug 7, 2016 at 11:26 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is the usual analysis of build failures. Waldemar, Alexey, Vlad,
> Gustavo, Frank, Gwenhael, Angelo, Fran?ois, Romain, Bernd, can you have
> a look below? Thanks!
>
>>          arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/f7e92678e91a6cb15ccf32d4a7d75b39f49d6000/
>
> fatal error: stdlib.h: No such file or directory
>
> Samuel, could you have a look ?
Sure.
I'm able to reproduce it.

It seems to be another error due to "-isystem
$(STAGING_DIR)/usr/include" passed to g++ [1].

AFAICS, this is done by CMake when generating the flags.make files.
Note that removing it from the CXX_INCLUDES variables in all generated
flags.make prevent from triggering this error.

It is not clear to me whether it is a gcc-6.x bug or a CMake one.
According to fedora developers, this is not a gcc-6 bug [2].
Ben, do you have any idea?

Ben, I have not opened any ticket yet, nor checked if a similar one is
already opened. Do you need more details?

Regards,


[1] http://code.bulix.org/6osftm-104973
[2] https://lists.fedoraproject.org/archives/list/devel at lists.fedoraproject.org/thread/Q5SWCUUMWQ4EMS7CU2CBOZHV3WZYOOTT/

-- 
Samuel
