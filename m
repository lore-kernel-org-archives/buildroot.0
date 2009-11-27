From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 27 Nov 2009 11:00:34 -0600
Subject: [Buildroot] Lua by Buildroot
Message-ID: <200911271100.36521.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My #1 question -

I will be building Lua extension libraries,
shall I keep those as local changes, or do
you want them as "additional application patches"?

My #2 question -
Should the current implementation be re-organized first?

Background:
"Lua" is an extensible, extension language implemented by libraries.

The "Lua" known to keyboard users, that is, the interactive scripting
language - that is a few hundred lines of code "extended" by the
Lua libraries.

The "Lua" known to programmers is the extension libraries themself.

A common point of confusion in the "Lua world" - - -

Currently, the "Lua" entry is under "Scripting Languages" -
But that has already caused some problems,
I think a re-organization is in order before the sh.. gets any deeper.

My suggestion(s) -

First, move the current "Lua" (minus the interactive and compiler files)
into "General Supporting Libraries" - and there generate the Lua libraries.

That should simplify things for applications which use "Lua" as a set
of extension libraries (only) - such as Hasrel.

Now, if your following this, then we need to put back a "Lua-something" under
"Scripting Languages" - there it will only build the interactive and compiler
files with a build dependency on the "Lua" in "General Supporting Libraries" -
Same-same as Hasrel should be (if it isn't already).

Why? Because when used as an "extension library" only the library files are used.

Which brings us to dealing with the "extensible" side of Lua (part 1) - - -
The things I am adding would be a sub-menu of the "General Supporting Libraries:Lua"
**not** a sub-menu of "Scripting Languages:Lua"
(Lua-lpeg, Lua-gd, Lua-<something xml>)

Then there is dealing with the "extensible" side of Lua (part 2) - - -
This situation is "Lua" being extended by "pure Lua" scripting.
It isn't usable unless either the compiler and/or interactive language is built.
Meaning that even though these are "Lua Extensions" they don't belong under
"General Supporting Libraries:Lua" they need to be on a sub-menu of 
"Scripting Languages:Lua" - (they just get a "cp -a" and their done).
(My own Lua-URI is one of many examples.)

Note 1: there is an established fs layout that should also be followed, the
above re-organization should simplify creating it and maintaining it.

Note 2: I will be building these things locally regardless -
But if they should someday become "Buildroot" patches,
it would be nice if what I do fits into the "Buildroot Plan". ;)

Mike
