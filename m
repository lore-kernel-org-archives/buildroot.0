From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 10:52:44 +0100
Subject: [Buildroot] [PATCH v5] luvi: new package
In-Reply-To: <1451080268.16818.8.camel@embedded.rocks>
References: <1446104703-21295-1-git-send-email-joerg.krause@embedded.rocks>
 <20151220232856.12acbfe8@free-electrons.com>
 <1451080268.16818.8.camel@embedded.rocks>
Message-ID: <20151226105244.14556b27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Fri, 25 Dec 2015 22:51:08 +0100, J?rg Krause wrote:

> > Thanks, patch applied. I must say I don't really understand what this
> > luvi thing is doing, but it built fine here, and the packaging seems
> > reasonable.
> 
> luvi is a LuaJIT runtime with additional bindings, e.g. libuv. You can
> compare it with the V8 engine (the JavaScript engine used by Node.js),
> the main difference is, that luvi already contains the libuv bindings,
> whereas Node.js adds the libuv bindings to V8.
> 
> All together, it is a Node.js like system for Lua.

Thanks a lot for the explanation, makes sense!

> I want to integrate some luvi applications like lit and luvit into
> Buildroot. lit is similar to npm and luvit adds a Node.js like API to
> luvi.
> 
> This will be done in follow-up patches...

Cool!

> > as this ?.lua doesn't really look like a path, but since it builds
> > fine, maybe I'm missing something.
> 
> Lua(JIT) uses this string as a path to search for files. In this case
> we have to tell LuaJIT where to search for its bundled modules.

Ok. So this "?" is interpreted by LuaJIT in a "special" way.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
