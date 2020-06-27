From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 Jun 2020 23:35:30 +0200
Subject: [Buildroot] Cannot build glibc for ARM with GCC10
In-Reply-To: <CAGm1_ku8d5Gy5haB5CQow=kntoyboQ5SZBmYUp51kpggjxKZng@mail.gmail.com>
References: <CAGm1_kti3EuVpDUMKcuHfLfpKoRhBwKbzxte9NncjNgmpn7qyg@mail.gmail.com>
 <20200627164322.79ff2cad@windsurf>
 <CAGm1_ku8d5Gy5haB5CQow=kntoyboQ5SZBmYUp51kpggjxKZng@mail.gmail.com>
Message-ID: <2d032ef9-149c-29f2-5311-e21af074fcdd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Yegor, Thomas,

Le 27/06/2020 ? 19:18, Yegor Yefremov a ?crit?:
> Hi Thomas,
> 
> On Sat, Jun 27, 2020 at 4:43 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Fri, 26 Jun 2020 18:51:57 +0200
>> Yegor Yefremov <yegorslists@googlemail.com> wrote:
>>
>>> I just wanted to test GCC10 with glibc and encountered the following error:
>>
>> Did you try with the updated glibc version, provided by the following
>> patch series:
>>
>> https://patchwork.ozlabs.org/project/buildroot/list/?series=182049
> 
> The patch series has solved my problem.

Indeed, glibc 2.30 doesn't contain fixes for gcc 10, only glibc 2.31 build with
gcc 10.

We are up-to-date on the glibc 2.30 stable branch, so even glibc upstream didn't
backported gcc 10 fixes.

I currently backported 6 patches from glibc 2.31 to start fixing the build but
glibc still doesn't build. I'm not sure it's worth the effort... I would suggest
to disable glibc 2.30 with gcc 10.

Best regards,
Romain

> 
> Thanks.
> 
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
