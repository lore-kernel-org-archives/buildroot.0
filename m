From: Andreas Naumann <dev@andin.de>
Date: Wed, 4 Sep 2019 14:31:34 +0200
Subject: [Buildroot] [PATCH v5 1/2] qt5base: Fix inconsistencies when
 overriding qmake properties
In-Reply-To: <20190817235907.513f170f@windsurf.home>
References: <20190415205622.25268-1-anaumann@ultratronik.de>
 <20190817235907.513f170f@windsurf.home>
Message-ID: <25a2ac5a-1832-2494-eb58-9e203e1a2af8@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 17.08.19 um 23:59 schrieb Thomas Petazzoni:
> Hello Andreas,
> 
> On Mon, 15 Apr 2019 22:56:21 +0200
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> When querying the qmake properties with our custom qt.conf present, I noticed
>> that they were different from the built-in ones (without qt.conf).
>> Most notably QT_INSTALL_PREFIX was a concatenated string of two absolute pathes
>> (hostdir + sysroot).
>>
>> This is due to Prefix being set to our HOST_DIR and HostPrefix not being set at
>> all. I guess this was also the root cause of the initial problem with
>> qt.conf.in, because once Prefix and HostPrefix were set to their correct values,
>> re-setting all the other default pathes became obsolete. (However, since our
>> pathes for Headers, Plugins and Examples are non-default, they still have to be
>> explicitely set.)
>>
>> There is one exception to this: Omitting 'Settings' leads to the CONFIGURATION
>> path being plain /usr, whereas the default without qt.conf is /usr/etc/xdg. But
>> even if storing configs directly under /usr seems a bit strange we keep it that
>> way, so the behaviour of "our" qmake doesnt change.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> 
> I'm not sure if it's related to this commit, but some users are
> complaining about QML applications not working anymore:
> 
>    https://bugs.busybox.net/show_bug.cgi?id=11926
> 
> Could you have a look at this bug report ? I wanted to re-assign the
> bug to you, but it seems like you don't have a Bugzilla account.

he reverted the my commit, but nothing changed. I have now tried 
Cinematic Experience with the linaro toolchain (albeit with buildroot 
2019.08 plus patch series for mesa3d 19.1.5) and all libs have been 
found, no problem.
So, i dont know what to suggest. Have you had other bug reports in this 
direction?
I have been partly involved in 
https://git.buildroot.net/buildroot/commit/?id=4ad73bf5e6326f7a414ecc94dbac0c79f5d33b31
but that was a compile time problem and has been solved.


regards,
Andreas

> 
> Thanks!
> 
> Thomas
> 
