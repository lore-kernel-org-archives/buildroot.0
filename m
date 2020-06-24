From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 Jun 2020 22:41:39 +0200
Subject: [Buildroot] [PATCH 5/5] package/gcc: switch to gcc 9.x as the
 default
In-Reply-To: <20200624215654.1ccffabd@windsurf>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
 <20200608221347.2639059-5-romain.naour@gmail.com>
 <20200624215654.1ccffabd@windsurf>
Message-ID: <3b1056c1-67c6-48b2-94c2-5f0d2dea24b7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/06/2020 ? 21:56, Thomas Petazzoni a ?crit?:
> On Tue,  9 Jun 2020 00:13:47 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Even if gcc 8 is still maintained for some time (gcc 8.5 is pending),
>> switch to gcc 9.x since it has been released since 2019-05-03 and
>> gcc 10.x is available since 2020-05-07.
>>
>> We have been having toolchains in the autobuilders with gcc
>> 9.x for a while, so the vast majority of the problems should have
>> already been solved.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/gcc/Config.in.host | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks.
> 
> Following this, we should drop gcc 7.x support. However, one defconfig
> (roseapplepi) still uses gcc 7.x. I've notified Peter Korsgaard on IRC,
> and I am doing it here as well: if this defconfig is not updated to a
> newer kernel that builds with gcc >= 8.x, we will have to drop support
> for this defconfig.

Yes, I would like to avoid the mess like for beagleboneblack defconfig for qt5
when it was using gcc 5 only.

Best regards,
Romain


> 
> Thomas
> 
