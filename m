From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 29 Apr 2016 22:26:48 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: bump to 1.17.0
In-Reply-To: <572355E6.4040400@zacarias.com.ar>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
 <1461790014-17051-2-git-send-email-romain.naour@gmail.com>
 <572355E6.4040400@zacarias.com.ar>
Message-ID: <f6b845e4-97b0-a3f5-57c5-dfce944dcd6a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

Le 29/04/2016 ? 14:39, Gustavo Zacarias a ?crit :
> On 27/04/16 17:46, Romain Naour wrote:
> 
>> Autoreconf has been fixed upstream.
>> Update the untested configuration warning option.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Hi Romain.
> host-efl is failing to build in my tests:
> 
>   ELUA     lib/ecore_con/ecore_con_base.eo.lua
> ERR<2199>:elua lib/elua/elua.c:647 _elua_errmsg() ../src/bin/elua/elua:
> ...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:53: libeina.so:
> cannot open shared object file: No such file or directory
> stack traceback:
>         [C]: in function 'error'
> 
> ...put/build/host-efl-1.17.0/src/scripts/elua/core/util.lua:162: in function
> 'lib_load'
>         ...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:53: in
> function <...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:52>
>         [C]: in function 'init_module'
>         ...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:63: in
> function 'loader'
>         ...t/build/host-efl-1.17.0/src/scripts/elua/core/module.lua:94: in
> function 'require'
>         ...ild/host-efl-1.17.0/src/scripts/elua/modules/lualian.lua:5: in
> function 'loader'
>         ...t/build/host-efl-1.17.0/src/scripts/elua/core/module.lua:94: in
> function 'require'
>         .../build/host-efl-1.17.0/src/scripts/elua/apps/lualian.lua:4: in main
> chunk
>         [C]: at 0x00401460
> Makefile:40673: recipe for target 'lib/ecore_con/ecore_con_base.eo.lua' failed
> 
> libeina.so in fact doesn't exist in the host dir, however it does inside the
> host-efl build dir in src/lib/eina/.libs/libeina.so
> Got any ideas to look into/try?

Weird, I'm able to build host-efl here... let me retry again.
Can you share your Buildroot config and the host-efl config.log ?

Can you try to autoreconf the efl package ?
EFL_AUTORECONF = YES
EFL_GETTEXTIZE = YES

Thanks for testing :)

Best regards,
Romain
> 
> Regards.
