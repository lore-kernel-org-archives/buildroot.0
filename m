From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 21 Nov 2011 09:42:31 +0100
Subject: [Buildroot] [PATCH 1 of 5 v2] Makefile.package.in: add utility
 functions find*clauses and notfirstword
In-Reply-To: <172e.4ec7571e.5a6e@getafix.xdna.net>
References: <patchbomb.1321557989@devws108>
 <b6579582d02dd802adca.1321557990@devws108>
 <172e.4ec7571e.5a6e@getafix.xdna.net>
Message-ID: <CAAXf6LUX2GCq4wve6hFmpaMK9HGEt910PkHgmHJysqOL4SkHJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cam,

On Sat, Nov 19, 2011 at 8:13 AM, Cam Hutchison <camh@xdna.net> wrote:
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
> Apologies if you have seen this, but I haven't seen my response to this
> come through (probably a gmane stuffup).
>
>>+# finddirclauses: creates "-wholename 'basedir/dirX' -o -wholename 'basedir/dirY'"
>>+# [1:basedir, 2:namelist]
>>+finddirclauses=-wholename '$(firstword $(2))' $(patsubst %,-o -wholename '$(1)/%',$(call notfirstword,$(2)))
>
> I think the first -wholename argument is meant to be
> ?'$(1)/$(firstword $(2))'
>
> according to the comment above it.

You are absolutely right. I can't believe I missed that! Thanks for noticing.

>
> Also, my man page for find(1) says this about -wholename:
> ?See -path. ? ?This alternative is less portable than -path.

That is funny. My man page redirects in the opposite way:

       -path pattern
              See -wholename.   The predicate -path is also supported
by HP-UX find.

       -wholename pattern
              File name matches shell pattern pattern.  The
metacharacters do not treat ?/? or ?.? specially; so, for example,
                        find . -wholename ?./sr*sc?
              will print an entry for a directory called ?./src/misc?
(if one exists).  To ignore a whole directory tree, use -prune
              rather than checking every file in the tree.  For
example, to skip the directory ?src/emacs? and all files and
              directories under it, and print the names of the other
files found, do something like this:
                        find . -wholename ?./src/emacs? -prune -o -print

But beware, this is CentOS 5, and probably more ancient than your system.

>
> Do you find -wholename to be more readable? It's not an option I've used
> much, so I need to look up the man page anyway, but -path is easier to
> look up because you do not get redirected to another option like you do
> with -wholename.

The main reason was because my man page uses -wholename when giving
-prune information, and I was not aware of -path. But I'll change to
-path if that's more portable.

Thanks,
Thomas
