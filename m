From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Sun, 26 Feb 2012 00:06:59 -0300
Subject: [Buildroot] [PATCH V2] openocd: fetch package from git
 repository and update version
In-Reply-To: <201202251631.25121.arnout@mind.be>
References: <20120224190112.GB10670@game.jcrosoft.org>
 <1330119073-24810-1-git-send-email-aletes.xgr@gmail.com>
 <20120225033301.GC10670@game.jcrosoft.org>
 <201202251631.25121.arnout@mind.be>
Message-ID: <CAAAP30E8ijhxYh05evremPG9fpkyySo8fjJv18Wc4J2eKuf8rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> again NACK
>>
>> DO NOT USE GIT in the release
>
> ?Instead of just shouting at Alexandre, perhaps you can explain why it's
> a bad idea to use the git version for openocd...
>
> ?Alexandre, why do you need a more recent version than the official
> release?

The openocd release is 6 months old and they made many improvements
since then. And I don't see any plans for them to release a new
version any time soon.

Openocd git head is usually more stable than their latest released
version. Specially if the support for the target you are using is new.
I have had issues connecting one of my cortex-m3 targets with openocd
0.5.0.

This is a special package like u-boot and the kernel because in many
occasions you have to tweak the package to suit your own hardware.

Other option would be to use 0.5.0 version from git, so people who run
into this kind of issue, can override the version more easily.

Another comment on this issue is about git submodule fetching. Do you
think that could be useful to other packages? If so, I can prepare a
new patch to fetch all submodules, if any.
