From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 06 Oct 2019 21:07:33 -0300
Subject: [Buildroot] [PATCH 3/4] support/testing: add lua-sdl2 test
References: <20190929125520.16957-3-francois.perrad@gadz.org>
Message-ID: <5d9a81c5df819_1fa73fda500b91087903b@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Sep 29, 2019 at 09:55 AM, Francois Perrad wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .gitlab-ci.yml                                |  2 +
>  .../testing/tests/package/test_lua_sdl2.py    | 41 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 support/testing/tests/package/test_lua_sdl2.py
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a1e309b50..ecbcbcb78 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -385,6 +385,8 @@ tests.package.test_lua_gd.TestLuaLuaGD: { extends: .runtime_test }
>  tests.package.test_lua_gd.TestLuajitLuaGD: { extends: .runtime_test }
>  tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
>  tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
> +tests.package.test_lua_sdl2.TestLuaLuaSDL2: { extends: .runtime_test }
> +tests.package.test_lua_sdl2.TestLuajitLuaSDL2: { extends: .runtime_test }

These 2 test cases failed for me:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517926
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517929

with this output:
# lua -l SDL -e 'a=1'
lua: module 'SDL' not found:
	no field package.preload['SDL']
	no file './SDL.lua'
	no file '/usr/share/luajit-2.0.5/SDL.lua'
	no file '/usr/local/share/lua/5.1/SDL.lua'
	no file '/usr/local/share/lua/5.1/SDL/init.lua'
	no file '/usr/share/lua/5.1/SDL.lua'
	no file '/usr/share/lua/5.1/SDL/init.lua'
	no file './SDL.so'
	no file '/usr/local/lib/lua/5.1/SDL.so'
	no file '/usr/lib/lua/5.1/SDL.so'
	no file '/usr/local/lib/lua/5.1/loadall.so'
stack traceback:
	[C]: at 0xb6f51bb0
	[C]: at 0x00011af8
# echo $?
1
# 


Regards,
Ricardo
