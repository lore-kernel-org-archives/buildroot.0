From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:07:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-28
In-Reply-To: <CAGm1_kvmveF6QpT66fMfW+psigqShdzMi-_9bQthrnsA8q6mdg@mail.gmail.com>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
 <CAGm1_kuaabmOkyg60eU+PkWuwOgCQ3Kci3yX=8SXdG=jjnaeqw@mail.gmail.com>
 <20140405144804.743b310a@skate>
 <CAGm1_kvmveF6QpT66fMfW+psigqShdzMi-_9bQthrnsA8q6mdg@mail.gmail.com>
Message-ID: <20140405190727.7b8fdcbf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sat, 5 Apr 2014 16:44:06 +0200, Yegor Yefremov wrote:

> IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR "${LUAPATH}" EQUAL "")
> 
> Could you test this?
> 
> diff --git a/lua/CMakeLists.txt b/lua/CMakeLists.txt
> index e4295d7..4ba8e37 100644
> --- a/lua/CMakeLists.txt
> +++ b/lua/CMakeLists.txt
> @@ -36,7 +36,7 @@ IF(NOT LUAPATH)
>         )
> 
>         IF(BUILD_LUA)
> -               IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR ${LUAPATH} EQUAL "")
> +               IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR "${LUAPATH}" EQUAL "")
>                         MESSAGE(SEND_ERROR "Lua was not found on your system")
>                 ENDIF()
>         ENDIF()

This patch fixes the problem here. Can you send a patch for it?

I'm pretty sure you can reproduce the problem if you disable Lua in
your configuration.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
