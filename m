From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 1 Aug 2018 17:05:08 +0200
Subject: [Buildroot] [PATCH 2/4] minicom: add pre-configure hook to call
 autogen.sh
In-Reply-To: <20180801164852.7afe9c99@windsurf>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
 <20180801125721.34654-3-giulio.benetti@micronovasrl.com>
 <20180801164852.7afe9c99@windsurf>
Message-ID: <4c0a7347-7dc9-bedb-4fc9-a888b864e8e8@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 01/08/2018 16:48, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed,  1 Aug 2018 14:57:19 +0200, Giulio Benetti wrote:
>> Using latest minicom git commit need to call autogen.sh instead of
>> relying on Buildroot MINICOM_AUTORECONF = YES
>>
>> Add MINICOM_RUN_AUTOGEN to MINICOM_PRE_CONFIGURE_HOOKS and dependencies
>> needed by autogen.sh like: host-automake, host-autoconf, host-libtool.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Looking at the autogen.sh script, I don't see anything fancy. What is
> happening when you use MINICOM_AUTORECONF = YES ?

It complains about m4 directory missing.
Maybe I could create a workaround for that?

Giulio
