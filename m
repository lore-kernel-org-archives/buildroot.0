From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 15 Feb 2015 00:33:37 +0100
Subject: [Buildroot] [PATCH 2/8] package/libiio: update cmake code for
 libxml2 detection
In-Reply-To: <20150214221523.333c1fe4@free-electrons.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
 <20150214221523.333c1fe4@free-electrons.com>
Message-ID: <CAHXCMMJtOSQ4KTSAyLZ6ovsNX0jBOiUnHhEq_MASBZnewnrQ4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Feb 14, 2015 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun, 25 Jan 2015 22:13:49 +0100, Samuel Martin wrote:
>> Only check for libxml2 when it is needed.
>>
>> This prevents CMake from falling back on the libxml2-config.cmake
>> installed on the host system (i.e. when libxml2 >=2.9.2 is part of the
>> host system), but not enabled as a target package (i.e. not existing in
>> the staging tree).
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  ...l2-detection-try-first-the-CMake-module-f.patch | 40 +++++++++++++---------
>>  1 file changed, 23 insertions(+), 17 deletions(-)
>
> Is this fixing a bug happening in practice? I.e should it be applied to
> master or next?

This patch does fix a bug here (that's why i explain the case triggering it).
For the branch to apply it, I let you judge, but libxml2-2.9.2 will
become more and more common. Archlinux already has it, the next
release of Ubuntu-15.04 and Fedora-22 include it (but debian Jessy
does not yet includes it); so if there is currently a few people
triggering this bug, they may be more by the time we release the
buildroot-2015.05.

BTW, I still have to check WRT Arnout's comment (how to tell cmake to
never look at /usr/share/cmake when cross-compiling).

Regards,

-- 
Samuel
