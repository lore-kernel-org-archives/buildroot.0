From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Sep 2013 22:54:08 +0200
Subject: [Buildroot] [v4 1/2] luainterpreter: create virtual package
In-Reply-To: <CA+-urNQZVaNvLwNUA_X6N7Ft2N0U1Yo6h+L__vNtHJfOZVPUSA@mail.gmail.com>
References: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
 <CA+-urNQZVaNvLwNUA_X6N7Ft2N0U1Yo6h+L__vNtHJfOZVPUSA@mail.gmail.com>
Message-ID: <20130930225408.4ea0f858@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Mon, 30 Sep 2013 14:31:46 -0400, Frank Hunleth wrote:

> > +#############################################################
> > +#
> > +# Virtual package for luainterpreter
> > +#
> > +#############################################################
> > +
> > +LUAINTERPRETER_VERSION = 5.1
> 
> I was curious on your choice of version number for the virtual
> package. Is this intended to be used for API compatibility checks?
> 
> The reason that I'm asking is that I'm going to need to upgrade a
> project to Lua 5.2. There are enough API differences between Lua 5.1
> and 5.2 that it would be useful to use your patch set and add Lua 5.2
> as another luainterpreter. Using LUAINTERPRETER_VERSION sounds like
> one way of checking Lua API compatibility in other projects. Or did
> you have other thoughts?
> 
> Also, any word on the status of your patches?

Having a "version" attached to a virtual package does not make sense, I
believe.

If there are several incompatible versions of Lua that need to be
supported in Buildroot, then they must be packaged as separate
packages: lua, lua52 for example, like we're doing for python vs.
python4 and qt vs. qt5.

A virtual package should remain only have as dependencies packages that
provide the same API, i.e that interchangeable.

(Note: I have no knowledge about Lua specifically, those statements are
generic Buildroot rules.)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
