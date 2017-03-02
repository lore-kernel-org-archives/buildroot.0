From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:22:26 +0100
Subject: [Buildroot] [PATCH 13/25] package/Config.in: explain that lua
 package names should start with lua
In-Reply-To: <a9a0a363-1c91-c50a-6f5d-a058c8fd4e4b@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-14-arnout@mind.be>
 <20170302225033.4c38fbab@free-electrons.com>
 <a9a0a363-1c91-c50a-6f5d-a058c8fd4e4b@mind.be>
Message-ID: <20170302232226.7566b105@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 23:19:50 +0100, Arnout Vandecappelle wrote:

>  The problem is that we want to use upstream names. The upstream name of
> luaposix is luaposix. We certainly don't want to change that into lua-posix, and
> making it lua-luaposix would be weird as well. Note that Debian does call it
> lua-posix. So to use the lua-posix package, you have to do 'require "luaposix"',
> which makes little sense IMHO.
> 
>  For me, the important thing is that I can see in the package directory which
> packages are lua-related. I'm not really bothered with seeing a mix of lua-foo
> and luabar.
> 
>  Perl is different because module names (almost?) never start with Perl. Python
> is different because package names sometimes are like pyfoo, but never
> python-foo, and we have indeed chosen to make it python-pyfoo.
> 
>  If people think it would be better for consistency to have lua-luafoo, I can
> live with that (just 3 letters more). But do keep in mind that we have already
> forsaken consistency because of the historical discrepancy.

Fair enough, but then I'd like that the rule be:

 * If the upstream package name is luafoo, then it should be luafoo in
   Buildroot.

 * If the upstream package name is foo, then it should be lua-foo in
   Buildroot.

Does that sound OK?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
