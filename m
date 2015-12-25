From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 25 Dec 2015 22:51:08 +0100
Subject: [Buildroot] [PATCH v5] luvi: new package
In-Reply-To: <20151220232856.12acbfe8@free-electrons.com>
References: <1446104703-21295-1-git-send-email-joerg.krause@embedded.rocks>
 <20151220232856.12acbfe8@free-electrons.com>
Message-ID: <1451080268.16818.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On So, 2015-12-20 at 23:28 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu, 29 Oct 2015 08:45:03 +0100, J?rg Krause wrote:
> > Add package luvi version v2.3.5.
> > 
> > luvi extends LuaJIT with asynchronous I/O and several optional
> > modules to run
> > Lua applications and build self-contained binaries.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > Changes v3 -> v5: (v4 is same as v3, forgot commit --amend)
> > ?- bump to v2.3.5
> > ?- remove patch from upstream
> 
> Thanks, patch applied. I must say I don't really understand what this
> luvi thing is doing, but it built fine here, and the packaging seems
> reasonable.

luvi is a LuaJIT runtime with additional bindings, e.g. libuv. You can
compare it with the V8 engine (the JavaScript engine used by Node.js),
the main difference is, that luvi already contains the libuv bindings,
whereas Node.js adds the libuv bindings to V8.

All together, it is a Node.js like system for Lua.

I want to integrate some luvi applications like lit and luvit into
Buildroot. lit is similar to npm and luvit adds a Node.js like API to
luvi.

This will be done in follow-up patches...

> I was somewhat surprised by:
> 
> 	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-2.0.4/?.lua
> 
> as this ?.lua doesn't really look like a path, but since it builds
> fine, maybe I'm missing something.

Lua(JIT) uses this string as a path to search for files. In this case
we have to tell LuaJIT where to search for its bundled modules.

Best regards
J?rg
