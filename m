From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 23 Mar 2012 10:06:40 +0100
Subject: [Buildroot] [PATCH 1/2] New package: socketcand
In-Reply-To: <20120323095538.5edb8eea@skate>
References: <1332428460-28459-1-git-send-email-yegorslists@googlemail.com>
 <87ehsk1c2d.fsf@macbook.be.48ers.dk> <20120323095538.5edb8eea@skate>
Message-ID: <4F6C3D20.8050304@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 23.03.2012 09:55, schrieb Thomas Petazzoni:
> Le Thu, 22 Mar 2012 23:54:34 +0100,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
> 
>>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com>
>>>>>>> writes:
>>
>>  yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
>>  yegorslists> Signed-off-by: Yegor Yefremov
>>  yegorslists> <yegorslists@googlemail.com>
>>
>> Committed, thanks.
> 
> There are apparently build problems with this package:
> http://autobuild.buildroot.org/results/d6a79808eae008611a3ed12a0b7d9901a7fc159f/build-end.log
> 
> The host system I use is an old Debian Sarge, so the coreutils
> (including cp) might be quite old. But I think it's a good test to see
> if we can correctly build on old enterprise distros such as RHEL that
> some people are forced to use in companies (and I feel sorry for them).

What do you suggest?
I found following solution here:

http://superuser.com/questions/140708/ubuntu-equivalent-of-unix-command-cp-n

if [ ! -e dest ]; then
    cp -f src dest
fi

Yegor
