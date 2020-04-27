From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 27 Apr 2020 19:03:23 +0200
Subject: [Buildroot] [PATCH] [RFC] support/testing: test_lua_utf8: fix
 test after bump to lua-utf8 0.1.2
In-Reply-To: <20200426230130.1578616-1-romain.naour@gmail.com>
References: <20200426230130.1578616-1-romain.naour@gmail.com>
Message-ID: <CAB0FRssX+o4LxABhW2cY-Y_ZTfLW=ddyhebK2eGgfu4VpRVL-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 27 avr. 2020 ? 01:01, Romain Naour <romain.naour@gmail.com> a
?crit :

> The commit 0f0649140f73645f4cd00c9c0d27c50e9fa1caf9 introduced a change
> in the module name: utf8 -> lua-utf8.
>
> The packages-file-list.txt show the change in the files intalled on the
> rootfs:
>
> [lua-utf8 0.1.2-2 latest version]
> lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/doc/LICENSE
> lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/doc/README.md
>
> lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/luautf8-0.1.2-2.rockspec
> lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/rock_manifest
> lua-utf8,./usr/lib/lua/5.1/lua-utf8.so
>
> [lua-utf8 1.2-0 previous version]
> lua-utf8,./usr/lib/luarocks/rocks-5.1/utf8/1.2-0/doc/README.md
> lua-utf8,./usr/lib/luarocks/rocks-5.1/utf8/1.2-0/utf8-1.2-0.rockspec
> lua-utf8,./usr/lib/luarocks/rocks-5.1/utf8/1.2-0/rock_manifest
> lua-utf8,./usr/lib/lua/5.1/utf8.so
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/526036036
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
>

The 2 variants (Lua & LuaJIT) must have the same fix.

Fran?ois


> ---
> I'm really not sure if it's the correct fixes.
> ---
>  support/testing/tests/package/test_lua_utf8.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/testing/tests/package/test_lua_utf8.py
> b/support/testing/tests/package/test_lua_utf8.py
> index 3eab19dd4d..3757bf283c 100644
> --- a/support/testing/tests/package/test_lua_utf8.py
> +++ b/support/testing/tests/package/test_lua_utf8.py
> @@ -22,4 +22,4 @@ class TestLuajitUtf8(TestLuaBase):
>
>      def test_run(self):
>          self.login()
> -        self.module_test("utf8")
> +        self.module_test("lua-utf8")
> --
> 2.25.3
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200427/01592b7f/attachment.html>
