From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Apr 2016 09:39:02 -0300
Subject: [Buildroot] [PATCH 2/4] package/efl: bump to 1.17.0
In-Reply-To: <1461790014-17051-2-git-send-email-romain.naour@gmail.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
 <1461790014-17051-2-git-send-email-romain.naour@gmail.com>
Message-ID: <572355E6.4040400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/04/16 17:46, Romain Naour wrote:

> Autoreconf has been fixed upstream.
> Update the untested configuration warning option.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Hi Romain.
host-efl is failing to build in my tests:

   ELUA     lib/ecore_con/ecore_con_base.eo.lua
ERR<2199>:elua lib/elua/elua.c:647 _elua_errmsg() ../src/bin/elua/elua: 
...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:53: 
libeina.so: cannot open shared object file: No such file or directory
stack traceback:
         [C]: in function 'error'
 
...put/build/host-efl-1.17.0/src/scripts/elua/core/util.lua:162: in 
function 'lib_load'
         ...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:53: 
in function <...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:52>
         [C]: in function 'init_module'
         ...t/build/host-efl-1.17.0/src/bindings/luajit/eina/log.lua:63: 
in function 'loader'
         ...t/build/host-efl-1.17.0/src/scripts/elua/core/module.lua:94: 
in function 'require'
         ...ild/host-efl-1.17.0/src/scripts/elua/modules/lualian.lua:5: 
in function 'loader'
         ...t/build/host-efl-1.17.0/src/scripts/elua/core/module.lua:94: 
in function 'require'
         .../build/host-efl-1.17.0/src/scripts/elua/apps/lualian.lua:4: 
in main chunk
         [C]: at 0x00401460
Makefile:40673: recipe for target 'lib/ecore_con/ecore_con_base.eo.lua' 
failed

libeina.so in fact doesn't exist in the host dir, however it does inside 
the host-efl build dir in src/lib/eina/.libs/libeina.so
Got any ideas to look into/try?

Regards.
