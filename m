From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 25 Sep 2013 09:09:04 -0400
Subject: [Buildroot] [PATCH] ljsyscall: new package
In-Reply-To: <CAB0FRsuHwyT_LK=3Ga+nvDLdUzreAiMHkj22TxayeazCCPbQGw@mail.gmail.com>
References: <1380070732-1834-1-git-send-email-danomimanchego123@gmail.com>
 <CAB0FRsuHwyT_LK=3Ga+nvDLdUzreAiMHkj22TxayeazCCPbQGw@mail.gmail.com>
Message-ID: <CANxTyt53=D+o9NV_WeYn0SZQng_YjmYjzxk8kYjNU67EVBfkCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Wed, Sep 25, 2013 at 7:31 AM, Fran?ois Perrad >> diff --git
a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
>> new file mode 100644
>> index 0000000..0bed738
>> --- /dev/null
>> +++ b/package/ljsyscall/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_LJSYSCALL
>> +       bool "ljsyscall"
>> +       # ljsyscall is specifically for LuaJIT, not Lua.
>> +       depends on BR2_PACKAGE_LUAJIT
>
> not available on all architecture
>     depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_powerpc || BR2_mips

True - but those conditions are already in LuaJIT, except even more
restrictive, so I didn't bother.  But I take the point, will add.

From your other email:  points taken, I'll remove the LuaJIT
dependency and the add -m0644.


Danomi -
