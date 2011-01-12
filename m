From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 12 Jan 2011 14:14:00 +0100
Subject: [Buildroot] [PATCH 1/2] liberation: add support for custom
	target directory
In-Reply-To: <20110112120831.244cacff@surf>
References: <1294830195-11438-1-git-send-email-daniel.nystrom@timeterminal.se>
	<20110112120831.244cacff@surf>
Message-ID: <AANLkTikuu4Y5AquLQXxMG137xTC7zRTT9+qOAgF7AQmT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/1/12 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> +if BR2_PACKAGE_LIBERATION
>> +
>> +config BR2_PACKAGE_LIBERATION_INSTALL_DIR
>> + ? ? string "Install directory"
>> + ? ? default "/usr/share/fonts/liberation"
>> + ? ? help
>> + ? ? ? Target directory where the fonts should be installed
>> +
>> +endif
>
> Why would this be necessary ?

In my case, I'm running Nano-X/Microwindows which doesn't handle fonts
in subdirs and therefore requires them being all installed in the same
directory. This was actually inspired by Luca Ceresolis' Dejavu font
contribution.

> In other words, which use case is this solving ? If it's a general font
> location problem, maybe this should not be a Liberation-specific option.

In my opinion, letting default installation directory keep using font
named subdir but still configurable would cover most cases.

/ Daniel
