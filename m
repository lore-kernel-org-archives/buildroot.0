From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2014 23:04:17 +0100
Subject: [Buildroot] [V2 2/2] ljlinenoise: new package
In-Reply-To: <20140203225608.4593b632@skate>
References: <1391425657-30915-1-git-send-email-francois.perrad@gadz.org>
 <1391425657-30915-2-git-send-email-francois.perrad@gadz.org>
 <20140203202630.GB3264@free.fr> <20140203225608.4593b632@skate>
Message-ID: <20140203220417.GD3264@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fran?ois, All,

On 2014-02-03 22:56 +0100, Thomas Petazzoni spake thusly:
> On Mon, 3 Feb 2014 21:26:31 +0100, Yann E. MORIN wrote:
> 
> > > diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
> > > new file mode 100644
> > > index 0000000..3d2af35
> > > --- /dev/null
> > > +++ b/package/ljlinenoise/Config.in
> > > @@ -0,0 +1,15 @@
> > > +config BR2_PACKAGE_LJLINENOISE
> > > +	bool "ljlinenoise"
> > > +	select BR2_PACKAGE_LJSYSCALL
> > > +	# ljsyscall is specifically for LuaJIT, not Lua.
> > > +	depends on BR2_PACKAGE_LUAJIT
> > > +	# ljsyscall is only available for some target architectures
> > > +	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
> > 
> > No need for the comment, it is obvious from the dependency itself that
> > ljlinenoise only works on these architectures.
> 
> Hum, really? These dependencies are inherited from ljsyscall, which is
> selected by this package. In such a situation, we normally do something
> like:
> 
> 	select BR2_PACKAGE_LIBGLIB2
> 	depends on BR2_USE_WCHAR # libglib2
> 
> so having the same comment mentioned here makes sense, IMO, as it helps
> understanding where the architecture dependency is coming from.

OK, my bad, I misread 'ljlinenoise' when 'ljsyscall' was properly
written.

Forget what I said about this. Sorry for the noise.
As Thomas said, just post-fix the depends with  '# ljsyscall'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
