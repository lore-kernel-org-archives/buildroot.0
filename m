From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 09 Aug 2018 16:14:52 +0300
Subject: [Buildroot] [PATCH] docs/manual: gcc 4.4 is the lowest we are
 known to work with
In-Reply-To: <CANQCQpZv0zcAV4L_ZdRk21e22GLw5pzaTe_2JoH0kN_uC4Tumw@mail.gmail.com>
References: <20180805114615.3442-1-yann.morin.1998@free.fr>
 <CANQCQpZv0zcAV4L_ZdRk21e22GLw5pzaTe_2JoH0kN_uC4Tumw@mail.gmail.com>
Message-ID: <87a7pvbs1f.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Matthew Weber writes:
> On Sun, Aug 5, 2018 at 6:46 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>
>> gcc-2.95 is old. No, it is not old; it is antediluvian.
>>
>> The odlest gcc version we are testing against is gcc-4.4 (on Holiss'
>> autobuilder using RHEL6.5).
>>
>
> Any suggestions if we keep the minimum host compiler requirement at
> 4.4, how should I address the below build failures with "error:
> '__ATOMIC_ACQUIRE' undeclared " on the RHEL6.5 autobuilder?
> http://autobuild.buildroot.net/?reason=host-libselinux-2.7
>
> If this was a more recent compiler version issue, I'd dig into the
> package and look at up-streaming a compatibility ifdef check.

The atomic operations were introduced in gcc version 4.7:

  https://gcc.gnu.org/gcc-4.7/changes.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
